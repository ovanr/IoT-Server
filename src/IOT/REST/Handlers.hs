{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}

module IOT.REST.Handlers where

import IOT.REST.Foundation
import IOT.Misc (refModify')
import IOT.Packet.Cmd 
import qualified IOT.Packet.Packet as P (UID) 
import Data.Aeson (Value, (.=), object)
import Yesod.Core
   ( HandlerFor
   , invalidArgs
   , notFound
   , getsYesod
   )
import Yesod.Core.Json (requireCheckJsonBody, returnJson)
import Data.ProtoLens
import Data.Text (Text)
import Control.Lens ((^.))
import Data.Maybe

getStatusR :: P.UID -> HandlerFor RESTApp ()
getStatusR = undefined

postSendCmdR :: P.UID -> HandlerFor RESTApp Value 
postSendCmdR uid = do
   (c :: Cmd) <- requireCheckJsonBody 
   queue <- getsYesod _sharedCmdQueue
    
   if isJust (c ^. maybe'cmd)
      then do
         let response = object [ "status" .= ("success" :: Text) ] 
         refModify' ((uid,c):) queue 
         returnJson response
      else invalidArgs [ "No command given" ] 
