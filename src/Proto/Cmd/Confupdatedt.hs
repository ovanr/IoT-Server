{- This file was auto-generated from cmd/confupdatedt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Cmd.Confupdatedt (
        Confupdateopt()
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
{- | Fields :
     
         * 'Proto.Cmd.Confupdatedt_Fields.perform' @:: Lens' Confupdateopt Prelude.Bool@
         * 'Proto.Cmd.Confupdatedt_Fields.newConf' @:: Lens' Confupdateopt Proto.Configdt.Devconf@
         * 'Proto.Cmd.Confupdatedt_Fields.maybe'newConf' @:: Lens' Confupdateopt (Prelude.Maybe Proto.Configdt.Devconf)@ -}
data Confupdateopt
  = Confupdateopt'_constructor {_Confupdateopt'perform :: !Prelude.Bool,
                                _Confupdateopt'newConf :: !(Prelude.Maybe Proto.Configdt.Devconf),
                                _Confupdateopt'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Confupdateopt where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Confupdateopt "perform" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Confupdateopt'perform
           (\ x__ y__ -> x__ {_Confupdateopt'perform = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Confupdateopt "newConf" Proto.Configdt.Devconf where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Confupdateopt'newConf
           (\ x__ y__ -> x__ {_Confupdateopt'newConf = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Confupdateopt "maybe'newConf" (Prelude.Maybe Proto.Configdt.Devconf) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Confupdateopt'newConf
           (\ x__ y__ -> x__ {_Confupdateopt'newConf = y__}))
        Prelude.id
instance Data.ProtoLens.Message Confupdateopt where
  messageName _ = Data.Text.pack "cmd.confupdatedt.Confupdateopt"
  packedMessageDescriptor _
    = "\n\
      \\rConfupdateopt\DC2\CAN\n\
      \\aperform\CAN\SOH \SOH(\bR\aperform\DC2,\n\
      \\bnew_conf\CAN\STX \SOH(\v2\DC1.configdt.DevconfR\anewConf"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        perform__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "perform"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"perform")) ::
              Data.ProtoLens.FieldDescriptor Confupdateopt
        newConf__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "new_conf"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Configdt.Devconf)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'newConf")) ::
              Data.ProtoLens.FieldDescriptor Confupdateopt
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, perform__field_descriptor),
           (Data.ProtoLens.Tag 2, newConf__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Confupdateopt'_unknownFields
        (\ x__ y__ -> x__ {_Confupdateopt'_unknownFields = y__})
  defMessage
    = Confupdateopt'_constructor
        {_Confupdateopt'perform = Data.ProtoLens.fieldDefault,
         _Confupdateopt'newConf = Prelude.Nothing,
         _Confupdateopt'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Confupdateopt -> Data.ProtoLens.Encoding.Bytes.Parser Confupdateopt
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
                                       "perform"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"perform") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "new_conf"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"newConf") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Confupdateopt"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"perform") _x
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
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'newConf") _x
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
instance Control.DeepSeq.NFData Confupdateopt where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Confupdateopt'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Confupdateopt'perform x__)
                (Control.DeepSeq.deepseq (_Confupdateopt'newConf x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SYNcmd/confupdatedt.proto\DC2\DLEcmd.confupdatedt\SUB\SOconfigdt.proto\"W\n\
    \\rConfupdateopt\DC2\CAN\n\
    \\aperform\CAN\SOH \SOH(\bR\aperform\DC2,\n\
    \\bnew_conf\CAN\STX \SOH(\v2\DC1.configdt.DevconfR\anewConfJ\173\SOH\n\
    \\ACK\DC2\EOT\SOH\NUL\n\
    \\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\SOH\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ETX\NUL\EM\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\ENQ\NUL\CAN\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\a\NUL\n\
    \\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\a\b\NAK\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\b\ETX\DC4\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\b\ETX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\b\b\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\b\DC2\DC3\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\t\ETX!\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX\t\ETX\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\t\DC4\FS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\t\US b\ACKproto3"