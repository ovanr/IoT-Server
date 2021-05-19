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
{-# LANGUAGE DataKinds #-}

module IOT.Server.Types where

import Colog.Core.Action
import Colog.Core.Class (HasLog(..))
import Colog.Message (Message(..))
import Control.Lens (view, (%~), (&), (^.), makeLenses)
import Control.Monad.Catch
import Control.Monad.IO.Class
import Control.Monad.Reader.Class
import Control.Monad.State.Class
import Control.Monad.Trans.Class (MonadTrans(..))
import Control.Monad.Trans.Reader hiding (reader)
import GHC.IO.Handle.Types (Handle)
import Data.Aeson.TH
import qualified Data.ByteString as B
import qualified Data.ByteString.UTF8 as BU 
import Data.IORef (IORef)
import qualified Data.Text as T
import Data.Time.Clock (UTCTime)
import Database.InfluxDB
   ( Database(..)
   , Line(..)
   , Measurement(..)
   , WriteParams(..)
   )
import Database.MySQL.Base
import IOT.REST.Import (RESTApp)
import qualified IOT.Packet.Packet as P (UID)
import IOT.Server.Field

$(deriveJSON defaultOptions ''Measurement)
$(deriveJSON defaultOptions {unwrapUnaryRecords = True} ''Database)

data ServerArgs =
  ServerArgs
    { _verbosity :: Int    -- ^ Verbosity in log file logging
    , _logPath   :: String -- ^ File to write the logs to
    , _confPath  :: String -- ^ Location of config file
    }
  deriving (Show)

makeLenses ''ServerArgs
makeHasFieldFieldInstances ''ServerArgs

data ServerConf =
   ServerConf
      { _infxHost        :: T.Text      -- ^ hostname of InfluxDB
      , _infxMeasurement :: Measurement -- ^ measurement used in InfluxDB 
      , _infxDb          :: Database    -- ^ database used in InfluxDB
      , _mysqlHost       :: String      -- ^ hostname of MySQL DB
      , _mysqlUser       :: String      -- ^ username for MySQL DB
      , _mysqlPass       :: String      -- ^ password for MySQL DB
      , _mysqlDb         :: String      -- ^ database name for MySQL DB
      , _amqpHost        :: String      -- ^ hostname of AMQP broker
      , _amqpVhost       :: T.Text      -- ^ virtual host for AMQP broker
      , _amqpUser        :: T.Text      -- ^ username for AMQP broker
      , _amqpPass        :: T.Text      -- ^ password for AMQP broker
      , _amqpExchange    :: T.Text      -- ^ name of AMQP exchange to write to
      , _amqpDataQueue   :: T.Text      -- ^ name of AMQP queue to subscribe to
      }

makeLenses ''ServerConf
makeHasFieldFieldInstances ''ServerConf
$(deriveJSON defaultOptions {fieldLabelModifier = drop 1} ''ServerConf)

{- |
   Make a MySQL ConnectInfo config from a ServerConf 
-}
mysqlConfig :: ServerConf -> ConnectInfo
mysqlConfig conf = do
   defaultConnectInfo
      { ciHost     = conf ^. mysqlHost
      , ciUser     = BU.fromString $ view mysqlUser conf
      , ciPassword = BU.fromString $ view mysqlPass conf
      , ciDatabase = BU.fromString $ view mysqlDb conf
      }

type InfluxQueue = IORef [Line UTCTime]
type MySQLQueue  = IORef [(P.UID, B.ByteString)]

{- |
   The AppEnv data type is the reader environment for the App Type.
   Its 'm' argument corresponds to the monad that log messages should be returned in
-}
data AppEnv (m :: * -> *) =
   AppEnv
      { _logAction    :: LogAction m Message           -- ^ Method to write to dump Log Messages
      , _sConf        :: ServerConf                    -- ^ App config
      , _pendingInfx  :: InfluxQueue                   -- ^ Influx Data Point Queue
      , _pendingMysql :: MySQLQueue                    -- ^ MySQL Image Queue
      , _restApp      :: RESTApp                       -- ^ Yesod Foundation Data Type
      }

makeLenses ''AppEnv
makeHasFieldFieldInstances ''AppEnv

data AppState (m :: * -> *) =
   AppState
      { _appEnv    :: AppEnv m     -- ^ the AppEnv specialised to m Monad
      , _logHandle :: Maybe Handle -- ^ an open handle to the Log file
      , _infxConn  :: WriteParams  -- ^ the active Influx Connection
      , _mysqlConn :: MySQLConn    -- ^ the active MySQL Connection
      }

makeLenses ''AppState
makeHasFieldFieldInstances ''AppState

{- |
   The App data type is an unfolded Reader and State Monad Transformer
-}
newtype App (m :: * -> *) (a :: *) =
   App
      { unApp :: AppState (App m) -> m (a, AppState (App m)) -- ^ 
      }

{- |
   The AppCb Type Corresponds to the Reader Transformer 
   used in an AMQP Message Callback.
   Instead of directly running in the IO Monad, 
   we run the Message parsing and handling in a ReaderT environment.
-}
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
            , MonadThrow
            , MonadCatch
            , MonadMask
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

instance MonadFail m => MonadFail (App m) where
   fail = lift . fail

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

{- |
   This implementation is identical to the StateT version,
   we only adjust the Value Constructors to work with the App Type
-}
instance MonadMask m => MonadMask (App m) where
   mask :: ((forall a. App m a -> App m a) -> App m b) -> App m b
   mask f = App $ \s -> mask $ \ma -> unApp (f $ maAppma ma) s
     where
       maAppma :: (forall a. m a -> m a) -> (forall a. App m a -> App m a)
       maAppma ma = \(App appma) -> App (ma . appma)
   
   uninterruptibleMask :: ((forall a. App m a -> App m a) -> App m b) -> App m b
   uninterruptibleMask f =
      App $ \s -> uninterruptibleMask $ \ma -> unApp (f $ maAppma ma) s
     where
       maAppma :: (forall a. m a -> m a) -> (forall a. App m a -> App m a)
       maAppma ma = \(App appma) -> App (ma . appma)
   
   generalBracket acquire release use =
      App $ \s0 -> do
         ((b, _s2), (c, s3)) <-
            generalBracket
               (unApp acquire s0)
               (\(resource, s1) exitCase ->
                   case exitCase of
                      ExitCaseSuccess (b, s2) ->
                         unApp (release resource (ExitCaseSuccess b)) s2
                      ExitCaseException e ->
                         unApp (release resource (ExitCaseException e)) s1
                      ExitCaseAbort -> unApp (release resource ExitCaseAbort) s1)
               (\(resource, s1) -> unApp (use resource) s1)
         return ((b, c), s3)
