{- This file was auto-generated from sensordt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Sensordt (
        Output(), Output'Output(..), _Output'Cpu, _Output'Cam, Sensorout()
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
{- | Fields :
     
         * 'Proto.Sensordt_Fields.maybe'output' @:: Lens' Output (Prelude.Maybe Output'Output)@
         * 'Proto.Sensordt_Fields.maybe'cpu' @:: Lens' Output (Prelude.Maybe Proto.Sensors.Cpudt.Cpuout)@
         * 'Proto.Sensordt_Fields.cpu' @:: Lens' Output Proto.Sensors.Cpudt.Cpuout@
         * 'Proto.Sensordt_Fields.maybe'cam' @:: Lens' Output (Prelude.Maybe Proto.Sensors.Raspcamdt.Raspcamout)@
         * 'Proto.Sensordt_Fields.cam' @:: Lens' Output Proto.Sensors.Raspcamdt.Raspcamout@ -}
data Output
  = Output'_constructor {_Output'output :: !(Prelude.Maybe Output'Output),
                         _Output'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Output where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Output'Output
  = Output'Cpu !Proto.Sensors.Cpudt.Cpuout |
    Output'Cam !Proto.Sensors.Raspcamdt.Raspcamout
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Output "maybe'output" (Prelude.Maybe Output'Output) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Output'output (\ x__ y__ -> x__ {_Output'output = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Output "maybe'cpu" (Prelude.Maybe Proto.Sensors.Cpudt.Cpuout) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Output'output (\ x__ y__ -> x__ {_Output'output = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Output'Cpu x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Output'Cpu y__))
instance Data.ProtoLens.Field.HasField Output "cpu" Proto.Sensors.Cpudt.Cpuout where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Output'output (\ x__ y__ -> x__ {_Output'output = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Output'Cpu x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Output'Cpu y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Output "maybe'cam" (Prelude.Maybe Proto.Sensors.Raspcamdt.Raspcamout) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Output'output (\ x__ y__ -> x__ {_Output'output = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Output'Cam x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Output'Cam y__))
instance Data.ProtoLens.Field.HasField Output "cam" Proto.Sensors.Raspcamdt.Raspcamout where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Output'output (\ x__ y__ -> x__ {_Output'output = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Output'Cam x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Output'Cam y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Output where
  messageName _ = Data.Text.pack "sensordt.Output"
  packedMessageDescriptor _
    = "\n\
      \\ACKOutput\DC2)\n\
      \\ETXcpu\CAN\SOH \SOH(\v2\NAK.sensors.cpudt.CpuoutH\NULR\ETXcpu\DC21\n\
      \\ETXcam\CAN\STX \SOH(\v2\GS.sensors.raspcamdt.RaspcamoutH\NULR\ETXcamB\b\n\
      \\ACKoutput"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        cpu__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cpu"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Sensors.Cpudt.Cpuout)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'cpu")) ::
              Data.ProtoLens.FieldDescriptor Output
        cam__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cam"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Sensors.Raspcamdt.Raspcamout)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'cam")) ::
              Data.ProtoLens.FieldDescriptor Output
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, cpu__field_descriptor),
           (Data.ProtoLens.Tag 2, cam__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Output'_unknownFields
        (\ x__ y__ -> x__ {_Output'_unknownFields = y__})
  defMessage
    = Output'_constructor
        {_Output'output = Prelude.Nothing, _Output'_unknownFields = []}
  parseMessage
    = let
        loop :: Output -> Data.ProtoLens.Encoding.Bytes.Parser Output
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
                                       "cpu"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"cpu") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "cam"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"cam") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Output"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'output") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just (Output'Cpu v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Output'Cam v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Output where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Output'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Output'output x__) ())
instance Control.DeepSeq.NFData Output'Output where
  rnf (Output'Cpu x__) = Control.DeepSeq.rnf x__
  rnf (Output'Cam x__) = Control.DeepSeq.rnf x__
_Output'Cpu ::
  Data.ProtoLens.Prism.Prism' Output'Output Proto.Sensors.Cpudt.Cpuout
_Output'Cpu
  = Data.ProtoLens.Prism.prism'
      Output'Cpu
      (\ p__
         -> case p__ of
              (Output'Cpu p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Output'Cam ::
  Data.ProtoLens.Prism.Prism' Output'Output Proto.Sensors.Raspcamdt.Raspcamout
_Output'Cam
  = Data.ProtoLens.Prism.prism'
      Output'Cam
      (\ p__
         -> case p__ of
              (Output'Cam p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Sensordt_Fields.outputs' @:: Lens' Sensorout [Output]@
         * 'Proto.Sensordt_Fields.vec'outputs' @:: Lens' Sensorout (Data.Vector.Vector Output)@ -}
data Sensorout
  = Sensorout'_constructor {_Sensorout'outputs :: !(Data.Vector.Vector Output),
                            _Sensorout'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Sensorout where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Sensorout "outputs" [Output] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Sensorout'outputs (\ x__ y__ -> x__ {_Sensorout'outputs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Sensorout "vec'outputs" (Data.Vector.Vector Output) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Sensorout'outputs (\ x__ y__ -> x__ {_Sensorout'outputs = y__}))
        Prelude.id
instance Data.ProtoLens.Message Sensorout where
  messageName _ = Data.Text.pack "sensordt.Sensorout"
  packedMessageDescriptor _
    = "\n\
      \\tSensorout\DC2*\n\
      \\aoutputs\CAN\STX \ETX(\v2\DLE.sensordt.OutputR\aoutputs"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        outputs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "outputs"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Output)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"outputs")) ::
              Data.ProtoLens.FieldDescriptor Sensorout
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 2, outputs__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Sensorout'_unknownFields
        (\ x__ y__ -> x__ {_Sensorout'_unknownFields = y__})
  defMessage
    = Sensorout'_constructor
        {_Sensorout'outputs = Data.Vector.Generic.empty,
         _Sensorout'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Sensorout
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Output
             -> Data.ProtoLens.Encoding.Bytes.Parser Sensorout
        loop x mutable'outputs
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'outputs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'outputs)
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
                              (Data.ProtoLens.Field.field @"vec'outputs") frozen'outputs x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "outputs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'outputs y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'outputs
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'outputs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'outputs)
          "Sensorout"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'outputs") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Sensorout where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Sensorout'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Sensorout'outputs x__) ())
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SOsensordt.proto\DC2\bsensordt\SUB\ETBsensors/raspcamdt.proto\SUB\DC3sensors/cpudt.proto\"p\n\
    \\ACKOutput\DC2)\n\
    \\ETXcpu\CAN\SOH \SOH(\v2\NAK.sensors.cpudt.CpuoutH\NULR\ETXcpu\DC21\n\
    \\ETXcam\CAN\STX \SOH(\v2\GS.sensors.raspcamdt.RaspcamoutH\NULR\ETXcamB\b\n\
    \\ACKoutput\"7\n\
    \\tSensorout\DC2*\n\
    \\aoutputs\CAN\STX \ETX(\v2\DLE.sensordt.OutputR\aoutputsJ\177\STX\n\
    \\ACK\DC2\EOT\SOH\NUL\DC1\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\SOH\NUL\DC2\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\ETX\NUL!\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX\EOT\NUL\GS\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ACK\NUL\DC1\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\b\NUL\r\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\b\b\SO\n\
    \\f\n\
    \\EOT\EOT\NUL\b\NUL\DC2\EOT\t\ETX\f\EOT\n\
    \\f\n\
    \\ENQ\EOT\NUL\b\NUL\SOH\DC2\ETX\t\t\SI\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\n\
    \\ACK#\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETX\n\
    \\ACK\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\n\
    \\ESC\RS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\n\
    \!\"\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\v\ACK+\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX\v\ACK\"\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\v#&\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\v)*\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\SI\NUL\DC1\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\SI\b\DC1\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\DLE\ETX\US\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\EOT\DC2\ETX\DLE\ETX\v\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ACK\DC2\ETX\DLE\f\DC2\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\DLE\DC3\SUB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\DLE\GS\RSb\ACKproto3"