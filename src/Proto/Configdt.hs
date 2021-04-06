{- This file was auto-generated from configdt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Configdt (
        Devconf(), Modconf(), Time()
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
import qualified Proto.Sensors.Cpudt
import qualified Proto.Sensors.Raspcamdt
import qualified Proto.Sensors.Systemdt
{- | Fields :
     
         * 'Proto.Configdt_Fields.mqttHost' @:: Lens' Devconf Data.Text.Text@
         * 'Proto.Configdt_Fields.mqttUser' @:: Lens' Devconf Data.Text.Text@
         * 'Proto.Configdt_Fields.mqttPass' @:: Lens' Devconf Data.Text.Text@
         * 'Proto.Configdt_Fields.burstInterval' @:: Lens' Devconf Data.Int.Int32@
         * 'Proto.Configdt_Fields.burstCount' @:: Lens' Devconf Data.Int.Int32@
         * 'Proto.Configdt_Fields.wakeOn' @:: Lens' Devconf [Time]@
         * 'Proto.Configdt_Fields.vec'wakeOn' @:: Lens' Devconf (Data.Vector.Vector Time)@
         * 'Proto.Configdt_Fields.sensorConf' @:: Lens' Devconf Modconf@
         * 'Proto.Configdt_Fields.maybe'sensorConf' @:: Lens' Devconf (Prelude.Maybe Modconf)@ -}
data Devconf
  = Devconf'_constructor {_Devconf'mqttHost :: !Data.Text.Text,
                          _Devconf'mqttUser :: !Data.Text.Text,
                          _Devconf'mqttPass :: !Data.Text.Text,
                          _Devconf'burstInterval :: !Data.Int.Int32,
                          _Devconf'burstCount :: !Data.Int.Int32,
                          _Devconf'wakeOn :: !(Data.Vector.Vector Time),
                          _Devconf'sensorConf :: !(Prelude.Maybe Modconf),
                          _Devconf'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Devconf where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Devconf "mqttHost" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Devconf'mqttHost (\ x__ y__ -> x__ {_Devconf'mqttHost = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Devconf "mqttUser" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Devconf'mqttUser (\ x__ y__ -> x__ {_Devconf'mqttUser = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Devconf "mqttPass" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Devconf'mqttPass (\ x__ y__ -> x__ {_Devconf'mqttPass = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Devconf "burstInterval" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Devconf'burstInterval
           (\ x__ y__ -> x__ {_Devconf'burstInterval = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Devconf "burstCount" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Devconf'burstCount (\ x__ y__ -> x__ {_Devconf'burstCount = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Devconf "wakeOn" [Time] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Devconf'wakeOn (\ x__ y__ -> x__ {_Devconf'wakeOn = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Devconf "vec'wakeOn" (Data.Vector.Vector Time) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Devconf'wakeOn (\ x__ y__ -> x__ {_Devconf'wakeOn = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Devconf "sensorConf" Modconf where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Devconf'sensorConf (\ x__ y__ -> x__ {_Devconf'sensorConf = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Devconf "maybe'sensorConf" (Prelude.Maybe Modconf) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Devconf'sensorConf (\ x__ y__ -> x__ {_Devconf'sensorConf = y__}))
        Prelude.id
instance Data.ProtoLens.Message Devconf where
  messageName _ = Data.Text.pack "configdt.Devconf"
  packedMessageDescriptor _
    = "\n\
      \\aDevconf\DC2\ESC\n\
      \\tmqtt_host\CAN\SOH \SOH(\tR\bmqttHost\DC2\ESC\n\
      \\tmqtt_user\CAN\ETX \SOH(\tR\bmqttUser\DC2\ESC\n\
      \\tmqtt_pass\CAN\EOT \SOH(\tR\bmqttPass\DC2%\n\
      \\SOburst_interval\CAN\ENQ \SOH(\ENQR\rburstInterval\DC2\US\n\
      \\vburst_count\CAN\ACK \SOH(\ENQR\n\
      \burstCount\DC2'\n\
      \\awake_on\CAN\a \ETX(\v2\SO.configdt.TimeR\ACKwakeOn\DC22\n\
      \\vsensor_conf\CAN\b \SOH(\v2\DC1.configdt.ModconfR\n\
      \sensorConf"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        mqttHost__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "mqtt_host"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"mqttHost")) ::
              Data.ProtoLens.FieldDescriptor Devconf
        mqttUser__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "mqtt_user"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"mqttUser")) ::
              Data.ProtoLens.FieldDescriptor Devconf
        mqttPass__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "mqtt_pass"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"mqttPass")) ::
              Data.ProtoLens.FieldDescriptor Devconf
        burstInterval__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "burst_interval"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"burstInterval")) ::
              Data.ProtoLens.FieldDescriptor Devconf
        burstCount__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "burst_count"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"burstCount")) ::
              Data.ProtoLens.FieldDescriptor Devconf
        wakeOn__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "wake_on"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Time)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"wakeOn")) ::
              Data.ProtoLens.FieldDescriptor Devconf
        sensorConf__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sensor_conf"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Modconf)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'sensorConf")) ::
              Data.ProtoLens.FieldDescriptor Devconf
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, mqttHost__field_descriptor),
           (Data.ProtoLens.Tag 3, mqttUser__field_descriptor),
           (Data.ProtoLens.Tag 4, mqttPass__field_descriptor),
           (Data.ProtoLens.Tag 5, burstInterval__field_descriptor),
           (Data.ProtoLens.Tag 6, burstCount__field_descriptor),
           (Data.ProtoLens.Tag 7, wakeOn__field_descriptor),
           (Data.ProtoLens.Tag 8, sensorConf__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Devconf'_unknownFields
        (\ x__ y__ -> x__ {_Devconf'_unknownFields = y__})
  defMessage
    = Devconf'_constructor
        {_Devconf'mqttHost = Data.ProtoLens.fieldDefault,
         _Devconf'mqttUser = Data.ProtoLens.fieldDefault,
         _Devconf'mqttPass = Data.ProtoLens.fieldDefault,
         _Devconf'burstInterval = Data.ProtoLens.fieldDefault,
         _Devconf'burstCount = Data.ProtoLens.fieldDefault,
         _Devconf'wakeOn = Data.Vector.Generic.empty,
         _Devconf'sensorConf = Prelude.Nothing,
         _Devconf'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Devconf
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Time
             -> Data.ProtoLens.Encoding.Bytes.Parser Devconf
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
                                       "mqtt_host"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"mqttHost") y x)
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
                                       "mqtt_user"
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
                                       "mqtt_pass"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"mqttPass") y x)
                                  mutable'wakeOn
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "burst_interval"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"burstInterval") y x)
                                  mutable'wakeOn
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "burst_count"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"burstCount") y x)
                                  mutable'wakeOn
                        58
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "wake_on"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'wakeOn y)
                                loop x v
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "sensor_conf"
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
          "Devconf"
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
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
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
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData Devconf where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Devconf'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Devconf'mqttHost x__)
                (Control.DeepSeq.deepseq
                   (_Devconf'mqttUser x__)
                   (Control.DeepSeq.deepseq
                      (_Devconf'mqttPass x__)
                      (Control.DeepSeq.deepseq
                         (_Devconf'burstInterval x__)
                         (Control.DeepSeq.deepseq
                            (_Devconf'burstCount x__)
                            (Control.DeepSeq.deepseq
                               (_Devconf'wakeOn x__)
                               (Control.DeepSeq.deepseq (_Devconf'sensorConf x__) ())))))))
{- | Fields :
     
         * 'Proto.Configdt_Fields.raspCam' @:: Lens' Modconf Proto.Sensors.Raspcamdt.Raspcamopt@
         * 'Proto.Configdt_Fields.maybe'raspCam' @:: Lens' Modconf (Prelude.Maybe Proto.Sensors.Raspcamdt.Raspcamopt)@
         * 'Proto.Configdt_Fields.cpu' @:: Lens' Modconf Proto.Sensors.Cpudt.Cpuopt@
         * 'Proto.Configdt_Fields.maybe'cpu' @:: Lens' Modconf (Prelude.Maybe Proto.Sensors.Cpudt.Cpuopt)@
         * 'Proto.Configdt_Fields.system' @:: Lens' Modconf Proto.Sensors.Systemdt.Systemopt@
         * 'Proto.Configdt_Fields.maybe'system' @:: Lens' Modconf (Prelude.Maybe Proto.Sensors.Systemdt.Systemopt)@ -}
data Modconf
  = Modconf'_constructor {_Modconf'raspCam :: !(Prelude.Maybe Proto.Sensors.Raspcamdt.Raspcamopt),
                          _Modconf'cpu :: !(Prelude.Maybe Proto.Sensors.Cpudt.Cpuopt),
                          _Modconf'system :: !(Prelude.Maybe Proto.Sensors.Systemdt.Systemopt),
                          _Modconf'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Modconf where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Modconf "raspCam" Proto.Sensors.Raspcamdt.Raspcamopt where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Modconf'raspCam (\ x__ y__ -> x__ {_Modconf'raspCam = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Modconf "maybe'raspCam" (Prelude.Maybe Proto.Sensors.Raspcamdt.Raspcamopt) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Modconf'raspCam (\ x__ y__ -> x__ {_Modconf'raspCam = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Modconf "cpu" Proto.Sensors.Cpudt.Cpuopt where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Modconf'cpu (\ x__ y__ -> x__ {_Modconf'cpu = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Modconf "maybe'cpu" (Prelude.Maybe Proto.Sensors.Cpudt.Cpuopt) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Modconf'cpu (\ x__ y__ -> x__ {_Modconf'cpu = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Modconf "system" Proto.Sensors.Systemdt.Systemopt where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Modconf'system (\ x__ y__ -> x__ {_Modconf'system = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Modconf "maybe'system" (Prelude.Maybe Proto.Sensors.Systemdt.Systemopt) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Modconf'system (\ x__ y__ -> x__ {_Modconf'system = y__}))
        Prelude.id
instance Data.ProtoLens.Message Modconf where
  messageName _ = Data.Text.pack "configdt.Modconf"
  packedMessageDescriptor _
    = "\n\
      \\aModconf\DC28\n\
      \\brasp_cam\CAN\SOH \SOH(\v2\GS.sensors.raspcamdt.RaspcamoptR\araspCam\DC2'\n\
      \\ETXcpu\CAN\STX \SOH(\v2\NAK.sensors.cpudt.CpuoptR\ETXcpu\DC23\n\
      \\ACKsystem\CAN\ETX \SOH(\v2\ESC.sensors.systemdt.SystemoptR\ACKsystem"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        raspCam__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "rasp_cam"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Sensors.Raspcamdt.Raspcamopt)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'raspCam")) ::
              Data.ProtoLens.FieldDescriptor Modconf
        cpu__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cpu"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Sensors.Cpudt.Cpuopt)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'cpu")) ::
              Data.ProtoLens.FieldDescriptor Modconf
        system__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "system"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Sensors.Systemdt.Systemopt)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'system")) ::
              Data.ProtoLens.FieldDescriptor Modconf
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, raspCam__field_descriptor),
           (Data.ProtoLens.Tag 2, cpu__field_descriptor),
           (Data.ProtoLens.Tag 3, system__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Modconf'_unknownFields
        (\ x__ y__ -> x__ {_Modconf'_unknownFields = y__})
  defMessage
    = Modconf'_constructor
        {_Modconf'raspCam = Prelude.Nothing,
         _Modconf'cpu = Prelude.Nothing, _Modconf'system = Prelude.Nothing,
         _Modconf'_unknownFields = []}
  parseMessage
    = let
        loop :: Modconf -> Data.ProtoLens.Encoding.Bytes.Parser Modconf
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
                                       "rasp_cam"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"raspCam") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "cpu"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"cpu") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "system"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"system") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Modconf"
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
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'system") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Modconf where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Modconf'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Modconf'raspCam x__)
                (Control.DeepSeq.deepseq
                   (_Modconf'cpu x__)
                   (Control.DeepSeq.deepseq (_Modconf'system x__) ())))
{- | Fields :
     
         * 'Proto.Configdt_Fields.hour' @:: Lens' Time Data.Int.Int32@
         * 'Proto.Configdt_Fields.minute' @:: Lens' Time Data.Int.Int32@ -}
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
  messageName _ = Data.Text.pack "configdt.Time"
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
    \\SOconfigdt.proto\DC2\bconfigdt\SUB\ETBsensors/raspcamdt.proto\SUB\DC3sensors/cpudt.proto\SUB\SYNsensors/systemdt.proto\"2\n\
    \\EOTTime\DC2\DC2\n\
    \\EOThour\CAN\SOH \SOH(\ENQR\EOThour\DC2\SYN\n\
    \\ACKminute\CAN\STX \SOH(\ENQR\ACKminute\"\161\SOH\n\
    \\aModconf\DC28\n\
    \\brasp_cam\CAN\SOH \SOH(\v2\GS.sensors.raspcamdt.RaspcamoptR\araspCam\DC2'\n\
    \\ETXcpu\CAN\STX \SOH(\v2\NAK.sensors.cpudt.CpuoptR\ETXcpu\DC23\n\
    \\ACKsystem\CAN\ETX \SOH(\v2\ESC.sensors.systemdt.SystemoptR\ACKsystem\"\133\STX\n\
    \\aDevconf\DC2\ESC\n\
    \\tmqtt_host\CAN\SOH \SOH(\tR\bmqttHost\DC2\ESC\n\
    \\tmqtt_user\CAN\ETX \SOH(\tR\bmqttUser\DC2\ESC\n\
    \\tmqtt_pass\CAN\EOT \SOH(\tR\bmqttPass\DC2%\n\
    \\SOburst_interval\CAN\ENQ \SOH(\ENQR\rburstInterval\DC2\US\n\
    \\vburst_count\CAN\ACK \SOH(\ENQR\n\
    \burstCount\DC2'\n\
    \\awake_on\CAN\a \ETX(\v2\SO.configdt.TimeR\ACKwakeOn\DC22\n\
    \\vsensor_conf\CAN\b \SOH(\v2\DC1.configdt.ModconfR\n\
    \sensorConfJ\167\ACK\n\
    \\ACK\DC2\EOT\NUL\NUL\ESC\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\STX\NUL\DC1\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\EOT\NUL!\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX\ENQ\NUL\GS\n\
    \\t\n\
    \\STX\ETX\STX\DC2\ETX\ACK\NUL \n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\b\NUL\v\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\b\b\f\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\t\ETX\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\t\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\t\t\r\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\t\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\n\
    \\ETX\DC4\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETX\n\
    \\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\n\
    \\t\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\n\
    \\DC2\DC3\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\r\NUL\DC1\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\r\b\SI\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\SO\ETX-\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ACK\DC2\ETX\SO\ETX\US\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\SO (\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\SO+,\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX\SI\ETX \n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ACK\DC2\ETX\SI\ETX\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX\SI\CAN\ESC\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX\SI\RS\US\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX\DLE\ETX)\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ACK\DC2\ETX\DLE\ETX\GS\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX\DLE\RS$\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX\DLE'(\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOT\DC3\NUL\ESC\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX\DC3\b\SI\n\
    \\v\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX\DC4\ETX\CAN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETX\DC4\ETX\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX\DC4\n\
    \\DC3\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX\DC4\SYN\ETB\n\
    \\v\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETX\NAK\ETX\CAN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\ETX\NAK\ETX\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETX\NAK\n\
    \\DC3\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETX\NAK\SYN\ETB\n\
    \\v\n\
    \\EOT\EOT\STX\STX\STX\DC2\ETX\SYN\ETX\CAN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ENQ\DC2\ETX\SYN\ETX\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\ETX\SYN\n\
    \\DC3\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\ETX\SYN\SYN\ETB\n\
    \\v\n\
    \\EOT\EOT\STX\STX\ETX\DC2\ETX\ETB\ETX\FS\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\ENQ\DC2\ETX\ETB\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\SOH\DC2\ETX\ETB\t\ETB\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ETX\ETX\DC2\ETX\ETB\SUB\ESC\n\
    \\v\n\
    \\EOT\EOT\STX\STX\EOT\DC2\ETX\CAN\ETX\EM\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\ENQ\DC2\ETX\CAN\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\SOH\DC2\ETX\CAN\t\DC4\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\EOT\ETX\DC2\ETX\CAN\ETB\CAN\n\
    \\v\n\
    \\EOT\EOT\STX\STX\ENQ\DC2\ETX\EM\ETX\GS\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\EOT\DC2\ETX\EM\ETX\v\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\ACK\DC2\ETX\EM\f\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\SOH\DC2\ETX\EM\DC1\CAN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ENQ\ETX\DC2\ETX\EM\ESC\FS\n\
    \\v\n\
    \\EOT\EOT\STX\STX\ACK\DC2\ETX\SUB\ETX\ESC\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\ACK\DC2\ETX\SUB\ETX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\SOH\DC2\ETX\SUB\v\SYN\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\ACK\ETX\DC2\ETX\SUB\EM\SUBb\ACKproto3"