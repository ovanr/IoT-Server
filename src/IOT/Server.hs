{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}

module IOT.Server
   ( initApp
   , runApp
   ) where

import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Lazy.UTF8 as BLU

import Control.Monad.Reader
import Data.Aeson
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
import IOT.Server.Types
   ( IMState(..)
   , ServerArgs(..)
   , ServerConf(..)
   , amqpConn
   , amqpHost
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
   )
import System.Log.Logger
import System.Timeout

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

import qualified Codec.Compression.GZip as GZip
import qualified Control.Concurrent.Event as Event
import Control.Monad ((=<<))
import Control.Monad.Catch
import Control.Monad.Trans.Except

refModify' :: (a -> a) -> IORef a -> IO a 
refModify' f r = r `atomicModifyIORef'` (\a -> (f a, a)) 

queueSensorData :: (Real a) => IMState -> T.Text -> [(T.Text, a)] -> IO ()
queueSensorData st uid f = do
   infoM "App.pktHandler" "Appending data item to Influx Queue"
   t <- getCurrentTime
   let newL =
          Line
             m
             (Map.singleton "node_id" (fromString . T.unpack $ uid))
             (Map.fromList $
              map (bimap (fromString . T.unpack) (FieldFloat . realToFrac)) f)
             (Just t)
   st ^. pendingInfx & refModify' (newL :)
   return ()
  where
    m = st ^. sConf . infxMeasurement

queueSensorImage :: IMState -> T.Text -> BL.ByteString -> IO ()
queueSensorImage st uid bin = do
   let c = st ^. mysqlConn
   st ^. pendingMysql & refModify' ((uid, bin) :)
   return ()

flushImageQueue :: IMState -> IO ()
flushImageQueue st = do
   let c = st ^. mysqlConn
   
   imgs <- readIORef (st ^. pendingMysql)

   infoM "App.pktHandler" "Uploading image to DB"
   stmt <- prepareStmt c "INSERT INTO device_images (node_id, bin) VALUES (?,?)"
   debugM "App.pktHandler" $ show stmt
    
   flip mapM_ imgs $ \(uid, bin) ->
      print =<< executeStmt c stmt [MySQLText uid, MySQLBytes (BL.toStrict bin)]

flushDataQueue :: IMState -> IO ()
flushDataQueue st = do
   l <- st ^. pendingInfx & refModify' (const [])
   unless (null l) $ do
         debugM "App.flushAndWrite" $
            "Sending to Influx these: \n[" ++
            BLU.toString (encodeLines (scaleTo Second) l) ++ "]"
         (st ^. infxConn) & (`writeBatch` l)

flushQueues :: IMState -> IO ()
flushQueues st = do
   flushDataQueue st 
   flushImageQueue st 
   st ^. event & Event.wait

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
       if | isJson b -> jsonParse b
          | isImg b -> imgParse b
          | otherwise -> Left "Incorrect Packet format"

liftEither :: (MonadFail m, Monad m) => Either String a -> m a
liftEither (Left err) = fail err
liftEither (Right a) = return a

pktHandler :: IMState -> (Message, Envelope) -> IO ()
pktHandler st (msg, env) = do
   infoM "App.pktHandler" $ "Received a msg with key " ++
      T.unpack (envRoutingKey env)
   whenRight (parseBody msg uid) parsePacket
  where
    uid = last . T.split (== '.') . envRoutingKey $ env
    parsePacket (Packet uid uniq) = do
       case uniq of
          (SensorData f) -> queueSensorData st uid f
          (SensorRaw bin) -> queueSensorImage st uid bin
          _ -> fail "Incorrect packet format"
       st ^. event & Event.signal

initApp :: ServerArgs -> IO IMState
initApp args = do
   let level =
          case args ^. verbosity of
             3 -> DEBUG
             2 -> INFO
             1 -> WARNING
             0 -> ERROR
   infoM "App" $ "Amqp-forw v." ++ (showVersion version)
   conf <- liftEither . eitherDecode =<< BL.readFile (args ^. confPath)
   let wp =
          writeParams (conf ^. infxDb) & 
          server . host .~ (conf ^. infxHost) &
          precision .~ Second
   let mysqlInfo =
          defaultConnectInfo
             { ciHost = conf ^. mysqlHost
             , ciUser = BU.fromString $ view mysqlUser conf
             , ciPassword = BU.fromString $ view mysqlPass conf
             , ciDatabase = BU.fromString $ view mysqlDb conf
             }
   IMState conf wp <$>
      openConnection
         (conf ^. amqpHost)
         (conf ^. amqpVhost)
         (conf ^. amqpUser)
         (conf ^. amqpPass) <*>
      connect mysqlInfo <*>
      newIORef [] <*>
      newIORef [] <*>
      Event.new

loop :: (Monad m) => m Bool -> m ()
loop m = m >>= (`when` loop m)

runApp :: IMState -> IO ()
runApp st = do
   chan <- st ^. amqpConn & openChannel
   th <- forkIO $ loop (threadDelay 10000000 >> flushQueues st >> return True)
   debugM "App.Run" $ "Thread " ++ show th ++ " started"
   tag <- consumeMsgs chan "q_all" NoAck $ pktHandler st
   loop $ do
      putStrLn "Enter quit to exit program"
      resp <- getLine
      if resp == "quit"
         then return False
         else return True
   cancelConsumer chan tag
   killThread th
   st ^. amqpConn & closeConnection
   infoM "App.Run" "Exiting.."
   removeAllHandlers
