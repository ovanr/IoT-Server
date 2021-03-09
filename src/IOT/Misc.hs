module IOT.Misc where

import Data.IORef
import Control.Monad.Trans.Class (MonadTrans(..))
import Control.Monad.Trans.Reader hiding (reader)
import Control.Monad.Reader.Class

refModify' :: (a -> a) -> IORef a -> IO a 
refModify' f r = r `atomicModifyIORef'` (\a -> (f a, a)) 

liftEither :: (MonadFail m, Monad m) => Either String a -> m a
liftEither (Left err) = fail err
liftEither (Right a) = return a

readerM :: (MonadTrans t, Monad m, MonadReader r (t m)) => (r -> m a) -> t m a
readerM r = reader r >>= lift
