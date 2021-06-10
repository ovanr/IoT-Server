{-# LANGUAGE OverloadedStrings #-}

module IOT.REST.Dispatch where

import IOT.REST.Foundation
import IOT.REST.Handlers (getStatusR, postSendCmdR, postUpdateDevAlertRules)
import Yesod.Core
   ( YesodDispatch(..)
   , yesodRunner
   , notFound
   , fromPathPiece
   , toTypedContent
   )
import Network.Wai (pathInfo, Request(..))
import Data.Text (Text)
import Network.HTTP.Types.Method

{- |
   Parse a url path to a Typed Route
-}
parseRoute :: Method -> [Text] -> Maybe (Route RESTApp)
parseRoute m ["node", uid] 
   | m == methodGet  = DevStatusR <$> fromPathPiece uid 
   | m == methodPost = DevCmdSendR <$> fromPathPiece uid 
parseRoute methodPost ["alert-rule", "update"] = Just DevAlertRuleUpdateR
parseRoute _ _ = Nothing

{- |
   Declare the link between url path to handler
-}
instance YesodDispatch RESTApp where
   yesodDispatch yesodRunnerEnv req sendResponse =
      let maybeRoute = parseRoute (requestMethod req) (pathInfo req)
          handler =
               case maybeRoute of
                  Nothing                  -> notFound
                  Just (DevStatusR uid)    -> toTypedContent <$> getStatusR uid
                  Just (DevCmdSendR uid)   -> toTypedContent <$> postSendCmdR uid
                  Just DevAlertRuleUpdateR -> toTypedContent <$> postUpdateDevAlertRules
       in yesodRunner handler yesodRunnerEnv maybeRoute req sendResponse
