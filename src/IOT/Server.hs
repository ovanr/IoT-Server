{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeApplications #-}

module IOT.Server
   ( 
   runApp
   ) where

import Colog.Core.Action ( LogAction(LogAction) )
import Colog.Core.Severity
    ( Severity(Debug, Error, Warning, Info) )
import Colog.Message ( logInfo, logDebug, Msg(..), Message)
import qualified Data.Text as T
import Data.Text.Encoding (decodeUtf8)
import Control.Monad.Logger (fromLogStr, LogLevel(..))
import IOT.Packet.Parse ( pktHandler )
import Control.Lens ( (&), (^.), use, view, (.=), (.~) )
import Control.Monad.Reader (MonadReader(ask))
import Control.Monad.Catch ( finally )
import Control.Concurrent (forkIO, killThread)
import qualified Data.Map as M
import qualified Data.ByteString.Lazy as BL ( readFile )
import Control.Monad.Trans.Cont
import Control.Monad.IO.Class
import Data.IORef ( newIORef )
import Database.InfluxDB
    ( host,
      writeParams,
      WriteParams,
      HasPrecision(precision),
      HasServer(server),
      Precision(Second) )
import Database.MySQL.Base ( connect )
import IOT.Server.Types
    ( App(unApp),
      AppEnv(AppEnv),
      ServerArgs,
      amqpHost,
      amqpPass,
      amqpUser,
      amqpVhost,
      amqpDataQueue,
      mysqlHost,
      mysqlUser,
      mysqlPass,
      mysqlDb,
      restApp,
      infxDb,
      infxHost,
      logAction,
      logPath,
      confPath,
      ServerConf,
      sConf,
      verbosity )
import Data.Aeson ( eitherDecode )
import IOT.Misc
    ( hTryGetLine,
      liftEither,
      richMessageLogFileAction,
      sleep,
      withAmqpChannel,
      withThread,
      withAmqpConnection,
      withAmqpConsumer,
      withMySqlBackend, 
      withFileM,
      withTempPipeM )
import Control.Monad.State.Class ( MonadState(get) )
import System.IO
    ( IOMode(WriteMode),
      hClose,
      hSetBuffering,
      Handle,
      openFile,
      BufferMode(LineBuffering) )
import IOT.Server.Queue ( flushQueues )
import IOT.Server.Alerts ( syncAlertRules )
import qualified Database.MySQL.Base as MySQL
import IOT.REST.Import (RESTApp(..))
import Yesod.Core (warp)
import Database.Persist hiding (Key, get)
import Database.Persist.MySQL hiding (Key, get)
import qualified Colog (Message(..))
import GHC.Stack.Types (CallStack(..))

{- |
   Create the Colog.LogAction using the ServerArgs and an open handle
-}
makeLogFileAction :: MonadIO m => ServerArgs -> Handle -> LogAction m Colog.Message
makeLogFileAction args = richMessageLogFileAction level 
    where
        level = [Error, Warning, Info, Debug] !! min 3 (args ^. verbosity)

makeLogFunc :: LogAction IO Colog.Message -> LogFunc
makeLogFunc (LogAction logger) _ _ level msg = logger message
   where
      toSeverity LevelDebug = Debug 
      toSeverity LevelInfo  = Info
      toSeverity LevelWarn  = Warning 
      toSeverity LevelError = Error
      toSeverity _          = Info

      msgText = decodeUtf8 . fromLogStr $ msg
      message = Msg (toSeverity level) EmptyCallStack msgText

{- |
   Make a WriteParams Influx config from a ServerConf 
-}
makeInfluxConf :: ServerConf -> WriteParams
makeInfluxConf conf = 
    writeParams (conf ^. infxDb) 
        & server . host .~ (conf ^. infxHost) 
        & precision .~ Second

{- |
   Make a MySQL ConnectInfo config from a ServerConf 
-}
makeMysqlConf :: ServerConf -> MySQL.ConnectInfo
makeMysqlConf conf = do
   MySQL.defaultConnectInfo
      { MySQL.connectHost     = view mysqlHost conf
      , MySQL.connectUser     = view mysqlUser conf
      , MySQL.connectPassword = view mysqlPass conf
      , MySQL.connectDatabase = view mysqlDb   conf
      , MySQL.connectOptions  = [ MySQL.Reconnect True ]
      }

{- |
   App runner.
   runApp runs in a ContT () IO () monad
   in order to easily initalize connections/services 
   using continuation-style computations. 
   Internally the App runs as a ReaderT-like transformer monad.

   This function will open the AMQP connection,
   start the simple REST service, and listen for
   any new messages from the broker.

   Commands to the server can be provided using
   the named pipe file 'iot-server.run'.
-}
runApp :: ServerArgs -> IO ()
runApp args =
  evalContT $ do
    raw <- liftIO $ BL.readFile (args ^. confPath)
    (conf :: ServerConf) <- liftEither . eitherDecode $ raw

    logHandle <- ContT $ withFileM (args ^. logPath) WriteMode
    liftIO $ hSetBuffering logHandle LineBuffering

    let logger    = makeLogFileAction args logHandle
        inflxInfo = makeInfluxConf conf
        mysqlInfo = makeMysqlConf conf

    conn <-
      ContT $
         withAmqpConnection
           (conf ^. amqpHost)
           (conf ^. amqpVhost)
           (conf ^. amqpUser)
           (conf ^. amqpPass)

    chan <- ContT $ withAmqpChannel conn
    let logFunc = makeLogFunc (makeLogFileAction args logHandle)
    sqlBackend <- ContT $ withMySqlBackend mysqlInfo logFunc

    env <- liftIO $ 
        AppEnv logger conf inflxInfo sqlBackend chan
            <$> newIORef [] 
            <*> newIORef [] 
            <*> (RESTApp <$> newIORef [] <*> newIORef True) 
            <*> newIORef M.empty

    ContT $ withAmqpConsumer (pktHandler env) chan (conf ^. amqpDataQueue)
    ContT $ withThread $ warp 3000 (env ^. restApp)

    handle <- ContT $ withTempPipeM "iot-server.run"

    let (go :: App IO ()) = do
          sleep 5

          flushQueues
          syncAlertRules

          c <- hTryGetLine handle
          let c = Just "hola"
          logDebug $ "Got input " <> T.pack (show c)
          if c == Just "exit"
            then logInfo "Exiting due to user signal"
            else go

    liftIO $ unApp go env 
