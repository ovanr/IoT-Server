{- This file was auto-generated from sensors/raspcamdt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Sensors.Raspcamdt_Fields where
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
awb ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "awb" a) =>
  Lens.Family2.LensLike' f s a
awb = Data.ProtoLens.Field.field @"awb"
bin ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "bin" a) =>
  Lens.Family2.LensLike' f s a
bin = Data.ProtoLens.Field.field @"bin"
brightness ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "brightness" a) =>
  Lens.Family2.LensLike' f s a
brightness = Data.ProtoLens.Field.field @"brightness"
contrast ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "contrast" a) =>
  Lens.Family2.LensLike' f s a
contrast = Data.ProtoLens.Field.field @"contrast"
encoding ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "encoding" a) =>
  Lens.Family2.LensLike' f s a
encoding = Data.ProtoLens.Field.field @"encoding"
exposure ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "exposure" a) =>
  Lens.Family2.LensLike' f s a
exposure = Data.ProtoLens.Field.field @"exposure"
hflip ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "hflip" a) =>
  Lens.Family2.LensLike' f s a
hflip = Data.ProtoLens.Field.field @"hflip"
imxfx ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "imxfx" a) =>
  Lens.Family2.LensLike' f s a
imxfx = Data.ProtoLens.Field.field @"imxfx"
quality ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "quality" a) =>
  Lens.Family2.LensLike' f s a
quality = Data.ProtoLens.Field.field @"quality"
rotation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rotation" a) =>
  Lens.Family2.LensLike' f s a
rotation = Data.ProtoLens.Field.field @"rotation"
saturation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "saturation" a) =>
  Lens.Family2.LensLike' f s a
saturation = Data.ProtoLens.Field.field @"saturation"
sharpness ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sharpness" a) =>
  Lens.Family2.LensLike' f s a
sharpness = Data.ProtoLens.Field.field @"sharpness"
vflip ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "vflip" a) =>
  Lens.Family2.LensLike' f s a
vflip = Data.ProtoLens.Field.field @"vflip"