module Main where

import IOT.Server (initApp, runApp)
import IOT.Server.Types (ServerArgs(..))

import Options.Applicative
import Data.Semigroup ((<>))

argParser :: Parser ServerArgs
argParser = ServerArgs
   <$> (length <$> many (flag' () $
      short 'v'
         <> help "verbosity" ))
   <*> strOption
      (long "confFile"
         <> short 'c'
         <> metavar "FILE"
         <> showDefault
         <> value "/etc/default/amqp-forw.conf"
         <> help "Configuration file")

main :: IO ()
main = execParser opts >>= initApp >>= runApp
  where
    opts = info (argParser <**> helper)
      ( fullDesc
     <> progDesc "Amqp-forw"
     <> header "Amqp-forw - Forward data from IoT devices to persistent storage (db)" )
