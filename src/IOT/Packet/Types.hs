{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module IOT.Packet.Types
  ( Conf(..)
  , Packet(..)
  , PacketUnique(..)
  , Cmd(..)
  , fallbackMqtt
  , savedMqtt
  , username
  , password
  , burstInterval
  , burst
  , wakeOn
  , imgOptions
  , uid
  , uniq
  , fields
  , bin
  , cmd
  ) where

import Control.Lens (makeLenses)
import Control.Monad (unless)
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
  , withScientific
  )
import qualified Data.ByteString.Base64 as Base64 (decode, encode)
import qualified Data.ByteString.Lazy as BL (ByteString, fromStrict, toStrict)
import Data.Function ((&))
import qualified Data.HashMap.Strict as HM
import Data.Maybe (maybeToList)
import qualified Data.Text as T (Text, unpack)
import qualified Data.Text.Encoding as TE (decodeUtf8, encodeUtf8)
import Data.Time.Clock (UTCTime)
import Data.Time.Format (defaultTimeLocale, formatTime, parseTimeM)
import qualified Data.Vector as V (fromList)
import IOT.Device.Cam (RaspiStillOpt, nullRaspiOpt)
import IOT.Packet.Format (isImg')
import Network.URI (URI(..))
import qualified Network.URI as URI

data Conf =
  Conf
    { _fallbackMqtt :: [URI]
    , _savedMqtt :: Maybe URI
    , _username :: String
    , _password :: String
    , _burstInterval :: Int
    , _burst :: Int
    , _wakeOn :: [UTCTime]
    , _imgOptions :: RaspiStillOpt
    }
  deriving (Show, Eq)

makeLenses ''Conf

data Cmd
  = Reboot
  | ConfUpdate
      { newConf :: Conf
      }
  | OtaUpdate
      { upFile :: BL.ByteString
      }
  deriving (Eq)

data PacketUnique
  = SensorData
      { _fields :: [(T.Text, Float)]
      }
  | SensorRaw
      { _bin :: BL.ByteString
      }
  | SensorCmd
      { _cmd :: Cmd
      }
  deriving (Eq)

makeLenses ''PacketUnique

data Packet =
  Packet
    { _uid :: T.Text
    , _uniq :: PacketUnique
    }
  deriving (Eq)

makeLenses ''Packet

toPairs :: (KeyValue a) => Value -> [a]
toPairs (Object x) =
  reverse $ HM.foldlWithKey' (\acc k v -> (k .= v) : acc) [] x

maybeM :: Monad m => (a -> m b) -> Maybe a -> m (Maybe b)
maybeM _ Nothing = return Nothing
maybeM f (Just a) = Just <$> f a

instance FromJSON Conf where
  parseJSON =
    withObject "Conf" $ \o -> do
      _fallbackMqtt <- (o .:? "fallbackMqtt" .!= []) >>= mapM parseUriM
      _savedMqtt <- (o .:? "savedMqtt") >>= maybeM parseUriM
      _username <- o .:? "username" .!= ""
      _password <- o .:? "password" .!= ""
      _burstInterval <- o .:? "burstInterval" .!= 0
      _burst <- o .:? "burst" .!= 0
      _wakeOn <- (o .:? "wakeOn" .!= []) >>= mapM parseTime
      _imgOptions <- o .:? "imgOptions" .!= nullRaspiOpt
      return $ Conf {..}
    where
      parseTime = parseTimeM True defaultTimeLocale "%H:%M"
      parseUriM (String s) =
        case URI.parseURI . T.unpack $ s of
          Just x -> return x
          Nothing -> fail $ "url parse error on " ++ show s

instance ToJSON Conf where
  toJSON (Conf fl s u p bi b w iopt) =
    object $
    [ "fallbackMqtt" .= (V.fromList . map parseURI $ fl)
    , "username" .= u
    , "password" .= p
    , "burstInterval" .= bi
    , "burst" .= b
    , "wakeOn" .= (V.fromList . map parseDate $ w)
    , "imgOptions" .= iopt
    ] ++
    maybe [] (return . ("savedMqtt" .=) . parseURI) s
    where
      parseDate = formatTime defaultTimeLocale "%H:%M"
      parseURI = (mempty &) . URI.uriToString id

instance ToJSON Packet where
  toJSON (Packet uid uniq) = object $ ("uid" .= uid) : toPairs (toJSON uniq)

instance FromJSON Packet where
  parseJSON =
    withObject "SensorData or SensorImg or SensorCmd" $ \o -> do
      uid <- o .: "uid"
      uniq <- parseJSON (Object o)
      return $ Packet uid uniq

instance ToJSON PacketUnique where
  toJSON (SensorData f) =
    object
      [ "pktType" .= (0 :: Int)
      , "fields" .= (Array . V.fromList . map fieldToObj $ f)
      ]
    where
      fieldToObj (f, vf) = object ["f" .= f, "vf" .= vf]
  toJSON (SensorRaw b) = object ["pktType" .= (1 :: Int), "bin" .= base64enc b]
    where
      base64enc = TE.decodeUtf8 . Base64.encode . BL.toStrict
  toJSON (SensorCmd cmd) =
    case cmd of
      Reboot -> object ["pktType" .= (2 :: Int), "cmd" .= ("reboot" :: T.Text)]
      ConfUpdate cnf ->
        object
          [ "pktType" .= (2 :: Int)
          , "cmd" .= ("conf-update" :: T.Text)
          , "payload" .= cnf
          ]

instance FromJSON PacketUnique where
  parseJSON =
    withObject "SensorData or SensorImg or SensorCmd" $ \o -> do
      rawtype <- o .: "pktType"
      pktType <- withScientific "pktType" return rawtype
      case pktType of
        0 -> do
          arr <- o .: "fields"
          fields <- mapM objToField arr
          return $ SensorData fields
        1 -> do
          raw <- o .: "bin"
          tryImgDecode raw
        2 -> do
          cmd <- o .: "cmd"
          case cmd of
            "reboot" -> return $ SensorCmd Reboot
            "conf-update" -> do
              c <- o .: "payload"
              return . SensorCmd . ConfUpdate $ c
            _ -> fail $ "unrecognised Command" ++ show (cmd :: T.Text)
    where
      objToField o = (,) <$> o .: "f" <*> o .: "vf"
      tryImgDecode bin =
        case Base64.decode . TE.encodeUtf8 $ bin of
          Right raw_bin -> do
            unless (isImg' raw_bin) $ fail "Not an Image"
            return $ SensorRaw $ BL.fromStrict raw_bin
          Left err -> fail err
