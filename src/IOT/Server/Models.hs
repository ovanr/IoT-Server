{-# LANGUAGE GADTs #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module IOT.Server.Models where

import Database.Persist
import Database.Persist.MySQL
import Database.Persist.Class
import Database.Persist.Quasi
import Database.Persist.TH
import Database.MySQL.Simple
import Database.MySQL.Base.Types
import Control.Monad.Logger    (runStderrLoggingT)
import Data.Time
import Data.ByteString (ByteString)
import Data.Text (Text)

mkPersist sqlSettings $(persistFileWith lowerCaseSettings "./models/mariadb.persistentmodels")
