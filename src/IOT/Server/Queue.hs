{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
module IOT.Server.Queue where

import Control.Monad.Reader
import qualified Data.Text as T
import qualified Data.ByteString.Lazy as BL 
import qualified Data.ByteString.Lazy.UTF8 as BLU
import qualified Data.Map as Map
import Data.String (fromString)
import Database.InfluxDB.Line
import Database.InfluxDB
import IOT.Misc 
import Colog
import Control.Lens
import Data.Time
import Database.MySQL.Base
import IOT.Server.Types
import qualified Control.Exception as Exception
import Data.Maybe

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
      (Real a, MonadReader (AppEnv m) m, MonadIO m)
   => [(T.Text, a)]
   -> Uid
   -> m ()
queueSensorData f uid = do
   logInfo "Appending data item to Influx Queue"
   measurement <- view (sConf . infxMeasurement)
   t <- liftIO getCurrentTime
   let newL =
          Line
             measurement
             (Map.singleton "node_id" (fromString . T.unpack $ uid))
             (Map.fromList $
              map (bimap (fromString . T.unpack) (FieldFloat . realToFrac)) f)
             (Just t)
   q <- view pendingInfx
   liftIO $ refModify' (newL :) q
   return ()

queueSensorImage ::
      (MonadReader (AppEnv m) m, MonadIO m) => T.Text -> BL.ByteString -> m ()
queueSensorImage uid bin = do
   logInfo "Appending image to Mysql Queue"
   q <- view pendingMysql
   liftIO $ refModify' ((uid, bin) :) q
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
               , MySQLBytes (BL.toStrict bin)
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
