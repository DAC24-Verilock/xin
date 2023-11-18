{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.BehavioralStatements.ConditionalStatements where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Patterns (Pattern)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (StatementOrNull)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data ConditionalStatement
  = ConditionalStatement
      (Maybe UniquePriority)
      Keyword
      (Paren CondPredicate)
      (Splits (Keyword, Keyword, Paren CondPredicate) StatementOrNull)
      (Maybe (Keyword, StatementOrNull))
  deriving (Eq, Show)

data UniquePriority
  = Unique Keyword
  | Unique0 Keyword
  | Priority Keyword
  deriving (Eq, Show)

newtype CondPredicate
  = CondPredicate (Splits Symbol ExpressionOrCondPattern)
  deriving (Eq, Show)

data ExpressionOrCondPattern
  = MkExpression Expression
  | MkCondPattern CondPattern
  deriving (Eq, Show)

data CondPattern
  = CondPattern Expression Keyword Pattern
  deriving (Eq, Show)

deriveLit ''UniquePriority
deriveLit ''CondPattern
deriveLit ''ExpressionOrCondPattern
deriveLit ''CondPredicate
deriveLit ''ConditionalStatement