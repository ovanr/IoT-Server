{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts #-}

module IOT.Packet.Parse where

import qualified Data.ByteString.Lazy as BL
import qualified Data.Text as T
import Network.AMQP
import Proto.PacketDt
import Proto.PacketDt_Fields
import Proto.SensorDt
import Proto.SensorDt_Fields
import IOT.Server.Types
import IOT.Packet.Format
import IOT.Packet.Types()
import IOT.Misc (gzipDecompress)
import Proto.Sensors.RaspCamDt
import Proto.Sensors.RaspCamDt_Fields
import Control.Exception
import Control.Lens
import Data.ProtoLens hiding (Message)
import Data.Aeson
import Control.Monad
import Control.Monad.IO.Class
import Colog hiding (Message)

import qualified Control.Monad.Catch as MC

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
      Just "" -> sniff rawBody
      Nothing -> sniff rawBody
  
  where
    encodingHeader = T.replace " " "" . T.toLower <$> msgContentEncoding msg
    sniff j =
       eitherDecode j `mplus` decodeMessage (BL.toStrict j) `mplus`
       imgParse j pktUid

imgParse :: BL.ByteString -> T.Text -> Either String Packet
imgParse b pktUid = do
   enc <-
      if | isPng b -> Right PNG
         | isJpeg b -> Right JPEG
         | otherwise -> Left "unknown format"
   let out =
          (defMessage :: Output) &
          maybe'output ?~
          Output'Cam
             ((defMessage :: RaspCamOut) & encoding .~ enc &
              bin .~ BL.toStrict b)
   let sensorOut = defMessage & outputs .~ []
   Right $ defMessage & uid .~ pktUid & maybe'type' ?~ Packet'Out sensorOut

pktHandler :: AppEnv IO -> (Message, Envelope) -> IO ()                    
pktHandler env (msg, e) = runAppCb menv $ flip MC.catch catcher $ do          
  logInfo $ "Received a msg with key " <> envRoutingKey e                  
  either                                                                   
     (\b -> logError $ "Body parse error: " <> T.pack (show b))            
     parsePacket                                                           
     (parseBody msg uid)                                                   
                                                                           
  where                                                                    
   catcher (e :: SomeException) = logWarning $ T.pack (show e)             
   menv = env & logAction %~ hoistLogAction liftIO                               
   uid = last . T.split (== '.') . envRoutingKey $ e                             
   parsePacket :: MonadFail m => Packet -> m ()                                  
   parsePacket pkt =                                                             
      case pkt ^. maybe'type' of                                                 
         Just (Packet'Out out) -> undefined                                      
         Just (Packet'Conf conf) -> undefined                                    
         _ -> fail "Incorrect packet format"                                     
