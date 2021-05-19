{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}

module IOT.Server.Field where

import Language.Haskell.TH
import Data.ProtoLens.Field (HasField(..))
import Control.Monad
import qualified Data.Text as T

makeHasFieldInstances :: Name -> Q [Dec]
makeHasFieldInstances s = do 
   (TyConI tyCon) <- reify s

   -- tyConName: Type Name e.g. Maybe
   -- tyVars: Type Contructor variables e.g. in Either a b is a, b
   -- cs: Value Contructors of the Type 
   (tyConName, tyVars, cs) <- case tyCon of
     DataD _ nm tyVars _ cs _   -> return (nm, tyVars, cs)
     NewtypeD _ nm tyVars _ c _ -> return (nm, tyVars, [c])
     _ -> fail "makeHasFieldFieldInstances: Type must either be a data or a newtype"
   
   let sType = foldl apply (ConT tyConName) tyVars
   
   concat <$> forM cs (makeInstances sType)

   where
      apply t (PlainTV name)    = AppT t (VarT name)
      apply t (KindedTV name kind) = AppT t (VarT name)

toLensName :: Name -> Name
toLensName nm =
   let newName = T.unpack . T.tail . last . T.splitOn "." . T.pack . show $ nm
    in mkName newName

makeInstances :: Type -> Con -> Q [Dec]
makeInstances s (RecC _ fields) = 
   forM fields $ \(field, _, a) -> makeSingleInstance s (toLensName field) a 
makeInstances _ _ = fail "makeHasFieldFieldInstances: Unsupported Value Constructor encountered!" 

makeSingleInstance :: Type -> Name -> Type -> Q Dec
makeSingleInstance s f a = do
   let fSymbol = LitT $ StrTyLit (show f) 
   let instanceType = ConT ''HasField `AppT` s `AppT` fSymbol `AppT` a

   -- create the instances of the HasField (T s f a)
   -- Ctx :: Prerequisite constraints
   instanceD (pure []) (pure instanceType) [ makeFieldOf f ]

makeFieldOf :: Name -> Q Dec
makeFieldOf fieldName = do 
   let body = normalB $ varE fieldName 
   funD 'fieldOf [ clause [ wildP ] body [] ]
