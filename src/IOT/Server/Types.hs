{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ScopedTypeVariables #-}

module IOT.Server.Types where

import Control.Lens (makeLenses, (^.), (.~), (%~), (&))
import Data.Aeson.TH
import qualified Data.ByteString.Lazy as BL
import Data.IORef (IORef)
import qualified Data.Text as T
import Data.Time.Clock (UTCTime)
import Database.InfluxDB
   ( Database(..)
   , Line(..)
   , Measurement(..)
   , WriteParams(..)
   )
import Database.MySQL.Base (MySQLConn(..))
import Network.AMQP (Connection, Envelope(..))
import Control.Monad.State.Class
import Control.Monad.Reader.Class
import Control.Monad.IO.Class
import Control.Monad.Trans.Class (MonadTrans(..))
import Control.Monad.Trans.Reader hiding (reader)
import Colog.Core.Action (LogAction(..))
import Colog.Message (Message(..))
import Colog.Core.Class (HasLog(..))
import Colog.Core.Action
import Control.Monad.Catch

$(deriveJSON defaultOptions ''Measurement)
$(deriveJSON defaultOptions {unwrapUnaryRecords = True} ''Database)

type Tag = T.Text
type Uid = T.Text

data ServerArgs =
  ServerArgs
    { _verbosity :: Int
    , _confPath  :: String
    }
  deriving (Show)

makeLenses ''ServerArgs

data ServerConf =
   ServerConf
      { _infxHost :: T.Text
      , _infxMeasurement :: Measurement
      , _infxDb :: Database
      , _mysqlHost :: String
      , _mysqlUser :: String
      , _mysqlPass :: String
      , _mysqlDb :: String
      , _amqpHost :: String
      , _amqpVhost :: T.Text
      , _amqpUser :: T.Text
      , _amqpPass :: T.Text
      }

makeLenses ''ServerConf
$(deriveJSON defaultOptions {fieldLabelModifier = drop 1} ''ServerConf)

data AppEnv (m :: * -> *) =
   AppEnv
      { _logAction :: LogAction m Message 
      , _sConf :: ServerConf
      , _pendingInfx :: IORef [Line UTCTime]
      , _pendingMysql :: IORef [(Uid, BL.ByteString)]
      }

makeLenses ''AppEnv

data AppState (m :: * -> *) =
   AppState
      { _appEnv :: AppEnv m 
      , _infxConn :: WriteParams
      , _mysqlConn :: MySQLConn
      }

makeLenses ''AppState

newtype App (m :: * -> *) (a :: *) =
   App
      { unApp :: AppState (App m) -> m (a, AppState (App m))
      }

newtype AppCb a =
   AppCb
      { unAppCb :: ReaderT (AppEnv AppCb) IO a
      }
   deriving ( Functor
            , Applicative
            , Monad
            , MonadIO
            , MonadFail
            , MonadReader (AppEnv AppCb)
            )

runAppCb env (AppCb app) = runReaderT app env

instance HasLog (AppEnv m) Message m where
   logActionL = logAction

instance Monad m => Functor (App m) where
   fmap f (App app) =
      App $ \s -> do
         (!a, !s') <- app s
         return (f a, s')

instance Monad m => Applicative (App m) where
   pure a = App $ \s -> return (a, s)
   (App fab) <*> (App fa) =
      App $ \s -> do
         (!ab, !s') <- fab s
         (a, s'') <- fa s'
         return (ab a, s'')

instance Monad m => Monad (App m) where
   return = pure
   (App ma) >>= amb =
      App $ \s -> do
         (!a, !s') <- ma s
         (b, s'') <- unApp (amb a) s'
         return (b, s'')

instance Monad m => MonadState (AppState (App m)) (App m) where
   get = App $ \s -> return (s, s)
   put s = App . const . pure $ ((), s)
   state app = App $ \s -> return (app s)

instance Monad m => MonadReader (AppEnv (App m)) (App m) where
   ask = App $ \s -> return (s ^. appEnv, s)
   local f (App app) = App $ \s -> app (s & appEnv %~ f)

instance MonadTrans App where
   lift m = App $ \s -> (,s) <$> m

instance MonadIO m => MonadIO (App m) where
   liftIO m = App $ \s -> (,s) <$> liftIO m

instance MonadThrow m => MonadThrow (App m) where
   throwM = lift . throwM 
   
instance MonadCatch m => MonadCatch (App m) where
   catch (App app) handler =
      App $ \s -> app s `catch` (\e -> unApp (handler e) s)

-- Identical to StateT version
instance MonadMask m => MonadMask (App m) where
   mask :: ((forall a. App m a -> App m a) -> App m b) -> App m b  
   mask f = App $ \s -> mask $ \ma -> unApp (f $ maAppma ma) s
    where
      maAppma :: (forall a. m a -> m a) -> (forall a. App m a -> App m a) 
      maAppma ma = \(App appma) -> App (ma . appma)

   uninterruptibleMask :: ((forall a. App m a -> App m a) -> App m b) -> App m b  
   uninterruptibleMask f = App $ \s -> uninterruptibleMask $ \ma -> unApp (f $ maAppma ma) s
    where
      maAppma :: (forall a. m a -> m a) -> (forall a. App m a -> App m a) 
      maAppma ma = \(App appma) -> App (ma . appma)

   generalBracket acquire release use = App $ \s0 -> do
         ((b, _s2), (c, s3)) <- generalBracket (unApp acquire s0)
               (\(resource, s1) exitCase -> 
                  case exitCase of
                     ExitCaseSuccess (b, s2) -> unApp (release resource (ExitCaseSuccess b)) s2
                     ExitCaseException e     -> unApp (release resource (ExitCaseException e)) s1
                     ExitCaseAbort           -> unApp (release resource ExitCaseAbort) s1
               )
               (\(resource, s1) -> unApp (use resource) s1)
         return ((b, c), s3)
