{- This file was auto-generated from configDt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.ConfigDt (
        DeviceConf(), ModuleConf(), Time()
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
import qualified Proto.Sensors.CpuDt
import qualified Proto.Sensors.RaspCamDt
{- | Fields :
     
         * 'Proto.ConfigDt_Fields.mqttHost' @:: Lens' DeviceConf Data.Text.Text@
         * 'Proto.ConfigDt_Fields.mqttPort' @:: Lens' DeviceConf Data.Int.Int32@
         * 'Proto.ConfigDt_Fields.mqttUser' @:: Lens' DeviceConf Data.Text.Text@
         * 'Proto.ConfigDt_Fields.mqttPass' @:: Lens' DeviceConf Data.Text.Text@
         * 'Proto.ConfigDt_Fields.burstInterval' @:: Lens' DeviceConf Data.Int.Int32@
         * 'Proto.ConfigDt_Fields.burstCount' @:: Lens' DeviceConf Data.Int.Int32@
         * 'Proto.ConfigDt_Fields.wakeOn' @:: Lens' DeviceConf [Time]@
         * 'Proto.ConfigDt_Fields.vec'wakeOn' @:: Lens' DeviceConf (Data.Vector.Vector Time)@
         * 'Proto.ConfigDt_Fields.sensorConf' @:: Lens' DeviceConf ModuleConf@
         * 'Proto.ConfigDt_Fields.maybe'sensorConf' @:: Lens' DeviceConf (Prelude.Maybe ModuleConf)@ -}
data DeviceConf
  = DeviceConf'_constructor {_DeviceConf'mqttHost :: !Data.Text.Text,
                             _DeviceConf'mqttPort :: !Data.Int.Int32,
                             _DeviceConf'mqttUser :: !Data.Text.Text,
                             _DeviceConf'mqttPass :: !Data.Text.Text,
                             _DeviceConf'burstInterval :: !Data.Int.Int32,
                             _DeviceConf'burstCount :: !Data.Int.Int32,
                             _DeviceConf'wakeOn :: !(Data.Vector.Vector Time),
                             _DeviceConf'sensorConf :: !(Prelude.Maybe ModuleConf),
                             _DeviceConf'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DeviceConf where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField DeviceConf "mqttHost" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DeviceConf'mqttHost
           (\ x__ y__ -> x__ {_DeviceConf'mqttHost = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DeviceConf "mqttPort" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DeviceConf'mqttPort
           (\ x__ y__ -> x__ {_DeviceConf'mqttPort = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DeviceConf "mqttUser" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DeviceConf'mqttUser
           (\ x__ y__ -> x__ {_DeviceConf'mqttUser = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DeviceConf "mqttPass" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DeviceConf'mqttPass
           (\ x__ y__ -> x__ {_DeviceConf'mqttPass = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DeviceConf "burstInterval" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DeviceConf'burstInterval
           (\ x__ y__ -> x__ {_DeviceConf'burstInterval = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DeviceConf "burstCount" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DeviceConf'burstCount
           (\ x__ y__ -> x__ {_DeviceConf'burstCount = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DeviceConf "wakeOn" [Time] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DeviceConf'wakeOn (\ x__ y__ -> x__ {_DeviceConf'wakeOn = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField DeviceConf "vec'wakeOn" (Data.Vector.Vector Time) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DeviceConf'wakeOn (\ x__ y__ -> x__ {_DeviceConf'wakeOn = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DeviceConf "sensorConf" ModuleConf where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DeviceConf'sensorConf
           (\ x__ y__ -> x__ {_DeviceConf'sensorConf = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField DeviceConf "maybe'sensorConf" (Prelude.Maybe ModuleConf) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DeviceConf'sensorConf
           (\ x__ y__ -> x__ {_DeviceConf'sensorConf = y__}))
        Prelude.id
instance Data.ProtoLens.Message DeviceConf where
  messageName _ = Data.Text.pack "configDt.DeviceConf"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \DeviceConf\DC2\SUB\n\
      \\bmqttHost\CAN\SOH \SOH(\tR\bmqttHost\DC2\SUB\n\
      \\bmqttPort\CAN\STX \SOH(\ENQR\bmqttPort\DC2\SUB\n\
      \\bmqttUser\CAN\ETX \SOH(\tR\bmqttUser\DC2\SUB\n\
      \\bmqttPass\CAN\EOT \SOH(\tR\bmqttPass\DC2$\n\
      \\rburstInterval\CAN\ENQ \SOH(\ENQR\rburstInterval\DC2\RS\n\
      \\n\
      \burstCount\CAN\ACK \SOH(\ENQR\n\
      \burstCount\DC2&\n\
      \\ACKwakeOn\CAN\a \ETX(\v2\SO.configDt.TimeR\ACKwakeOn\DC24\n\
      \\n\
      \sensorConf\CAN\b \SOH(\v2\DC4.configDt.ModuleConfR\n\
      \sensorConf"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        mqttHost__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "mqttHost"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"mqttHost")) ::
              Data.ProtoLens.FieldDescriptor DeviceConf
        mqttPort__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "mqttPort"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"mqttPort")) ::
              Data.ProtoLens.FieldDescriptor DeviceConf
        mqttUser__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "mqttUser"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"mqttUser")) ::
              Data.ProtoLens.FieldDescriptor DeviceConf
        mqttPass__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "mqttPass"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"mqttPass")) ::
              Data.ProtoLens.FieldDescriptor DeviceConf
        burstInterval__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "burstInterval"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"burstInterval")) ::
              Data.ProtoLens.FieldDescriptor DeviceConf
        burstCount__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "burstCount"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"burstCount")) ::
              Data.ProtoLens.FieldDescriptor DeviceConf
        wakeOn__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "wakeOn"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Time)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"wakeOn")) ::
              Data.ProtoLens.FieldDescriptor DeviceConf
        sensorConf__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sensorConf"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ModuleConf)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'sensorConf")) ::
              Data.ProtoLens.FieldDescriptor DeviceConf
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, mqttHost__field_descriptor),
           (Data.ProtoLens.Tag 2, mqttPort__field_descriptor),
           (Data.ProtoLens.Tag 3, mqttUser__field_descriptor),
           (Data.ProtoLens.Tag 4, mqttPass__field_descriptor),
           (Data.ProtoLens.Tag 5, burstInterval__field_descriptor),
           (Data.ProtoLens.Tag 6, burstCount__field_descriptor),
           (Data.ProtoLens.Tag 7, wakeOn__field_descriptor),
           (Data.ProtoLens.Tag 8, sensorConf__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _DeviceConf'_unknownFields
        (\ x__ y__ -> x__ {_DeviceConf'_unknownFields = y__})
  defMessage
    = DeviceConf'_constructor
        {_DeviceConf'mqttHost = Data.ProtoLens.fieldDefault,
         _DeviceConf'mqttPort = Data.ProtoLens.fieldDefault,
         _DeviceConf'mqttUser = Data.ProtoLens.fieldDefault,
         _DeviceConf'mqttPass = Data.ProtoLens.fieldDefault,
         _DeviceConf'burstInterval = Data.ProtoLens.fieldDefault,
         _DeviceConf'burstCount = Data.ProtoLens.fieldDefault,
         _DeviceConf'wakeOn = Data.Vector.Generic.empty,
         _DeviceConf'sensorConf = Prelude.Nothing,
         _DeviceConf'_unknownFields = []}
  parseMessage
    = let
        loop ::
          DeviceConf
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Time
             -> Data.ProtoLens.Encoding.Bytes.Parser DeviceConf
        loop x mutable'wakeOn
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'wakeOn <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'wakeOn)
                      (let missing = []
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'wakeOn") frozen'wakeOn x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "mqttHost"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"mqttHost") y x)
                                  mutable'wakeOn
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "mqttPort"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"mqttPort") y x)
                                  mutable'wakeOn
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "mqttUser"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"mqttUser") y x)
                                  mutable'wakeOn
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "mqttPass"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"mqttPass") y x)
                                  mutable'wakeOn
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "burstInterval"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"burstInterval") y x)
                                  mutable'wakeOn
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "burstCount"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"burstCount") y x)
                                  mutable'wakeOn
                        58
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "wakeOn"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'wakeOn y)
                                loop x v
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "sensorConf"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"sensorConf") y x)
                                  mutable'wakeOn
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'wakeOn
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'wakeOn <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'wakeOn)
          "DeviceConf"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"mqttHost") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"mqttPort") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"mqttUser") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((Prelude..)
                               (\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               Data.Text.Encoding.encodeUtf8 _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"mqttPass") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                               ((Prelude..)
                                  (\ bs
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                             (Prelude.fromIntegral (Data.ByteString.length bs)))
                                          (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  Data.Text.Encoding.encodeUtf8 _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"burstInterval") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                     _v))
                         ((Data.Monoid.<>)
                            (let
                               _v
                                 = Lens.Family2.view (Data.ProtoLens.Field.field @"burstCount") _x
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
                               (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                  (\ _v
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                          ((Prelude..)
                                             (\ bs
                                                -> (Data.Monoid.<>)
                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                        (Prelude.fromIntegral
                                                           (Data.ByteString.length bs)))
                                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                             Data.ProtoLens.encodeMessage _v))
                                  (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'wakeOn") _x))
                               ((Data.Monoid.<>)
                                  (case
                                       Lens.Family2.view
                                         (Data.ProtoLens.Field.field @"maybe'sensorConf") _x
                                   of
                                     Prelude.Nothing -> Data.Monoid.mempty
                                     (Prelude.Just _v)
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                            ((Prelude..)
                                               (\ bs
                                                  -> (Data.Monoid.<>)
                                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                          (Prelude.fromIntegral
                                                             (Data.ByteString.length bs)))
                                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                               Data.ProtoLens.encodeMessage _v))
                                  (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                     (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))))
instance Control.DeepSeq.NFData DeviceConf where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_DeviceConf'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_DeviceConf'mqttHost x__)
                (Control.DeepSeq.deepseq
                   (_DeviceConf'mqttPort x__)
                   (Control.DeepSeq.deepseq
                      (_DeviceConf'mqttUser x__)
                      (Control.DeepSeq.deepseq
                         (_DeviceConf'mqttPass x__)
                         (Control.DeepSeq.deepseq
                            (_DeviceConf'burstInterval x__)
                            (Control.DeepSeq.deepseq
                               (_DeviceConf'burstCount x__)
                               (Control.DeepSeq.deepseq
                                  (_DeviceConf'wakeOn x__)
                                  (Control.DeepSeq.deepseq (_DeviceConf'sensorConf x__) ()))))))))
{- | Fields :
     
         * 'Proto.ConfigDt_Fields.raspCam' @:: Lens' ModuleConf Proto.Sensors.RaspCamDt.RaspCamOpt@
         * 'Proto.ConfigDt_Fields.maybe'raspCam' @:: Lens' ModuleConf (Prelude.Maybe Proto.Sensors.RaspCamDt.RaspCamOpt)@
         * 'Proto.ConfigDt_Fields.cpu' @:: Lens' ModuleConf Proto.Sensors.CpuDt.CpuOpt@
         * 'Proto.ConfigDt_Fields.maybe'cpu' @:: Lens' ModuleConf (Prelude.Maybe Proto.Sensors.CpuDt.CpuOpt)@ -}
data ModuleConf
  = ModuleConf'_constructor {_ModuleConf'raspCam :: !(Prelude.Maybe Proto.Sensors.RaspCamDt.RaspCamOpt),
                             _ModuleConf'cpu :: !(Prelude.Maybe Proto.Sensors.CpuDt.CpuOpt),
                             _ModuleConf'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ModuleConf where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ModuleConf "raspCam" Proto.Sensors.RaspCamDt.RaspCamOpt where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ModuleConf'raspCam (\ x__ y__ -> x__ {_ModuleConf'raspCam = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ModuleConf "maybe'raspCam" (Prelude.Maybe Proto.Sensors.RaspCamDt.RaspCamOpt) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ModuleConf'raspCam (\ x__ y__ -> x__ {_ModuleConf'raspCam = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ModuleConf "cpu" Proto.Sensors.CpuDt.CpuOpt where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ModuleConf'cpu (\ x__ y__ -> x__ {_ModuleConf'cpu = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ModuleConf "maybe'cpu" (Prelude.Maybe Proto.Sensors.CpuDt.CpuOpt) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ModuleConf'cpu (\ x__ y__ -> x__ {_ModuleConf'cpu = y__}))
        Prelude.id
instance Data.ProtoLens.Message ModuleConf where
  messageName _ = Data.Text.pack "configDt.ModuleConf"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \ModuleConf\DC27\n\
      \\araspCam\CAN\SOH \SOH(\v2\GS.sensors.raspCamDt.RaspCamOptR\araspCam\DC2'\n\
      \\ETXcpu\CAN\STX \SOH(\v2\NAK.sensors.cpuDt.CpuOptR\ETXcpu"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        raspCam__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "raspCam"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Sensors.RaspCamDt.RaspCamOpt)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'raspCam")) ::
              Data.ProtoLens.FieldDescriptor ModuleConf
        cpu__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cpu"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Sensors.CpuDt.CpuOpt)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'cpu")) ::
              Data.ProtoLens.FieldDescriptor ModuleConf
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, raspCam__field_descriptor),
           (Data.ProtoLens.Tag 2, cpu__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ModuleConf'_unknownFields
        (\ x__ y__ -> x__ {_ModuleConf'_unknownFields = y__})
  defMessage
    = ModuleConf'_constructor
        {_ModuleConf'raspCam = Prelude.Nothing,
         _ModuleConf'cpu = Prelude.Nothing, _ModuleConf'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ModuleConf -> Data.ProtoLens.Encoding.Bytes.Parser ModuleConf
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
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "raspCam"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"raspCam") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "cpu"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"cpu") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ModuleConf"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'raspCam") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'cpu") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData ModuleConf where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ModuleConf'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ModuleConf'raspCam x__)
                (Control.DeepSeq.deepseq (_ModuleConf'cpu x__) ()))
{- | Fields :
     
         * 'Proto.ConfigDt_Fields.hour' @:: Lens' Time Data.Int.Int32@
         * 'Proto.ConfigDt_Fields.minute' @:: Lens' Time Data.Int.Int32@ -}
data Time
  = Time'_constructor {_Time'hour :: !Data.Int.Int32,
                       _Time'minute :: !Data.Int.Int32,
                       _Time'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Time where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Time "hour" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Time'hour (\ x__ y__ -> x__ {_Time'hour = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Time "minute" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Time'minute (\ x__ y__ -> x__ {_Time'minute = y__}))
        Prelude.id
instance Data.ProtoLens.Message Time where
  messageName _ = Data.Text.pack "configDt.Time"
  packedMessageDescriptor _
    = "\n\
      \\EOTTime\DC2\DC2\n\
      \\EOThour\CAN\SOH \SOH(\ENQR\EOThour\DC2\SYN\n\
      \\ACKminute\CAN\STX \SOH(\ENQR\ACKminute"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        hour__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "hour"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"hour")) ::
              Data.ProtoLens.FieldDescriptor Time
        minute__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "minute"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"minute")) ::
              Data.ProtoLens.FieldDescriptor Time
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, hour__field_descriptor),
           (Data.ProtoLens.Tag 2, minute__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Time'_unknownFields
        (\ x__ y__ -> x__ {_Time'_unknownFields = y__})
  defMessage
    = Time'_constructor
        {_Time'hour = Data.ProtoLens.fieldDefault,
         _Time'minute = Data.ProtoLens.fieldDefault,
         _Time'_unknownFields = []}
  parseMessage
    = let
        loop :: Time -> Data.ProtoLens.Encoding.Bytes.Parser Time
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
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "hour"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"hour") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "minute"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"minute") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Time"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"hour") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"minute") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Time where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Time'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Time'hour x__) (Control.DeepSeq.deepseq (_Time'minute x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SOconfigDt.proto\DC2\bconfigDt\SUB\ETBsensors/raspCamDt.proto\SUB\DC3sensors/cpuDt.proto\"2\n\
    \\EOTTime\DC2\DC2\n\
    \\EOThour\CAN\SOH \SOH(\ENQR\EOThour\DC2\SYN\n\
    \\ACKminute\CAN\STX \SOH(\ENQR\ACKminute\"n\n\
    \\n\
    \ModuleConf\DC27\n\
    \\araspCam\CAN\SOH \SOH(\v2\GS.sensors.raspCamDt.RaspCamOptR\araspCam\DC2'\n\
    \\ETXcpu\CAN\STX \SOH(\v2\NAK.sensors.cpuDt.CpuOptR\ETXcpu\"\160\STX\n\
    \\n\
    \DeviceConf\DC2\SUB\n\
    \\bmqttHost\CAN\SOH \SOH(\tR\bmqttHost\DC2\SUB\n\
    \\bmqttPort\CAN\STX \SOH(\ENQR\bmqttPort\DC2\SUB\n\
    \\bmqttUser\CAN\ETX \SOH(\tR\bmqttUser\DC2\SUB\n\
    \\bmqttPass\CAN\EOT \SOH(\tR\bmqttPass\DC2$\n\
    \\rburstInterval\CAN\ENQ \SOH(\ENQR\rburstInterval\DC2\RS\n\
    \\n\
    \burstCount\CAN\ACK \SOH(\ENQR\n\
    \burstCount\DC2&\n\
    \\ACKwakeOn\CAN\a \ETX(\v2\SO.configDt.TimeR\ACKwakeOn\DC24\n\
    \\n\
    \sensorConf\CAN\b \SOH(\v2\DC4.configDt.ModuleConfR\n\
    \sensorConfJ\156\ACK\n\
    \\ACK\DC2\EOT\NUL\NUL\SUB\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\STX\NUL!\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX\ETX\NUL\GS\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ENQ\NUL\DC1\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\a\NUL\n\
    \\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\a\b\f\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\b\ETX\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\b\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\b\t\r\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\b\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\t\ETX\DC4\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETX\t\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\t\t\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\t\DC2\DC3\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\f\NUL\SI\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\f\b\DC2\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\r\ETX,\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ACK\DC2\ETX\r\ETX\US\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\r '\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\r*+\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX\SO\ETX \n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ACK\DC2\ETX\SO\ETX\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX\SO\CAN\ESC\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX\SO\RS\US\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOT\DC1\NUL\SUB\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX\DC1\b\DC2\n\
    \\v\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX\DC2\ETX\ETB\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETX\DC2\ETX\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX\DC2\n\
    \\DC2\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX\DC2\NAK\SYN\n\
    \\v\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETX\DC3\ETX\SYN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\ETX\DC3\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETX\DC3\t\DC1\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETX\DC3\DC4\NAK\n\
    \\v\n\
    \\EOT\EOT\STX\STX\STX\DC2\ETX\DC4\ETX\ETB\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ENQ\DC2\ETX\DC4\ETX\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\ETX\DC4\n\
    \\DC2\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\ETX\DC4\NAK\SYN\n\
    \\v\n\
    \\EOT\EOT\STX\STX\ETX\DC2\ETX\NAK\ETX\ETB\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\ENQ\DC2\ETX\NAK\ETX\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\SOH\DC2\ETX\NAK\n\
    \\DC2\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\ETX\DC2\ETX\NAK\NAK\SYN\n\
    \\v\n\
    \\EOT\EOT\STX\STX\EOT\DC2\ETX\SYN\ETX\ESC\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\ENQ\DC2\ETX\SYN\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\SOH\DC2\ETX\SYN\t\SYN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\ETX\DC2\ETX\SYN\EM\SUB\n\
    \\v\n\
    \\EOT\EOT\STX\STX\ENQ\DC2\ETX\ETB\ETX\CAN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\ENQ\DC2\ETX\ETB\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\SOH\DC2\ETX\ETB\t\DC3\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\ETX\DC2\ETX\ETB\SYN\ETB\n\
    \\v\n\
    \\EOT\EOT\STX\STX\ACK\DC2\ETX\CAN\ETX\FS\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\EOT\DC2\ETX\CAN\ETX\v\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\ACK\DC2\ETX\CAN\f\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\SOH\DC2\ETX\CAN\DC1\ETB\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\ETX\DC2\ETX\CAN\SUB\ESC\n\
    \\v\n\
    \\EOT\EOT\STX\STX\a\DC2\ETX\EM\ETX\GS\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\a\ACK\DC2\ETX\EM\ETX\r\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\a\SOH\DC2\ETX\EM\SO\CAN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\a\ETX\DC2\ETX\EM\ESC\FSb\ACKproto3"