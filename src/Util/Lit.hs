{-# LANGUAGE TemplateHaskell #-}

module Util.Lit where

import qualified Data.Text as T
import Language.Haskell.TH (
  Name,
  Q,
  Dec (DataD, NewtypeD),
  Info (TyConI),
  TyVarBndr (KindedTV, PlainTV),
  Clause,
  Con (NormalC),
  Exp,
  Quote (newName),
  funD, reify, conT, appT, instanceD, varT, varP, conP, normalB, clause, varE, appE, listE)
import Control.Monad (replicateM)

class Lit a where
  lit :: a -> T.Text

instance (Lit a) => Lit (Maybe a) where
  lit Nothing = T.empty
  lit (Just x) = lit x

instance (Lit a) => Lit [a] where
  lit [] = T.empty
  lit (x:xs) = lit x `T.append` lit xs

instance (Lit a, Lit b) => Lit (a, b) where
  lit (a, b) = lit a `T.append` lit b

instance (Lit a, Lit b, Lit c) => Lit (a, b, c) where
  lit (a, b, c) = T.concat [lit a, lit b, lit c]

instance (Lit a, Lit b, Lit c, Lit d) => Lit (a, b, c, d) where
  lit (a, b, c, d) = T.concat [lit a, lit b, lit c, lit d]

instance (Lit a, Lit b, Lit c, Lit d, Lit e) => Lit (a, b, c, d, e) where
  lit (a, b, c, d, e) = T.concat [lit a, lit b, lit c, lit d, lit e]

instance (Lit a, Lit b, Lit c, Lit d, Lit e, Lit f) => Lit (a, b, c, d, e, f) where
  lit (a, b, c, d, e, f) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f]

instance (Lit a, Lit b, Lit c, Lit d, Lit e, Lit f, Lit g) => Lit (a, b, c, d, e, f, g) where
  lit (a, b, c, d, e, f, g) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g]

instance (Lit a, Lit b, Lit c, Lit d, Lit e, Lit f, Lit g, Lit h) => Lit (a, b, c, d, e, f, g, h) where
  lit (a, b, c, d, e, f, g, h) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g, lit h]

data Deriving = Deriving {tyCon :: Name, tyVar :: Name}

deriveLit :: Name -> Q [Dec]
deriveLit ty =
  do
    (TyConI tyCon) <- reify ty
    (tyConName, tyVars, cs) <- case tyCon of
      DataD _ nm tyVars _ cs _ -> return (nm, tyVars, cs)
      NewtypeD _ nm tyVars _ c _ -> return (nm, tyVars, [c])
      _ -> fail "deriveLit: tyCon may not be a type synonym."

    let instanceTye = conT ''Lit `appT` (foldl apply (conT tyConName) tyVars)
    sequence [instanceD (return []) instanceTye [genLit cs]]
  where
    apply t (PlainTV name _) = appT t (varT name)
    apply t (KindedTV name _ _) = appT t (varT name)

genLit :: [Con] -> Q Dec
genLit cs = 
  do
    funD 'lit (map genLitClause cs)

genLitClause :: Con -> Q Clause
genLitClause c@(NormalC name fieldTypes) = 
  do
    fieldNames <- replicateM (length fieldTypes) (newName "x")
    let pats = [conP name (map varP fieldNames)]
        body = normalB $ appE
          (varE 'T.concat) (listE (map (processField 'lit) fieldNames))
    
    clause pats body []

processField :: Name -> Name -> Q Exp
processField f x
  = do appE (varE f) (varE x) 
