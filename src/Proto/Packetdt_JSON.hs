-- Code generated by protoc-gen-jsonpb_haskell 0.1.1, DO NOT EDIT.
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-orphans -Wno-unused-imports -Wno-missing-export-lists #-}
module Proto.Packetdt_JSON where

import           Prelude(($), (.), (<$>), pure, show, Maybe(..))

import           Data.ProtoLens.Runtime.Lens.Family2 ((^.), (.~), (&))
import           Data.Monoid (mconcat)
import           Control.Monad (msum)
import           Data.ProtoLens (defMessage)
import qualified Data.Aeson as A
import qualified Data.Aeson.Encoding as E
import           Data.ProtoLens.JSONPB as JSONPB
import qualified Data.Text as T

import           Proto.Cmddt_JSON ()
import           Proto.Sensordt_JSON ()
import           Proto.Packetdt as P
import           Proto.Packetdt_Fields as P

instance FromJSONPB Packet'Type where
  parseJSONPB = A.withObject "Packet'Type" $ \obj -> mconcat
    [
      Packet'Cmds <$> parseField obj "cmds"
    , Packet'Out <$> parseField obj "out"
    ]

instance ToJSONPB Packet'Type where
  toJSONPB (Packet'Cmds x) = object [ "cmds" .= Just x ]
  toJSONPB (Packet'Out x) = object [ "out" .= Just x ]
  toEncodingPB (Packet'Cmds x) = pairs [ "cmds" .= Just x ]
  toEncodingPB (Packet'Out x) = pairs [ "out" .= Just x ]

instance FromJSON Packet'Type where
  parseJSON = parseJSONPB

instance ToJSON Packet'Type where
  toJSON = toAesonValue
  toEncoding = toAesonEncoding

instance FromJSONPB Packet where
  parseJSONPB = withObject "Packet" $ \obj -> do
    uid' <- obj .: "uid"
    timestamp' <- obj .: "timestamp"
    type'' <- obj A..:? "type'"
    pure $ defMessage
      & P.uid .~ uid'
      & P.timestamp .~ timestamp'
      & P.maybe'type' .~ type''

instance ToJSONPB Packet where
  toJSONPB x = object
    [ "uid" .= (x^.uid)
    , "timestamp" .= (x^.timestamp)
    , "type'" .= (x^.maybe'type')
    ]
  toEncodingPB x = pairs
    [ "uid" .= (x^.uid)
    , "timestamp" .= (x^.timestamp)
    , "type'" .= (x^.maybe'type')
    ]

instance FromJSON Packet where
  parseJSON = parseJSONPB

instance ToJSON Packet where
  toJSON = toAesonValue
  toEncoding = toAesonEncoding
