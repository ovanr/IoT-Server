module Main (
  argParser,
  main ) where

import IOT.Server ( initApp, runApp )
import IOT.Server.Types ( ServerArgs(..), unApp )
import Control.Monad ( void )
import Options.Applicative
    ( Parser,
      helper,
      Alternative(many),
      (<**>),
      flag',
      fullDesc,
      header,
      help,
      info,
      long,
      metavar,
      progDesc,
      short,
      showDefault,
      strOption,
      value,
      execParser )
import Data.Semigroup ()

argParser :: Parser ServerArgs
argParser = ServerArgs
   <$> (length <$> many (flag' () $
      short 'v'
         <> help "verbosity" ))
   <*> strOption
      (long "logFile"
         <> short 'l'
         <> metavar "FILE"
         <> showDefault
         <> value "iot-server.log"
         <> help "File to write logs to")
   <*> strOption
      (long "confFile"
         <> short 'c'
         <> metavar "FILE"
         <> showDefault
         <> value "/etc/default/iot-server.conf"
         <> help "Configuration file")

main :: IO ()
main = execParser opts >>= initApp >>= (void . unApp runApp)
  where
    opts = info (argParser <**> helper)
      ( fullDesc
     <> progDesc "IoT-Server"
     <> header "IoT-Server - Forward data from IoT devices to persistent storage (db)" )
