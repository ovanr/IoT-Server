{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TemplateHaskell #-}

module IOT.Device.Cam
  ( takePicture
  , RaspiStillOpt(..)
  , nullRaspiOpt
  , ImgType(..)
  , Exposure(..)
  , Awb(..)
  , ImgEffect(..)
  , vflip
  , hflip
  , rotation
  , quality
  , encoding
  , sharpness
  , contrast
  , brightness
  , saturation
  , exposure
  , awb
  , imxfx
  , timeout
  ) where

import Data.Aeson
import Data.Aeson.TH
import qualified Data.ByteString.Lazy as BL
import Data.Char (toLower)
import Data.Maybe (fromJust, isJust)
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE (decodeUtf8)

import Control.Lens (makeLenses)

import Shelly
import System.IO (hSetBinaryMode)
import System.Log.Logger (debugM)

data ImgType
  = JPG
  | PNG
  | BMP
  | GIF
  deriving (Show, Eq)

$(deriveJSON defaultOptions {constructorTagModifier = map toLower} ''ImgType)

data Exposure
  = E_OFF
  | E_AUTO
  | E_NIGHT
  | E_NIGHTPREVIEW
  | E_BACKLIGHT
  | E_SPOTLIGHT
  | E_SPORTS
  | E_SNOW
  | E_BEACH
  | E_VERYLONG
  | E_FIXEDFPS
  | E_ANTISHAKE
  | E_FIREWORKS
  deriving (Show, Eq)

$(deriveJSON
    defaultOptions
      { constructorTagModifier =
          T.unpack . T.toLower . last . T.splitOn "_" . T.pack
      }
    ''Exposure)

data Awb
  = A_OFF
  | A_AUTO
  | A_SUN
  | A_CLOUD
  | A_SHADE
  | A_TUNGSTEN
  | A_FLUORESCENT
  | A_INCANDESCENT
  | A_FLASH
  | A_HORIZON
  | A_GREYWORLD
  deriving (Show, Eq)

$(deriveJSON
    defaultOptions
      { constructorTagModifier =
          T.unpack . T.toLower . last . T.splitOn "_" . T.pack
      }
    ''Awb)

data ImgEffect
  = I_NONE
  | I_NEGATIVE
  | I_SOLARISE
  | I_SKETCH
  | I_DENOISE
  | I_EMBOSS
  | I_OILPAINT
  | I_HATCH
  | I_GPEN
  | I_PASTEL
  | I_WATERCOLOUR
  | I_FILM
  | I_BLUR
  | I_SATURATION
  | I_COLOURSWAP
  | I_WASHEDOUT
  | I_POSTERISE
  | I_COLOURPOINT
  | I_COLOURBALANCE
  | I_CARTOON
  deriving (Show, Eq)

$(deriveJSON
    defaultOptions
      { constructorTagModifier =
          T.unpack . T.toLower . last . T.splitOn "_" . T.pack
      }
    ''ImgEffect)

data RaspiStillOpt =
  RaspiStillOpt
    { _vflip :: Maybe Bool
    , _hflip :: Maybe Bool
    , _rotation :: Maybe Int
    , _quality :: Maybe Int
    , _encoding :: Maybe ImgType
    , _sharpness :: Maybe Int
    , _contrast :: Maybe Int
    , _brightness :: Maybe Int
    , _saturation :: Maybe Int
    , _exposure :: Maybe Exposure
    , _awb :: Maybe Awb
    , _imxfx :: Maybe ImgEffect
    , _timeout :: Maybe Int
    }
  deriving (Show, Eq)

makeLenses ''RaspiStillOpt

$(deriveToJSON
    defaultOptions {omitNothingFields = True, fieldLabelModifier = drop 1}
    ''RaspiStillOpt)

nullRaspiOpt :: RaspiStillOpt
nullRaspiOpt =
  RaspiStillOpt
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing
    Nothing

instance FromJSON RaspiStillOpt where
  parseJSON =
    withObject "RaspiStillOpt" $ \o -> do
      _vflip <- o .:? "vflip"
      _hflip <- o .:? "hflip"
      _rotation <- o .:? "rotation"
      _quality <- o .:? "quality"
      _encoding <- o .:? "encoding"
      _sharpness <- o .:? "sharpness"
      _contrast <- o .:? "contrast"
      _brightness <- o .:? "brightness"
      _saturation <- o .:? "saturation"
      _exposure <- o .:? "exposure"
      _awb <- o .:? "awb"
      _imxfx <- o .:? "imxfx"
      _timeout <- o .:? "timeout"
      when
        (isJust _rotation &&
         (fromJust _rotation < 0 || fromJust _rotation > 359)) $
        fail $ "Invalid rotation value: " ++ show _rotation
      when
        (isJust _quality && (fromJust _quality < 0 || fromJust _quality > 100)) $
        fail $ "Invalid quality value: " ++ show _quality
      return RaspiStillOpt {..}

toCliArgs :: ToJSON a => a -> [T.Text]
toCliArgs =
  filter (not . T.null) .
  concatMap (\[x, y] -> ["--" `T.append` x, T.replace "true" "" y]) .
  filter (\s -> last s /= "false") .
  map (T.splitOn ":" . T.replace "\"" "") .
  filter (not . T.null) .
  T.splitOn "," . T.drop 1 . T.dropEnd 1 . TE.decodeUtf8 . BL.toStrict . encode

-- TODO: ?catch exceptions
takePicture :: RaspiStillOpt -> IO BL.ByteString
takePicture opt = do
  debugM "App.takePicture" (show cliargs)
  shelly . silently $ runHandle "raspistill" cliargs handleOut
  where
    handleOut h = liftIO $ hSetBinaryMode h True >> BL.hGet h maxBound
    cliargs = ["--output", "-"] ++ toCliArgs opt
