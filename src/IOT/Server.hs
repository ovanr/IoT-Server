{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeApplications #-}
module IOT.Server
   ( initApp
   , runApp
   ) where

import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Lazy.UTF8 as BLU

import Colog.Actions
import Colog.Core.Action
import Colog.Core.Severity
import Colog.Message hiding (Message(..))
import qualified Colog.Message as Colog
import Control.Concurrent
import qualified Control.Exception as Exception
import Control.Lens
import Control.Monad.Catch (MonadMask, bracket, finally)
import Control.Monad.Reader
import Data.Aeson (eitherDecode)
import System.Directory
import Data.Bifunctor (bimap)
import qualified Data.ByteString.UTF8 as BU
import Data.Char
import Data.Either
import Data.Either.Combinators
import Data.Function ((&))
import Data.IORef
import qualified Data.Map.Strict as Map
import Data.String (fromString)
import qualified Data.Text as T
import Data.Time (getCurrentTime)
import Data.Time.Clock (UTCTime)
import Data.Time.Format
import Control.Monad.Extra
import Data.Version (showVersion)
import Database.InfluxDB
import Database.InfluxDB.Line
import Database.MySQL.Base hiding (Packet(..))
import IOT.Misc
   ( liftEither
   , withFileM
   , withTempPipeM
   , loopUntil
   , hTryGetChar 
   , refModify'
   , richMessageLogFileAction
   , sleep
   , withAmqpChannel
   , mkfifo
   , withAmqpConnection
   , withAmqpConsumer
   )
import IOT.Packet.Format (isImg, isJson)
import IOT.Packet.Types (Packet(..), PacketUnique(..))
import IOT.Server.Types
   ( App
   , AppCb(..)
   , AppEnv(..)
   , AppState(..)
   , ServerArgs(..)
   , ServerConf(..)
   , Uid
   , amqpHost
   , amqpPass
   , amqpUser
   , amqpVhost
   , confPath
   , infxConn
   , infxDb
   , infxHost
   , infxMeasurement
   , logAction
   , logHandle
   , logPath
   , mysqlConn
   , mysqlDb
   , mysqlHost
   , mysqlPass
   , mysqlUser
   , pendingInfx
   , pendingMysql
   , runAppCb
   , sConf
   , unApp
   , verbosity
   )
import Network.AMQP
import Paths_iot_server (version)
import System.Timeout

import qualified Codec.Compression.GZip as GZip
import Control.Monad ((=<<))
import Control.Monad.State.Class
import Control.Monad.Trans.Except
import System.IO
queueSensorData :: (Real a, MonadReader (AppEnv m) m, MonadIO m) => [(T.Text, a)] -> Uid -> m () 
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

queueSensorImage :: (MonadReader (AppEnv m) m, MonadIO m) => T.Text -> BL.ByteString -> m ()
queueSensorImage uid bin = do
   logInfo "Appending image to Mysql Queue"
   q <- view pendingMysql 
   liftIO $ refModify' ((uid, bin) :) q
   return ()

isOpenMysql :: MySQLConn -> IO Bool
isOpenMysql c = Exception.catch (ping c >> return True) (\(e :: NetworkException) -> return False)

getMysqlConnection :: App IO MySQLConn
getMysqlConnection = do
   conn <- use mysqlConn
   conf <- view sConf
   isActive <- liftIO (isOpenMysql conn)
   unless isActive $ do
      let mysqlconf = mysqlConfig conf 
      conn <- liftIO (connect mysqlconf)
      mysqlConn .= conn

   return conn

parseBody :: Message -> T.Text -> Either String Packet
parseBody msg uid = do
   rawBody <-
      case T.toLower <$> msgContentEncoding msg of
         Just "gzip" -> Right . GZip.decompress . msgBody $ msg -- Found GZip Encoding
         Just x -> Left $ "Unrecognised Content Encoding " ++ show x
         Nothing -> Right $ msgBody msg -- "Found no Encoding"
   toPacket rawBody
  where
    jsonParse b = eitherDecode b
    imgParse b = Right $ Packet uid (SensorRaw b)
    toPacket b =
       if | isJson b  -> jsonParse b
          | isImg b   -> imgParse b
          | otherwise -> Left "Incorrect Packet format"

pktHandler :: AppEnv IO -> (Message, Envelope) -> IO ()
pktHandler env (msg, e) = runAppCb menv $ do
   logInfo $ "Received a msg with key " <> envRoutingKey e
   either
      (\b -> logError $ "Body parse error: " <> T.pack (show b)) 
      parsePacket
      (parseBody msg uid)

   where
    menv = env & logAction %~ hoistLogAction liftIO 
    uid = last . T.split (== '.') . envRoutingKey $ e
    parsePacket (Packet uid uniq) = do
       case uniq of
          (SensorData f) -> queueSensorData f uid 
          (SensorRaw bin) -> queueSensorImage uid bin
          _ -> fail "Incorrect packet format"

flushImageQueue :: App IO ()
flushImageQueue = do
   imgs <- view pendingMysql >>= (liftIO . refModify' (const []))
   unless (null imgs) $ do 
      logInfo "Uploading images to DB"
      conn <- getMysqlConnection
      stmt <-
         liftIO $
         prepareStmt conn "INSERT INTO device_images (node_id, bin) VALUES (?,?)"
      forM_ imgs $ \(uid, bin) ->
         (logDebug . T.pack . show) =<<
         liftIO
            (executeStmt conn stmt [MySQLText uid, MySQLBytes (BL.toStrict bin)])

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

mysqlConfig :: ServerConf -> ConnectInfo
mysqlConfig conf = do
   defaultConnectInfo
      { ciHost = conf ^. mysqlHost
      , ciUser = BU.fromString $ view mysqlUser conf
      , ciPassword = BU.fromString $ view mysqlPass conf
      , ciDatabase = BU.fromString $ view mysqlDb conf
      }

initApp :: ServerArgs -> IO (AppState (App IO))
initApp args = do
   putStrLn $ "IoT-Server v." ++ showVersion version
   
   let level =
          case args ^. verbosity of
             3 -> Debug
             2 -> Info
             1 -> Warning
             0 -> Error
   
   conf <- liftEither . eitherDecode =<< BL.readFile (args ^. confPath)
   let wp =
          writeParams (conf ^. infxDb) & 
          server . host .~ (conf ^. infxHost) &
          precision .~ Second
   
   logHandle <- openFile (args ^. logPath) WriteMode 
   hSetBuffering logHandle LineBuffering

   env <- AppEnv (richMessageLogFileAction level logHandle) conf 
            <$> newIORef [] 
            <*> newIORef [] 
    
   let mysqlInfo = mysqlConfig (env ^. sConf)

   AppState env (Just logHandle) wp <$> connect mysqlInfo

runApp :: App IO ()
runApp = runner `finally` closeLog
   where
      closeLog = do
         handle <- use logHandle
         liftIO $ maybe mempty hClose handle
         logHandle .= Nothing
         
      runner = do
         host  <- view (sConf.amqpHost)
         vhost <- view (sConf.amqpVhost)
         user  <- view (sConf.amqpUser)
         pass  <- view (sConf.amqpPass)
         
         withAmqpConnection host vhost user pass $ \conn -> do
            withAmqpChannel conn $ \chan -> do
               env <- ask
               state <- get
               let envio = env & logAction %~ unHoist state 
               
               withAmqpConsumer (pktHandler envio) chan "q_all" $ \_ -> do
                  withTempPipeM "iot-server.run" $ \handle -> 
                        loopUntil $ do
                          sleep 5
                          flushQueues
                          c <- hTryGetChar handle
                          return $ c == Just 'E'
         
         logInfo "Exiting normally..."

         where
            unHoist :: Functor m => AppState (App m) -> LogAction (App m) x -> LogAction m x
            unHoist s (LogAction xappm) = LogAction $ \x -> fst <$> unApp (xappm x) s
