{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DataKinds #-}
module IOT.Server.Queue where

import qualified Data.Text as T
import qualified Data.ByteString.Lazy.UTF8 as BLU
import qualified Data.ByteString.Lazy as BL
import qualified IOT.Packet.Packet as P
import qualified Data.Aeson ((.=))
import qualified Data.Map as Map
import Data.IORef (readIORef)
import qualified Data.HashMap.Strict as HM
import Control.Exception (SomeException)
import qualified Control.Monad.Catch as MC
import Database.InfluxDB.Line (Line(..), encodeLines, Precision(..), LineField, Field(..))

import qualified Database.Persist as Persist (Key)
import Database.Persist hiding (Key)
import Database.Persist.MySQL hiding (Key)
import IOT.Server.Models hiding (Key)
import Data.Pool

import Proto.Sensors.Raspcamdt (Raspcamout)
import Proto.Sensors.Raspcamdt_Fields (bin)
import IOT.REST.Import (RESTApp, sharedCmdQueue, alertRuleUpdate)

import Control.Monad.Extra (whenM)
import Data.ProtoLens.Field
import Colog
import Control.Lens (view, (^.), sequenceAOf, _2, (.~), (&), (?~))
import Data.Time
import Control.Monad.Reader
import Data.Maybe
import Data.Aeson (encode, ToJSON(..), Value(..))
import Data.Aeson.Types (Pair)
import Database.InfluxDB (scaleTo, writeBatch, Key, WriteParams) 
import Data.Bifunctor (bimap)
import Data.String (fromString)
import IOT.Misc 
import IOT.Server.Types
import IOT.Server.Alerts (checkAndSendAlerts, syncAlertRules)
import Network.AMQP (Channel, publishMsg, Message(..), newMsg)
import Data.ProtoLens.Encoding (encodeMessage)
import Data.ProtoLens (defMessage)

{- |
   Transform a Data.Aeson Value data type to an 
   InfluxDB Map of LineField data types
-}
toInfluxFields :: Value -> Map.Map Key LineField
toInfluxFields j =
   Map.fromList $
   mapMaybe
      (sequenceAOf _2 . bimap (fromString . T.unpack) toInfluxField)
      (toPairs j)
  where
    toPairs :: Value -> [Pair]
    toPairs (Object x) =
       flip concatMap (HM.toList x) $ 
         \(k,v) ->
            case v of 
               Object o -> toPairs (Object o)
               Array a -> []
               _ -> [k Data.Aeson..= v]
    toPairs _ = []

    toInfluxField (Number n) = Just . FieldFloat . realToFrac $ n
    toInfluxField (String t) = Just $ FieldString t
    toInfluxField (Bool b) = Just $ FieldBool b
    toInfluxField _ = Nothing

{- |
   Store a JSON-like structure to the Influx Queue.
   The Influx Queue buffers data points to be sent
   all at once.
-}
queueSensorData ::
     ( ToJSON j
     , MonadIO m
     , ValidApp '[ '( "pendingInfx", InfluxQueue), '("sConf", ServerConf) ] m r
     )
  => P.UID
  -> j
  -> UTCTime
  -> m ()
queueSensorData uid f timestamp = do
   logInfo "Appending data item to Influx Queue"

   measurement <- view (field @"sConf" . infxMeasurement)
   logError $ T.pack $ show $ toJSON f
   let fields = toInfluxFields (toJSON f)
   
   logDebug . T.pack . show . encode $ f  
   logDebug . T.pack . show $ fields

   let newL =
          Line
             measurement
             (Map.singleton "node_id" (fromString . T.unpack $ uid))
             fields 
             (Just timestamp)

   q <- view (field @"pendingInfx")
   refModify' (newL :) q
   return ()

{- |
   Store a Raspberry Image to the Image Queue.
   The Image Queue buffers images to be sent
   all at once.
-}
queueSensorImage ::
     ( MonadIO m
     , ValidApp '[ '( "pendingMysql", MySQLQueue) ] m r
     )
  => T.Text
  -> Raspcamout
  -> UTCTime
  -> m ()
queueSensorImage uid img timestamp = do
   logInfo "Appending image to Mysql Queue"
   q <- view (field @"pendingMysql")
   refModify' ((uid, img ^. bin, timestamp) :) q
   return ()

{- |
   Send the contents of the Image Queue to the MySQL Database.
   The Image Queue is emptied after that. 
-}
flushImageQueue :: 
     ( MonadIO m
     , ValidApp '[ '( "sConf", ServerConf), '( "pendingMysql", MySQLQueue) ] m r
     ) => Pool SqlBackend -> m () 
flushImageQueue backend = do
   imgs <- view (field @"pendingMysql") >>= (liftIO . refModify' (const []))

   unless (null imgs) $ do
      logInfo "Uploading images to DB"
      errors <- liftIO $ flip runSqlPool backend $
         forM imgs uploadImage

      mapM_ logWarning (catMaybes errors)

    where
        catcher (e :: SomeException) = pure . Just . T.pack . show $ e
        uploadImage (uid, bin, timestamp) = do 
            maybeId <- genSecureString 64
            id <- maybe (fail "Unable to generate an id") pure maybeId

            flip MC.catch catcher $ do 
                let newImage = DevImage (DeviceKey uid) timestamp bin 0 0
                insertKey (DevImageKey id) newImage
                pure Nothing

{- |
   Send the contents of the Influx Queue to the Influx Database.
   The Influx Queue is emptied after that. 
-}
flushDataQueue :: 
     ( MonadIO m
     , ValidApp '[ '( "alertRules",  AlertRules), 
                   '( "infxConn",    WriteParams), 
                   '( "pendingInfx", InfluxQueue) ] m r
     ) => Pool SqlBackend -> m () 
flushDataQueue backend = do
   lines <- view (field @"pendingInfx") >>= (liftIO . refModify' (const []))

   unless (null lines) $ do
      logInfo "Sending to Influx:" 
      logInfo $ T.pack (BLU.toString $ encodeLines (scaleTo Second) lines)

      forM_ lines $ 
         checkAndSendAlerts backend

      infx <- view (field @"infxConn")
      liftIO $ infx `writeBatch` lines

{- |
   Send the queued Device commands to the devices
   using the AMQP connection. The command queue 
   is emptied after that.
-}
flushCmdQueue :: 
     ( MonadIO m
     , ValidApp '[ '( "sConf", ServerConf), '( "restApp", RESTApp) ] m r
     ) => Channel -> m () 
flushCmdQueue chan = do
   exchange <- view (field @"sConf" . amqpExchange)
   cmds     <- view (field @"restApp" . sharedCmdQueue) 
                >>= (liftIO . refModify' (const []))
   unless (null cmds) $ do
      let numCmds = T.pack . show . length $ cmds 
      logInfo $ "Sending " <> numCmds <> " commands"
      
      forM_ cmds $ \(uid, cmd) ->
         let topic = "cmd." <> uid
             pcktCmd = P.Packet'Cmds (defMessage & P.cmds .~ [cmd])
             pckt :: P.Packet = defMessage 
                     & P.uid .~ uid
                     & P.maybe'type' ?~ pcktCmd
             body = BL.fromStrict . encodeMessage $ pckt
             msg = newMsg{msgBody=body}
          in do
            logInfo $ "Sending to: " <> uid
            logDebug $ T.pack (show pckt)
            liftIO $ publishMsg chan exchange topic msg

{- |
   Send all pending data from the internal queues to
   their corresponding endpoints. 
-}
flushQueues channel backend = do
   logDebug "Attempting to flush queues"
   flushDataQueue backend
   flushImageQueue backend
   flushCmdQueue channel
   syncAlertRules backend
