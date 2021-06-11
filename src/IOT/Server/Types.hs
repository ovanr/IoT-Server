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
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE ConstraintKinds #-}

module IOT.Server.Types where

import qualified Colog (log)
import Colog.Core.Action
import qualified Network.AMQP as Amqp (Channel)
import Colog.Core.Class (HasLog(..))
import Colog.Message (Message(..))
import Control.Lens (view, (%~), (&), (^.), makeLenses)
import Control.Monad.Catch
import Control.Monad.IO.Class
import Data.ProtoLens.Field
import Data.Kind (Type)
import Control.Monad.IO.Unlift
import GHC.Types (Symbol)
import Control.Monad.Reader.Class
import Control.Monad.Trans.Class (MonadTrans(..))
import Control.Monad.Trans.Reader hiding (reader)
import GHC.IO.Handle.Types (Handle)
import Data.Aeson.TH
import qualified Data.ByteString as B
import qualified Data.ByteString.UTF8 as BU 
import Data.IORef (IORef)
import Database.Persist.Sql
import Control.Monad.Logger
import qualified Data.Text as T
import Data.Time.Clock (UTCTime)
import Database.InfluxDB
   ( Database(..)
   , Line(..)
   , Measurement(..)
   , WriteParams(..)
   )
import IOT.REST.Import (RESTApp)
import qualified IOT.Packet.Packet as P (UID)
import IOT.Server.Field
import Fcf (Eval, Uncurry, Pure2, Map, Constraints, If)
import Fcf.Data.List (Length)
import qualified Fcf as Fcf
import IOT.Server.Models
import qualified Data.Map as M (Map)

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
makeHasFieldInstances ''ServerArgs

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
makeHasFieldInstances ''ServerConf
$(deriveJSON defaultOptions {fieldLabelModifier = drop 1} ''ServerConf)


type InfluxQueue = IORef [Line UTCTime]
type MySQLQueue  = IORef [(P.UID, B.ByteString, UTCTime)]
type AlertRules  = IORef (M.Map DeviceId (M.Map T.Text [Entity DevAlertRule])) 

{- |
   The AppEnv data type is the reader environment for the App Type.
   Its 'm' argument corresponds to the monad that log messages should be returned in
-}
data AppEnv (m :: * -> *) =
   AppEnv
      { _logAction    :: LogAction m Message   -- ^ Function to write Log Messages
      , _sConf        :: ServerConf            -- ^ App config
      , _infxConn     :: WriteParams           -- ^ Influx connection info
      , _sqlBackend   :: SqlBackend            -- ^ Sql Backend to communicate with MySQL
      , _amqpChannel  :: Amqp.Channel          -- ^ Active channel to communicate with RabbitMQ
      , _pendingInfx  :: InfluxQueue           -- ^ Influx Data Point Queue
      , _pendingMysql :: MySQLQueue            -- ^ MySQL Image Queue
      , _restApp      :: RESTApp               -- ^ Yesod Foundation Data Type
      , _alertRules   :: AlertRules            -- ^ Device Alert rules for triggering alerts
      }

makeLenses ''AppEnv
makeHasFieldInstances ''AppEnv

{- |
   The App data type acts like a ReaderT
-}
newtype App (m :: * -> *) (a :: *) =
   App
      { unApp :: AppEnv (App m) -> m a 
      }

type MakeHasField (fs :: [(Symbol, Type)]) (m :: Type) =
   Eval (Map (Uncurry (Pure2 (HasField m))) fs)

type MakeMonadReaderConstraint (rf :: [a]) r m =
   If (Eval (Eval (Length rf) Fcf.> 0))
      '[ MonadReader r m ]
      '[]

type ValidApp (rf :: [(Symbol, Type)]) (m :: Type -> Type) (r :: Type) =
   Eval (
      Constraints ( 
         MonadFail m
         ':
         HasLog r Message m 
         ': 
         Eval (
            MakeHasField rf r
            Fcf.++
            MakeMonadReaderConstraint rf r m
         )
      )
   )

instance HasLog (AppEnv m) Message m where
   logActionL = logAction

instance Monad m => Functor (App m) where
   fmap f (App app) =
      App $ \r -> do
         !a <- app r
         return $ f a

instance Monad m => Applicative (App m) where
   pure a = App $ \_ -> return a
   (App fab) <*> (App fa) =
      App $ \r -> do
         !ab <- fab r
         a <- fa r
         return (ab a)

instance Monad m => Monad (App m) where
   return = pure
   (App ma) >>= amb =
      App $ \r -> do
         !a <- ma r
         unApp (amb a) r

instance MonadFail m => MonadFail (App m) where
   fail = lift . fail

instance Monad m => MonadReader (AppEnv (App m)) (App m) where
   ask = App $ \r -> return r
   local f (App app) = App $ \r -> app (f r)

instance MonadTrans App where
   lift m = App $ const m

instance MonadIO m => MonadIO (App m) where
   liftIO m = App $ \_ -> liftIO m

instance MonadThrow m => MonadThrow (App m) where
   throwM = lift . throwM 
   
instance MonadCatch m => MonadCatch (App m) where
   catch (App app) handler =
      App $ \r -> app r `catch` (\e -> unApp (handler e) r)

{- |
   This implementation is identical to the ReaderT version,
   we only adjust the Value Constructors to work with the App Type
-}
instance MonadMask m => MonadMask (App m) where
  mask a = App $ \e -> mask $ \u -> unApp (a $ q u) e
    where q :: (m a -> m a) -> App m a -> App m a
          q u (App b) = App (u . b)

  uninterruptibleMask a =
    App $ \e -> uninterruptibleMask $ \u -> unApp (a $ q u) e
      where q :: (m a -> m a) -> App m a -> App m a
            q u (App b) = App (u . b)

  generalBracket acquire release use = App $ \r ->
    generalBracket
      (unApp acquire r)
      (\resource exitCase -> unApp (release resource exitCase) r)
      (\resource -> unApp (use resource) r)
