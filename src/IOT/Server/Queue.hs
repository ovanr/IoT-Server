{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DataKinds #-}
module IOT.Server.Queue where

import qualified Data.Text as T
import qualified Data.ByteString.Lazy.UTF8 as BLU
import qualified Data.ByteString.Lazy as BL
import qualified IOT.Packet.Packet as P
import qualified Control.Exception as Exception
import qualified Data.Aeson ((.=))
import qualified Data.Map as Map
import qualified Data.HashMap.Strict as HM
import Database.InfluxDB.Line (Line(..), encodeLines, Precision(..), LineField, Field(..))
import Proto.Sensors.Raspcamdt (Raspcamout)
import Proto.Sensors.Raspcamdt_Fields (bin)
import IOT.REST.Import (RESTApp, sharedCmdQueue)
import Data.ProtoLens.Field
import Colog
import Control.Lens (use, view, (.=), (^.), sequenceAOf, _2, (.~), (&), (?~))
import Data.Time
import Database.MySQL.Base
import Control.Monad.Reader
import Data.Maybe
import Data.Aeson (encode, ToJSON(..), Value(..))
import Data.Aeson.Types (Pair)
import Database.InfluxDB (scaleTo, writeBatch, Key, WriteParams) 
import Data.Bifunctor (bimap)
import Data.String (fromString)
import IOT.Misc 
import IOT.Server.Types
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
   Check if a MySQL connection is still alive
-}
isOpenMysql :: MySQLConn -> IO Bool
isOpenMysql c =
   Exception.catch
      (ping c >> return True)
      (\(e :: NetworkException) -> return False)

{- |
   Get the active MySQL connection.
   If previously stored connection is broken, 
   a new connection will be returned.   
-}
getMysqlConnection ::
     ( MonadIO m
     , ValidApp '[ '("mysqlConn", MySQLConn) ] '[ '("sConf", ServerConf) ] m s r
     )
  => m MySQLConn
getMysqlConnection = do
   conn <- use (field @"mysqlConn")
   conf <- view (field @"sConf")
   isActive <- liftIO (isOpenMysql conn)
   unless isActive $ do
      logWarning "Detected closed Mysql connection" 
      let mysqlconf = mysqlConfig conf 
      conn <- liftIO (connect mysqlconf)
      (field @"mysqlConn") .= conn

   return conn

{- |
   Store a JSON-like structure to the Influx Queue.
   The Influx Queue buffers data points to be sent
   all at once.
-}
queueSensorData ::
     ( ToJSON j
     , Show j
     , MonadIO m
     , ValidApp '[] '[ '( "pendingInfx", InfluxQueue), '("sConf", ServerConf) ] m _1 r
     )
  => P.UID
  -> j
  -> UTCTime
  -> m ()
queueSensorData uid f timestamp = do
   logInfo "Appending data item to Influx Queue"

   measurement <- view (field @"sConf" . infxMeasurement)
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
     , ValidApp '[] '[ '( "pendingMysql", MySQLQueue) ] m _1 r
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
     , ValidApp '[ '( "mysqlConn", MySQLConn)] '[ '( "sConf", ServerConf), '( "pendingMysql", MySQLQueue) ] m s r
     ) => m () 
flushImageQueue = do
   imgs <- view (field @"pendingMysql") >>= (liftIO . refModify' (const []))
   unless (null imgs) $ do
      logInfo "Uploading images to DB"
      conn <- getMysqlConnection
      stmt <-
         liftIO $
         prepareStmt
            conn
            "INSERT INTO device_images (id, node_id, insertion_date, bin) VALUES (?,?,?,?)"
      forM_ imgs $ \(uid, bin, timestamp) -> do
         id <- genSecureString 64
         when (isNothing id) $ fail "Unable to generate secure string"
         printOk =<<
            executeStmt'
               conn
               stmt
               [ MySQLText $ fromJust id
               , MySQLText uid
               , MySQLTimeStamp (utcToLocalTime utc timestamp)
               , MySQLBytes bin
               ]
  where
    printOk (Left err) = logWarning $ "Error on mysql insert: " <> T.pack err
    printOk (Right ok) =
       logInfo $ "Success on mysql insert: " <> T.pack (show ok)

{- |
   Send the contents of the Influx Queue to the Influx Database.
   The Influx Queue is emptied after that. 
-}
flushDataQueue :: 
     ( MonadIO m
     , ValidApp '[ '( "infxConn", WriteParams)] '[ '( "pendingInfx", InfluxQueue) ] m s r
     ) => m () 
flushDataQueue = do
   l <- view (field @"pendingInfx") >>= (liftIO . refModify' (const []))
   unless (null l) $ do
      logInfo $
         "Sending to Influx these: \n[" <>
         T.pack (BLU.toString $ encodeLines (scaleTo Second) l) <> "]"
      infx <- use (field @"infxConn")
      liftIO $ infx `writeBatch` l

{- |
   Send the queued Device commands to the devices
   using the AMQP connection. The command queue 
   is emptied after that.
-}
flushCmdQueue :: 
     ( MonadIO m
     , ValidApp '[] '[ '( "sConf", ServerConf), '( "restApp", RESTApp) ] m s r
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
flushQueues channel = do
  logDebug "Attempting to flush queues"
  flushDataQueue
  flushImageQueue
  flushCmdQueue channel
