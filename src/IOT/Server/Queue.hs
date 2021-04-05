{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
module IOT.Server.Queue where

import Control.Monad.Reader
import qualified Data.Text as T
import qualified Data.ByteString.Lazy.UTF8 as BLU
import Database.InfluxDB.Line (Line(..), encodeLines, Precision(..), LineField, Field(..))
import IOT.Misc 
import Proto.Sensors.Raspcamdt (Raspcamout)
import Proto.Sensors.Raspcamdt_Fields (bin)
import Colog
import Control.Lens (use, view, (.=), (^.), sequenceAOf, _2)
import Data.Time
import Database.MySQL.Base
import IOT.Server.Types
import qualified Control.Exception as Exception
import Data.Maybe
import Data.Aeson (encode, ToJSON(..), Value(..))
import Data.Aeson.Types (Pair)
import qualified Data.Aeson ((.=))
import qualified Data.Map as Map
import qualified Data.HashMap.Strict as HM
import Database.InfluxDB (scaleTo, writeBatch, Key) 
import Data.Bifunctor (bimap)
import Data.String (fromString)

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
   => Uid 
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
   liftIO $ refModify' (newL :) q
   return ()

queueSensorImage ::
      (MonadReader (AppEnv m) m, MonadIO m) => T.Text -> Raspcamout -> m ()
queueSensorImage uid img = do
   logInfo "Appending image to Mysql Queue"
   q <- view pendingMysql
   liftIO $ refModify' ((uid, img ^. bin) :) q
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

flushQueues :: App IO ()
flushQueues = do
   logDebug "Attempting to flush queues"
   flushDataQueue
   flushImageQueue
