{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
module IOT.REST.Foundation where

import Data.Aeson (Value)
import Yesod.Core
   ( HandlerFor
   , RenderRoute(..)
   , Yesod
   , YesodDispatch(..)
   , yesodRunner
   , parseRoutes
   , redirect
   , notFound
   , toPathPiece
   , fromPathPiece
   , toTypedContent
   , warp
   )
import Network.Wai (pathInfo, Request(..))
import qualified Data.Text as T
import Data.Text (Text)
import Network.HTTP.Types.Method
import qualified IOT.Packet.Cmd as C
import qualified IOT.Packet.Packet as P 
import Control.Lens (makeLenses)
import Data.IORef

newtype RESTApp = RESTApp
   { _sharedCmdQueue :: IORef [(P.UID, C.Cmd)]
   }

makeLenses ''RESTApp

instance Yesod RESTApp

type RESTAppRoute = Route RESTApp

instance RenderRoute RESTApp where
   data Route RESTApp = DevStatusR P.UID | DevCmdSendR P.UID
      deriving (Show, Read, Eq, Ord)

   renderRoute (DevStatusR uid) =  (["node", toPathPiece uid], [])
   renderRoute (DevCmdSendR uid) = (["node", toPathPiece uid], [])
