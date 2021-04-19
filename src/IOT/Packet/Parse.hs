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
import Control.Lens
import Data.ProtoLens hiding (Message)
import Data.Aeson
import Control.Monad
import Control.Monad.IO.Class
import Colog hiding (Message)

import qualified Control.Monad.Catch as MC

{- | attempt to parse message body as a raw Raspberry Cam Image -}
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

parseBody :: Message -> T.Text -> Either String P.Packet
parseBody msg pktUid = do
   
   --decompress if gzip encoded
   rawBody <-
      if has (_Just . to (T.isPrefixOf "gzip;")) encodingHeader
         then gzipDecompress . msgBody $ msg
         else Right $ msgBody msg

   --detect packet format 
   case encodingHeader >>= T.stripPrefix "gzip;" of
      Just "application/protocol-buffer" -> decodeMessage (BL.toStrict rawBody)
      Just "application/json" -> eitherDecode rawBody
      Just "" -> autoParse rawBody
      Nothing -> autoParse rawBody
  
  where
    encodingHeader = T.replace " " "" . T.toLower <$> msgContentEncoding msg
    autoParse j =
       eitherDecode j `mplus` decodeMessage (BL.toStrict j) `mplus`
       imgParse j pktUid

parsePacket ::
      (MonadReader (AppEnv m) m, MonadIO m, MonadFail m)
   => P.UID
   -> P.Packet
   -> m ()
parsePacket uid pkt =
   case pkt ^. P.maybe'type' of
      Just (P.Packet'Out out) -> do
         let dat = out ^.. S.vec'outputs . folded . S.maybe'output . _Just
         forM_ dat $ \case
            S.Output'Cam img -> queueSensorImage uid img
            r -> queueSensorData uid r -- use json instance to get fields
      Just (P.Packet'Cmds cmds) ->
         logWarning "Received cmd packet.. Don't know what to do with it"
      _ -> fail "Incorrect packet format"

{- | mqtt callback function on message received -}
pktHandler :: AppEnv IO -> (Message, Envelope) -> IO ()
pktHandler env (msg, e) =
   runAppCb menv $ flip MC.catch catcher $ do
      logInfo $ "Received a msg with key " <> envRoutingKey e
      either
         (\b -> logError $ "Body parse error: " <> T.pack (show b))
         (parsePacket pktUid)
         (parseBody msg pktUid)
  where
    catcher (e :: SomeException) = logWarning $ T.pack (show e)
    menv = env & logAction %~ hoistLogAction liftIO
    pktUid = last . T.split (== '.') . envRoutingKey $ e
