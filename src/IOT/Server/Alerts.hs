{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TupleSections #-}

module IOT.Server.Alerts
   ( checkAndSendAlerts 
   , syncAlertRules
   ) where

import Data.ProtoLens.Field
import IOT.Server.Types
import IOT.Server.Models
import IOT.Misc
import IOT.REST.Import
import Data.Coerce (coerce)
import Data.Time (UTCTime)
import qualified Control.Monad.Catch as MC
import Control.Monad.Extra
import Data.Maybe (fromMaybe, fromJust)
import Control.Lens (view)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Database.Persist.MySQL
import qualified Data.Map as Map
import Control.Exception
import qualified Data.Text as T
import Data.Text (Text)
import Colog
import Database.InfluxDB.Line
import Data.IORef
import Text.Read (readMaybe)
import Control.Applicative (liftA2)
import qualified Database.InfluxDB.Types as Influx (Key(..))

checkForAlerts :: 
      ( MonadIO m 
      , ValidApp '[ '( "alertRules", AlertRules) ] m r
      ) => Line UTCTime -> m [ DevAlert ] 
checkForAlerts (Line _ _ _ Nothing) = return []
checkForAlerts (Line _ tags lineMap (Just datetime)) = do
   rules <- view (field @"alertRules") >>= liftIO . readIORef
   let (devId :: DeviceId) = coerce $ fromJust $ Map.lookup "node_id" tags 

   case Map.lookup devId rules of
      (Just fieldMap) -> do
         return $ Map.foldlWithKey (matchFieldLine fieldMap) [] lineMap
      Nothing -> return []

   where
      matchFieldLine :: Map.Map Text [Entity DevAlertRule] 
                        -> [DevAlert] 
                        -> Influx.Key 
                        -> LineField 
                        -> [DevAlert]
      matchFieldLine fieldMap acc (Influx.Key k) a =
         fromMaybe acc $ do
            value <- toDouble a 
            rules <- Map.lookup k fieldMap
            Just $ foldl (matchRuleValue value) [] rules

      matchRuleValue :: Double -> [DevAlert] -> Entity DevAlertRule -> [DevAlert]
      matchRuleValue v acc rule@(Entity ruleKey (DevAlertRule _ _ thres funct)) =
         case funct of
            "MIN" | v < thres -> DevAlert ruleKey v False datetime : acc
            "MAX" | v > thres -> DevAlert ruleKey v False datetime : acc
            _ -> acc

      toDouble :: LineField -> Maybe Double
      toDouble (FieldString v) = readMaybe $ T.unpack v
      toDouble (FieldFloat v) = Just . fromRational . toRational $ v
      toDouble (FieldBool True) = Just 1.0
      toDouble (FieldBool False) = Just 0.0
      toDouble _ = Nothing

persistAlerts ::
      ( MonadIO m 
      , ValidApp '[ '( "sqlBackend",  SqlBackend) ] m r
      ) => [ DevAlert ] -> m [ DevAlertId ] 
persistAlerts alerts = do
   backend <- view (field @"sqlBackend")
   liftIO $ runSqlConn (insertMany alerts) backend

checkAndSendAlerts line = do
   alerts <- checkForAlerts line
   logInfo $ "Got new alerts: " <> T.pack (show alerts)
   unless (null alerts) $ 
      void $ persistAlerts alerts

fetchAlertRules :: 
     ( MonadIO m
     , MC.MonadMask m
     , ValidApp '[ '( "alertRules", AlertRules),
                   '( "sqlBackend",  SqlBackend) ] m r
     ) => m ([ Entity DevAlertRule ] , [ Entity DevField ])
fetchAlertRules = do
   backend <- view (field @"sqlBackend")
   MC.catch 
      (liftIO $ runSqlConn (liftA2 (,) (selectList [] []) (selectList [] [])) backend)
      catcher
   where
      catcher (e :: SomeException) = do
         logWarning . T.pack . show $ e
         return ([], [])

restructureRules :: [ Entity DevAlertRule ] 
                    -> Map.Map DevFieldId DevField
                    -> Map.Map DeviceId (Map.Map Text [ Entity DevAlertRule])
restructureRules rules fieldMap = 
   foldl (\map rule@(Entity _ (DevAlertRule devId _ _ _)) -> 
            Map.alter (insertToDevMap rule) devId map) 
         Map.empty rules
   where
      insertToDevMap rule@(Entity _ (DevAlertRule _ fieldId _ _)) (Just map) =
         maybe 
            (Just map) 
            (\k -> Just $ Map.alter (insertToFieldMap rule) k map)
            (getShortName fieldId)
      insertToDevMap rule@(Entity _ (DevAlertRule _ fieldId _ _)) Nothing = do
         shortName <- getShortName fieldId
         Just $ Map.singleton shortName [rule]
      insertToFieldMap rule (Just rules) = Just $ rule : rules
      insertToFieldMap rule Nothing = Just [rule]
      getShortName fieldId = 
         devFieldShortName <$> Map.lookup fieldId fieldMap 
         
updateAlertRules :: 
     ( MonadIO m
     , ValidApp '[ '( "alertRules", AlertRules) ] m r
     ) => [ Entity DevAlertRule ] -> [ Entity DevField ] -> m () 
updateAlertRules newAlertRules fields = do
   ref <- view (field @"alertRules")
   let newRuleMap = restructureRules newAlertRules fieldMap
   logInfo $ "Got new alert rules" <> T.pack (show newRuleMap)
   refModify' (const newRuleMap) ref
   return ()
   where
      fieldMap = foldl (\m (Entity k a) -> Map.insert k a m) Map.empty fields

syncAlertRules ::
     ( MonadIO m
     , MC.MonadMask m
     , ValidApp '[ '("alertRules", AlertRules), 
                   '( "sqlBackend",  SqlBackend),
                   '( "restApp", RESTApp) ] m r
     ) => m () 
syncAlertRules = 
   flip MC.catch catcher $ do
   ref <- view (field @"restApp" . alertRuleUpdate)
   whenM (liftIO $ readIORef ref) $ do
      (rules, fields) <- fetchAlertRules 
      updateAlertRules rules fields
      void $ refModify' (const False) ref
   
   where
      catcher (e :: SomeException) = logWarning $ T.pack (show e)
