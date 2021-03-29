{- This file was auto-generated from sensors/raspCamDt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Sensors.RaspCamDt (
        Awb(..), Awb(), Awb'UnrecognizedValue, Encoding(..), Encoding(),
        Encoding'UnrecognizedValue, Exposure(..), Exposure(),
        Exposure'UnrecognizedValue, Imxfx(..), Imxfx(),
        Imxfx'UnrecognizedValue, RaspCamOpt(), RaspCamOut()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes as Data.ProtoLens.Encoding.Bytes
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing as Data.ProtoLens.Encoding.Growing
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2 as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8 as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read
newtype Awb'UnrecognizedValue
  = Awb'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Awb
  = Awb_OFF |
    Awb_AUTO |
    Awb_SUN |
    Awb_CLOUD |
    Awb_SHADE |
    Awb_TUNGSTEN |
    Awb_FLUORESCENT |
    Awb_INCANDESCENT |
    Awb_FLASH |
    Awb_HORIZON |
    Awb_GREYWORLD |
    Awb'Unrecognized !Awb'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Awb where
  maybeToEnum 0 = Prelude.Just Awb_OFF
  maybeToEnum 1 = Prelude.Just Awb_AUTO
  maybeToEnum 2 = Prelude.Just Awb_SUN
  maybeToEnum 3 = Prelude.Just Awb_CLOUD
  maybeToEnum 4 = Prelude.Just Awb_SHADE
  maybeToEnum 5 = Prelude.Just Awb_TUNGSTEN
  maybeToEnum 6 = Prelude.Just Awb_FLUORESCENT
  maybeToEnum 7 = Prelude.Just Awb_INCANDESCENT
  maybeToEnum 8 = Prelude.Just Awb_FLASH
  maybeToEnum 9 = Prelude.Just Awb_HORIZON
  maybeToEnum 10 = Prelude.Just Awb_GREYWORLD
  maybeToEnum k
    = Prelude.Just
        (Awb'Unrecognized (Awb'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum Awb_OFF = "Awb_OFF"
  showEnum Awb_AUTO = "Awb_AUTO"
  showEnum Awb_SUN = "Awb_SUN"
  showEnum Awb_CLOUD = "Awb_CLOUD"
  showEnum Awb_SHADE = "Awb_SHADE"
  showEnum Awb_TUNGSTEN = "Awb_TUNGSTEN"
  showEnum Awb_FLUORESCENT = "Awb_FLUORESCENT"
  showEnum Awb_INCANDESCENT = "Awb_INCANDESCENT"
  showEnum Awb_FLASH = "Awb_FLASH"
  showEnum Awb_HORIZON = "Awb_HORIZON"
  showEnum Awb_GREYWORLD = "Awb_GREYWORLD"
  showEnum (Awb'Unrecognized (Awb'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "Awb_OFF" = Prelude.Just Awb_OFF
    | (Prelude.==) k "Awb_AUTO" = Prelude.Just Awb_AUTO
    | (Prelude.==) k "Awb_SUN" = Prelude.Just Awb_SUN
    | (Prelude.==) k "Awb_CLOUD" = Prelude.Just Awb_CLOUD
    | (Prelude.==) k "Awb_SHADE" = Prelude.Just Awb_SHADE
    | (Prelude.==) k "Awb_TUNGSTEN" = Prelude.Just Awb_TUNGSTEN
    | (Prelude.==) k "Awb_FLUORESCENT" = Prelude.Just Awb_FLUORESCENT
    | (Prelude.==) k "Awb_INCANDESCENT" = Prelude.Just Awb_INCANDESCENT
    | (Prelude.==) k "Awb_FLASH" = Prelude.Just Awb_FLASH
    | (Prelude.==) k "Awb_HORIZON" = Prelude.Just Awb_HORIZON
    | (Prelude.==) k "Awb_GREYWORLD" = Prelude.Just Awb_GREYWORLD
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Awb where
  minBound = Awb_OFF
  maxBound = Awb_GREYWORLD
instance Prelude.Enum Awb where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Awb: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum Awb_OFF = 0
  fromEnum Awb_AUTO = 1
  fromEnum Awb_SUN = 2
  fromEnum Awb_CLOUD = 3
  fromEnum Awb_SHADE = 4
  fromEnum Awb_TUNGSTEN = 5
  fromEnum Awb_FLUORESCENT = 6
  fromEnum Awb_INCANDESCENT = 7
  fromEnum Awb_FLASH = 8
  fromEnum Awb_HORIZON = 9
  fromEnum Awb_GREYWORLD = 10
  fromEnum (Awb'Unrecognized (Awb'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ Awb_GREYWORLD
    = Prelude.error
        "Awb.succ: bad argument Awb_GREYWORLD. This value would be out of bounds."
  succ Awb_OFF = Awb_AUTO
  succ Awb_AUTO = Awb_SUN
  succ Awb_SUN = Awb_CLOUD
  succ Awb_CLOUD = Awb_SHADE
  succ Awb_SHADE = Awb_TUNGSTEN
  succ Awb_TUNGSTEN = Awb_FLUORESCENT
  succ Awb_FLUORESCENT = Awb_INCANDESCENT
  succ Awb_INCANDESCENT = Awb_FLASH
  succ Awb_FLASH = Awb_HORIZON
  succ Awb_HORIZON = Awb_GREYWORLD
  succ (Awb'Unrecognized _)
    = Prelude.error "Awb.succ: bad argument: unrecognized value"
  pred Awb_OFF
    = Prelude.error
        "Awb.pred: bad argument Awb_OFF. This value would be out of bounds."
  pred Awb_AUTO = Awb_OFF
  pred Awb_SUN = Awb_AUTO
  pred Awb_CLOUD = Awb_SUN
  pred Awb_SHADE = Awb_CLOUD
  pred Awb_TUNGSTEN = Awb_SHADE
  pred Awb_FLUORESCENT = Awb_TUNGSTEN
  pred Awb_INCANDESCENT = Awb_FLUORESCENT
  pred Awb_FLASH = Awb_INCANDESCENT
  pred Awb_HORIZON = Awb_FLASH
  pred Awb_GREYWORLD = Awb_HORIZON
  pred (Awb'Unrecognized _)
    = Prelude.error "Awb.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Awb where
  fieldDefault = Awb_OFF
instance Control.DeepSeq.NFData Awb where
  rnf x__ = Prelude.seq x__ ()
newtype Encoding'UnrecognizedValue
  = Encoding'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Encoding
  = JPEG |
    PNG |
    BMP |
    GIF |
    Encoding'Unrecognized !Encoding'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Encoding where
  maybeToEnum 0 = Prelude.Just JPEG
  maybeToEnum 1 = Prelude.Just PNG
  maybeToEnum 2 = Prelude.Just BMP
  maybeToEnum 3 = Prelude.Just GIF
  maybeToEnum k
    = Prelude.Just
        (Encoding'Unrecognized
           (Encoding'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum JPEG = "JPEG"
  showEnum PNG = "PNG"
  showEnum BMP = "BMP"
  showEnum GIF = "GIF"
  showEnum (Encoding'Unrecognized (Encoding'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "JPEG" = Prelude.Just JPEG
    | (Prelude.==) k "PNG" = Prelude.Just PNG
    | (Prelude.==) k "BMP" = Prelude.Just BMP
    | (Prelude.==) k "GIF" = Prelude.Just GIF
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Encoding where
  minBound = JPEG
  maxBound = GIF
instance Prelude.Enum Encoding where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Encoding: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum JPEG = 0
  fromEnum PNG = 1
  fromEnum BMP = 2
  fromEnum GIF = 3
  fromEnum (Encoding'Unrecognized (Encoding'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ GIF
    = Prelude.error
        "Encoding.succ: bad argument GIF. This value would be out of bounds."
  succ JPEG = PNG
  succ PNG = BMP
  succ BMP = GIF
  succ (Encoding'Unrecognized _)
    = Prelude.error "Encoding.succ: bad argument: unrecognized value"
  pred JPEG
    = Prelude.error
        "Encoding.pred: bad argument JPEG. This value would be out of bounds."
  pred PNG = JPEG
  pred BMP = PNG
  pred GIF = BMP
  pred (Encoding'Unrecognized _)
    = Prelude.error "Encoding.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Encoding where
  fieldDefault = JPEG
instance Control.DeepSeq.NFData Encoding where
  rnf x__ = Prelude.seq x__ ()
newtype Exposure'UnrecognizedValue
  = Exposure'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Exposure
  = Exp_OFF |
    Exp_AUTO |
    Exp_NIGHT |
    Exp_NIGHTPREVIEW |
    Exp_BACKLIGHT |
    Exp_SPOTLIGHT |
    Exp_SPORTS |
    Exp_SNOW |
    Exp_BEACH |
    Exp_VERYLONG |
    Exp_FIXEDFPS |
    Exp_ANTISHAKE |
    Exp_FIREWORKS |
    Exposure'Unrecognized !Exposure'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Exposure where
  maybeToEnum 0 = Prelude.Just Exp_OFF
  maybeToEnum 1 = Prelude.Just Exp_AUTO
  maybeToEnum 2 = Prelude.Just Exp_NIGHT
  maybeToEnum 3 = Prelude.Just Exp_NIGHTPREVIEW
  maybeToEnum 4 = Prelude.Just Exp_BACKLIGHT
  maybeToEnum 5 = Prelude.Just Exp_SPOTLIGHT
  maybeToEnum 6 = Prelude.Just Exp_SPORTS
  maybeToEnum 7 = Prelude.Just Exp_SNOW
  maybeToEnum 8 = Prelude.Just Exp_BEACH
  maybeToEnum 9 = Prelude.Just Exp_VERYLONG
  maybeToEnum 10 = Prelude.Just Exp_FIXEDFPS
  maybeToEnum 11 = Prelude.Just Exp_ANTISHAKE
  maybeToEnum 12 = Prelude.Just Exp_FIREWORKS
  maybeToEnum k
    = Prelude.Just
        (Exposure'Unrecognized
           (Exposure'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum Exp_OFF = "Exp_OFF"
  showEnum Exp_AUTO = "Exp_AUTO"
  showEnum Exp_NIGHT = "Exp_NIGHT"
  showEnum Exp_NIGHTPREVIEW = "Exp_NIGHTPREVIEW"
  showEnum Exp_BACKLIGHT = "Exp_BACKLIGHT"
  showEnum Exp_SPOTLIGHT = "Exp_SPOTLIGHT"
  showEnum Exp_SPORTS = "Exp_SPORTS"
  showEnum Exp_SNOW = "Exp_SNOW"
  showEnum Exp_BEACH = "Exp_BEACH"
  showEnum Exp_VERYLONG = "Exp_VERYLONG"
  showEnum Exp_FIXEDFPS = "Exp_FIXEDFPS"
  showEnum Exp_ANTISHAKE = "Exp_ANTISHAKE"
  showEnum Exp_FIREWORKS = "Exp_FIREWORKS"
  showEnum (Exposure'Unrecognized (Exposure'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "Exp_OFF" = Prelude.Just Exp_OFF
    | (Prelude.==) k "Exp_AUTO" = Prelude.Just Exp_AUTO
    | (Prelude.==) k "Exp_NIGHT" = Prelude.Just Exp_NIGHT
    | (Prelude.==) k "Exp_NIGHTPREVIEW" = Prelude.Just Exp_NIGHTPREVIEW
    | (Prelude.==) k "Exp_BACKLIGHT" = Prelude.Just Exp_BACKLIGHT
    | (Prelude.==) k "Exp_SPOTLIGHT" = Prelude.Just Exp_SPOTLIGHT
    | (Prelude.==) k "Exp_SPORTS" = Prelude.Just Exp_SPORTS
    | (Prelude.==) k "Exp_SNOW" = Prelude.Just Exp_SNOW
    | (Prelude.==) k "Exp_BEACH" = Prelude.Just Exp_BEACH
    | (Prelude.==) k "Exp_VERYLONG" = Prelude.Just Exp_VERYLONG
    | (Prelude.==) k "Exp_FIXEDFPS" = Prelude.Just Exp_FIXEDFPS
    | (Prelude.==) k "Exp_ANTISHAKE" = Prelude.Just Exp_ANTISHAKE
    | (Prelude.==) k "Exp_FIREWORKS" = Prelude.Just Exp_FIREWORKS
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Exposure where
  minBound = Exp_OFF
  maxBound = Exp_FIREWORKS
instance Prelude.Enum Exposure where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Exposure: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum Exp_OFF = 0
  fromEnum Exp_AUTO = 1
  fromEnum Exp_NIGHT = 2
  fromEnum Exp_NIGHTPREVIEW = 3
  fromEnum Exp_BACKLIGHT = 4
  fromEnum Exp_SPOTLIGHT = 5
  fromEnum Exp_SPORTS = 6
  fromEnum Exp_SNOW = 7
  fromEnum Exp_BEACH = 8
  fromEnum Exp_VERYLONG = 9
  fromEnum Exp_FIXEDFPS = 10
  fromEnum Exp_ANTISHAKE = 11
  fromEnum Exp_FIREWORKS = 12
  fromEnum (Exposure'Unrecognized (Exposure'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ Exp_FIREWORKS
    = Prelude.error
        "Exposure.succ: bad argument Exp_FIREWORKS. This value would be out of bounds."
  succ Exp_OFF = Exp_AUTO
  succ Exp_AUTO = Exp_NIGHT
  succ Exp_NIGHT = Exp_NIGHTPREVIEW
  succ Exp_NIGHTPREVIEW = Exp_BACKLIGHT
  succ Exp_BACKLIGHT = Exp_SPOTLIGHT
  succ Exp_SPOTLIGHT = Exp_SPORTS
  succ Exp_SPORTS = Exp_SNOW
  succ Exp_SNOW = Exp_BEACH
  succ Exp_BEACH = Exp_VERYLONG
  succ Exp_VERYLONG = Exp_FIXEDFPS
  succ Exp_FIXEDFPS = Exp_ANTISHAKE
  succ Exp_ANTISHAKE = Exp_FIREWORKS
  succ (Exposure'Unrecognized _)
    = Prelude.error "Exposure.succ: bad argument: unrecognized value"
  pred Exp_OFF
    = Prelude.error
        "Exposure.pred: bad argument Exp_OFF. This value would be out of bounds."
  pred Exp_AUTO = Exp_OFF
  pred Exp_NIGHT = Exp_AUTO
  pred Exp_NIGHTPREVIEW = Exp_NIGHT
  pred Exp_BACKLIGHT = Exp_NIGHTPREVIEW
  pred Exp_SPOTLIGHT = Exp_BACKLIGHT
  pred Exp_SPORTS = Exp_SPOTLIGHT
  pred Exp_SNOW = Exp_SPORTS
  pred Exp_BEACH = Exp_SNOW
  pred Exp_VERYLONG = Exp_BEACH
  pred Exp_FIXEDFPS = Exp_VERYLONG
  pred Exp_ANTISHAKE = Exp_FIXEDFPS
  pred Exp_FIREWORKS = Exp_ANTISHAKE
  pred (Exposure'Unrecognized _)
    = Prelude.error "Exposure.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Exposure where
  fieldDefault = Exp_OFF
instance Control.DeepSeq.NFData Exposure where
  rnf x__ = Prelude.seq x__ ()
newtype Imxfx'UnrecognizedValue
  = Imxfx'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Imxfx
  = Imxfx_NONE |
    Imxfx_NEGATIVE |
    Imxfx_SOLARISE |
    Imxfx_SKETCH |
    Imxfx_DENOISE |
    Imxfx_EMBOSS |
    Imxfx_OILPAINT |
    Imxfx_HATCH |
    Imxfx_GPEN |
    Imxfx_PASTEL |
    Imxfx_WATERCOLOUR |
    Imxfx_FILM |
    Imxfx_BLUR |
    Imxfx_SATURATION |
    Imxfx_COLOURSWAP |
    Imxfx_WASHEDOUT |
    Imxfx_POSTERISE |
    Imxfx_COLOURPOINT |
    Imxfx_COLOURBALANCE |
    Imxfx_CARTOON |
    Imxfx'Unrecognized !Imxfx'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Imxfx where
  maybeToEnum 0 = Prelude.Just Imxfx_NONE
  maybeToEnum 1 = Prelude.Just Imxfx_NEGATIVE
  maybeToEnum 2 = Prelude.Just Imxfx_SOLARISE
  maybeToEnum 3 = Prelude.Just Imxfx_SKETCH
  maybeToEnum 4 = Prelude.Just Imxfx_DENOISE
  maybeToEnum 5 = Prelude.Just Imxfx_EMBOSS
  maybeToEnum 6 = Prelude.Just Imxfx_OILPAINT
  maybeToEnum 7 = Prelude.Just Imxfx_HATCH
  maybeToEnum 8 = Prelude.Just Imxfx_GPEN
  maybeToEnum 9 = Prelude.Just Imxfx_PASTEL
  maybeToEnum 10 = Prelude.Just Imxfx_WATERCOLOUR
  maybeToEnum 11 = Prelude.Just Imxfx_FILM
  maybeToEnum 12 = Prelude.Just Imxfx_BLUR
  maybeToEnum 13 = Prelude.Just Imxfx_SATURATION
  maybeToEnum 14 = Prelude.Just Imxfx_COLOURSWAP
  maybeToEnum 15 = Prelude.Just Imxfx_WASHEDOUT
  maybeToEnum 16 = Prelude.Just Imxfx_POSTERISE
  maybeToEnum 17 = Prelude.Just Imxfx_COLOURPOINT
  maybeToEnum 18 = Prelude.Just Imxfx_COLOURBALANCE
  maybeToEnum 19 = Prelude.Just Imxfx_CARTOON
  maybeToEnum k
    = Prelude.Just
        (Imxfx'Unrecognized
           (Imxfx'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum Imxfx_NONE = "Imxfx_NONE"
  showEnum Imxfx_NEGATIVE = "Imxfx_NEGATIVE"
  showEnum Imxfx_SOLARISE = "Imxfx_SOLARISE"
  showEnum Imxfx_SKETCH = "Imxfx_SKETCH"
  showEnum Imxfx_DENOISE = "Imxfx_DENOISE"
  showEnum Imxfx_EMBOSS = "Imxfx_EMBOSS"
  showEnum Imxfx_OILPAINT = "Imxfx_OILPAINT"
  showEnum Imxfx_HATCH = "Imxfx_HATCH"
  showEnum Imxfx_GPEN = "Imxfx_GPEN"
  showEnum Imxfx_PASTEL = "Imxfx_PASTEL"
  showEnum Imxfx_WATERCOLOUR = "Imxfx_WATERCOLOUR"
  showEnum Imxfx_FILM = "Imxfx_FILM"
  showEnum Imxfx_BLUR = "Imxfx_BLUR"
  showEnum Imxfx_SATURATION = "Imxfx_SATURATION"
  showEnum Imxfx_COLOURSWAP = "Imxfx_COLOURSWAP"
  showEnum Imxfx_WASHEDOUT = "Imxfx_WASHEDOUT"
  showEnum Imxfx_POSTERISE = "Imxfx_POSTERISE"
  showEnum Imxfx_COLOURPOINT = "Imxfx_COLOURPOINT"
  showEnum Imxfx_COLOURBALANCE = "Imxfx_COLOURBALANCE"
  showEnum Imxfx_CARTOON = "Imxfx_CARTOON"
  showEnum (Imxfx'Unrecognized (Imxfx'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "Imxfx_NONE" = Prelude.Just Imxfx_NONE
    | (Prelude.==) k "Imxfx_NEGATIVE" = Prelude.Just Imxfx_NEGATIVE
    | (Prelude.==) k "Imxfx_SOLARISE" = Prelude.Just Imxfx_SOLARISE
    | (Prelude.==) k "Imxfx_SKETCH" = Prelude.Just Imxfx_SKETCH
    | (Prelude.==) k "Imxfx_DENOISE" = Prelude.Just Imxfx_DENOISE
    | (Prelude.==) k "Imxfx_EMBOSS" = Prelude.Just Imxfx_EMBOSS
    | (Prelude.==) k "Imxfx_OILPAINT" = Prelude.Just Imxfx_OILPAINT
    | (Prelude.==) k "Imxfx_HATCH" = Prelude.Just Imxfx_HATCH
    | (Prelude.==) k "Imxfx_GPEN" = Prelude.Just Imxfx_GPEN
    | (Prelude.==) k "Imxfx_PASTEL" = Prelude.Just Imxfx_PASTEL
    | (Prelude.==) k "Imxfx_WATERCOLOUR"
    = Prelude.Just Imxfx_WATERCOLOUR
    | (Prelude.==) k "Imxfx_FILM" = Prelude.Just Imxfx_FILM
    | (Prelude.==) k "Imxfx_BLUR" = Prelude.Just Imxfx_BLUR
    | (Prelude.==) k "Imxfx_SATURATION" = Prelude.Just Imxfx_SATURATION
    | (Prelude.==) k "Imxfx_COLOURSWAP" = Prelude.Just Imxfx_COLOURSWAP
    | (Prelude.==) k "Imxfx_WASHEDOUT" = Prelude.Just Imxfx_WASHEDOUT
    | (Prelude.==) k "Imxfx_POSTERISE" = Prelude.Just Imxfx_POSTERISE
    | (Prelude.==) k "Imxfx_COLOURPOINT"
    = Prelude.Just Imxfx_COLOURPOINT
    | (Prelude.==) k "Imxfx_COLOURBALANCE"
    = Prelude.Just Imxfx_COLOURBALANCE
    | (Prelude.==) k "Imxfx_CARTOON" = Prelude.Just Imxfx_CARTOON
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Imxfx where
  minBound = Imxfx_NONE
  maxBound = Imxfx_CARTOON
instance Prelude.Enum Imxfx where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Imxfx: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum Imxfx_NONE = 0
  fromEnum Imxfx_NEGATIVE = 1
  fromEnum Imxfx_SOLARISE = 2
  fromEnum Imxfx_SKETCH = 3
  fromEnum Imxfx_DENOISE = 4
  fromEnum Imxfx_EMBOSS = 5
  fromEnum Imxfx_OILPAINT = 6
  fromEnum Imxfx_HATCH = 7
  fromEnum Imxfx_GPEN = 8
  fromEnum Imxfx_PASTEL = 9
  fromEnum Imxfx_WATERCOLOUR = 10
  fromEnum Imxfx_FILM = 11
  fromEnum Imxfx_BLUR = 12
  fromEnum Imxfx_SATURATION = 13
  fromEnum Imxfx_COLOURSWAP = 14
  fromEnum Imxfx_WASHEDOUT = 15
  fromEnum Imxfx_POSTERISE = 16
  fromEnum Imxfx_COLOURPOINT = 17
  fromEnum Imxfx_COLOURBALANCE = 18
  fromEnum Imxfx_CARTOON = 19
  fromEnum (Imxfx'Unrecognized (Imxfx'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ Imxfx_CARTOON
    = Prelude.error
        "Imxfx.succ: bad argument Imxfx_CARTOON. This value would be out of bounds."
  succ Imxfx_NONE = Imxfx_NEGATIVE
  succ Imxfx_NEGATIVE = Imxfx_SOLARISE
  succ Imxfx_SOLARISE = Imxfx_SKETCH
  succ Imxfx_SKETCH = Imxfx_DENOISE
  succ Imxfx_DENOISE = Imxfx_EMBOSS
  succ Imxfx_EMBOSS = Imxfx_OILPAINT
  succ Imxfx_OILPAINT = Imxfx_HATCH
  succ Imxfx_HATCH = Imxfx_GPEN
  succ Imxfx_GPEN = Imxfx_PASTEL
  succ Imxfx_PASTEL = Imxfx_WATERCOLOUR
  succ Imxfx_WATERCOLOUR = Imxfx_FILM
  succ Imxfx_FILM = Imxfx_BLUR
  succ Imxfx_BLUR = Imxfx_SATURATION
  succ Imxfx_SATURATION = Imxfx_COLOURSWAP
  succ Imxfx_COLOURSWAP = Imxfx_WASHEDOUT
  succ Imxfx_WASHEDOUT = Imxfx_POSTERISE
  succ Imxfx_POSTERISE = Imxfx_COLOURPOINT
  succ Imxfx_COLOURPOINT = Imxfx_COLOURBALANCE
  succ Imxfx_COLOURBALANCE = Imxfx_CARTOON
  succ (Imxfx'Unrecognized _)
    = Prelude.error "Imxfx.succ: bad argument: unrecognized value"
  pred Imxfx_NONE
    = Prelude.error
        "Imxfx.pred: bad argument Imxfx_NONE. This value would be out of bounds."
  pred Imxfx_NEGATIVE = Imxfx_NONE
  pred Imxfx_SOLARISE = Imxfx_NEGATIVE
  pred Imxfx_SKETCH = Imxfx_SOLARISE
  pred Imxfx_DENOISE = Imxfx_SKETCH
  pred Imxfx_EMBOSS = Imxfx_DENOISE
  pred Imxfx_OILPAINT = Imxfx_EMBOSS
  pred Imxfx_HATCH = Imxfx_OILPAINT
  pred Imxfx_GPEN = Imxfx_HATCH
  pred Imxfx_PASTEL = Imxfx_GPEN
  pred Imxfx_WATERCOLOUR = Imxfx_PASTEL
  pred Imxfx_FILM = Imxfx_WATERCOLOUR
  pred Imxfx_BLUR = Imxfx_FILM
  pred Imxfx_SATURATION = Imxfx_BLUR
  pred Imxfx_COLOURSWAP = Imxfx_SATURATION
  pred Imxfx_WASHEDOUT = Imxfx_COLOURSWAP
  pred Imxfx_POSTERISE = Imxfx_WASHEDOUT
  pred Imxfx_COLOURPOINT = Imxfx_POSTERISE
  pred Imxfx_COLOURBALANCE = Imxfx_COLOURPOINT
  pred Imxfx_CARTOON = Imxfx_COLOURBALANCE
  pred (Imxfx'Unrecognized _)
    = Prelude.error "Imxfx.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Imxfx where
  fieldDefault = Imxfx_NONE
instance Control.DeepSeq.NFData Imxfx where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Sensors.RaspCamDt_Fields.vflip' @:: Lens' RaspCamOpt Prelude.Bool@
         * 'Proto.Sensors.RaspCamDt_Fields.hflip' @:: Lens' RaspCamOpt Prelude.Bool@
         * 'Proto.Sensors.RaspCamDt_Fields.rotation' @:: Lens' RaspCamOpt Data.Int.Int32@
         * 'Proto.Sensors.RaspCamDt_Fields.quality' @:: Lens' RaspCamOpt Data.Int.Int32@
         * 'Proto.Sensors.RaspCamDt_Fields.encoding' @:: Lens' RaspCamOpt Encoding@
         * 'Proto.Sensors.RaspCamDt_Fields.sharpness' @:: Lens' RaspCamOpt Data.Int.Int32@
         * 'Proto.Sensors.RaspCamDt_Fields.contrast' @:: Lens' RaspCamOpt Data.Int.Int32@
         * 'Proto.Sensors.RaspCamDt_Fields.brightness' @:: Lens' RaspCamOpt Data.Int.Int32@
         * 'Proto.Sensors.RaspCamDt_Fields.saturation' @:: Lens' RaspCamOpt Data.Int.Int32@
         * 'Proto.Sensors.RaspCamDt_Fields.exposure' @:: Lens' RaspCamOpt Exposure@
         * 'Proto.Sensors.RaspCamDt_Fields.awb' @:: Lens' RaspCamOpt Awb@
         * 'Proto.Sensors.RaspCamDt_Fields.imxfx' @:: Lens' RaspCamOpt Imxfx@ -}
data RaspCamOpt
  = RaspCamOpt'_constructor {_RaspCamOpt'vflip :: !Prelude.Bool,
                             _RaspCamOpt'hflip :: !Prelude.Bool,
                             _RaspCamOpt'rotation :: !Data.Int.Int32,
                             _RaspCamOpt'quality :: !Data.Int.Int32,
                             _RaspCamOpt'encoding :: !Encoding,
                             _RaspCamOpt'sharpness :: !Data.Int.Int32,
                             _RaspCamOpt'contrast :: !Data.Int.Int32,
                             _RaspCamOpt'brightness :: !Data.Int.Int32,
                             _RaspCamOpt'saturation :: !Data.Int.Int32,
                             _RaspCamOpt'exposure :: !Exposure,
                             _RaspCamOpt'awb :: !Awb,
                             _RaspCamOpt'imxfx :: !Imxfx,
                             _RaspCamOpt'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RaspCamOpt where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField RaspCamOpt "vflip" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'vflip (\ x__ y__ -> x__ {_RaspCamOpt'vflip = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "hflip" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'hflip (\ x__ y__ -> x__ {_RaspCamOpt'hflip = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "rotation" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'rotation
           (\ x__ y__ -> x__ {_RaspCamOpt'rotation = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "quality" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'quality (\ x__ y__ -> x__ {_RaspCamOpt'quality = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "encoding" Encoding where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'encoding
           (\ x__ y__ -> x__ {_RaspCamOpt'encoding = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "sharpness" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'sharpness
           (\ x__ y__ -> x__ {_RaspCamOpt'sharpness = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "contrast" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'contrast
           (\ x__ y__ -> x__ {_RaspCamOpt'contrast = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "brightness" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'brightness
           (\ x__ y__ -> x__ {_RaspCamOpt'brightness = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "saturation" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'saturation
           (\ x__ y__ -> x__ {_RaspCamOpt'saturation = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "exposure" Exposure where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'exposure
           (\ x__ y__ -> x__ {_RaspCamOpt'exposure = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "awb" Awb where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'awb (\ x__ y__ -> x__ {_RaspCamOpt'awb = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOpt "imxfx" Imxfx where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOpt'imxfx (\ x__ y__ -> x__ {_RaspCamOpt'imxfx = y__}))
        Prelude.id
instance Data.ProtoLens.Message RaspCamOpt where
  messageName _ = Data.Text.pack "sensors.raspCamDt.RaspCamOpt"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \RaspCamOpt\DC2\DC4\n\
      \\ENQvflip\CAN\SOH \SOH(\bR\ENQvflip\DC2\DC4\n\
      \\ENQhflip\CAN\STX \SOH(\bR\ENQhflip\DC2\SUB\n\
      \\brotation\CAN\ETX \SOH(\ENQR\brotation\DC2\CAN\n\
      \\aquality\CAN\EOT \SOH(\ENQR\aquality\DC27\n\
      \\bencoding\CAN\ENQ \SOH(\SO2\ESC.sensors.raspCamDt.EncodingR\bencoding\DC2\FS\n\
      \\tsharpness\CAN\ACK \SOH(\ENQR\tsharpness\DC2\SUB\n\
      \\bcontrast\CAN\a \SOH(\ENQR\bcontrast\DC2\RS\n\
      \\n\
      \brightness\CAN\b \SOH(\ENQR\n\
      \brightness\DC2\RS\n\
      \\n\
      \saturation\CAN\t \SOH(\ENQR\n\
      \saturation\DC27\n\
      \\bexposure\CAN\n\
      \ \SOH(\SO2\ESC.sensors.raspCamDt.ExposureR\bexposure\DC2(\n\
      \\ETXawb\CAN\v \SOH(\SO2\SYN.sensors.raspCamDt.AwbR\ETXawb\DC2.\n\
      \\ENQimxfx\CAN\f \SOH(\SO2\CAN.sensors.raspCamDt.ImxfxR\ENQimxfx"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        vflip__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "vflip"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"vflip")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        hflip__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "hflip"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"hflip")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        rotation__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "rotation"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"rotation")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        quality__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "quality"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"quality")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        encoding__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "encoding"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Encoding)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"encoding")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        sharpness__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sharpness"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"sharpness")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        contrast__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "contrast"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"contrast")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        brightness__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "brightness"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"brightness")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        saturation__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "saturation"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"saturation")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        exposure__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "exposure"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Exposure)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"exposure")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        awb__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "awb"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Awb)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"awb")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
        imxfx__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "imxfx"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Imxfx)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"imxfx")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOpt
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, vflip__field_descriptor),
           (Data.ProtoLens.Tag 2, hflip__field_descriptor),
           (Data.ProtoLens.Tag 3, rotation__field_descriptor),
           (Data.ProtoLens.Tag 4, quality__field_descriptor),
           (Data.ProtoLens.Tag 5, encoding__field_descriptor),
           (Data.ProtoLens.Tag 6, sharpness__field_descriptor),
           (Data.ProtoLens.Tag 7, contrast__field_descriptor),
           (Data.ProtoLens.Tag 8, brightness__field_descriptor),
           (Data.ProtoLens.Tag 9, saturation__field_descriptor),
           (Data.ProtoLens.Tag 10, exposure__field_descriptor),
           (Data.ProtoLens.Tag 11, awb__field_descriptor),
           (Data.ProtoLens.Tag 12, imxfx__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _RaspCamOpt'_unknownFields
        (\ x__ y__ -> x__ {_RaspCamOpt'_unknownFields = y__})
  defMessage
    = RaspCamOpt'_constructor
        {_RaspCamOpt'vflip = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'hflip = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'rotation = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'quality = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'encoding = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'sharpness = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'contrast = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'brightness = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'saturation = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'exposure = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'awb = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'imxfx = Data.ProtoLens.fieldDefault,
         _RaspCamOpt'_unknownFields = []}
  parseMessage
    = let
        loop ::
          RaspCamOpt -> Data.ProtoLens.Encoding.Bytes.Parser RaspCamOpt
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "vflip"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"vflip") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "hflip"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"hflip") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "rotation"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"rotation") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "quality"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"quality") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "encoding"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"encoding") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sharpness"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"sharpness") y x)
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "contrast"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"contrast") y x)
                        64
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "brightness"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"brightness") y x)
                        72
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "saturation"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"saturation") y x)
                        80
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "exposure"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"exposure") y x)
                        88
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "awb"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"awb") y x)
                        96
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "imxfx"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"imxfx") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "RaspCamOpt"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"vflip") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"hflip") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                            _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"rotation") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"quality") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (let
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"encoding") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                        Prelude.fromIntegral)
                                     Prelude.fromEnum _v))
                         ((Data.Monoid.<>)
                            (let
                               _v = Lens.Family2.view (Data.ProtoLens.Field.field @"sharpness") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                        _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v = Lens.Family2.view (Data.ProtoLens.Field.field @"contrast") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           Prelude.fromIntegral _v))
                               ((Data.Monoid.<>)
                                  (let
                                     _v
                                       = Lens.Family2.view
                                           (Data.ProtoLens.Field.field @"brightness") _x
                                   in
                                     if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                         Data.Monoid.mempty
                                     else
                                         (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt 64)
                                           ((Prelude..)
                                              Data.ProtoLens.Encoding.Bytes.putVarInt
                                              Prelude.fromIntegral _v))
                                  ((Data.Monoid.<>)
                                     (let
                                        _v
                                          = Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"saturation") _x
                                      in
                                        if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                            Data.Monoid.mempty
                                        else
                                            (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt 72)
                                              ((Prelude..)
                                                 Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 Prelude.fromIntegral _v))
                                     ((Data.Monoid.<>)
                                        (let
                                           _v
                                             = Lens.Family2.view
                                                 (Data.ProtoLens.Field.field @"exposure") _x
                                         in
                                           if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                               Data.Monoid.mempty
                                           else
                                               (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 80)
                                                 ((Prelude..)
                                                    ((Prelude..)
                                                       Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       Prelude.fromIntegral)
                                                    Prelude.fromEnum _v))
                                        ((Data.Monoid.<>)
                                           (let
                                              _v
                                                = Lens.Family2.view
                                                    (Data.ProtoLens.Field.field @"awb") _x
                                            in
                                              if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                                  Data.Monoid.mempty
                                              else
                                                  (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 88)
                                                    ((Prelude..)
                                                       ((Prelude..)
                                                          Data.ProtoLens.Encoding.Bytes.putVarInt
                                                          Prelude.fromIntegral)
                                                       Prelude.fromEnum _v))
                                           ((Data.Monoid.<>)
                                              (let
                                                 _v
                                                   = Lens.Family2.view
                                                       (Data.ProtoLens.Field.field @"imxfx") _x
                                               in
                                                 if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                                     Data.Monoid.mempty
                                                 else
                                                     (Data.Monoid.<>)
                                                       (Data.ProtoLens.Encoding.Bytes.putVarInt 96)
                                                       ((Prelude..)
                                                          ((Prelude..)
                                                             Data.ProtoLens.Encoding.Bytes.putVarInt
                                                             Prelude.fromIntegral)
                                                          Prelude.fromEnum _v))
                                              (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                                 (Lens.Family2.view
                                                    Data.ProtoLens.unknownFields _x)))))))))))))
instance Control.DeepSeq.NFData RaspCamOpt where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_RaspCamOpt'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_RaspCamOpt'vflip x__)
                (Control.DeepSeq.deepseq
                   (_RaspCamOpt'hflip x__)
                   (Control.DeepSeq.deepseq
                      (_RaspCamOpt'rotation x__)
                      (Control.DeepSeq.deepseq
                         (_RaspCamOpt'quality x__)
                         (Control.DeepSeq.deepseq
                            (_RaspCamOpt'encoding x__)
                            (Control.DeepSeq.deepseq
                               (_RaspCamOpt'sharpness x__)
                               (Control.DeepSeq.deepseq
                                  (_RaspCamOpt'contrast x__)
                                  (Control.DeepSeq.deepseq
                                     (_RaspCamOpt'brightness x__)
                                     (Control.DeepSeq.deepseq
                                        (_RaspCamOpt'saturation x__)
                                        (Control.DeepSeq.deepseq
                                           (_RaspCamOpt'exposure x__)
                                           (Control.DeepSeq.deepseq
                                              (_RaspCamOpt'awb x__)
                                              (Control.DeepSeq.deepseq
                                                 (_RaspCamOpt'imxfx x__) ()))))))))))))
{- | Fields :
     
         * 'Proto.Sensors.RaspCamDt_Fields.encoding' @:: Lens' RaspCamOut Encoding@
         * 'Proto.Sensors.RaspCamDt_Fields.bin' @:: Lens' RaspCamOut Data.ByteString.ByteString@ -}
data RaspCamOut
  = RaspCamOut'_constructor {_RaspCamOut'encoding :: !Encoding,
                             _RaspCamOut'bin :: !Data.ByteString.ByteString,
                             _RaspCamOut'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RaspCamOut where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField RaspCamOut "encoding" Encoding where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOut'encoding
           (\ x__ y__ -> x__ {_RaspCamOut'encoding = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RaspCamOut "bin" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RaspCamOut'bin (\ x__ y__ -> x__ {_RaspCamOut'bin = y__}))
        Prelude.id
instance Data.ProtoLens.Message RaspCamOut where
  messageName _ = Data.Text.pack "sensors.raspCamDt.RaspCamOut"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \RaspCamOut\DC27\n\
      \\bencoding\CAN\SOH \SOH(\SO2\ESC.sensors.raspCamDt.EncodingR\bencoding\DC2\DLE\n\
      \\ETXbin\CAN\STX \SOH(\fR\ETXbin"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        encoding__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "encoding"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Encoding)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"encoding")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOut
        bin__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "bin"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"bin")) ::
              Data.ProtoLens.FieldDescriptor RaspCamOut
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, encoding__field_descriptor),
           (Data.ProtoLens.Tag 2, bin__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _RaspCamOut'_unknownFields
        (\ x__ y__ -> x__ {_RaspCamOut'_unknownFields = y__})
  defMessage
    = RaspCamOut'_constructor
        {_RaspCamOut'encoding = Data.ProtoLens.fieldDefault,
         _RaspCamOut'bin = Data.ProtoLens.fieldDefault,
         _RaspCamOut'_unknownFields = []}
  parseMessage
    = let
        loop ::
          RaspCamOut -> Data.ProtoLens.Encoding.Bytes.Parser RaspCamOut
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "encoding"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"encoding") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "bin"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"bin") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "RaspCamOut"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"encoding") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"bin") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData RaspCamOut where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_RaspCamOut'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_RaspCamOut'encoding x__)
                (Control.DeepSeq.deepseq (_RaspCamOut'bin x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\ETBsensors/raspCamDt.proto\DC2\DC1sensors.raspCamDt\"W\n\
    \\n\
    \RaspCamOut\DC27\n\
    \\bencoding\CAN\SOH \SOH(\SO2\ESC.sensors.raspCamDt.EncodingR\bencoding\DC2\DLE\n\
    \\ETXbin\CAN\STX \SOH(\fR\ETXbin\"\180\ETX\n\
    \\n\
    \RaspCamOpt\DC2\DC4\n\
    \\ENQvflip\CAN\SOH \SOH(\bR\ENQvflip\DC2\DC4\n\
    \\ENQhflip\CAN\STX \SOH(\bR\ENQhflip\DC2\SUB\n\
    \\brotation\CAN\ETX \SOH(\ENQR\brotation\DC2\CAN\n\
    \\aquality\CAN\EOT \SOH(\ENQR\aquality\DC27\n\
    \\bencoding\CAN\ENQ \SOH(\SO2\ESC.sensors.raspCamDt.EncodingR\bencoding\DC2\FS\n\
    \\tsharpness\CAN\ACK \SOH(\ENQR\tsharpness\DC2\SUB\n\
    \\bcontrast\CAN\a \SOH(\ENQR\bcontrast\DC2\RS\n\
    \\n\
    \brightness\CAN\b \SOH(\ENQR\n\
    \brightness\DC2\RS\n\
    \\n\
    \saturation\CAN\t \SOH(\ENQR\n\
    \saturation\DC27\n\
    \\bexposure\CAN\n\
    \ \SOH(\SO2\ESC.sensors.raspCamDt.ExposureR\bexposure\DC2(\n\
    \\ETXawb\CAN\v \SOH(\SO2\SYN.sensors.raspCamDt.AwbR\ETXawb\DC2.\n\
    \\ENQimxfx\CAN\f \SOH(\SO2\CAN.sensors.raspCamDt.ImxfxR\ENQimxfx*/\n\
    \\bEncoding\DC2\b\n\
    \\EOTJPEG\DLE\NUL\DC2\a\n\
    \\ETXPNG\DLE\SOH\DC2\a\n\
    \\ETXBMP\DLE\STX\DC2\a\n\
    \\ETXGIF\DLE\ETX*\231\SOH\n\
    \\bExposure\DC2\v\n\
    \\aExp_OFF\DLE\NUL\DC2\f\n\
    \\bExp_AUTO\DLE\SOH\DC2\r\n\
    \\tExp_NIGHT\DLE\STX\DC2\DC4\n\
    \\DLEExp_NIGHTPREVIEW\DLE\ETX\DC2\DC1\n\
    \\rExp_BACKLIGHT\DLE\EOT\DC2\DC1\n\
    \\rExp_SPOTLIGHT\DLE\ENQ\DC2\SO\n\
    \\n\
    \Exp_SPORTS\DLE\ACK\DC2\f\n\
    \\bExp_SNOW\DLE\a\DC2\r\n\
    \\tExp_BEACH\DLE\b\DC2\DLE\n\
    \\fExp_VERYLONG\DLE\t\DC2\DLE\n\
    \\fExp_FIXEDFPS\DLE\n\
    \\DC2\DC1\n\
    \\rExp_ANTISHAKE\DLE\v\DC2\DC1\n\
    \\rExp_FIREWORKS\DLE\f*\187\SOH\n\
    \\ETXAwb\DC2\v\n\
    \\aAwb_OFF\DLE\NUL\DC2\f\n\
    \\bAwb_AUTO\DLE\SOH\DC2\v\n\
    \\aAwb_SUN\DLE\STX\DC2\r\n\
    \\tAwb_CLOUD\DLE\ETX\DC2\r\n\
    \\tAwb_SHADE\DLE\EOT\DC2\DLE\n\
    \\fAwb_TUNGSTEN\DLE\ENQ\DC2\DC3\n\
    \\SIAwb_FLUORESCENT\DLE\ACK\DC2\DC4\n\
    \\DLEAwb_INCANDESCENT\DLE\a\DC2\r\n\
    \\tAwb_FLASH\DLE\b\DC2\SI\n\
    \\vAwb_HORIZON\DLE\t\DC2\DC1\n\
    \\rAwb_GREYWORLD\DLE\n\
    \*\141\ETX\n\
    \\ENQImxfx\DC2\SO\n\
    \\n\
    \Imxfx_NONE\DLE\NUL\DC2\DC2\n\
    \\SOImxfx_NEGATIVE\DLE\SOH\DC2\DC2\n\
    \\SOImxfx_SOLARISE\DLE\STX\DC2\DLE\n\
    \\fImxfx_SKETCH\DLE\ETX\DC2\DC1\n\
    \\rImxfx_DENOISE\DLE\EOT\DC2\DLE\n\
    \\fImxfx_EMBOSS\DLE\ENQ\DC2\DC2\n\
    \\SOImxfx_OILPAINT\DLE\ACK\DC2\SI\n\
    \\vImxfx_HATCH\DLE\a\DC2\SO\n\
    \\n\
    \Imxfx_GPEN\DLE\b\DC2\DLE\n\
    \\fImxfx_PASTEL\DLE\t\DC2\NAK\n\
    \\DC1Imxfx_WATERCOLOUR\DLE\n\
    \\DC2\SO\n\
    \\n\
    \Imxfx_FILM\DLE\v\DC2\SO\n\
    \\n\
    \Imxfx_BLUR\DLE\f\DC2\DC4\n\
    \\DLEImxfx_SATURATION\DLE\r\DC2\DC4\n\
    \\DLEImxfx_COLOURSWAP\DLE\SO\DC2\DC3\n\
    \\SIImxfx_WASHEDOUT\DLE\SI\DC2\DC3\n\
    \\SIImxfx_POSTERISE\DLE\DLE\DC2\NAK\n\
    \\DC1Imxfx_COLOURPOINT\DLE\DC1\DC2\ETB\n\
    \\DC3Imxfx_COLOURBALANCE\DLE\DC2\DC2\DC1\n\
    \\rImxfx_CARTOON\DLE\DC3J\222\SYN\n\
    \\ACK\DC2\EOT\SOH\NULS\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\SOH\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ETX\NUL\SUB\n\
    \\n\
    \\n\
    \\STX\ENQ\NUL\DC2\EOT\ENQ\NUL\n\
    \\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\NUL\SOH\DC2\ETX\ENQ\ENQ\r\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\ETX\ACK\EOT\r\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\ETX\ACK\EOT\b\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\ETX\ACK\v\f\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\ETX\a\EOT\f\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\ETX\a\EOT\a\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\ETX\a\n\
    \\v\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\STX\DC2\ETX\b\EOT\f\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\STX\SOH\DC2\ETX\b\EOT\a\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\STX\STX\DC2\ETX\b\n\
    \\v\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\ETX\DC2\ETX\t\EOT\f\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ETX\SOH\DC2\ETX\t\EOT\a\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ETX\STX\DC2\ETX\t\n\
    \\v\n\
    \\n\
    \\n\
    \\STX\ENQ\SOH\DC2\EOT\f\NUL\SUB\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\SOH\SOH\DC2\ETX\f\ENQ\r\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\NUL\DC2\ETX\r\EOT\DLE\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\NUL\SOH\DC2\ETX\r\EOT\v\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\NUL\STX\DC2\ETX\r\SO\SI\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\SOH\DC2\ETX\SO\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\SOH\SOH\DC2\ETX\SO\EOT\f\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\SOH\STX\DC2\ETX\SO\SI\DLE\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\STX\DC2\ETX\SI\EOT\DC2\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\STX\SOH\DC2\ETX\SI\EOT\r\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\STX\STX\DC2\ETX\SI\DLE\DC1\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\ETX\DC2\ETX\DLE\EOT\EM\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\ETX\SOH\DC2\ETX\DLE\EOT\DC4\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\ETX\STX\DC2\ETX\DLE\ETB\CAN\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\EOT\DC2\ETX\DC1\EOT\SYN\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\EOT\SOH\DC2\ETX\DC1\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\EOT\STX\DC2\ETX\DC1\DC4\NAK\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\ENQ\DC2\ETX\DC2\EOT\SYN\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\ENQ\SOH\DC2\ETX\DC2\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\ENQ\STX\DC2\ETX\DC2\DC4\NAK\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\ACK\DC2\ETX\DC3\EOT\DC3\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\ACK\SOH\DC2\ETX\DC3\EOT\SO\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\ACK\STX\DC2\ETX\DC3\DC1\DC2\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\a\DC2\ETX\DC4\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\a\SOH\DC2\ETX\DC4\EOT\f\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\a\STX\DC2\ETX\DC4\SI\DLE\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\b\DC2\ETX\NAK\EOT\DC2\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\b\SOH\DC2\ETX\NAK\EOT\r\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\b\STX\DC2\ETX\NAK\DLE\DC1\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\t\DC2\ETX\SYN\EOT\NAK\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\t\SOH\DC2\ETX\SYN\EOT\DLE\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\t\STX\DC2\ETX\SYN\DC3\DC4\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\n\
    \\DC2\ETX\ETB\EOT\SYN\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\n\
    \\SOH\DC2\ETX\ETB\EOT\DLE\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\n\
    \\STX\DC2\ETX\ETB\DC3\NAK\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\v\DC2\ETX\CAN\EOT\ETB\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\v\SOH\DC2\ETX\CAN\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\v\STX\DC2\ETX\CAN\DC4\SYN\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\f\DC2\ETX\EM\EOT\ETB\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\f\SOH\DC2\ETX\EM\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\f\STX\DC2\ETX\EM\DC4\SYN\n\
    \\n\
    \\n\
    \\STX\ENQ\STX\DC2\EOT\FS\NUL(\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\STX\SOH\DC2\ETX\FS\ENQ\b\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\NUL\DC2\ETX\GS\EOT\DLE\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\NUL\SOH\DC2\ETX\GS\EOT\v\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\NUL\STX\DC2\ETX\GS\SO\SI\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\SOH\DC2\ETX\RS\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\SOH\SOH\DC2\ETX\RS\EOT\f\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\SOH\STX\DC2\ETX\RS\SI\DLE\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\STX\DC2\ETX\US\EOT\DLE\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\STX\SOH\DC2\ETX\US\EOT\v\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\STX\STX\DC2\ETX\US\SO\SI\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\ETX\DC2\ETX \EOT\DC2\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\ETX\SOH\DC2\ETX \EOT\r\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\ETX\STX\DC2\ETX \DLE\DC1\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\EOT\DC2\ETX!\EOT\DC2\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\EOT\SOH\DC2\ETX!\EOT\r\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\EOT\STX\DC2\ETX!\DLE\DC1\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\ENQ\DC2\ETX\"\EOT\NAK\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\ENQ\SOH\DC2\ETX\"\EOT\DLE\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\ENQ\STX\DC2\ETX\"\DC3\DC4\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\ACK\DC2\ETX#\EOT\CAN\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\ACK\SOH\DC2\ETX#\EOT\DC3\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\ACK\STX\DC2\ETX#\SYN\ETB\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\a\DC2\ETX$\EOT\EM\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\a\SOH\DC2\ETX$\EOT\DC4\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\a\STX\DC2\ETX$\ETB\CAN\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\b\DC2\ETX%\EOT\DC2\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\b\SOH\DC2\ETX%\EOT\r\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\b\STX\DC2\ETX%\DLE\DC1\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\t\DC2\ETX&\EOT\DC4\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\t\SOH\DC2\ETX&\EOT\SI\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\t\STX\DC2\ETX&\DC2\DC3\n\
    \\v\n\
    \\EOT\ENQ\STX\STX\n\
    \\DC2\ETX'\EOT\ETB\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\n\
    \\SOH\DC2\ETX'\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\n\
    \\STX\DC2\ETX'\DC4\SYN\n\
    \\n\
    \\n\
    \\STX\ENQ\ETX\DC2\EOT*\NUL?\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\ETX\SOH\DC2\ETX*\ENQ\n\
    \\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\NUL\DC2\ETX+\EOT\DC3\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\NUL\SOH\DC2\ETX+\EOT\SO\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\NUL\STX\DC2\ETX+\DC1\DC2\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\SOH\DC2\ETX,\EOT\ETB\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\SOH\SOH\DC2\ETX,\EOT\DC2\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\SOH\STX\DC2\ETX,\NAK\SYN\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\STX\DC2\ETX-\EOT\ETB\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\STX\SOH\DC2\ETX-\EOT\DC2\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\STX\STX\DC2\ETX-\NAK\SYN\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\ETX\DC2\ETX.\EOT\NAK\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\ETX\SOH\DC2\ETX.\EOT\DLE\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\ETX\STX\DC2\ETX.\DC3\DC4\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\EOT\DC2\ETX/\EOT\SYN\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\EOT\SOH\DC2\ETX/\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\EOT\STX\DC2\ETX/\DC4\NAK\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\ENQ\DC2\ETX0\EOT\NAK\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\ENQ\SOH\DC2\ETX0\EOT\DLE\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\ENQ\STX\DC2\ETX0\DC3\DC4\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\ACK\DC2\ETX1\EOT\ETB\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\ACK\SOH\DC2\ETX1\EOT\DC2\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\ACK\STX\DC2\ETX1\NAK\SYN\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\a\DC2\ETX2\EOT\DC4\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\a\SOH\DC2\ETX2\EOT\SI\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\a\STX\DC2\ETX2\DC2\DC3\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\b\DC2\ETX3\EOT\DC3\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\b\SOH\DC2\ETX3\EOT\SO\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\b\STX\DC2\ETX3\DC1\DC2\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\t\DC2\ETX4\EOT\NAK\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\t\SOH\DC2\ETX4\EOT\DLE\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\t\STX\DC2\ETX4\DC3\DC4\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\n\
    \\DC2\ETX5\EOT\ESC\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\n\
    \\SOH\DC2\ETX5\EOT\NAK\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\n\
    \\STX\DC2\ETX5\CAN\SUB\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\v\DC2\ETX6\EOT\DC4\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\v\SOH\DC2\ETX6\EOT\SO\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\v\STX\DC2\ETX6\DC1\DC3\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\f\DC2\ETX7\EOT\DC4\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\f\SOH\DC2\ETX7\EOT\SO\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\f\STX\DC2\ETX7\DC1\DC3\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\r\DC2\ETX8\EOT\SUB\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\r\SOH\DC2\ETX8\EOT\DC4\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\r\STX\DC2\ETX8\ETB\EM\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\SO\DC2\ETX9\EOT\SUB\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\SO\SOH\DC2\ETX9\EOT\DC4\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\SO\STX\DC2\ETX9\ETB\EM\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\SI\DC2\ETX:\EOT\EM\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\SI\SOH\DC2\ETX:\EOT\DC3\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\SI\STX\DC2\ETX:\SYN\CAN\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\DLE\DC2\ETX;\EOT\EM\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\DLE\SOH\DC2\ETX;\EOT\DC3\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\DLE\STX\DC2\ETX;\SYN\CAN\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\DC1\DC2\ETX<\EOT\ESC\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\DC1\SOH\DC2\ETX<\EOT\NAK\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\DC1\STX\DC2\ETX<\CAN\SUB\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\DC2\DC2\ETX=\EOT\GS\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\DC2\SOH\DC2\ETX=\EOT\ETB\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\DC2\STX\DC2\ETX=\SUB\FS\n\
    \\v\n\
    \\EOT\ENQ\ETX\STX\DC3\DC2\ETX>\EOT\ETB\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\DC3\SOH\DC2\ETX>\EOT\DC1\n\
    \\f\n\
    \\ENQ\ENQ\ETX\STX\DC3\STX\DC2\ETX>\DC4\SYN\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOTA\NULD\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETXA\b\DC2\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETXB\EOT\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETXB\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETXB\r\NAK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETXB\CAN\EM\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETXC\EOT\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETXC\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETXC\n\
    \\r\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETXC\DLE\DC1\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOTF\NULS\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETXF\b\DC2\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETXG\EOT\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETXG\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETXG\t\SO\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETXG\DC1\DC2\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETXH\EOT\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETXH\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETXH\t\SO\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETXH\DC1\DC2\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETXI\EOT\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETXI\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETXI\n\
    \\DC2\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETXI\NAK\SYN\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\ETX\DC2\ETXJ\EOT\SYN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ENQ\DC2\ETXJ\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\SOH\DC2\ETXJ\n\
    \\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ETX\DC2\ETXJ\DC4\NAK\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\EOT\DC2\ETXK\EOT\SUB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ACK\DC2\ETXK\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\SOH\DC2\ETXK\r\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ETX\DC2\ETXK\CAN\EM\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\ENQ\DC2\ETXL\EOT\CAN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ENQ\DC2\ETXL\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\SOH\DC2\ETXL\n\
    \\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ETX\DC2\ETXL\SYN\ETB\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\ACK\DC2\ETXM\EOT\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\ENQ\DC2\ETXM\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\SOH\DC2\ETXM\n\
    \\DC2\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\ETX\DC2\ETXM\NAK\SYN\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\a\DC2\ETXN\EOT\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\ENQ\DC2\ETXN\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\SOH\DC2\ETXN\n\
    \\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\ETX\DC2\ETXN\ETB\CAN\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\b\DC2\ETXO\EOT\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\b\ENQ\DC2\ETXO\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\b\SOH\DC2\ETXO\n\
    \\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\b\ETX\DC2\ETXO\ETB\CAN\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\t\DC2\ETXP\EOT\ESC\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\t\ACK\DC2\ETXP\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\t\SOH\DC2\ETXP\r\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\t\ETX\DC2\ETXP\CAN\SUB\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\n\
    \\DC2\ETXQ\EOT\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\n\
    \\ACK\DC2\ETXQ\EOT\a\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\n\
    \\SOH\DC2\ETXQ\b\v\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\n\
    \\ETX\DC2\ETXQ\SO\DLE\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\v\DC2\ETXR\EOT\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\v\ACK\DC2\ETXR\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\v\SOH\DC2\ETXR\n\
    \\SI\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\v\ETX\DC2\ETXR\DC2\DC4b\ACKproto3"