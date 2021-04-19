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
import Colog.Message ( logInfo, logDebug )
import qualified Data.Text as T
import IOT.Packet.Parse ( pktHandler )
import Control.Lens ( (&), (^.), use, view, (.=), (.~) )
import Control.Monad.Reader (MonadReader(ask))
import Control.Monad.Catch ( finally )
import Control.Concurrent (forkIO, killThread)
import qualified Data.ByteString.Lazy as BL ( readFile )
import Control.Monad.Cont
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
      amqpDataQueue,
      confPath,
      restApp,
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
    ( hTryGetLine,
      liftEither,
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
import IOT.REST.Import (RESTApp(..))
import Yesod.Core (warp)

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
            <*> (RESTApp <$> newIORef [])

   let mysqlInfo = mysqlConfig (env ^. sConf)

   AppState env (Just logHandle) wp <$> connect mysqlInfo

-- convert from AppEnv (App m) to AppEnv m
unHoistedAppEnv :: Monad m => App m (AppEnv m)
unHoistedAppEnv = do
      env <- ask
      state <- get
      LogAction lg <- view logAction
      let newLogAction = LogAction $ \m -> fst <$> unApp (lg m) state
      return $ env & logAction .~ newLogAction

runApp :: App IO ()
runApp = runner `finally` closeLog
  where
    closeLog = do
       handle <- use logHandle
       liftIO $ maybe mempty hClose handle
       logHandle .= Nothing
    
    runner = flip runContT pure $ do
       host      <- view (sConf . amqpHost)
       vhost     <- view (sConf . amqpVhost)
       user      <- view (sConf . amqpUser)
       pass      <- view (sConf . amqpPass)
       dataQueue <- view (sConf . amqpDataQueue)
       
       conn   <- ContT $ withAmqpConnection host vhost user pass 
       chan   <- ContT $ withAmqpChannel conn
       
       envio  <- lift unHoistedAppEnv
       ContT $ withAmqpConsumer (pktHandler envio) chan dataQueue 
       
       restApp <- view restApp 
       serverThread <- liftIO $ forkIO $ warp 3000 restApp 

       handle <- ContT $ withTempPipeM "iot-server.run"
       
       let go = \exit -> do
            sleep 5
            lift (flushQueues chan)
            c <- hTryGetLine handle
            lift (logDebug $ "Got input " <> T.pack (show c))
            if c == Just "exit"
               then exit "Received exit signal"
               else go exit 
       
       exitMsg <- callCC go
       liftIO $ killThread serverThread
       lift (logInfo $ "Exiting: " <> exitMsg)
