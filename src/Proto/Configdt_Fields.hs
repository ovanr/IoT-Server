{- This file was auto-generated from configdt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Configdt_Fields where
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
import qualified Proto.Sensors.Cpudt
import qualified Proto.Sensors.Raspcamdt
import qualified Proto.Sensors.Systemdt
burstCount ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "burstCount" a) =>
  Lens.Family2.LensLike' f s a
burstCount = Data.ProtoLens.Field.field @"burstCount"
burstInterval ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "burstInterval" a) =>
  Lens.Family2.LensLike' f s a
burstInterval = Data.ProtoLens.Field.field @"burstInterval"
cpu ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "cpu" a) =>
  Lens.Family2.LensLike' f s a
cpu = Data.ProtoLens.Field.field @"cpu"
hour ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "hour" a) =>
  Lens.Family2.LensLike' f s a
hour = Data.ProtoLens.Field.field @"hour"
maybe'cpu ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'cpu" a) =>
  Lens.Family2.LensLike' f s a
maybe'cpu = Data.ProtoLens.Field.field @"maybe'cpu"
maybe'raspCam ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'raspCam" a) =>
  Lens.Family2.LensLike' f s a
maybe'raspCam = Data.ProtoLens.Field.field @"maybe'raspCam"
maybe'sensorConf ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'sensorConf" a) =>
  Lens.Family2.LensLike' f s a
maybe'sensorConf = Data.ProtoLens.Field.field @"maybe'sensorConf"
maybe'system ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'system" a) =>
  Lens.Family2.LensLike' f s a
maybe'system = Data.ProtoLens.Field.field @"maybe'system"
minute ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "minute" a) =>
  Lens.Family2.LensLike' f s a
minute = Data.ProtoLens.Field.field @"minute"
mqttHost ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "mqttHost" a) =>
  Lens.Family2.LensLike' f s a
mqttHost = Data.ProtoLens.Field.field @"mqttHost"
mqttPass ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "mqttPass" a) =>
  Lens.Family2.LensLike' f s a
mqttPass = Data.ProtoLens.Field.field @"mqttPass"
mqttUser ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "mqttUser" a) =>
  Lens.Family2.LensLike' f s a
mqttUser = Data.ProtoLens.Field.field @"mqttUser"
raspCam ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "raspCam" a) =>
  Lens.Family2.LensLike' f s a
raspCam = Data.ProtoLens.Field.field @"raspCam"
sensorConf ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sensorConf" a) =>
  Lens.Family2.LensLike' f s a
sensorConf = Data.ProtoLens.Field.field @"sensorConf"
system ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "system" a) =>
  Lens.Family2.LensLike' f s a
system = Data.ProtoLens.Field.field @"system"
vec'wakeOn ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'wakeOn" a) =>
  Lens.Family2.LensLike' f s a
vec'wakeOn = Data.ProtoLens.Field.field @"vec'wakeOn"
wakeOn ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "wakeOn" a) =>
  Lens.Family2.LensLike' f s a
wakeOn = Data.ProtoLens.Field.field @"wakeOn"