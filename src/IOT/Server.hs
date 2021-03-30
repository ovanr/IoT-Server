{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeApplications #-}

module IOT.Server
   ( initApp
   , runApp
   ) where

import Colog.Core.Action ( LogAction(LogAction) )
import Colog.Core.Severity
    ( Severity(Debug, Error, Warning, Info) )
import Colog.Message ( logInfo )
import IOT.Packet.Parse ( pktHandler )
import Control.Lens ( (&), (^.), use, view, (%~), (.=), (.~) )
import Control.Monad.Reader ( MonadReader(ask), MonadIO(liftIO) )
import Control.Monad.Catch ( finally )
import qualified Data.ByteString.Lazy as BL ( readFile )
import Data.IORef ( newIORef )
import Data.Version ( showVersion )
import Database.InfluxDB
    ( host,
      writeParams,
      HasPrecision(precision),
      HasServer(server),
      Precision(Second) )
import Database.MySQL.Base ( connect )
import IOT.Server.Types
    ( App(unApp),
      AppState(AppState),
      AppEnv(AppEnv),
      ServerArgs,
      amqpHost,
      amqpPass,
      amqpUser,
      amqpVhost,
      confPath,
      infxDb,
      infxHost,
      logAction,
      logHandle,
      logPath,
      mysqlConfig,
      sConf,
      verbosity )
import Data.Aeson ( eitherDecode )
import IOT.Misc
    ( hTryGetChar,
      liftEither,
      loopUntil,
      richMessageLogFileAction,
      sleep,
      withAmqpChannel,
      withAmqpConnection,
      withAmqpConsumer,
      withTempPipeM )
import Paths_iot_server ( version )
import Control.Monad.State.Class ( MonadState(get) )
import System.IO
    ( IOMode(WriteMode),
      hClose,
      hSetBuffering,
      openFile,
      BufferMode(LineBuffering) )
import IOT.Server.Queue ( flushQueues )

initApp :: ServerArgs -> IO (AppState (App IO))
initApp args = do
   putStrLn $ "IoT-Server v." ++ showVersion version

   let level = [Error, Warning, Info, Debug] !! min 3 (args ^. verbosity)

   conf <- liftEither . eitherDecode =<< BL.readFile (args ^. confPath)
   let wp =
          writeParams (conf ^. infxDb) &
          server . host .~ (conf ^. infxHost) &
          precision .~ Second

   logHandle <- openFile (args ^. logPath) WriteMode
   hSetBuffering logHandle LineBuffering

   env <- AppEnv (richMessageLogFileAction level logHandle) conf
            <$> newIORef []
            <*> newIORef []

   let mysqlInfo = mysqlConfig (env ^. sConf)

   AppState env (Just logHandle) wp <$> connect mysqlInfo

runApp :: App IO ()
runApp = runner `finally` closeLog
  where
    closeLog = do
       handle <- use logHandle
       liftIO $ maybe mempty hClose handle
       logHandle .= Nothing
    runner = do
       host <- view (sConf . amqpHost)
       vhost <- view (sConf . amqpVhost)
       user <- view (sConf . amqpUser)
       pass <- view (sConf . amqpPass)
       withAmqpConnection host vhost user pass $ \conn -> do
          withAmqpChannel conn $ \chan -> do
             env <- ask
             state <- get
             let envio = env & logAction %~ unHoist state
             withAmqpConsumer (pktHandler envio) chan "q_all" $ \_ -> do
                withTempPipeM "iot-server.run" $ \handle ->
                   loopUntil $ do
                      sleep 5
                      flushQueues
                      c <- hTryGetChar handle
                      return $ c == Just 'E'
       logInfo "Exiting normally..."
      where
        unHoist ::
              Functor m
           => AppState (App m)
           -> LogAction (App m) x
           -> LogAction m x
        unHoist s (LogAction xappm) =
           LogAction $ \x -> fst <$> unApp (xappm x) s
