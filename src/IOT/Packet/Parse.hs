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
import IOT.Packet.Types
import Proto.Packetdt
import Proto.Packetdt_Fields
import Proto.Sensordt
import Proto.Sensordt_Fields
import Proto.Sensors.Raspcamdt
import Proto.Sensors.Raspcamdt_Fields
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
imgParse :: BL.ByteString -> T.Text -> Either String Packet
imgParse b pktUid = do
   enc <-
      if | isPng b -> Right PNG
         | isJpeg b -> Right JPEG
         | otherwise -> Left "unknown format"
   let (out :: Output) =
          defMessage &
          maybe'output ?~
          Output'Cam (defMessage & encoding .~ enc & bin .~ BL.toStrict b)
   let sensorOut = defMessage & outputs .~ [out] :: Sensorout
   Right $ defMessage & uid .~ pktUid & maybe'type' ?~ Packet'Out sensorOut

parseBody :: Message -> T.Text -> Either String Packet
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
   => Uid
   -> Packet
   -> m ()
parsePacket uid pkt =
   case pkt ^. maybe'type' of
      Just (Packet'Out out) -> do
         let dat = out ^.. vec'outputs . folded . maybe'output . _Just
         forM_ dat $ \case
            Output'Cam img -> queueSensorImage uid img
            r -> queueSensorData uid r -- use json instance to get fields
      Just (Packet'Cmds cmds) ->
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
