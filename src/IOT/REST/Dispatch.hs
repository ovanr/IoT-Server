{-# LANGUAGE OverloadedStrings #-}

module IOT.REST.Dispatch where

import Data.Aeson (Value)
import IOT.REST.Foundation
import IOT.REST.Handlers (getStatusR, postSendCmdR)
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

parseRoute :: Method -> [Text] -> Maybe (Route RESTApp)
parseRoute m ["node", uid] 
   | m == methodGet  = DevStatusR <$> fromPathPiece uid 
   | m == methodPost = DevCmdSendR <$> fromPathPiece uid 
parseRoute _ _ = Nothing

instance YesodDispatch RESTApp where
   yesodDispatch yesodRunnerEnv req sendResponse =
      let maybeRoute = parseRoute (requestMethod req) (pathInfo req)
          handler =
               case maybeRoute of
                  Nothing                -> notFound
                  Just (DevStatusR uid)  -> toTypedContent <$> getStatusR uid
                  Just (DevCmdSendR uid) -> toTypedContent <$> postSendCmdR uid
       in yesodRunner handler yesodRunnerEnv maybeRoute req sendResponse
