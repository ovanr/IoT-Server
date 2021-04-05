{- This file was auto-generated from packetdt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Packetdt (
        Command(), Packet(), Packet'Type(..), _Packet'Conf, _Packet'Cmd,
        _Packet'Out
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
import qualified Proto.Configdt
import qualified Proto.Sensordt
{- | Fields :
     
         * 'Proto.Packetdt_Fields.cmd' @:: Lens' Command Data.Text.Text@ -}
data Command
  = Command'_constructor {_Command'cmd :: !Data.Text.Text,
                          _Command'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Command where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Command "cmd" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Command'cmd (\ x__ y__ -> x__ {_Command'cmd = y__}))
        Prelude.id
instance Data.ProtoLens.Message Command where
  messageName _ = Data.Text.pack "packetdt.Command"
  packedMessageDescriptor _
    = "\n\
      \\aCommand\DC2\DLE\n\
      \\ETXcmd\CAN\SOH \SOH(\tR\ETXcmd"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        cmd__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cmd"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"cmd")) ::
              Data.ProtoLens.FieldDescriptor Command
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, cmd__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Command'_unknownFields
        (\ x__ y__ -> x__ {_Command'_unknownFields = y__})
  defMessage
    = Command'_constructor
        {_Command'cmd = Data.ProtoLens.fieldDefault,
         _Command'_unknownFields = []}
  parseMessage
    = let
        loop :: Command -> Data.ProtoLens.Encoding.Bytes.Parser Command
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
                                       "cmd"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"cmd") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Command"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"cmd") _x
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
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Command where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Command'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Command'cmd x__) ())
{- | Fields :
     
         * 'Proto.Packetdt_Fields.uid' @:: Lens' Packet Data.Text.Text@
         * 'Proto.Packetdt_Fields.maybe'type'' @:: Lens' Packet (Prelude.Maybe Packet'Type)@
         * 'Proto.Packetdt_Fields.maybe'conf' @:: Lens' Packet (Prelude.Maybe Proto.Configdt.Devconf)@
         * 'Proto.Packetdt_Fields.conf' @:: Lens' Packet Proto.Configdt.Devconf@
         * 'Proto.Packetdt_Fields.maybe'cmd' @:: Lens' Packet (Prelude.Maybe Command)@
         * 'Proto.Packetdt_Fields.cmd' @:: Lens' Packet Command@
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
  = Packet'Conf !Proto.Configdt.Devconf |
    Packet'Cmd !Command |
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
instance Data.ProtoLens.Field.HasField Packet "maybe'conf" (Prelude.Maybe Proto.Configdt.Devconf) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Packet'type' (\ x__ y__ -> x__ {_Packet'type' = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Packet'Conf x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Packet'Conf y__))
instance Data.ProtoLens.Field.HasField Packet "conf" Proto.Configdt.Devconf where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Packet'type' (\ x__ y__ -> x__ {_Packet'type' = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Packet'Conf x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Packet'Conf y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Packet "maybe'cmd" (Prelude.Maybe Command) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Packet'type' (\ x__ y__ -> x__ {_Packet'type' = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Packet'Cmd x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Packet'Cmd y__))
instance Data.ProtoLens.Field.HasField Packet "cmd" Command where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Packet'type' (\ x__ y__ -> x__ {_Packet'type' = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Packet'Cmd x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Packet'Cmd y__))
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
      \\ETXuid\CAN\SOH \SOH(\tR\ETXuid\DC2'\n\
      \\EOTconf\CAN\STX \SOH(\v2\DC1.configdt.DevconfH\NULR\EOTconf\DC2%\n\
      \\ETXcmd\CAN\ETX \SOH(\v2\DC1.packetdt.CommandH\NULR\ETXcmd\DC2'\n\
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
        conf__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "conf"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Configdt.Devconf)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'conf")) ::
              Data.ProtoLens.FieldDescriptor Packet
        cmd__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cmd"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Command)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'cmd")) ::
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
           (Data.ProtoLens.Tag 2, conf__field_descriptor),
           (Data.ProtoLens.Tag 3, cmd__field_descriptor),
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
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "conf"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"conf") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "cmd"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"cmd") y x)
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
                   (Prelude.Just (Packet'Conf v))
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage v)
                   (Prelude.Just (Packet'Cmd v))
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
  rnf (Packet'Conf x__) = Control.DeepSeq.rnf x__
  rnf (Packet'Cmd x__) = Control.DeepSeq.rnf x__
  rnf (Packet'Out x__) = Control.DeepSeq.rnf x__
_Packet'Conf ::
  Data.ProtoLens.Prism.Prism' Packet'Type Proto.Configdt.Devconf
_Packet'Conf
  = Data.ProtoLens.Prism.prism'
      Packet'Conf
      (\ p__
         -> case p__ of
              (Packet'Conf p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Packet'Cmd :: Data.ProtoLens.Prism.Prism' Packet'Type Command
_Packet'Cmd
  = Data.ProtoLens.Prism.prism'
      Packet'Cmd
      (\ p__
         -> case p__ of
              (Packet'Cmd p__val) -> Prelude.Just p__val
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
    \\SOpacketdt.proto\DC2\bpacketdt\SUB\SOsensordt.proto\SUB\SOconfigdt.proto\"\ESC\n\
    \\aCommand\DC2\DLE\n\
    \\ETXcmd\CAN\SOH \SOH(\tR\ETXcmd\"\155\SOH\n\
    \\ACKPacket\DC2\DLE\n\
    \\ETXuid\CAN\SOH \SOH(\tR\ETXuid\DC2'\n\
    \\EOTconf\CAN\STX \SOH(\v2\DC1.configdt.DevconfH\NULR\EOTconf\DC2%\n\
    \\ETXcmd\CAN\ETX \SOH(\v2\DC1.packetdt.CommandH\NULR\ETXcmd\DC2'\n\
    \\ETXout\CAN\EOT \SOH(\v2\DC3.sensordt.SensoroutH\NULR\ETXoutB\ACK\n\
    \\EOTtypeJ\145\ETX\n\
    \\ACK\DC2\EOT\SOH\NUL\DC3\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\SOH\NUL\DC2\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\ETX\NUL\CAN\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX\EOT\NUL\CAN\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ACK\NUL\DC1\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\b\NUL\n\
    \\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\b\b\SI\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\t\ETX\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\t\ETX\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\t\n\
    \\r\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\t\DLE\DC1\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\f\NUL\DC3\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\f\b\SO\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\r\STX\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX\r\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\r\t\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\r\SI\DLE\n\
    \\f\n\
    \\EOT\EOT\SOH\b\NUL\DC2\EOT\SO\STX\DC2\ETX\n\
    \\f\n\
    \\ENQ\EOT\SOH\b\NUL\SOH\DC2\ETX\SO\b\f\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX\SI\ENQ\US\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ACK\DC2\ETX\SI\ENQ\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX\SI\SYN\SUB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX\SI\GS\RS\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX\DLE\ENQ\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ACK\DC2\ETX\DLE\ENQ\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX\DLE\r\DLE\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX\DLE\DC3\DC4\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\ETX\DC2\ETX\DC1\ENQ \n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ACK\DC2\ETX\DC1\ENQ\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\SOH\DC2\ETX\DC1\CAN\ESC\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ETX\DC2\ETX\DC1\RS\USb\ACKproto3"