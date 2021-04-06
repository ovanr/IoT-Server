{- This file was auto-generated from cmddt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Cmddt (
        Cmd(), Cmd'Cmd(..), _Cmd'Reboot, _Cmd'ConfUpdate, Cmdin()
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
import qualified Proto.Cmd.Confupdatedt
import qualified Proto.Cmd.Rebootdt
{- | Fields :
     
         * 'Proto.Cmddt_Fields.maybe'cmd' @:: Lens' Cmd (Prelude.Maybe Cmd'Cmd)@
         * 'Proto.Cmddt_Fields.maybe'reboot' @:: Lens' Cmd (Prelude.Maybe Proto.Cmd.Rebootdt.Rebootopt)@
         * 'Proto.Cmddt_Fields.reboot' @:: Lens' Cmd Proto.Cmd.Rebootdt.Rebootopt@
         * 'Proto.Cmddt_Fields.maybe'confUpdate' @:: Lens' Cmd (Prelude.Maybe Proto.Cmd.Confupdatedt.Confupdateopt)@
         * 'Proto.Cmddt_Fields.confUpdate' @:: Lens' Cmd Proto.Cmd.Confupdatedt.Confupdateopt@ -}
data Cmd
  = Cmd'_constructor {_Cmd'cmd :: !(Prelude.Maybe Cmd'Cmd),
                      _Cmd'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Cmd where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Cmd'Cmd
  = Cmd'Reboot !Proto.Cmd.Rebootdt.Rebootopt |
    Cmd'ConfUpdate !Proto.Cmd.Confupdatedt.Confupdateopt
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Cmd "maybe'cmd" (Prelude.Maybe Cmd'Cmd) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Cmd'cmd (\ x__ y__ -> x__ {_Cmd'cmd = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Cmd "maybe'reboot" (Prelude.Maybe Proto.Cmd.Rebootdt.Rebootopt) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Cmd'cmd (\ x__ y__ -> x__ {_Cmd'cmd = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Cmd'Reboot x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Cmd'Reboot y__))
instance Data.ProtoLens.Field.HasField Cmd "reboot" Proto.Cmd.Rebootdt.Rebootopt where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Cmd'cmd (\ x__ y__ -> x__ {_Cmd'cmd = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Cmd'Reboot x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Cmd'Reboot y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Cmd "maybe'confUpdate" (Prelude.Maybe Proto.Cmd.Confupdatedt.Confupdateopt) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Cmd'cmd (\ x__ y__ -> x__ {_Cmd'cmd = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Cmd'ConfUpdate x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Cmd'ConfUpdate y__))
instance Data.ProtoLens.Field.HasField Cmd "confUpdate" Proto.Cmd.Confupdatedt.Confupdateopt where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Cmd'cmd (\ x__ y__ -> x__ {_Cmd'cmd = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Cmd'ConfUpdate x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Cmd'ConfUpdate y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Cmd where
  messageName _ = Data.Text.pack "cmddt.Cmd"
  packedMessageDescriptor _
    = "\n\
      \\ETXCmd\DC21\n\
      \\ACKreboot\CAN\SOH \SOH(\v2\ETB.cmd.rebootdt.RebootoptH\NULR\ACKreboot\DC2B\n\
      \\vconf_update\CAN\STX \SOH(\v2\US.cmd.confupdatedt.ConfupdateoptH\NULR\n\
      \confUpdateB\ENQ\n\
      \\ETXcmd"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        reboot__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "reboot"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Cmd.Rebootdt.Rebootopt)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'reboot")) ::
              Data.ProtoLens.FieldDescriptor Cmd
        confUpdate__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "conf_update"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Cmd.Confupdatedt.Confupdateopt)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'confUpdate")) ::
              Data.ProtoLens.FieldDescriptor Cmd
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, reboot__field_descriptor),
           (Data.ProtoLens.Tag 2, confUpdate__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Cmd'_unknownFields (\ x__ y__ -> x__ {_Cmd'_unknownFields = y__})
  defMessage
    = Cmd'_constructor
        {_Cmd'cmd = Prelude.Nothing, _Cmd'_unknownFields = []}
  parseMessage
    = let
        loop :: Cmd -> Data.ProtoLens.Encoding.Bytes.Parser Cmd
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
                                       "reboot"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"reboot") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "conf_update"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"confUpdate") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Cmd"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'cmd") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just (Cmd'Reboot v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Cmd'ConfUpdate v))
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
instance Control.DeepSeq.NFData Cmd where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Cmd'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Cmd'cmd x__) ())
instance Control.DeepSeq.NFData Cmd'Cmd where
  rnf (Cmd'Reboot x__) = Control.DeepSeq.rnf x__
  rnf (Cmd'ConfUpdate x__) = Control.DeepSeq.rnf x__
_Cmd'Reboot ::
  Data.ProtoLens.Prism.Prism' Cmd'Cmd Proto.Cmd.Rebootdt.Rebootopt
_Cmd'Reboot
  = Data.ProtoLens.Prism.prism'
      Cmd'Reboot
      (\ p__
         -> case p__ of
              (Cmd'Reboot p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Cmd'ConfUpdate ::
  Data.ProtoLens.Prism.Prism' Cmd'Cmd Proto.Cmd.Confupdatedt.Confupdateopt
_Cmd'ConfUpdate
  = Data.ProtoLens.Prism.prism'
      Cmd'ConfUpdate
      (\ p__
         -> case p__ of
              (Cmd'ConfUpdate p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Cmddt_Fields.cmds' @:: Lens' Cmdin [Cmd]@
         * 'Proto.Cmddt_Fields.vec'cmds' @:: Lens' Cmdin (Data.Vector.Vector Cmd)@ -}
data Cmdin
  = Cmdin'_constructor {_Cmdin'cmds :: !(Data.Vector.Vector Cmd),
                        _Cmdin'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Cmdin where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Cmdin "cmds" [Cmd] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Cmdin'cmds (\ x__ y__ -> x__ {_Cmdin'cmds = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Cmdin "vec'cmds" (Data.Vector.Vector Cmd) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Cmdin'cmds (\ x__ y__ -> x__ {_Cmdin'cmds = y__}))
        Prelude.id
instance Data.ProtoLens.Message Cmdin where
  messageName _ = Data.Text.pack "cmddt.Cmdin"
  packedMessageDescriptor _
    = "\n\
      \\ENQCmdin\DC2\RS\n\
      \\EOTcmds\CAN\SOH \ETX(\v2\n\
      \.cmddt.CmdR\EOTcmds"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        cmds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cmds"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Cmd)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"cmds")) ::
              Data.ProtoLens.FieldDescriptor Cmdin
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, cmds__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Cmdin'_unknownFields
        (\ x__ y__ -> x__ {_Cmdin'_unknownFields = y__})
  defMessage
    = Cmdin'_constructor
        {_Cmdin'cmds = Data.Vector.Generic.empty,
         _Cmdin'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Cmdin
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Cmd
             -> Data.ProtoLens.Encoding.Bytes.Parser Cmdin
        loop x mutable'cmds
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'cmds <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'cmds)
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
                              (Data.ProtoLens.Field.field @"vec'cmds") frozen'cmds x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "cmds"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'cmds y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'cmds
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'cmds <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'cmds)
          "Cmdin"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'cmds") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Cmdin where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Cmdin'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Cmdin'cmds x__) ())
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\vcmddt.proto\DC2\ENQcmddt\SUB\DC2cmd/rebootdt.proto\SUB\SYNcmd/confupdatedt.proto\"\131\SOH\n\
    \\ETXCmd\DC21\n\
    \\ACKreboot\CAN\SOH \SOH(\v2\ETB.cmd.rebootdt.RebootoptH\NULR\ACKreboot\DC2B\n\
    \\vconf_update\CAN\STX \SOH(\v2\US.cmd.confupdatedt.ConfupdateoptH\NULR\n\
    \confUpdateB\ENQ\n\
    \\ETXcmd\"'\n\
    \\ENQCmdin\DC2\RS\n\
    \\EOTcmds\CAN\SOH \ETX(\v2\n\
    \.cmddt.CmdR\EOTcmdsJ\177\STX\n\
    \\ACK\DC2\EOT\SOH\NUL\DC1\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\SOH\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ETX\NUL\SO\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\ENQ\NUL\FS\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX\ACK\NUL \n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\b\NUL\r\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\b\b\v\n\
    \\f\n\
    \\EOT\EOT\NUL\b\NUL\DC2\EOT\t\ETX\f\EOT\n\
    \\f\n\
    \\ENQ\EOT\NUL\b\NUL\SOH\DC2\ETX\t\t\f\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\n\
    \\ACK(\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETX\n\
    \\ACK\FS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\n\
    \\GS#\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\n\
    \&'\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\v\ACK5\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX\v\ACK$\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\v%0\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\v34\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\SI\NUL\DC1\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\SI\b\r\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\DLE\ETX\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\EOT\DC2\ETX\DLE\ETX\v\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ACK\DC2\ETX\DLE\f\SI\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\DLE\DLE\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\DLE\ETB\CANb\ACKproto3"