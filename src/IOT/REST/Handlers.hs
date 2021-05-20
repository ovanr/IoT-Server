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
   , getsYesod
   )
import Yesod.Core.Json (requireCheckJsonBody, returnJson)
import Data.Text (Text)
import Control.Lens ((^.))
import Data.Maybe

{- |
   Not yet implemented.
-}
getStatusR :: P.UID -> HandlerFor RESTApp ()
getStatusR = undefined

{- |
   Read Command packet as JSON from the HTTP body
   and add the command to the Queue.
-}
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
