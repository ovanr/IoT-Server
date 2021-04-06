{- This file was auto-generated from sensors/systemdt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Sensors.Systemdt (
        Systemopt(), Systemout()
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
{- | Fields :
      -}
data Systemopt
  = Systemopt'_constructor {_Systemopt'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Systemopt where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message Systemopt where
  messageName _ = Data.Text.pack "sensors.systemdt.Systemopt"
  packedMessageDescriptor _
    = "\n\
      \\tSystemopt"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Systemopt'_unknownFields
        (\ x__ y__ -> x__ {_Systemopt'_unknownFields = y__})
  defMessage
    = Systemopt'_constructor {_Systemopt'_unknownFields = []}
  parseMessage
    = let
        loop :: Systemopt -> Data.ProtoLens.Encoding.Bytes.Parser Systemopt
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
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Systemopt"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData Systemopt where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq (_Systemopt'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Sensors.Systemdt_Fields.voltage' @:: Lens' Systemout Prelude.Float@
         * 'Proto.Sensors.Systemdt_Fields.wifiSignal' @:: Lens' Systemout Prelude.Float@ -}
data Systemout
  = Systemout'_constructor {_Systemout'voltage :: !Prelude.Float,
                            _Systemout'wifiSignal :: !Prelude.Float,
                            _Systemout'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Systemout where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Systemout "voltage" Prelude.Float where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Systemout'voltage (\ x__ y__ -> x__ {_Systemout'voltage = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Systemout "wifiSignal" Prelude.Float where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Systemout'wifiSignal
           (\ x__ y__ -> x__ {_Systemout'wifiSignal = y__}))
        Prelude.id
instance Data.ProtoLens.Message Systemout where
  messageName _ = Data.Text.pack "sensors.systemdt.Systemout"
  packedMessageDescriptor _
    = "\n\
      \\tSystemout\DC2\CAN\n\
      \\avoltage\CAN\SOH \SOH(\STXR\avoltage\DC2\US\n\
      \\vwifi_signal\CAN\STX \SOH(\STXR\n\
      \wifiSignal"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        voltage__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "voltage"
              (Data.ProtoLens.ScalarField Data.ProtoLens.FloatField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Float)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"voltage")) ::
              Data.ProtoLens.FieldDescriptor Systemout
        wifiSignal__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "wifi_signal"
              (Data.ProtoLens.ScalarField Data.ProtoLens.FloatField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Float)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"wifiSignal")) ::
              Data.ProtoLens.FieldDescriptor Systemout
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, voltage__field_descriptor),
           (Data.ProtoLens.Tag 2, wifiSignal__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Systemout'_unknownFields
        (\ x__ y__ -> x__ {_Systemout'_unknownFields = y__})
  defMessage
    = Systemout'_constructor
        {_Systemout'voltage = Data.ProtoLens.fieldDefault,
         _Systemout'wifiSignal = Data.ProtoLens.fieldDefault,
         _Systemout'_unknownFields = []}
  parseMessage
    = let
        loop :: Systemout -> Data.ProtoLens.Encoding.Bytes.Parser Systemout
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
                        13
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToFloat
                                          Data.ProtoLens.Encoding.Bytes.getFixed32)
                                       "voltage"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"voltage") y x)
                        21
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToFloat
                                          Data.ProtoLens.Encoding.Bytes.getFixed32)
                                       "wifi_signal"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"wifiSignal") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Systemout"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"voltage") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 13)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putFixed32
                         Data.ProtoLens.Encoding.Bytes.floatToWord _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"wifiSignal") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 21)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putFixed32
                            Data.ProtoLens.Encoding.Bytes.floatToWord _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Systemout where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Systemout'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Systemout'voltage x__)
                (Control.DeepSeq.deepseq (_Systemout'wifiSignal x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SYNsensors/systemdt.proto\DC2\DLEsensors.systemdt\"\v\n\
    \\tSystemopt\"F\n\
    \\tSystemout\DC2\CAN\n\
    \\avoltage\CAN\SOH \SOH(\STXR\avoltage\DC2\US\n\
    \\vwifi_signal\CAN\STX \SOH(\STXR\n\
    \wifiSignalJ\197\SOH\n\
    \\ACK\DC2\EOT\SOH\NUL\f\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\SOH\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ETX\NUL\EM\n\
    \\NAK\n\
    \\STX\EOT\NUL\DC2\EOT\ENQ\NUL\a\SOH\"\t comment\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\ENQ\b\DC1\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\t\NUL\f\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\t\b\DC1\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\n\
    \\ETX\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX\n\
    \\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\n\
    \\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\n\
    \\DC3\DC4\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX\v\ETX\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETX\v\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX\v\t\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX\v\ETB\CANb\ACKproto3"
