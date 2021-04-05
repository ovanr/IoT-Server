{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module IOT.Packet.Types where

import Control.Lens (makeLenses, (%%~), (<~))
import Control.Monad (unless)
import Data.Aeson.Types (Parser, Object)
import Data.Aeson
  ( FromJSON
  , KeyValue
  , ToJSON
  , Value(..)
  , (.!=)
  , (.:)
  , (.:?)
  , (.=)
  , object
  , parseJSON
  , toJSON
  , withObject
  , withText
  , withScientific
  )
import Data.Int
import Data.ProtoLens.Encoding.Wire
import qualified Data.List as L
import Data.Aeson.TH
import qualified Data.ByteString as B
import qualified Data.ByteString.Base64 as Base64 (decode, encode)
import qualified Data.ByteString.Lazy as BL (ByteString, fromStrict, toStrict)
import Data.Function ((&))
import Data.Maybe (maybeToList)
import qualified Data.Text as T (Text, unpack)
import qualified Data.Text.Encoding as TE (decodeUtf8, encodeUtf8)
import Data.Time.Clock (UTCTime)
import Data.Time.Format (defaultTimeLocale, formatTime, parseTimeM)
import qualified Data.Vector as V (fromList)
import IOT.Packet.Format (isImg')
import Network.URI (URI(..))
import qualified Network.URI as URI
import Control.Monad.State

import Data.ProtoLens
import Proto.Packetdt 
import Proto.Packetdt_Fields
import Proto.Packetdt_JSON
import Proto.Configdt
import Proto.Configdt_Fields
import Proto.Configdt_JSON
import Proto.Sensordt
import Proto.Sensordt_Fields
import Proto.Sensordt_JSON
import Proto.Sensors.Raspcamdt
import Proto.Sensors.Raspcamdt_Fields
import Proto.Sensors.Raspcamdt_JSON
import Proto.Sensors.Cpudt
import Proto.Sensors.Cpudt_Fields
import Proto.Sensors.Cpudt_JSON

maybeM :: Monad m => (a -> m b) -> Maybe a -> m (Maybe b)
maybeM _ Nothing = return Nothing
maybeM f (Just a) = Just <$> f a

(.:^) :: (FromJSON a, MonadTrans t) 
         => Object -> T.Text -> t Parser a
(.:^) o k = lift (o .: k)
