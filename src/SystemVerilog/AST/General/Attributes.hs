{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.General.Attributes where

import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (Identifier)
import SystemVerilog.AST.SpecialNodes (Splits, Symbol)
import Util.Lit (deriveLit)

data AttributeInstance
  = AttributeInstance
      Symbol
      (Splits Symbol AttrSpec)
      Symbol
  deriving (Eq, Show)

data AttrSpec
  = AttrSpec
      Identifier
      (Maybe (Symbol, ConstantExpression))
  deriving (Eq, Show)

deriveLit ''AttrSpec
deriveLit ''AttributeInstance