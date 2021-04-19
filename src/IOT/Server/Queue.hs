{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
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
import Colog
import Control.Lens (use, view, (.=), (^.), sequenceAOf, _2, (.~), (&), (?~))
import Data.Time
import Database.MySQL.Base
import Control.Monad.Reader
import Data.Maybe
import Data.Aeson (encode, ToJSON(..), Value(..))
import Data.Aeson.Types (Pair)
import Database.InfluxDB (scaleTo, writeBatch, Key) 
import Data.Bifunctor (bimap)
import Data.String (fromString)
import IOT.Misc 
import IOT.Server.Types
import IOT.REST.Import (sharedCmdQueue)
import Network.AMQP (Channel, publishMsg, Message(..), newMsg)
import Data.ProtoLens.Encoding (encodeMessage)
import Data.ProtoLens (defMessage)

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

isOpenMysql :: MySQLConn -> IO Bool
isOpenMysql c =
   Exception.catch
      (ping c >> return True)
      (\(e :: NetworkException) -> return False)

getMysqlConnection :: App IO MySQLConn
getMysqlConnection = do
   conn <- use mysqlConn
   conf <- view sConf
   isActive <- liftIO (isOpenMysql conn)
   unless isActive $ do
      logWarning "Detected closed Mysql connection" 
      let mysqlconf = mysqlConfig conf 
      conn <- liftIO (connect mysqlconf)
      mysqlConn .= conn

   return conn

queueSensorData ::
      (ToJSON j, Show j, MonadReader (AppEnv m) m, MonadIO m)
   => P.UID 
   -> j 
   -> m ()
queueSensorData uid f = do
   logInfo "Appending data item to Influx Queue"
   measurement <- view (sConf . infxMeasurement)
   t <- liftIO getCurrentTime
   let fields = toInfluxFields (toJSON f)
   logDebug . T.pack . show . encode $ f  
   logDebug . T.pack . show $ fields
   let newL =
          Line
             measurement
             (Map.singleton "node_id" (fromString . T.unpack $ uid))
             fields 
             (Just t)
   q <- view pendingInfx
   refModify' (newL :) q
   return ()

queueSensorImage ::
      (MonadReader (AppEnv m) m, MonadIO m) => T.Text -> Raspcamout -> m ()
queueSensorImage uid img = do
   logInfo "Appending image to Mysql Queue"
   q <- view pendingMysql
   refModify' ((uid, img ^. bin) :) q
   return ()

flushImageQueue :: App IO ()
flushImageQueue = do
   imgs <- view pendingMysql >>= (liftIO . refModify' (const []))
   unless (null imgs) $ do
      logInfo "Uploading images to DB"
      conn <- getMysqlConnection
      stmt <-
         liftIO $
         prepareStmt
            conn
            "INSERT INTO device_images (id, node_id, bin) VALUES (?,?,?)"
      forM_ imgs $ \(uid, bin) -> do
         id <- genSecureString 64
         when (isNothing id) $ fail "Unable to generate secure string"
         printOk =<<
            executeStmt'
               conn
               stmt
               [ MySQLText $ fromJust id
               , MySQLText uid
               , MySQLBytes bin
               ]
  where
    printOk (Left err) = logWarning $ "Error on mysql insert: " <> T.pack err
    printOk (Right ok) =
       logInfo $ "Success on mysql insert: " <> T.pack (show ok)

flushDataQueue :: App IO ()
flushDataQueue = do
   l <- view pendingInfx >>= (liftIO . refModify' (const []))
   unless (null l) $ do
      logInfo $
         "Sending to Influx these: \n[" <>
         T.pack (BLU.toString $ encodeLines (scaleTo Second) l) <> "]"
      infx <- use infxConn
      liftIO $ infx `writeBatch` l

flushCmdQueue :: Channel -> App IO ()
flushCmdQueue chan = do
   exchange <- view (sConf . amqpExchange)
   cmds     <- view (restApp.sharedCmdQueue) 
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

flushQueues :: Channel -> App IO ()
flushQueues chan = do
   logDebug "Attempting to flush queues"
   flushDataQueue
   flushImageQueue
   flushCmdQueue chan
