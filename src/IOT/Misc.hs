{-# LANGUAGE FlexibleContexts #-} 
{-# LANGUAGE OverloadedStrings #-} 
{-# LANGUAGE ScopedTypeVariables #-} 
module IOT.Misc where

import Data.IORef
import qualified Data.Text as T
import qualified Codec.Compression.GZip as GZip
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Base64 as Base64
import Control.Monad.Trans.Maybe
import qualified Data.ByteString as B
import Network.AMQP
import qualified Control.Exception as Exception
import Control.Monad.Trans.Class (MonadTrans(..))
import qualified Data.Text.Encoding as TE
import System.Exit (ExitCode(..))
import Control.Monad.Reader.Class
import Database.MySQL.Base hiding (Packet(..))
import Control.Monad.IO.Class
import Control.Monad.Catch
import System.IO.Unsafe (unsafePerformIO)
import Control.Monad
import Control.Monad.Extra
import Control.Concurrent (threadDelay)
import Colog.Core.Severity
import Colog.Actions
import System.Process (readProcessWithExitCode)
import Colog.Message hiding (Message(..))
import qualified Colog.Message as Colog 
import Colog.Core.Action
import System.Directory
import System.IO
import Data.Aeson (Value(..), FromJSON(..), (.:))
import Data.Aeson.Types (Parser, Object)
import Yesod.Core (warp, YesodDispatch)
import Data.Conduit ((.|), runConduit)
import Conduit (foldC)
import Yesod.Core (MonadHandler, rawRequestBody)

refModify' :: MonadIO m => (a -> a) -> IORef a -> m a 
refModify' f r = liftIO $ r `atomicModifyIORef'` (\a -> (f a, a)) 

liftEither :: (MonadFail m, Monad m) => Either String a -> m a
liftEither (Left err) = fail err
liftEither (Right a) = return a

readerM :: (MonadTrans t, Monad m, MonadReader r (t m)) 
           => (r -> m a) 
           -> t m a
readerM r = reader r >>= lift

-- same as threadDelay but in seconds
-- and lifted to work with MonadIO
sleep :: MonadIO m => Int -> m ()
sleep = liftIO . threadDelay . (* 1000000)

-- retrieve the body of a request as a raw ByteString
-- note that it can only be run once per request body
getRawRequestBody :: MonadHandler m => m B.ByteString
getRawRequestBody = runConduit $ rawRequestBody .| foldC

-- exception-less MySQL statement execution
executeStmt' ::
      MonadIO m => MySQLConn -> StmtID -> [MySQLValue] -> m (Either String OK)
executeStmt' conn stmt vals =
   liftIO $
   (Right <$> executeStmt conn stmt vals) `catch`
   (\(e :: SomeException) -> return . Left . show $ e)

-- generalisation of withFile
withFileM ::
      (MonadMask m, MonadIO m) => FilePath -> IOMode -> (Handle -> m a) -> m a
withFileM fp mode = bracket (liftIO $ openFile fp mode) (liftIO . hClose)

withAmqpConnection ::
      (MonadMask m, MonadIO m)
   => String
   -> T.Text
   -> T.Text
   -> T.Text
   -> (Connection -> m a)
   -> m a
withAmqpConnection host vhost user pass =
   bracket
      (liftIO $ openConnection host vhost user pass)
      (liftIO . closeConnection)

withAmqpChannel ::
      (MonadMask m, MonadIO m) => Connection -> (Channel -> m a) -> m a
withAmqpChannel conn =
   bracket (liftIO $ openChannel conn) (liftIO . closeChannel)

withAmqpConsumer ::
      (MonadMask m, MonadIO m)
   => ((Message, Envelope) -> IO ())
   -> Channel
   -> T.Text
   -> (ConsumerTag -> m a)
   -> m a
withAmqpConsumer cb chan tag =
   bracket
      (liftIO $ consumeMsgs chan tag NoAck cb)
      (liftIO . cancelConsumer chan)

richMessageLogFileAction ::
      MonadIO m => Severity -> Handle -> LogAction m Colog.Message
richMessageLogFileAction level handle =
   cfilter (\m -> msgSeverity m >= level) (cmapM mkRich $ logTextHandle handle)
  where
    mkRich msg = fmtRichMessageDefault $ RichMsg msg defaultFieldMap

mkfifo :: FilePath -> IO Bool
mkfifo fp =
   flip Exception.finally (return False) $ do
      whenM (doesFileExist fp) $ removeFile fp
      (code, _, _) <- readProcessWithExitCode "mkfifo" ["-m", "600", fp] ""
      return $ code == ExitSuccess

withTempPipeM ::
      (MonadFail m, MonadMask m, MonadIO m)
   => FilePath
   -> (Handle -> m a)
   -> m a
withTempPipeM fp cb = do
   unlessM (liftIO $ mkfifo fp) $ fail "Unable to make pipe"
   r <- withFileM fp ReadWriteMode $ const $ withFileM fp ReadMode cb
   liftIO $ removeFile fp
   return r

hTryGetLine :: MonadIO m => Handle -> m (Maybe String)
hTryGetLine h =
   liftIO $
   ifM (hWaitForInput h 10) 
      (Just <$> hGetLine h) 
      (pure Nothing) 
   `Exception.catch` (\(e :: SomeException) -> pure Nothing)

-- exception-less gzip decompression
-- GZip.decompress is pure but can throw exceptions
-- thus this function converts the exception to an Either
gzipDecompress :: BL.ByteString -> Either String BL.ByteString
gzipDecompress b =
   unsafePerformIO $
      pure (Right $ GZip.decompress b) `catch`
      (\(e :: SomeException) -> pure . Left . show $ e)

genSecureString :: MonadIO m => Int -> m (Maybe T.Text)
genSecureString len =
   liftIO . runMaybeT $ do
      str <- T.take len . TE.decodeUtf8 . Base64.encode <$> randomBytes
      guard (T.length str == len)
      pure str
  where
    readBytes :: IO B.ByteString
    readBytes = withFile "/dev/urandom" ReadMode (`B.hGetSome` len)
    randomBytes :: MaybeT IO B.ByteString
    randomBytes =
       MaybeT $
       (Just <$> readBytes) `catch` (\(e :: SomeException) -> pure Nothing)

(.:^) :: (FromJSON a, MonadTrans t) 
         => Object -> T.Text -> t Parser a
(.:^) o k = lift (o .: k)
