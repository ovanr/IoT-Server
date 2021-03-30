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
import Proto.ConfigDt
import Proto.ConfigDt_Fields
import Data.ProtoLens
import Proto.PacketDt 
import Proto.SensorDt
import Proto.Sensors.RaspCamDt
import Proto.Sensors.CpuDt
import Proto.Google.Protobuf.Timestamp
import Control.Monad.State

maybeM :: Monad m => (a -> m b) -> Maybe a -> m (Maybe b)
maybeM _ Nothing = return Nothing
maybeM f (Just a) = Just <$> f a

(.:^) :: (FromJSON a, MonadTrans t) 
         => Object -> T.Text -> t Parser a
(.:^) o k = lift (o .: k)

instance FromJSON Time where
   parseJSON = 
      withObject "Time" $ \o ->
         flip execStateT (defMessage :: Time) $ do
            hour <~ (o .:^ "hour")
            minute <~ (o .:^ "minute")

instance FromJSON DeviceConf where
  parseJSON =
    withObject "DeviceConf" $ \o ->
      flip execStateT (defMessage :: DeviceConf) $ do
         mqttHost <~ (o .:^ "mqttHost")
         mqttPort <~ (o .:^ "mqttPort") 
         mqttUser <~ (o .:^ "mqttUser")
         mqttPass <~ (o .:^ "mqttPass")
         burstInterval <~ (o .:^ "burstInterval")
         burstCount <~ (o .:^ "burstCount")
         wakeOn <~ (o .:^ "wakeOn")
    where
      parseTime :: String -> Parser UTCTime
      parseTime = parseTimeM True defaultTimeLocale "%H:%M"
      parseUriM (String s) =
        case URI.parseURI . T.unpack $ s of
          Just x -> return x
          Nothing -> fail $ "url parse error on " ++ show s

instance FromJSON B.ByteString where
   parseJSON =
      withText "ByteString" $ \t ->
         either 
            (const $ fail "base64 decode error")
            pure 
            (Base64.decode . TE.encodeUtf8 $ t)

instance ToJSON B.ByteString where
   toJSON = String . TE.decodeUtf8 . Base64.encode 

$(deriveJSON defaultOptions ''Encoding'UnrecognizedValue)
$(deriveJSON defaultOptions ''Encoding)
$(deriveJSON defaultOptions ''Awb'UnrecognizedValue)
$(deriveJSON defaultOptions ''Awb)
$(deriveJSON defaultOptions ''Exposure'UnrecognizedValue)
$(deriveJSON defaultOptions ''Exposure)
$(deriveJSON defaultOptions ''Imxfx'UnrecognizedValue)
$(deriveJSON defaultOptions ''Imxfx)
$(deriveJSON defaultOptions{ 
      fieldLabelModifier = tail . L.dropWhile (/= '\'')
   } ''RaspCamOpt)
$(deriveJSON defaultOptions ''TaggedValue)
$(deriveJSON defaultOptions ''Tag)
$(deriveJSON defaultOptions ''WireValue)

$(deriveJSON defaultOptions ''Timestamp)
$(deriveToJSON defaultOptions ''Time)
$(deriveToJSON defaultOptions ''DeviceConf)
$(deriveJSON defaultOptions ''ModuleConf)
$(deriveJSON defaultOptions ''Packet)
$(deriveJSON defaultOptions ''Packet'Type)
$(deriveJSON defaultOptions ''CpuOpt)
$(deriveJSON defaultOptions ''CpuOut)
$(deriveJSON defaultOptions ''RaspCamOut)
$(deriveJSON defaultOptions ''Output'Output)
$(deriveJSON defaultOptions ''Output)
$(deriveJSON defaultOptions ''SensorOut)
$(deriveJSON defaultOptions ''Command)

--instance ToJSON Conf where
--  toJSON (Conf fl s u p bi b w iopt) =
--    object $
--    [ "fallbackMqtt" .= (V.fromList . map parseURI $ fl)
--    , "username" .= u
--    , "password" .= p
--    , "burstInterval" .= bi
--    , "burst" .= b
--    , "wakeOn" .= (V.fromList . map parseDate $ w)
--    , "imgOptions" .= iopt
--    ] ++
--    maybe [] (return . ("savedMqtt" .=) . parseURI) s
--    where
--      parseDate = formatTime defaultTimeLocale "%H:%M"
--      parseURI = (mempty &) . URI.uriToString id
--
--instance ToJSON Packet where
--  toJSON (Packet uid uniq) = object $ ("uid" .= uid) : toPairs (toJSON uniq)
--
--instance FromJSON Packet where
--  parseJSON =
--    withObject "SensorData or SensorImg or SensorCmd" $ \o -> do
--      uid <- o .: "uid"
--      uniq <- parseJSON (Object o)
--      return $ Packet uid uniq
--
--instance ToJSON PacketUnique where
--  toJSON (SensorData f) =
--    object
--      [ "pktType" .= (0 :: Int)
--      , "fields" .= (Array . V.fromList . map fieldToObj $ f)
--      ]
--    where
--      fieldToObj (f, vf) = object ["f" .= f, "vf" .= vf]
--  toJSON (SensorRaw b) = object ["pktType" .= (1 :: Int), "bin" .= base64enc b]
--    where
--      base64enc = TE.decodeUtf8 . Base64.encode . BL.toStrict
--  toJSON (SensorCmd cmd) =
--    case cmd of
--      Reboot -> object ["pktType" .= (2 :: Int), "cmd" .= ("reboot" :: T.Text)]
--      ConfUpdate cnf ->
--        object
--          [ "pktType" .= (2 :: Int)
--          , "cmd" .= ("conf-update" :: T.Text)
--          , "payload" .= cnf
--          ]
--
--instance FromJSON PacketUnique where
--  parseJSON =
--    withObject "SensorData or SensorImg or SensorCmd" $ \o -> do
--      rawtype <- o .: "pktType"
--      pktType <- withScientific "pktType" return rawtype
--      case pktType of
--        0 -> do
--          arr <- o .: "fields"
--          fields <- mapM objToField arr
--          return $ SensorData fields
--        1 -> do
--          raw <- o .: "bin"
--          tryImgDecode raw
--        2 -> do
--          cmd <- o .: "cmd"
--          case cmd of
--            "reboot" -> return $ SensorCmd Reboot
--            "conf-update" -> do
--              c <- o .: "payload"
--              return . SensorCmd . ConfUpdate $ c
--            _ -> fail $ "unrecognised Command" ++ show (cmd :: T.Text)
--    where
--      objToField o = (,) <$> o .: "f" <*> o .: "vf"
--      tryImgDecode bin =
--        case Base64.decode . TE.encodeUtf8 $ bin of
--          Right raw_bin -> do
--            unless (isImg' raw_bin) $ fail "Not an Image"
--            return $ SensorRaw $ BL.fromStrict raw_bin
--          Left err -> fail err
