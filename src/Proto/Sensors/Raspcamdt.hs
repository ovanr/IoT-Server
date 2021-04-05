{- This file was auto-generated from sensors/raspcamdt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Sensors.Raspcamdt (
        Awb(..), Awb(), Awb'UnrecognizedValue, Encoding(..), Encoding(),
        Encoding'UnrecognizedValue, Exposure(..), Exposure(),
        Exposure'UnrecognizedValue, Imxfx(..), Imxfx(),
        Imxfx'UnrecognizedValue, Raspcamopt(), Raspcamout()
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
  = AWB_OFF |
    AWB_AUTO |
    AWB_SUN |
    AWB_CLOUD |
    AWB_SHADE |
    AWB_TUNGSTEN |
    AWB_FLUORESCENT |
    AWB_INCANDESCENT |
    AWB_FLASH |
    AWB_HORIZON |
    AWB_GREYWORLD |
    Awb'Unrecognized !Awb'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Awb where
  maybeToEnum 0 = Prelude.Just AWB_OFF
  maybeToEnum 1 = Prelude.Just AWB_AUTO
  maybeToEnum 2 = Prelude.Just AWB_SUN
  maybeToEnum 3 = Prelude.Just AWB_CLOUD
  maybeToEnum 4 = Prelude.Just AWB_SHADE
  maybeToEnum 5 = Prelude.Just AWB_TUNGSTEN
  maybeToEnum 6 = Prelude.Just AWB_FLUORESCENT
  maybeToEnum 7 = Prelude.Just AWB_INCANDESCENT
  maybeToEnum 8 = Prelude.Just AWB_FLASH
  maybeToEnum 9 = Prelude.Just AWB_HORIZON
  maybeToEnum 10 = Prelude.Just AWB_GREYWORLD
  maybeToEnum k
    = Prelude.Just
        (Awb'Unrecognized (Awb'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum AWB_OFF = "AWB_OFF"
  showEnum AWB_AUTO = "AWB_AUTO"
  showEnum AWB_SUN = "AWB_SUN"
  showEnum AWB_CLOUD = "AWB_CLOUD"
  showEnum AWB_SHADE = "AWB_SHADE"
  showEnum AWB_TUNGSTEN = "AWB_TUNGSTEN"
  showEnum AWB_FLUORESCENT = "AWB_FLUORESCENT"
  showEnum AWB_INCANDESCENT = "AWB_INCANDESCENT"
  showEnum AWB_FLASH = "AWB_FLASH"
  showEnum AWB_HORIZON = "AWB_HORIZON"
  showEnum AWB_GREYWORLD = "AWB_GREYWORLD"
  showEnum (Awb'Unrecognized (Awb'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "AWB_OFF" = Prelude.Just AWB_OFF
    | (Prelude.==) k "AWB_AUTO" = Prelude.Just AWB_AUTO
    | (Prelude.==) k "AWB_SUN" = Prelude.Just AWB_SUN
    | (Prelude.==) k "AWB_CLOUD" = Prelude.Just AWB_CLOUD
    | (Prelude.==) k "AWB_SHADE" = Prelude.Just AWB_SHADE
    | (Prelude.==) k "AWB_TUNGSTEN" = Prelude.Just AWB_TUNGSTEN
    | (Prelude.==) k "AWB_FLUORESCENT" = Prelude.Just AWB_FLUORESCENT
    | (Prelude.==) k "AWB_INCANDESCENT" = Prelude.Just AWB_INCANDESCENT
    | (Prelude.==) k "AWB_FLASH" = Prelude.Just AWB_FLASH
    | (Prelude.==) k "AWB_HORIZON" = Prelude.Just AWB_HORIZON
    | (Prelude.==) k "AWB_GREYWORLD" = Prelude.Just AWB_GREYWORLD
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Awb where
  minBound = AWB_OFF
  maxBound = AWB_GREYWORLD
instance Prelude.Enum Awb where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Awb: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum AWB_OFF = 0
  fromEnum AWB_AUTO = 1
  fromEnum AWB_SUN = 2
  fromEnum AWB_CLOUD = 3
  fromEnum AWB_SHADE = 4
  fromEnum AWB_TUNGSTEN = 5
  fromEnum AWB_FLUORESCENT = 6
  fromEnum AWB_INCANDESCENT = 7
  fromEnum AWB_FLASH = 8
  fromEnum AWB_HORIZON = 9
  fromEnum AWB_GREYWORLD = 10
  fromEnum (Awb'Unrecognized (Awb'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ AWB_GREYWORLD
    = Prelude.error
        "Awb.succ: bad argument AWB_GREYWORLD. This value would be out of bounds."
  succ AWB_OFF = AWB_AUTO
  succ AWB_AUTO = AWB_SUN
  succ AWB_SUN = AWB_CLOUD
  succ AWB_CLOUD = AWB_SHADE
  succ AWB_SHADE = AWB_TUNGSTEN
  succ AWB_TUNGSTEN = AWB_FLUORESCENT
  succ AWB_FLUORESCENT = AWB_INCANDESCENT
  succ AWB_INCANDESCENT = AWB_FLASH
  succ AWB_FLASH = AWB_HORIZON
  succ AWB_HORIZON = AWB_GREYWORLD
  succ (Awb'Unrecognized _)
    = Prelude.error "Awb.succ: bad argument: unrecognized value"
  pred AWB_OFF
    = Prelude.error
        "Awb.pred: bad argument AWB_OFF. This value would be out of bounds."
  pred AWB_AUTO = AWB_OFF
  pred AWB_SUN = AWB_AUTO
  pred AWB_CLOUD = AWB_SUN
  pred AWB_SHADE = AWB_CLOUD
  pred AWB_TUNGSTEN = AWB_SHADE
  pred AWB_FLUORESCENT = AWB_TUNGSTEN
  pred AWB_INCANDESCENT = AWB_FLUORESCENT
  pred AWB_FLASH = AWB_INCANDESCENT
  pred AWB_HORIZON = AWB_FLASH
  pred AWB_GREYWORLD = AWB_HORIZON
  pred (Awb'Unrecognized _)
    = Prelude.error "Awb.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Awb where
  fieldDefault = AWB_OFF
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
  = EXP_OFF |
    EXP_AUTO |
    EXP_NIGHT |
    EXP_NIGHTPREVIEW |
    EXP_BACKLIGHT |
    EXP_SPOTLIGHT |
    EXP_SPORTS |
    EXP_SNOW |
    EXP_BEACH |
    EXP_VERYLONG |
    EXP_FIXEDFPS |
    EXP_ANTISHAKE |
    EXP_FIREWORKS |
    Exposure'Unrecognized !Exposure'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Exposure where
  maybeToEnum 0 = Prelude.Just EXP_OFF
  maybeToEnum 1 = Prelude.Just EXP_AUTO
  maybeToEnum 2 = Prelude.Just EXP_NIGHT
  maybeToEnum 3 = Prelude.Just EXP_NIGHTPREVIEW
  maybeToEnum 4 = Prelude.Just EXP_BACKLIGHT
  maybeToEnum 5 = Prelude.Just EXP_SPOTLIGHT
  maybeToEnum 6 = Prelude.Just EXP_SPORTS
  maybeToEnum 7 = Prelude.Just EXP_SNOW
  maybeToEnum 8 = Prelude.Just EXP_BEACH
  maybeToEnum 9 = Prelude.Just EXP_VERYLONG
  maybeToEnum 10 = Prelude.Just EXP_FIXEDFPS
  maybeToEnum 11 = Prelude.Just EXP_ANTISHAKE
  maybeToEnum 12 = Prelude.Just EXP_FIREWORKS
  maybeToEnum k
    = Prelude.Just
        (Exposure'Unrecognized
           (Exposure'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum EXP_OFF = "EXP_OFF"
  showEnum EXP_AUTO = "EXP_AUTO"
  showEnum EXP_NIGHT = "EXP_NIGHT"
  showEnum EXP_NIGHTPREVIEW = "EXP_NIGHTPREVIEW"
  showEnum EXP_BACKLIGHT = "EXP_BACKLIGHT"
  showEnum EXP_SPOTLIGHT = "EXP_SPOTLIGHT"
  showEnum EXP_SPORTS = "EXP_SPORTS"
  showEnum EXP_SNOW = "EXP_SNOW"
  showEnum EXP_BEACH = "EXP_BEACH"
  showEnum EXP_VERYLONG = "EXP_VERYLONG"
  showEnum EXP_FIXEDFPS = "EXP_FIXEDFPS"
  showEnum EXP_ANTISHAKE = "EXP_ANTISHAKE"
  showEnum EXP_FIREWORKS = "EXP_FIREWORKS"
  showEnum (Exposure'Unrecognized (Exposure'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "EXP_OFF" = Prelude.Just EXP_OFF
    | (Prelude.==) k "EXP_AUTO" = Prelude.Just EXP_AUTO
    | (Prelude.==) k "EXP_NIGHT" = Prelude.Just EXP_NIGHT
    | (Prelude.==) k "EXP_NIGHTPREVIEW" = Prelude.Just EXP_NIGHTPREVIEW
    | (Prelude.==) k "EXP_BACKLIGHT" = Prelude.Just EXP_BACKLIGHT
    | (Prelude.==) k "EXP_SPOTLIGHT" = Prelude.Just EXP_SPOTLIGHT
    | (Prelude.==) k "EXP_SPORTS" = Prelude.Just EXP_SPORTS
    | (Prelude.==) k "EXP_SNOW" = Prelude.Just EXP_SNOW
    | (Prelude.==) k "EXP_BEACH" = Prelude.Just EXP_BEACH
    | (Prelude.==) k "EXP_VERYLONG" = Prelude.Just EXP_VERYLONG
    | (Prelude.==) k "EXP_FIXEDFPS" = Prelude.Just EXP_FIXEDFPS
    | (Prelude.==) k "EXP_ANTISHAKE" = Prelude.Just EXP_ANTISHAKE
    | (Prelude.==) k "EXP_FIREWORKS" = Prelude.Just EXP_FIREWORKS
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Exposure where
  minBound = EXP_OFF
  maxBound = EXP_FIREWORKS
instance Prelude.Enum Exposure where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Exposure: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum EXP_OFF = 0
  fromEnum EXP_AUTO = 1
  fromEnum EXP_NIGHT = 2
  fromEnum EXP_NIGHTPREVIEW = 3
  fromEnum EXP_BACKLIGHT = 4
  fromEnum EXP_SPOTLIGHT = 5
  fromEnum EXP_SPORTS = 6
  fromEnum EXP_SNOW = 7
  fromEnum EXP_BEACH = 8
  fromEnum EXP_VERYLONG = 9
  fromEnum EXP_FIXEDFPS = 10
  fromEnum EXP_ANTISHAKE = 11
  fromEnum EXP_FIREWORKS = 12
  fromEnum (Exposure'Unrecognized (Exposure'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ EXP_FIREWORKS
    = Prelude.error
        "Exposure.succ: bad argument EXP_FIREWORKS. This value would be out of bounds."
  succ EXP_OFF = EXP_AUTO
  succ EXP_AUTO = EXP_NIGHT
  succ EXP_NIGHT = EXP_NIGHTPREVIEW
  succ EXP_NIGHTPREVIEW = EXP_BACKLIGHT
  succ EXP_BACKLIGHT = EXP_SPOTLIGHT
  succ EXP_SPOTLIGHT = EXP_SPORTS
  succ EXP_SPORTS = EXP_SNOW
  succ EXP_SNOW = EXP_BEACH
  succ EXP_BEACH = EXP_VERYLONG
  succ EXP_VERYLONG = EXP_FIXEDFPS
  succ EXP_FIXEDFPS = EXP_ANTISHAKE
  succ EXP_ANTISHAKE = EXP_FIREWORKS
  succ (Exposure'Unrecognized _)
    = Prelude.error "Exposure.succ: bad argument: unrecognized value"
  pred EXP_OFF
    = Prelude.error
        "Exposure.pred: bad argument EXP_OFF. This value would be out of bounds."
  pred EXP_AUTO = EXP_OFF
  pred EXP_NIGHT = EXP_AUTO
  pred EXP_NIGHTPREVIEW = EXP_NIGHT
  pred EXP_BACKLIGHT = EXP_NIGHTPREVIEW
  pred EXP_SPOTLIGHT = EXP_BACKLIGHT
  pred EXP_SPORTS = EXP_SPOTLIGHT
  pred EXP_SNOW = EXP_SPORTS
  pred EXP_BEACH = EXP_SNOW
  pred EXP_VERYLONG = EXP_BEACH
  pred EXP_FIXEDFPS = EXP_VERYLONG
  pred EXP_ANTISHAKE = EXP_FIXEDFPS
  pred EXP_FIREWORKS = EXP_ANTISHAKE
  pred (Exposure'Unrecognized _)
    = Prelude.error "Exposure.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Exposure where
  fieldDefault = EXP_OFF
instance Control.DeepSeq.NFData Exposure where
  rnf x__ = Prelude.seq x__ ()
newtype Imxfx'UnrecognizedValue
  = Imxfx'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Imxfx
  = IMXFX_NONE |
    IMXFX_NEGATIVE |
    IMXFX_SOLARISE |
    IMXFX_SKETCH |
    IMXFX_DENOISE |
    IMXFX_EMBOSS |
    IMXFX_OILPAINT |
    IMXFX_HATCH |
    IMXFX_GPEN |
    IMXFX_PASTEL |
    IMXFX_WATERCOLOUR |
    IMXFX_FILM |
    IMXFX_BLUR |
    IMXFX_SATURATION |
    IMXFX_COLOURSWAP |
    IMXFX_WASHEDOUT |
    IMXFX_POSTERISE |
    IMXFX_COLOURPOINT |
    IMXFX_COLOURBALANCE |
    IMXFX_CARTOON |
    Imxfx'Unrecognized !Imxfx'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Imxfx where
  maybeToEnum 0 = Prelude.Just IMXFX_NONE
  maybeToEnum 1 = Prelude.Just IMXFX_NEGATIVE
  maybeToEnum 2 = Prelude.Just IMXFX_SOLARISE
  maybeToEnum 3 = Prelude.Just IMXFX_SKETCH
  maybeToEnum 4 = Prelude.Just IMXFX_DENOISE
  maybeToEnum 5 = Prelude.Just IMXFX_EMBOSS
  maybeToEnum 6 = Prelude.Just IMXFX_OILPAINT
  maybeToEnum 7 = Prelude.Just IMXFX_HATCH
  maybeToEnum 8 = Prelude.Just IMXFX_GPEN
  maybeToEnum 9 = Prelude.Just IMXFX_PASTEL
  maybeToEnum 10 = Prelude.Just IMXFX_WATERCOLOUR
  maybeToEnum 11 = Prelude.Just IMXFX_FILM
  maybeToEnum 12 = Prelude.Just IMXFX_BLUR
  maybeToEnum 13 = Prelude.Just IMXFX_SATURATION
  maybeToEnum 14 = Prelude.Just IMXFX_COLOURSWAP
  maybeToEnum 15 = Prelude.Just IMXFX_WASHEDOUT
  maybeToEnum 16 = Prelude.Just IMXFX_POSTERISE
  maybeToEnum 17 = Prelude.Just IMXFX_COLOURPOINT
  maybeToEnum 18 = Prelude.Just IMXFX_COLOURBALANCE
  maybeToEnum 19 = Prelude.Just IMXFX_CARTOON
  maybeToEnum k
    = Prelude.Just
        (Imxfx'Unrecognized
           (Imxfx'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum IMXFX_NONE = "IMXFX_NONE"
  showEnum IMXFX_NEGATIVE = "IMXFX_NEGATIVE"
  showEnum IMXFX_SOLARISE = "IMXFX_SOLARISE"
  showEnum IMXFX_SKETCH = "IMXFX_SKETCH"
  showEnum IMXFX_DENOISE = "IMXFX_DENOISE"
  showEnum IMXFX_EMBOSS = "IMXFX_EMBOSS"
  showEnum IMXFX_OILPAINT = "IMXFX_OILPAINT"
  showEnum IMXFX_HATCH = "IMXFX_HATCH"
  showEnum IMXFX_GPEN = "IMXFX_GPEN"
  showEnum IMXFX_PASTEL = "IMXFX_PASTEL"
  showEnum IMXFX_WATERCOLOUR = "IMXFX_WATERCOLOUR"
  showEnum IMXFX_FILM = "IMXFX_FILM"
  showEnum IMXFX_BLUR = "IMXFX_BLUR"
  showEnum IMXFX_SATURATION = "IMXFX_SATURATION"
  showEnum IMXFX_COLOURSWAP = "IMXFX_COLOURSWAP"
  showEnum IMXFX_WASHEDOUT = "IMXFX_WASHEDOUT"
  showEnum IMXFX_POSTERISE = "IMXFX_POSTERISE"
  showEnum IMXFX_COLOURPOINT = "IMXFX_COLOURPOINT"
  showEnum IMXFX_COLOURBALANCE = "IMXFX_COLOURBALANCE"
  showEnum IMXFX_CARTOON = "IMXFX_CARTOON"
  showEnum (Imxfx'Unrecognized (Imxfx'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "IMXFX_NONE" = Prelude.Just IMXFX_NONE
    | (Prelude.==) k "IMXFX_NEGATIVE" = Prelude.Just IMXFX_NEGATIVE
    | (Prelude.==) k "IMXFX_SOLARISE" = Prelude.Just IMXFX_SOLARISE
    | (Prelude.==) k "IMXFX_SKETCH" = Prelude.Just IMXFX_SKETCH
    | (Prelude.==) k "IMXFX_DENOISE" = Prelude.Just IMXFX_DENOISE
    | (Prelude.==) k "IMXFX_EMBOSS" = Prelude.Just IMXFX_EMBOSS
    | (Prelude.==) k "IMXFX_OILPAINT" = Prelude.Just IMXFX_OILPAINT
    | (Prelude.==) k "IMXFX_HATCH" = Prelude.Just IMXFX_HATCH
    | (Prelude.==) k "IMXFX_GPEN" = Prelude.Just IMXFX_GPEN
    | (Prelude.==) k "IMXFX_PASTEL" = Prelude.Just IMXFX_PASTEL
    | (Prelude.==) k "IMXFX_WATERCOLOUR"
    = Prelude.Just IMXFX_WATERCOLOUR
    | (Prelude.==) k "IMXFX_FILM" = Prelude.Just IMXFX_FILM
    | (Prelude.==) k "IMXFX_BLUR" = Prelude.Just IMXFX_BLUR
    | (Prelude.==) k "IMXFX_SATURATION" = Prelude.Just IMXFX_SATURATION
    | (Prelude.==) k "IMXFX_COLOURSWAP" = Prelude.Just IMXFX_COLOURSWAP
    | (Prelude.==) k "IMXFX_WASHEDOUT" = Prelude.Just IMXFX_WASHEDOUT
    | (Prelude.==) k "IMXFX_POSTERISE" = Prelude.Just IMXFX_POSTERISE
    | (Prelude.==) k "IMXFX_COLOURPOINT"
    = Prelude.Just IMXFX_COLOURPOINT
    | (Prelude.==) k "IMXFX_COLOURBALANCE"
    = Prelude.Just IMXFX_COLOURBALANCE
    | (Prelude.==) k "IMXFX_CARTOON" = Prelude.Just IMXFX_CARTOON
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Imxfx where
  minBound = IMXFX_NONE
  maxBound = IMXFX_CARTOON
instance Prelude.Enum Imxfx where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Imxfx: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum IMXFX_NONE = 0
  fromEnum IMXFX_NEGATIVE = 1
  fromEnum IMXFX_SOLARISE = 2
  fromEnum IMXFX_SKETCH = 3
  fromEnum IMXFX_DENOISE = 4
  fromEnum IMXFX_EMBOSS = 5
  fromEnum IMXFX_OILPAINT = 6
  fromEnum IMXFX_HATCH = 7
  fromEnum IMXFX_GPEN = 8
  fromEnum IMXFX_PASTEL = 9
  fromEnum IMXFX_WATERCOLOUR = 10
  fromEnum IMXFX_FILM = 11
  fromEnum IMXFX_BLUR = 12
  fromEnum IMXFX_SATURATION = 13
  fromEnum IMXFX_COLOURSWAP = 14
  fromEnum IMXFX_WASHEDOUT = 15
  fromEnum IMXFX_POSTERISE = 16
  fromEnum IMXFX_COLOURPOINT = 17
  fromEnum IMXFX_COLOURBALANCE = 18
  fromEnum IMXFX_CARTOON = 19
  fromEnum (Imxfx'Unrecognized (Imxfx'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ IMXFX_CARTOON
    = Prelude.error
        "Imxfx.succ: bad argument IMXFX_CARTOON. This value would be out of bounds."
  succ IMXFX_NONE = IMXFX_NEGATIVE
  succ IMXFX_NEGATIVE = IMXFX_SOLARISE
  succ IMXFX_SOLARISE = IMXFX_SKETCH
  succ IMXFX_SKETCH = IMXFX_DENOISE
  succ IMXFX_DENOISE = IMXFX_EMBOSS
  succ IMXFX_EMBOSS = IMXFX_OILPAINT
  succ IMXFX_OILPAINT = IMXFX_HATCH
  succ IMXFX_HATCH = IMXFX_GPEN
  succ IMXFX_GPEN = IMXFX_PASTEL
  succ IMXFX_PASTEL = IMXFX_WATERCOLOUR
  succ IMXFX_WATERCOLOUR = IMXFX_FILM
  succ IMXFX_FILM = IMXFX_BLUR
  succ IMXFX_BLUR = IMXFX_SATURATION
  succ IMXFX_SATURATION = IMXFX_COLOURSWAP
  succ IMXFX_COLOURSWAP = IMXFX_WASHEDOUT
  succ IMXFX_WASHEDOUT = IMXFX_POSTERISE
  succ IMXFX_POSTERISE = IMXFX_COLOURPOINT
  succ IMXFX_COLOURPOINT = IMXFX_COLOURBALANCE
  succ IMXFX_COLOURBALANCE = IMXFX_CARTOON
  succ (Imxfx'Unrecognized _)
    = Prelude.error "Imxfx.succ: bad argument: unrecognized value"
  pred IMXFX_NONE
    = Prelude.error
        "Imxfx.pred: bad argument IMXFX_NONE. This value would be out of bounds."
  pred IMXFX_NEGATIVE = IMXFX_NONE
  pred IMXFX_SOLARISE = IMXFX_NEGATIVE
  pred IMXFX_SKETCH = IMXFX_SOLARISE
  pred IMXFX_DENOISE = IMXFX_SKETCH
  pred IMXFX_EMBOSS = IMXFX_DENOISE
  pred IMXFX_OILPAINT = IMXFX_EMBOSS
  pred IMXFX_HATCH = IMXFX_OILPAINT
  pred IMXFX_GPEN = IMXFX_HATCH
  pred IMXFX_PASTEL = IMXFX_GPEN
  pred IMXFX_WATERCOLOUR = IMXFX_PASTEL
  pred IMXFX_FILM = IMXFX_WATERCOLOUR
  pred IMXFX_BLUR = IMXFX_FILM
  pred IMXFX_SATURATION = IMXFX_BLUR
  pred IMXFX_COLOURSWAP = IMXFX_SATURATION
  pred IMXFX_WASHEDOUT = IMXFX_COLOURSWAP
  pred IMXFX_POSTERISE = IMXFX_WASHEDOUT
  pred IMXFX_COLOURPOINT = IMXFX_POSTERISE
  pred IMXFX_COLOURBALANCE = IMXFX_COLOURPOINT
  pred IMXFX_CARTOON = IMXFX_COLOURBALANCE
  pred (Imxfx'Unrecognized _)
    = Prelude.error "Imxfx.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Imxfx where
  fieldDefault = IMXFX_NONE
instance Control.DeepSeq.NFData Imxfx where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Sensors.Raspcamdt_Fields.vflip' @:: Lens' Raspcamopt Prelude.Bool@
         * 'Proto.Sensors.Raspcamdt_Fields.hflip' @:: Lens' Raspcamopt Prelude.Bool@
         * 'Proto.Sensors.Raspcamdt_Fields.rotation' @:: Lens' Raspcamopt Data.Int.Int32@
         * 'Proto.Sensors.Raspcamdt_Fields.quality' @:: Lens' Raspcamopt Data.Int.Int32@
         * 'Proto.Sensors.Raspcamdt_Fields.encoding' @:: Lens' Raspcamopt Encoding@
         * 'Proto.Sensors.Raspcamdt_Fields.sharpness' @:: Lens' Raspcamopt Data.Int.Int32@
         * 'Proto.Sensors.Raspcamdt_Fields.contrast' @:: Lens' Raspcamopt Data.Int.Int32@
         * 'Proto.Sensors.Raspcamdt_Fields.brightness' @:: Lens' Raspcamopt Data.Int.Int32@
         * 'Proto.Sensors.Raspcamdt_Fields.saturation' @:: Lens' Raspcamopt Data.Int.Int32@
         * 'Proto.Sensors.Raspcamdt_Fields.exposure' @:: Lens' Raspcamopt Exposure@
         * 'Proto.Sensors.Raspcamdt_Fields.awb' @:: Lens' Raspcamopt Awb@
         * 'Proto.Sensors.Raspcamdt_Fields.imxfx' @:: Lens' Raspcamopt Imxfx@ -}
data Raspcamopt
  = Raspcamopt'_constructor {_Raspcamopt'vflip :: !Prelude.Bool,
                             _Raspcamopt'hflip :: !Prelude.Bool,
                             _Raspcamopt'rotation :: !Data.Int.Int32,
                             _Raspcamopt'quality :: !Data.Int.Int32,
                             _Raspcamopt'encoding :: !Encoding,
                             _Raspcamopt'sharpness :: !Data.Int.Int32,
                             _Raspcamopt'contrast :: !Data.Int.Int32,
                             _Raspcamopt'brightness :: !Data.Int.Int32,
                             _Raspcamopt'saturation :: !Data.Int.Int32,
                             _Raspcamopt'exposure :: !Exposure,
                             _Raspcamopt'awb :: !Awb,
                             _Raspcamopt'imxfx :: !Imxfx,
                             _Raspcamopt'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Raspcamopt where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Raspcamopt "vflip" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'vflip (\ x__ y__ -> x__ {_Raspcamopt'vflip = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "hflip" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'hflip (\ x__ y__ -> x__ {_Raspcamopt'hflip = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "rotation" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'rotation
           (\ x__ y__ -> x__ {_Raspcamopt'rotation = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "quality" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'quality (\ x__ y__ -> x__ {_Raspcamopt'quality = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "encoding" Encoding where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'encoding
           (\ x__ y__ -> x__ {_Raspcamopt'encoding = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "sharpness" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'sharpness
           (\ x__ y__ -> x__ {_Raspcamopt'sharpness = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "contrast" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'contrast
           (\ x__ y__ -> x__ {_Raspcamopt'contrast = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "brightness" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'brightness
           (\ x__ y__ -> x__ {_Raspcamopt'brightness = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "saturation" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'saturation
           (\ x__ y__ -> x__ {_Raspcamopt'saturation = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "exposure" Exposure where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'exposure
           (\ x__ y__ -> x__ {_Raspcamopt'exposure = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "awb" Awb where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'awb (\ x__ y__ -> x__ {_Raspcamopt'awb = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamopt "imxfx" Imxfx where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamopt'imxfx (\ x__ y__ -> x__ {_Raspcamopt'imxfx = y__}))
        Prelude.id
instance Data.ProtoLens.Message Raspcamopt where
  messageName _ = Data.Text.pack "sensors.raspcamdt.Raspcamopt"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Raspcamopt\DC2\DC4\n\
      \\ENQvflip\CAN\SOH \SOH(\bR\ENQvflip\DC2\DC4\n\
      \\ENQhflip\CAN\STX \SOH(\bR\ENQhflip\DC2\SUB\n\
      \\brotation\CAN\ETX \SOH(\ENQR\brotation\DC2\CAN\n\
      \\aquality\CAN\EOT \SOH(\ENQR\aquality\DC27\n\
      \\bencoding\CAN\ENQ \SOH(\SO2\ESC.sensors.raspcamdt.EncodingR\bencoding\DC2\FS\n\
      \\tsharpness\CAN\ACK \SOH(\ENQR\tsharpness\DC2\SUB\n\
      \\bcontrast\CAN\a \SOH(\ENQR\bcontrast\DC2\RS\n\
      \\n\
      \brightness\CAN\b \SOH(\ENQR\n\
      \brightness\DC2\RS\n\
      \\n\
      \saturation\CAN\t \SOH(\ENQR\n\
      \saturation\DC27\n\
      \\bexposure\CAN\n\
      \ \SOH(\SO2\ESC.sensors.raspcamdt.ExposureR\bexposure\DC2(\n\
      \\ETXawb\CAN\v \SOH(\SO2\SYN.sensors.raspcamdt.AwbR\ETXawb\DC2.\n\
      \\ENQimxfx\CAN\f \SOH(\SO2\CAN.sensors.raspcamdt.ImxfxR\ENQimxfx"
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
              Data.ProtoLens.FieldDescriptor Raspcamopt
        hflip__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "hflip"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"hflip")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
        rotation__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "rotation"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"rotation")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
        quality__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "quality"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"quality")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
        encoding__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "encoding"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Encoding)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"encoding")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
        sharpness__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sharpness"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"sharpness")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
        contrast__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "contrast"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"contrast")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
        brightness__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "brightness"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"brightness")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
        saturation__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "saturation"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"saturation")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
        exposure__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "exposure"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Exposure)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"exposure")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
        awb__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "awb"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Awb)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"awb")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
        imxfx__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "imxfx"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Imxfx)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"imxfx")) ::
              Data.ProtoLens.FieldDescriptor Raspcamopt
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
        _Raspcamopt'_unknownFields
        (\ x__ y__ -> x__ {_Raspcamopt'_unknownFields = y__})
  defMessage
    = Raspcamopt'_constructor
        {_Raspcamopt'vflip = Data.ProtoLens.fieldDefault,
         _Raspcamopt'hflip = Data.ProtoLens.fieldDefault,
         _Raspcamopt'rotation = Data.ProtoLens.fieldDefault,
         _Raspcamopt'quality = Data.ProtoLens.fieldDefault,
         _Raspcamopt'encoding = Data.ProtoLens.fieldDefault,
         _Raspcamopt'sharpness = Data.ProtoLens.fieldDefault,
         _Raspcamopt'contrast = Data.ProtoLens.fieldDefault,
         _Raspcamopt'brightness = Data.ProtoLens.fieldDefault,
         _Raspcamopt'saturation = Data.ProtoLens.fieldDefault,
         _Raspcamopt'exposure = Data.ProtoLens.fieldDefault,
         _Raspcamopt'awb = Data.ProtoLens.fieldDefault,
         _Raspcamopt'imxfx = Data.ProtoLens.fieldDefault,
         _Raspcamopt'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Raspcamopt -> Data.ProtoLens.Encoding.Bytes.Parser Raspcamopt
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
          (do loop Data.ProtoLens.defMessage) "Raspcamopt"
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
instance Control.DeepSeq.NFData Raspcamopt where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Raspcamopt'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Raspcamopt'vflip x__)
                (Control.DeepSeq.deepseq
                   (_Raspcamopt'hflip x__)
                   (Control.DeepSeq.deepseq
                      (_Raspcamopt'rotation x__)
                      (Control.DeepSeq.deepseq
                         (_Raspcamopt'quality x__)
                         (Control.DeepSeq.deepseq
                            (_Raspcamopt'encoding x__)
                            (Control.DeepSeq.deepseq
                               (_Raspcamopt'sharpness x__)
                               (Control.DeepSeq.deepseq
                                  (_Raspcamopt'contrast x__)
                                  (Control.DeepSeq.deepseq
                                     (_Raspcamopt'brightness x__)
                                     (Control.DeepSeq.deepseq
                                        (_Raspcamopt'saturation x__)
                                        (Control.DeepSeq.deepseq
                                           (_Raspcamopt'exposure x__)
                                           (Control.DeepSeq.deepseq
                                              (_Raspcamopt'awb x__)
                                              (Control.DeepSeq.deepseq
                                                 (_Raspcamopt'imxfx x__) ()))))))))))))
{- | Fields :
     
         * 'Proto.Sensors.Raspcamdt_Fields.encoding' @:: Lens' Raspcamout Encoding@
         * 'Proto.Sensors.Raspcamdt_Fields.bin' @:: Lens' Raspcamout Data.ByteString.ByteString@ -}
data Raspcamout
  = Raspcamout'_constructor {_Raspcamout'encoding :: !Encoding,
                             _Raspcamout'bin :: !Data.ByteString.ByteString,
                             _Raspcamout'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Raspcamout where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Raspcamout "encoding" Encoding where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamout'encoding
           (\ x__ y__ -> x__ {_Raspcamout'encoding = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Raspcamout "bin" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Raspcamout'bin (\ x__ y__ -> x__ {_Raspcamout'bin = y__}))
        Prelude.id
instance Data.ProtoLens.Message Raspcamout where
  messageName _ = Data.Text.pack "sensors.raspcamdt.Raspcamout"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Raspcamout\DC27\n\
      \\bencoding\CAN\SOH \SOH(\SO2\ESC.sensors.raspcamdt.EncodingR\bencoding\DC2\DLE\n\
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
              Data.ProtoLens.FieldDescriptor Raspcamout
        bin__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "bin"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"bin")) ::
              Data.ProtoLens.FieldDescriptor Raspcamout
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, encoding__field_descriptor),
           (Data.ProtoLens.Tag 2, bin__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Raspcamout'_unknownFields
        (\ x__ y__ -> x__ {_Raspcamout'_unknownFields = y__})
  defMessage
    = Raspcamout'_constructor
        {_Raspcamout'encoding = Data.ProtoLens.fieldDefault,
         _Raspcamout'bin = Data.ProtoLens.fieldDefault,
         _Raspcamout'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Raspcamout -> Data.ProtoLens.Encoding.Bytes.Parser Raspcamout
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
          (do loop Data.ProtoLens.defMessage) "Raspcamout"
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
instance Control.DeepSeq.NFData Raspcamout where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Raspcamout'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Raspcamout'encoding x__)
                (Control.DeepSeq.deepseq (_Raspcamout'bin x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\ETBsensors/raspcamdt.proto\DC2\DC1sensors.raspcamdt\"W\n\
    \\n\
    \Raspcamout\DC27\n\
    \\bencoding\CAN\SOH \SOH(\SO2\ESC.sensors.raspcamdt.EncodingR\bencoding\DC2\DLE\n\
    \\ETXbin\CAN\STX \SOH(\fR\ETXbin\"\180\ETX\n\
    \\n\
    \Raspcamopt\DC2\DC4\n\
    \\ENQvflip\CAN\SOH \SOH(\bR\ENQvflip\DC2\DC4\n\
    \\ENQhflip\CAN\STX \SOH(\bR\ENQhflip\DC2\SUB\n\
    \\brotation\CAN\ETX \SOH(\ENQR\brotation\DC2\CAN\n\
    \\aquality\CAN\EOT \SOH(\ENQR\aquality\DC27\n\
    \\bencoding\CAN\ENQ \SOH(\SO2\ESC.sensors.raspcamdt.EncodingR\bencoding\DC2\FS\n\
    \\tsharpness\CAN\ACK \SOH(\ENQR\tsharpness\DC2\SUB\n\
    \\bcontrast\CAN\a \SOH(\ENQR\bcontrast\DC2\RS\n\
    \\n\
    \brightness\CAN\b \SOH(\ENQR\n\
    \brightness\DC2\RS\n\
    \\n\
    \saturation\CAN\t \SOH(\ENQR\n\
    \saturation\DC27\n\
    \\bexposure\CAN\n\
    \ \SOH(\SO2\ESC.sensors.raspcamdt.ExposureR\bexposure\DC2(\n\
    \\ETXawb\CAN\v \SOH(\SO2\SYN.sensors.raspcamdt.AwbR\ETXawb\DC2.\n\
    \\ENQimxfx\CAN\f \SOH(\SO2\CAN.sensors.raspcamdt.ImxfxR\ENQimxfx*/\n\
    \\bEncoding\DC2\b\n\
    \\EOTJPEG\DLE\NUL\DC2\a\n\
    \\ETXPNG\DLE\SOH\DC2\a\n\
    \\ETXBMP\DLE\STX\DC2\a\n\
    \\ETXGIF\DLE\ETX*\231\SOH\n\
    \\bExposure\DC2\v\n\
    \\aEXP_OFF\DLE\NUL\DC2\f\n\
    \\bEXP_AUTO\DLE\SOH\DC2\r\n\
    \\tEXP_NIGHT\DLE\STX\DC2\DC4\n\
    \\DLEEXP_NIGHTPREVIEW\DLE\ETX\DC2\DC1\n\
    \\rEXP_BACKLIGHT\DLE\EOT\DC2\DC1\n\
    \\rEXP_SPOTLIGHT\DLE\ENQ\DC2\SO\n\
    \\n\
    \EXP_SPORTS\DLE\ACK\DC2\f\n\
    \\bEXP_SNOW\DLE\a\DC2\r\n\
    \\tEXP_BEACH\DLE\b\DC2\DLE\n\
    \\fEXP_VERYLONG\DLE\t\DC2\DLE\n\
    \\fEXP_FIXEDFPS\DLE\n\
    \\DC2\DC1\n\
    \\rEXP_ANTISHAKE\DLE\v\DC2\DC1\n\
    \\rEXP_FIREWORKS\DLE\f*\187\SOH\n\
    \\ETXAwb\DC2\v\n\
    \\aAWB_OFF\DLE\NUL\DC2\f\n\
    \\bAWB_AUTO\DLE\SOH\DC2\v\n\
    \\aAWB_SUN\DLE\STX\DC2\r\n\
    \\tAWB_CLOUD\DLE\ETX\DC2\r\n\
    \\tAWB_SHADE\DLE\EOT\DC2\DLE\n\
    \\fAWB_TUNGSTEN\DLE\ENQ\DC2\DC3\n\
    \\SIAWB_FLUORESCENT\DLE\ACK\DC2\DC4\n\
    \\DLEAWB_INCANDESCENT\DLE\a\DC2\r\n\
    \\tAWB_FLASH\DLE\b\DC2\SI\n\
    \\vAWB_HORIZON\DLE\t\DC2\DC1\n\
    \\rAWB_GREYWORLD\DLE\n\
    \*\141\ETX\n\
    \\ENQImxfx\DC2\SO\n\
    \\n\
    \IMXFX_NONE\DLE\NUL\DC2\DC2\n\
    \\SOIMXFX_NEGATIVE\DLE\SOH\DC2\DC2\n\
    \\SOIMXFX_SOLARISE\DLE\STX\DC2\DLE\n\
    \\fIMXFX_SKETCH\DLE\ETX\DC2\DC1\n\
    \\rIMXFX_DENOISE\DLE\EOT\DC2\DLE\n\
    \\fIMXFX_EMBOSS\DLE\ENQ\DC2\DC2\n\
    \\SOIMXFX_OILPAINT\DLE\ACK\DC2\SI\n\
    \\vIMXFX_HATCH\DLE\a\DC2\SO\n\
    \\n\
    \IMXFX_GPEN\DLE\b\DC2\DLE\n\
    \\fIMXFX_PASTEL\DLE\t\DC2\NAK\n\
    \\DC1IMXFX_WATERCOLOUR\DLE\n\
    \\DC2\SO\n\
    \\n\
    \IMXFX_FILM\DLE\v\DC2\SO\n\
    \\n\
    \IMXFX_BLUR\DLE\f\DC2\DC4\n\
    \\DLEIMXFX_SATURATION\DLE\r\DC2\DC4\n\
    \\DLEIMXFX_COLOURSWAP\DLE\SO\DC2\DC3\n\
    \\SIIMXFX_WASHEDOUT\DLE\SI\DC2\DC3\n\
    \\SIIMXFX_POSTERISE\DLE\DLE\DC2\NAK\n\
    \\DC1IMXFX_COLOURPOINT\DLE\DC1\DC2\ETB\n\
    \\DC3IMXFX_COLOURBALANCE\DLE\DC2\DC2\DC1\n\
    \\rIMXFX_CARTOON\DLE\DC3J\222\SYN\n\
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