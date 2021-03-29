{- This file was auto-generated from sensors/cpuDt.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Sensors.CpuDt (
        CpuOpt(), CpuOut()
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
data CpuOpt
  = CpuOpt'_constructor {_CpuOpt'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show CpuOpt where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message CpuOpt where
  messageName _ = Data.Text.pack "sensors.cpuDt.CpuOpt"
  packedMessageDescriptor _
    = "\n\
      \\ACKCpuOpt"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _CpuOpt'_unknownFields
        (\ x__ y__ -> x__ {_CpuOpt'_unknownFields = y__})
  defMessage = CpuOpt'_constructor {_CpuOpt'_unknownFields = []}
  parseMessage
    = let
        loop :: CpuOpt -> Data.ProtoLens.Encoding.Bytes.Parser CpuOpt
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
          (do loop Data.ProtoLens.defMessage) "CpuOpt"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData CpuOpt where
  rnf
    = \ x__ -> Control.DeepSeq.deepseq (_CpuOpt'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Sensors.CpuDt_Fields.load' @:: Lens' CpuOut Prelude.Float@
         * 'Proto.Sensors.CpuDt_Fields.count' @:: Lens' CpuOut Data.Int.Int32@
         * 'Proto.Sensors.CpuDt_Fields.pkgTemp' @:: Lens' CpuOut Prelude.Float@ -}
data CpuOut
  = CpuOut'_constructor {_CpuOut'load :: !Prelude.Float,
                         _CpuOut'count :: !Data.Int.Int32,
                         _CpuOut'pkgTemp :: !Prelude.Float,
                         _CpuOut'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show CpuOut where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField CpuOut "load" Prelude.Float where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CpuOut'load (\ x__ y__ -> x__ {_CpuOut'load = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField CpuOut "count" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CpuOut'count (\ x__ y__ -> x__ {_CpuOut'count = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField CpuOut "pkgTemp" Prelude.Float where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CpuOut'pkgTemp (\ x__ y__ -> x__ {_CpuOut'pkgTemp = y__}))
        Prelude.id
instance Data.ProtoLens.Message CpuOut where
  messageName _ = Data.Text.pack "sensors.cpuDt.CpuOut"
  packedMessageDescriptor _
    = "\n\
      \\ACKCpuOut\DC2\DC2\n\
      \\EOTload\CAN\SOH \SOH(\STXR\EOTload\DC2\DC4\n\
      \\ENQcount\CAN\STX \SOH(\ENQR\ENQcount\DC2\CAN\n\
      \\apkgTemp\CAN\ETX \SOH(\STXR\apkgTemp"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        load__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "load"
              (Data.ProtoLens.ScalarField Data.ProtoLens.FloatField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Float)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"load")) ::
              Data.ProtoLens.FieldDescriptor CpuOut
        count__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "count"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"count")) ::
              Data.ProtoLens.FieldDescriptor CpuOut
        pkgTemp__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "pkgTemp"
              (Data.ProtoLens.ScalarField Data.ProtoLens.FloatField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Float)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"pkgTemp")) ::
              Data.ProtoLens.FieldDescriptor CpuOut
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, load__field_descriptor),
           (Data.ProtoLens.Tag 2, count__field_descriptor),
           (Data.ProtoLens.Tag 3, pkgTemp__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _CpuOut'_unknownFields
        (\ x__ y__ -> x__ {_CpuOut'_unknownFields = y__})
  defMessage
    = CpuOut'_constructor
        {_CpuOut'load = Data.ProtoLens.fieldDefault,
         _CpuOut'count = Data.ProtoLens.fieldDefault,
         _CpuOut'pkgTemp = Data.ProtoLens.fieldDefault,
         _CpuOut'_unknownFields = []}
  parseMessage
    = let
        loop :: CpuOut -> Data.ProtoLens.Encoding.Bytes.Parser CpuOut
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
                                       "load"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"load") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "count"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"count") y x)
                        29
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToFloat
                                          Data.ProtoLens.Encoding.Bytes.getFixed32)
                                       "pkgTemp"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"pkgTemp") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "CpuOut"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"load") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"count") _x
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
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"pkgTemp") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 29)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putFixed32
                               Data.ProtoLens.Encoding.Bytes.floatToWord _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData CpuOut where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_CpuOut'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_CpuOut'load x__)
                (Control.DeepSeq.deepseq
                   (_CpuOut'count x__)
                   (Control.DeepSeq.deepseq (_CpuOut'pkgTemp x__) ())))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\DC3sensors/cpuDt.proto\DC2\rsensors.cpuDt\"\b\n\
    \\ACKCpuOpt\"L\n\
    \\ACKCpuOut\DC2\DC2\n\
    \\EOTload\CAN\SOH \SOH(\STXR\EOTload\DC2\DC4\n\
    \\ENQcount\CAN\STX \SOH(\ENQR\ENQcount\DC2\CAN\n\
    \\apkgTemp\CAN\ETX \SOH(\STXR\apkgTempJ\252\SOH\n\
    \\ACK\DC2\EOT\SOH\NUL\r\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\SOH\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ETX\NUL\SYN\n\
    \\NAK\n\
    \\STX\EOT\NUL\DC2\EOT\ENQ\NUL\a\SOH\"\t comment\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\ENQ\b\SO\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\t\NUL\r\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\t\b\SO\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\n\
    \\ETX\DC2\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX\n\
    \\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\n\
    \\t\r\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\n\
    \\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX\v\ETX\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETX\v\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX\v\t\SO\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX\v\DC1\DC2\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX\f\ETX\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETX\f\ETX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX\f\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX\f\DC3\DC4b\ACKproto3"