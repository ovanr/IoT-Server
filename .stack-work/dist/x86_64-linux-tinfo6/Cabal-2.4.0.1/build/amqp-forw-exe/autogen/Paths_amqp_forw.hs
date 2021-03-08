{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_amqp_forw (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/ovr/haskell/custom-iot/amqp-forw/.stack-work/install/x86_64-linux-tinfo6/e5ddcf3bc94c2efb7bf3c4d731ffef7cc0afdc180df2d3ceb02785afc97f685a/8.6.5/bin"
libdir     = "/home/ovr/haskell/custom-iot/amqp-forw/.stack-work/install/x86_64-linux-tinfo6/e5ddcf3bc94c2efb7bf3c4d731ffef7cc0afdc180df2d3ceb02785afc97f685a/8.6.5/lib/x86_64-linux-ghc-8.6.5/amqp-forw-0.1.0.0-8YBw0MIhpsQGK9rTctmSV-amqp-forw-exe"
dynlibdir  = "/home/ovr/haskell/custom-iot/amqp-forw/.stack-work/install/x86_64-linux-tinfo6/e5ddcf3bc94c2efb7bf3c4d731ffef7cc0afdc180df2d3ceb02785afc97f685a/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/ovr/haskell/custom-iot/amqp-forw/.stack-work/install/x86_64-linux-tinfo6/e5ddcf3bc94c2efb7bf3c4d731ffef7cc0afdc180df2d3ceb02785afc97f685a/8.6.5/share/x86_64-linux-ghc-8.6.5/amqp-forw-0.1.0.0"
libexecdir = "/home/ovr/haskell/custom-iot/amqp-forw/.stack-work/install/x86_64-linux-tinfo6/e5ddcf3bc94c2efb7bf3c4d731ffef7cc0afdc180df2d3ceb02785afc97f685a/8.6.5/libexec/x86_64-linux-ghc-8.6.5/amqp-forw-0.1.0.0"
sysconfdir = "/home/ovr/haskell/custom-iot/amqp-forw/.stack-work/install/x86_64-linux-tinfo6/e5ddcf3bc94c2efb7bf3c4d731ffef7cc0afdc180df2d3ceb02785afc97f685a/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "amqp_forw_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "amqp_forw_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "amqp_forw_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "amqp_forw_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "amqp_forw_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "amqp_forw_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
