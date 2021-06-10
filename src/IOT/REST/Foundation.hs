{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
module IOT.REST.Foundation where

import Yesod.Core
   ( RenderRoute(..)
   , Yesod
   , toPathPiece
   )
import qualified IOT.Packet.Cmd as C
import qualified IOT.Packet.Packet as P 
import Control.Lens (makeLenses)
import Data.IORef

data RESTApp = RESTApp
   { 
      -- | The Command Queue - holds the pending commands to be send to the devices 
      _sharedCmdQueue  :: IORef [(P.UID, C.Cmd)],
      _alertRuleUpdate :: IORef Bool
   }

makeLenses ''RESTApp

instance Yesod RESTApp

type RESTAppRoute = Route RESTApp

{- |
   Declare the REST routes and their paths
-}
instance RenderRoute RESTApp where
   data Route RESTApp = DevStatusR P.UID | DevCmdSendR P.UID | DevAlertRuleUpdateR
      deriving (Show, Read, Eq, Ord)

   renderRoute (DevStatusR uid) =  (["node", toPathPiece uid], [])
   renderRoute (DevCmdSendR uid) = (["node", toPathPiece uid], [])
   renderRoute DevAlertRuleUpdateR = (["alert-rule", "update"], [])
