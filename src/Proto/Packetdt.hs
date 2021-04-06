{- This file was auto-generated from packetdt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Packetdt (
        Packet(), Packet'Type(..), _Packet'Cmds, _Packet'Out
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
import qualified Proto.Cmddt
import qualified Proto.Sensordt
{- | Fields :
     
         * 'Proto.Packetdt_Fields.uid' @:: Lens' Packet Data.Text.Text@
         * 'Proto.Packetdt_Fields.maybe'type'' @:: Lens' Packet (Prelude.Maybe Packet'Type)@
         * 'Proto.Packetdt_Fields.maybe'cmds' @:: Lens' Packet (Prelude.Maybe Proto.Cmddt.Cmdin)@
         * 'Proto.Packetdt_Fields.cmds' @:: Lens' Packet Proto.Cmddt.Cmdin@
         * 'Proto.Packetdt_Fields.maybe'out' @:: Lens' Packet (Prelude.Maybe Proto.Sensordt.Sensorout)@
         * 'Proto.Packetdt_Fields.out' @:: Lens' Packet Proto.Sensordt.Sensorout@ -}
data Packet
  = Packet'_constructor {_Packet'uid :: !Data.Text.Text,
                         _Packet'type' :: !(Prelude.Maybe Packet'Type),
                         _Packet'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Packet where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Packet'Type
  = Packet'Cmds !Proto.Cmddt.Cmdin |
    Packet'Out !Proto.Sensordt.Sensorout
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Packet "uid" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Packet'uid (\ x__ y__ -> x__ {_Packet'uid = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Packet "maybe'type'" (Prelude.Maybe Packet'Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Packet'type' (\ x__ y__ -> x__ {_Packet'type' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Packet "maybe'cmds" (Prelude.Maybe Proto.Cmddt.Cmdin) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Packet'type' (\ x__ y__ -> x__ {_Packet'type' = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Packet'Cmds x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Packet'Cmds y__))
instance Data.ProtoLens.Field.HasField Packet "cmds" Proto.Cmddt.Cmdin where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Packet'type' (\ x__ y__ -> x__ {_Packet'type' = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Packet'Cmds x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Packet'Cmds y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Packet "maybe'out" (Prelude.Maybe Proto.Sensordt.Sensorout) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Packet'type' (\ x__ y__ -> x__ {_Packet'type' = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Packet'Out x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Packet'Out y__))
instance Data.ProtoLens.Field.HasField Packet "out" Proto.Sensordt.Sensorout where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Packet'type' (\ x__ y__ -> x__ {_Packet'type' = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Packet'Out x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Packet'Out y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Packet where
  messageName _ = Data.Text.pack "packetdt.Packet"
  packedMessageDescriptor _
    = "\n\
      \\ACKPacket\DC2\DLE\n\
      \\ETXuid\CAN\SOH \SOH(\tR\ETXuid\DC2\"\n\
      \\EOTcmds\CAN\ETX \SOH(\v2\f.cmddt.CmdinH\NULR\EOTcmds\DC2'\n\
      \\ETXout\CAN\EOT \SOH(\v2\DC3.sensordt.SensoroutH\NULR\ETXoutB\ACK\n\
      \\EOTtype"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        uid__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uid"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"uid")) ::
              Data.ProtoLens.FieldDescriptor Packet
        cmds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cmds"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Cmddt.Cmdin)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'cmds")) ::
              Data.ProtoLens.FieldDescriptor Packet
        out__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "out"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Sensordt.Sensorout)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'out")) ::
              Data.ProtoLens.FieldDescriptor Packet
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, uid__field_descriptor),
           (Data.ProtoLens.Tag 3, cmds__field_descriptor),
           (Data.ProtoLens.Tag 4, out__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Packet'_unknownFields
        (\ x__ y__ -> x__ {_Packet'_unknownFields = y__})
  defMessage
    = Packet'_constructor
        {_Packet'uid = Data.ProtoLens.fieldDefault,
         _Packet'type' = Prelude.Nothing, _Packet'_unknownFields = []}
  parseMessage
    = let
        loop :: Packet -> Data.ProtoLens.Encoding.Bytes.Parser Packet
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
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "uid"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"uid") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "cmds"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"cmds") y x)
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "out"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"out") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Packet"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"uid") _x
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
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'type'") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just (Packet'Cmds v))
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage v)
                   (Prelude.Just (Packet'Out v))
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Packet where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Packet'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Packet'uid x__) (Control.DeepSeq.deepseq (_Packet'type' x__) ()))
instance Control.DeepSeq.NFData Packet'Type where
  rnf (Packet'Cmds x__) = Control.DeepSeq.rnf x__
  rnf (Packet'Out x__) = Control.DeepSeq.rnf x__
_Packet'Cmds ::
  Data.ProtoLens.Prism.Prism' Packet'Type Proto.Cmddt.Cmdin
_Packet'Cmds
  = Data.ProtoLens.Prism.prism'
      Packet'Cmds
      (\ p__
         -> case p__ of
              (Packet'Cmds p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Packet'Out ::
  Data.ProtoLens.Prism.Prism' Packet'Type Proto.Sensordt.Sensorout
_Packet'Out
  = Data.ProtoLens.Prism.prism'
      Packet'Out
      (\ p__
         -> case p__ of
              (Packet'Out p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SOpacketdt.proto\DC2\bpacketdt\SUB\vcmddt.proto\SUB\SOsensordt.proto\"o\n\
    \\ACKPacket\DC2\DLE\n\
    \\ETXuid\CAN\SOH \SOH(\tR\ETXuid\DC2\"\n\
    \\EOTcmds\CAN\ETX \SOH(\v2\f.cmddt.CmdinH\NULR\EOTcmds\DC2'\n\
    \\ETXout\CAN\EOT \SOH(\v2\DC3.sensordt.SensoroutH\NULR\ETXoutB\ACK\n\
    \\EOTtypeJ\139\STX\n\
    \\ACK\DC2\EOT\SOH\NUL\SO\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\SOH\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ETX\NUL\DC1\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\ENQ\NUL\NAK\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX\ACK\NUL\CAN\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\b\NUL\SO\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\b\b\SO\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\t\STX\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\t\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\t\t\f\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\t\SI\DLE\n\
    \\f\n\
    \\EOT\EOT\NUL\b\NUL\DC2\EOT\n\
    \\STX\r\ETX\n\
    \\f\n\
    \\ENQ\EOT\NUL\b\NUL\SOH\DC2\ETX\n\
    \\b\f\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\v\ENQ\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX\v\ENQ\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\v\DC1\NAK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\v\CAN\EM\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX\f\ENQ \n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ACK\DC2\ETX\f\ENQ\ETB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX\f\CAN\ESC\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX\f\RS\USb\ACKproto3"