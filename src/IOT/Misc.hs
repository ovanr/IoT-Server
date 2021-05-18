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
import Data.Aeson (FromJSON(..), (.:))
import Data.Aeson.Types (Parser, Object)
import Data.Conduit ((.|), runConduit)
import Conduit (foldC)
import Yesod.Core (MonadHandler, rawRequestBody)

{- |
   Atomically modify an IORef by applying a function
   to its contents. This function returns the previous
   contents of the IORef before the modification.
-}
refModify' :: MonadIO m => (a -> a) -> IORef a -> m a 
refModify' f r = liftIO $ r `atomicModifyIORef'` (\a -> (f a, a)) 

{- |
    Transform an Either Data Type to a Data Type
    supporting Monad and MonadFail classes
    The error is simply thrown using MonadFail.fail
-}
liftEither :: (MonadFail m, Monad m) => Either String a -> m a
liftEither (Left err) = fail err
liftEither (Right a) = return a

{- |
    Lift a reader function that works on
    a base monad, to a MonadTrans stack that
    uses the same base monad.
-}
readerM :: (MonadTrans t, Monad m, MonadReader r (t m)) 
           => (r -> m a) 
           -> t m a
readerM r = reader r >>= lift

{- |
   Same as Control.Concurrent.threadDelay
   but works with seconds and is lifted
   over MonadIO. 
-}
sleep :: MonadIO m => Int -> m ()
sleep = liftIO . threadDelay . (* 1000000)

{- |
   Retrieve the body of a HTTP Request as a raw ByteString
   Note that this will read all the data from the socket thus
   it can only be run once per request.
-}
getRawRequestBody :: MonadHandler m => m B.ByteString
getRawRequestBody = runConduit $ rawRequestBody .| foldC

{- |
    MySQL exception-less executeStmt function.
    Same as MySQL.executeStmt but returns a Left error
    instead of throwing an exception 
-}
executeStmt' ::
      MonadIO m => MySQLConn -> StmtID -> [MySQLValue] -> m (Either String OK)
executeStmt' conn stmt vals =
   liftIO $
   (Right <$> executeStmt conn stmt vals) `catch`
   (\(e :: SomeException) -> return . Left . show $ e)

{- |
   Generalisation of System.IO.withFile to work
   with MonadIO and MonadMask Monads.
-}
withFileM ::
      (MonadMask m, MonadIO m) => FilePath -> IOMode -> (Handle -> m a) -> m a
withFileM fp mode = bracket (liftIO $ openFile fp mode) (liftIO . hClose)

{- |
   Bracket version of Network.AMQP.openConnection
   Passes the newly created AMQP connection to the
   callback and automatically closes the connection
   upon error or finish.
-}
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

{- |
   Bracket version of Network.AMQP.openChannel
   Passes the newly created AMQP channel to the
   callback and automatically closes the channel
   upon error or finish.
-}
withAmqpChannel ::
      (MonadMask m, MonadIO m) => Connection -> (Channel -> m a) -> m a
withAmqpChannel conn =
   bracket (liftIO $ openChannel conn) (liftIO . closeChannel)

{- |
   Bracket version of Network.AMQP.consumeMsgs
   Passes the newly created AMQP consumer to the
   callback and automatically cancels the consumer
   upon error or finish.
-}
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

{- |
   Colog LogAction that pretty writes a Colog.Message  
   as a Rich Message while also filters messages based
   on their Severity.
-}
richMessageLogFileAction ::
      MonadIO m => Severity -> Handle -> LogAction m Colog.Message
richMessageLogFileAction level handle =
   cfilter (\m -> msgSeverity m >= level) (cmapM mkRich $ logTextHandle handle)
  where
    mkRich msg = fmtRichMessageDefault $ RichMsg msg defaultFieldMap

{- |
   Create a named fifo file.
   Return True if creation was successful 
-}
mkfifo :: FilePath -> IO Bool
mkfifo fp =
   flip Exception.finally (return False) $ do
      whenM (doesFileExist fp) $ removeFile fp
      (code, _, _) <- readProcessWithExitCode "mkfifo" ["-m", "600", fp] ""
      return $ code == ExitSuccess

{- |
   Creates a temporary named pipe file 
   and passes the handle to the callback.
   The temp file is automatically deleted
   upon error or finish.
-}
withTempPipeM ::
      (MonadFail m, MonadMask m, MonadIO m)
   => FilePath
   -> (Handle -> m a)
   -> m a
withTempPipeM fp cb = do
   unlessM (liftIO $ mkfifo fp) $ fail "Unable to make pipe"

   -- at least one dummy Writer must be present at the named pipe
   r <- withFileM fp WriteMode $ const $ withFileM fp ReadMode cb

   liftIO $ removeFile fp
   return r

{- |
   Attempt to read one whole line from the Handle
-}
hTryGetLine :: MonadIO m => Handle -> m (Maybe String)
hTryGetLine h =
   liftIO $
   ifM (hWaitForInput h 10) 
      (Just <$> hGetLine h) 
      (pure Nothing) 
   `Exception.catch` (\(e :: SomeException) -> pure Nothing)

{- |
   Exception-less GZip decompression
   GZip.decompress is pure but can throw exceptions which
   can only be caught at the IO Monad.
   To make it fully pure, this function converts the 
   exception to an Either using unsafePerformIO.
-}
gzipDecompress :: BL.ByteString -> Either String BL.ByteString
gzipDecompress b =
   unsafePerformIO $
      pure (Right $ GZip.decompress b) `catch`
      (\(e :: SomeException) -> pure . Left . show $ e)

{- |
    Generate cryptographically secure strings.
    Note that this function depends on \/dev\/urandom.
    In case of failure, a Nothing is returned and no
    exceptions are thrown.
-}
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

{- |
   A lifted version of Data.Aeson.(.:)
   to work on MonadTrans stacks.
-}
(.:^) :: (FromJSON a, MonadTrans t) 
         => Object -> T.Text -> t Parser a
(.:^) o k = lift (o .: k)
