{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.BehavioralStatements.CaseStatements where

import SystemVerilog.AST.BehavioralStatements.ConditionalStatements (UniquePriority)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Patterns (Pattern)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (StatementOrNull)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression, ValueRange)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data CaseStatement
  = Normal CaseStatementNormal
  | Matches CaseStatementMatches
  | Inside CaseStatementInside
  deriving (Eq, Show)

data CaseStatementNormal
  = CaseStatementNormal
      (Maybe UniquePriority)
      CaseKeyword
      (Paren CaseExpression)
      CaseItem
      [CaseItem]
      Keyword
  deriving (Eq, Show)

data CaseStatementMatches
  = CaseStatementMatches
      (Maybe UniquePriority)
      CaseKeyword
      (Paren CaseExpression)
      Keyword
      CasePatternItem
      [CasePatternItem]
      Keyword
  deriving (Eq, Show)

data CaseStatementInside
  = CaseStatementInside
      (Maybe UniquePriority)
      Keyword
      (Paren CaseExpression)
      Keyword
      CaseInsideItem
      [CaseInsideItem]
      Keyword
  deriving (Eq, Show)

data CaseKeyword
  = Case Keyword
  | Casez Keyword
  | Casex Keyword
  deriving (Eq, Show)

newtype CaseExpression
  = CaseExpression Expression
  deriving (Eq, Show)

data CaseItem
  = MkCaseItemNondefault CaseItemNondefault
  | MkCaseItemDefault CaseItemDefault
  deriving (Eq, Show)

data CaseItemNondefault
  = CaseItemNondefault
      [(Symbol, CaseItemExpression)]
      Symbol
      StatementOrNull
  deriving (Eq, Show)

data CaseItemDefault
  = CaseItemDefault
      Keyword
      (Maybe Symbol)
      StatementOrNull
  deriving (Eq, Show)

data CasePatternItem
  = MkCasePatternItemNondefault CasePatternItemNondefault
  | MkCasePatternItemCaseItemDefault CaseItemDefault
  deriving (Eq, Show)

data CasePatternItemNondefault
  = CasePatternItemNondefault
      Pattern
      (Maybe (Symbol, Expression))
      Symbol
      StatementOrNull
  deriving (Eq, Show)

data CaseInsideItem
  = MkCaseInsideItemNondefault CaseInsideItemNondefault
  | MkCaseInsideItemCaseItemDefault CaseItemDefault
  deriving (Eq, Show)

data CaseInsideItemNondefault
  = CaseInsideItemNondefault
      OpenRangeList
      Symbol
      StatementOrNull
  deriving (Eq, Show)

newtype CaseItemExpression
  = CaseItemExpression Expression
  deriving (Eq, Show)

data RandcaseStatement
  = RandcaseStatement
      Keyword
      RandcaseItem
      [RandcaseItem]
      Keyword
  deriving (Eq, Show)

data RandcaseItem
  = RandcaseItem
      Expression
      Symbol
      StatementOrNull
  deriving (Eq, Show)

newtype OpenRangeList = OpenRangeList (Splits Symbol OpenValueRange) deriving (Eq, Show)

newtype OpenValueRange = OpenValueRange ValueRange deriving (Eq, Show)

deriveLit ''CaseKeyword
deriveLit ''CaseExpression
deriveLit ''CaseItemDefault
deriveLit ''CasePatternItemNondefault
deriveLit ''CaseItemExpression
deriveLit ''RandcaseItem
deriveLit ''OpenValueRange
deriveLit ''OpenRangeList
deriveLit ''RandcaseStatement
deriveLit ''CaseInsideItemNondefault
deriveLit ''CaseInsideItem
deriveLit ''CasePatternItem
deriveLit ''CaseItemNondefault
deriveLit ''CaseItem
deriveLit ''CaseStatementInside
deriveLit ''CaseStatementNormal
deriveLit ''CaseStatementMatches
deriveLit ''CaseStatement