{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE FlexibleContexts #-}

module IOT.Packet.Parse where

import qualified Data.ByteString.Lazy as BL
import qualified Data.Text as T
import Network.AMQP
import Control.Monad.Reader.Class
import IOT.Server.Types
import IOT.Server.Queue (queueSensorImage, queueSensorData)
import IOT.Packet.Format
import qualified IOT.Packet.Packet as P
import qualified IOT.Packet.Sensor as S 
import IOT.Misc (gzipDecompress)
import Control.Exception
import Data.Time.Clock.POSIX
import Control.Lens
import Data.ProtoLens hiding (Message)
import Data.Aeson
import Control.Monad
import Control.Monad.IO.Class
import Colog hiding (Message)

import qualified Control.Monad.Catch as MC

{- | 
   Try to parse a bytestring as a raw image
   and if it is successful wrap it in a IOT.Packet.Packet
-}
imgParse :: BL.ByteString -> T.Text -> Either String P.Packet
imgParse b pktUid = do
   enc <-
      if | isPng b -> Right S.PNG
         | isJpeg b -> Right S.JPEG
         | otherwise -> Left "unknown format"
   let (out :: S.Output) =
          defMessage &
          S.maybe'output ?~
          S.Output'Cam (defMessage & S.encoding .~ enc & S.bin .~ BL.toStrict b)
   let sensorOut = defMessage & S.outputs .~ [out] :: S.Sensorout
   Right $ defMessage & P.uid .~ pktUid & P.maybe'type' ?~ P.Packet'Out sensorOut

{- |
   Read out an IOT.Packet.Packet from an AMQP Message.
   Handles payload compression, and different encoding formats.
   The message may be encoded as a brotobuf or a JSON packet,
   or can be a raw image (PNG or JPEG).
   It can also be GZip compressed.
-}
parseBody :: Message -> T.Text -> Either String P.Packet
parseBody msg pktUid = do
   --decompress if gzip encoded
   rawBody <-
      if has (_Just . to (T.isPrefixOf "gzip;")) encodingHeader
         then gzipDecompress . msgBody $ msg
         else Right $ msgBody msg

   --detect packet format 
   case encodingHeader >>= T.stripPrefix "gzip;" of
      Just "application/protocol-buffer" -> protobufDecode rawBody
      Just "application/json" -> eitherDecode rawBody
      Just _ -> autoParse rawBody
      Nothing -> autoParse rawBody
  
  where
    encodingHeader = T.replace " " "" . T.toLower <$> msgContentEncoding msg
    protobufDecode = decodeMessage . BL.toStrict
    autoParse pkt =
       eitherDecode pkt `mplus` protobufDecode pkt `mplus` imgParse pkt pktUid

{- |
   Perform an action depending on the packet type.
   If it is a data packet, store the data points to the Influx Queue.
   If it is an image packet, store it in the Image Queue.
-}
parsePacket ::
      (MonadReader (AppEnv m) m, MC.MonadMask m, MonadIO m, MonadFail m)
   => P.UID
   -> P.Packet
   -> m ()
parsePacket uid pkt = do
   let timestamp = posixSecondsToUTCTime $ realToFrac (pkt ^. P.timestamp)
   case pkt ^. P.maybe'type' of
      Just (P.Packet'Out out) -> do
         let dat = out ^.. S.vec'outputs . folded . S.maybe'output . _Just
         forM_ dat $ \case
            S.Output'Cam img -> queueSensorImage uid img timestamp
            r -> queueSensorData uid r timestamp -- use json instance to get fields
      Just (P.Packet'Cmds cmds) ->
         logWarning "Received cmd packet.. Don't know what to do with it"
      _ -> fail "Incorrect packet format"

{- | 
   AMQP On Message Received Callback Function
   Attempt to parse each AMQP message as an IOT.Packet.Packet 
   and handle the packet according to its type.
-}
pktHandler :: AppEnv (App IO) -> (Message, Envelope) -> IO ()
pktHandler env (msg, e) =
   flip unApp env $ flip MC.catch catcher $ do
      logInfo $ "Received a msg with key " <> envRoutingKey e
      either
         (\b -> logError $ "Body parse error: " <> T.pack (show b))
         (parsePacket pktUid)
         (parseBody msg pktUid)
  where
    catcher (e :: SomeException) = logWarning $ T.pack (show e)
    pktUid = last . T.split (== '.') . envRoutingKey $ e
