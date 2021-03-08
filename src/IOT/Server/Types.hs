{-# LANGUAGE TemplateHaskell #-}

module IOT.Server.Types where

import Control.Concurrent.Event (Event(..))
import Control.Lens (makeLenses)
import Data.Aeson.TH
import qualified Data.ByteString.Lazy as BL
import Data.IORef (IORef)
import qualified Data.Text as T
import Data.Time.Clock (UTCTime)
import Database.InfluxDB
   ( Database(..)
   , Line(..)
   , Measurement(..)
   , WriteParams(..)
   )
import Database.MySQL.Base (MySQLConn(..))
import Network.AMQP (Connection, Envelope(..))

data ServerArgs =
  ServerArgs
    { _verbosity :: Int
    , _confPath  :: String
    }
  deriving (Show)

makeLenses ''ServerArgs

instance Show Envelope where
  show (Envelope envDeliveryTag envRedelivered envExchangeName envRoutingKey envChannel) =
    "Envelope " ++
    "Delivery Tag {" ++
    show envDeliveryTag ++
    "} " ++
    "Redelivered {" ++
    show envRedelivered ++
    "} " ++
    "ExchangeName {" ++
    show envExchangeName ++ "} " ++ "RoutingKey {" ++ show envRoutingKey ++ "}"

data ServerConf =
  ServerConf
    { _infxHost        :: T.Text
    , _infxMeasurement :: Measurement
    , _infxDb          :: Database
    , _mysqlHost       :: String
    , _mysqlUser       :: String
    , _mysqlPass       :: String
    , _mysqlDb         :: String
    , _amqpHost        :: String
    , _amqpVhost       :: T.Text
    , _amqpUser        :: T.Text
    , _amqpPass        :: T.Text
    }

makeLenses ''ServerConf

type Uid = T.Text

data IMState =
  IMState
    { _sConf        :: ServerConf
    , _infxConn     :: WriteParams
    , _amqpConn     :: Connection
    , _mysqlConn    :: MySQLConn
    , _pendingInfx  :: IORef [Line UTCTime]
    , _pendingMysql :: IORef [(Uid, BL.ByteString)]
    , _event        :: Event
    }

makeLenses ''IMState

$(deriveJSON defaultOptions ''Measurement)

$(deriveJSON defaultOptions {unwrapUnaryRecords = True} ''Database)

$(deriveJSON defaultOptions {fieldLabelModifier = drop 1} ''ServerConf)
