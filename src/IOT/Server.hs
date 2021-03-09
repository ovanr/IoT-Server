{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module IOT.Server
   ( initApp
   , runApp
   ) where

import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Lazy.UTF8 as BLU

import Control.Monad.Reader
import Data.Aeson (eitherDecode)
import qualified Data.ByteString.UTF8 as BU
import Data.Char
import Data.Either
import Data.Either.Combinators
import Data.IORef
import qualified Data.Map.Strict as Map
import Data.String (fromString)
import qualified Data.Text as T
import Data.Time.Clock (UTCTime)
import Database.InfluxDB
import Database.MySQL.Base hiding (Packet(..))
import IOT.Packet.Format (isImg, isJson)
import IOT.Packet.Types (Packet(..), PacketUnique(..))
import IOT.Misc (refModify', liftEither)
import IOT.Server.Types
   ( App 
   , AppState(..)
   , AppEnv(..)
   , AppCb(..)
   , ServerArgs(..)
   , ServerConf(..)
   , runAppCb
   , amqpConn
   , amqpHost
   , logAction
   , amqpPass
   , amqpUser
   , amqpVhost
   , confPath
   , event
   , infxConn
   , infxDb
   , infxHost
   , infxMeasurement
   , mysqlConn
   , mysqlDb
   , mysqlHost
   , mysqlPass
   , mysqlUser
   , pendingInfx
   , pendingMysql
   , sConf
   , verbosity
   , Uid
   )
import System.Timeout
import Control.Exception
import Control.Concurrent
import Control.Lens
import Data.Bifunctor (bimap)
import Data.Function ((&))
import Data.Time (getCurrentTime)
import Data.Time.Format
import Database.InfluxDB.Line
import Network.AMQP
import Data.Version (showVersion)
import Paths_iot_server (version)
import Colog.Message hiding (Message)
import Colog.Actions 
import Colog.Core.Severity 
import Colog.Core.Action

import qualified Codec.Compression.GZip as GZip
import qualified Control.Concurrent.Event as Event
import Control.Monad ((=<<))
import Control.Monad.Trans.Except

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
   q <- view pendingMysql 
   liftIO $ refModify' ((uid, bin) :) q
   return ()

isOpenMysql :: MySQLConn -> IO Bool
isOpenMysql c = catch (ping c >> return True) (\(e :: NetworkException) -> return False)

getMysqlConnection :: App IO MySQLConn
getMysqlConnection = do
   conn <- use mysqlConn
   isActive <- liftIO (isOpenMysql conn)
   unless isActive $ do
      conf <- mysqlConfig
      conn <- liftIO (connect conf)
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
   logInfo $ "Received a msg with key " <> (envRoutingKey e)
   whenRight (parseBody msg uid) parsePacket
  where
    menv = env & logAction %~ (hoistLogAction liftIO)  
    uid = last . T.split (== '.') . envRoutingKey $ e
    parsePacket (Packet uid uniq) = do
       case uniq of
          (SensorData f) -> queueSensorData f uid 
          (SensorRaw bin) -> queueSensorImage uid bin
          _ -> fail "Incorrect packet format"
       view event >>= (liftIO . Event.signal) 

mysqlConfig :: (MonadReader (AppEnv m) m) => m ConnectInfo
mysqlConfig = do
   conf <- view sConf
   return $ defaultConnectInfo
             { ciHost = conf ^. mysqlHost
             , ciUser = BU.fromString $ view mysqlUser conf
             , ciPassword = BU.fromString $ view mysqlPass conf
             , ciDatabase = BU.fromString $ view mysqlDb conf
             }
flushImageQueue :: App IO ()
flushImageQueue = do
   imgs <- view pendingMysql >>= (liftIO . readIORef)
   conn <- getMysqlConnection
   logInfo "Uploading image to DB"
   stmt <-
      liftIO $
      prepareStmt conn "INSERT INTO device_images (node_id, bin) VALUES (?,?)"
   flip mapM_ imgs $ \(uid, bin) ->
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
   flushDataQueue 
   flushImageQueue 
   view event >>= (liftIO . Event.wait) 

initApp :: ServerArgs -> IO (AppState IO)
initApp args = do
   putStrLn $ "Amqp-forw v." ++ (showVersion version)
   
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

   env <- AppEnv richMessageAction conf 
            <$> newIORef [] 
            <*> newIORef [] 
            <*> Event.new
   
   let mysqlInfo = runReader mysqlConfig env

   AppState env wp <$>
      openConnection
         (conf ^. amqpHost)
         (conf ^. amqpVhost)
         (conf ^. amqpUser)
         (conf ^. amqpPass) <*> connect mysqlInfo

loop :: (Monad m) => m Bool -> m ()
loop m = m >>= (`when` loop m)

runApp :: App IO ()
runApp = do
   chan <- openChannel <$> use amqpConn
   logDebug "hello" 
   return ()
   --th <- forkIO $ loop (threadDelay 10000000 >> flushQueues st >> return True)
   --debugM "App.Run" $ "Thread " ++ show th ++ " started"
   --tag <- consumeMsgs chan "q_all" NoAck $ pktHandler st
   --loop $ do
   --   putStrLn "Enter quit to exit program"
   --   resp <- getLine
   --   if resp == "quit"
   --      then return False
   --      else return True
   --cancelConsumer chan tag
   --killThread th
   --st ^. amqpConn & closeConnection
   --infoM "App.Run" "Exiting.."
   --removeAllHandlers
