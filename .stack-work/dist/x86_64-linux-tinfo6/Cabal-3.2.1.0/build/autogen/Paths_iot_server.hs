{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_iot_server (
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

bindir     = "/home/ovr/haskell/iot-server/.stack-work/install/x86_64-linux-tinfo6/c8f6aff96449d456fdbeaebbe5fd0b9ef9ed227b0a70aae1521619ea908102a4/8.10.3/bin"
libdir     = "/home/ovr/haskell/iot-server/.stack-work/install/x86_64-linux-tinfo6/c8f6aff96449d456fdbeaebbe5fd0b9ef9ed227b0a70aae1521619ea908102a4/8.10.3/lib/x86_64-linux-ghc-8.10.3/iot-server-0.1.0.0-7g6IIRBKXSECs7Foxrbn5m"
dynlibdir  = "/home/ovr/haskell/iot-server/.stack-work/install/x86_64-linux-tinfo6/c8f6aff96449d456fdbeaebbe5fd0b9ef9ed227b0a70aae1521619ea908102a4/8.10.3/lib/x86_64-linux-ghc-8.10.3"
datadir    = "/home/ovr/haskell/iot-server/.stack-work/install/x86_64-linux-tinfo6/c8f6aff96449d456fdbeaebbe5fd0b9ef9ed227b0a70aae1521619ea908102a4/8.10.3/share/x86_64-linux-ghc-8.10.3/iot-server-0.1.0.0"
libexecdir = "/home/ovr/haskell/iot-server/.stack-work/install/x86_64-linux-tinfo6/c8f6aff96449d456fdbeaebbe5fd0b9ef9ed227b0a70aae1521619ea908102a4/8.10.3/libexec/x86_64-linux-ghc-8.10.3/iot-server-0.1.0.0"
sysconfdir = "/home/ovr/haskell/iot-server/.stack-work/install/x86_64-linux-tinfo6/c8f6aff96449d456fdbeaebbe5fd0b9ef9ed227b0a70aae1521619ea908102a4/8.10.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "iot_server_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "iot_server_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "iot_server_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "iot_server_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "iot_server_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "iot_server_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
