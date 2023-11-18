{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Expressions.Concatenations where

import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (SimpleType)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions
  ( ConstantExpression,
    Expression,
    ModulePathExpression,
  )
import SystemVerilog.AST.SpecialNodes (Brace, Bracket, Keyword, Splits, Symbol)
import Util.Lit (deriveLit)

newtype Concatenation
  = Concatenation (Brace (Splits Symbol Expression))
  deriving (Eq, Show)

newtype ConstantConcatenation
  = ConstantConcatenation (Brace (Splits Symbol ConstantExpression))
  deriving (Eq, Show)

newtype ConstantMultipleConcatenation
  = ConstantMultipleConcatenation (Brace (ConstantExpression, ConstantConcatenation))
  deriving (Eq, Show)

newtype ModulePathConcatenation
  = ModulePathConcatenation (Brace (Splits Symbol ModulePathExpression))
  deriving (Eq, Show)

newtype ModulePathMultipleConcatenation
  = ModulePathMultipleConcatenation (Brace (ConstantExpression, ModulePathConcatenation))
  deriving (Eq, Show)

newtype MultipleConcatenation
  = MultipleConcatenation (Brace (Expression, Concatenation))
  deriving (Eq, Show)

newtype StreamingConcatenation
  = StreamingConcatenation (Brace (StreamOperator, Maybe SliceSize, StreamConcatenation))
  deriving (Eq, Show)

newtype StreamOperator = StreamOperator Symbol deriving (Eq, Show)

data SliceSize
  = MkSimpleType SimpleType
  | MkConstantExpression ConstantExpression
  deriving (Eq, Show)

newtype StreamConcatenation
  = StreamConcatenation (Brace (Splits Symbol StreamExpression))
  deriving (Eq, Show)

data StreamExpression
  = StreamExpression
      Expression
      (Maybe (Keyword, Bracket ArrayRangeExpression))
  deriving (Eq, Show)

data ArrayRangeExpression
  = MkExpression Expression
  | MkArrayRangeExpressionColon ArrayRangeExpressionColon
  | MkArrayRangeExpressionPlusColon ArrayRangeExpressionPlusColon
  | MkArrayRangeExpressionMinusColon ArrayRangeExpressionMinusColon
  deriving (Eq, Show)

data ArrayRangeExpressionColon
  = ArrayRangeExpressionColon
      Expression
      Symbol
      Expression
  deriving (Eq, Show)

data ArrayRangeExpressionPlusColon
  = ArrayRangeExpressionPlusColon
      Expression
      Symbol
      Expression
  deriving (Eq, Show)

data ArrayRangeExpressionMinusColon
  = ArrayRangeExpressionMinusColon
      Expression
      Symbol
      Expression
  deriving (Eq, Show)

data EmptyUnpackedArrayConcatenation
  = EmptyUnpackedArrayConcatenation
      Symbol
      Symbol
  deriving (Eq, Show)

deriveLit ''Concatenation
deriveLit ''ConstantConcatenation
deriveLit ''ConstantMultipleConcatenation
deriveLit ''ModulePathConcatenation
deriveLit ''ModulePathMultipleConcatenation
deriveLit ''MultipleConcatenation
deriveLit ''StreamOperator
deriveLit ''SliceSize
deriveLit ''ArrayRangeExpressionColon
deriveLit ''ArrayRangeExpressionPlusColon
deriveLit ''ArrayRangeExpressionMinusColon
deriveLit ''EmptyUnpackedArrayConcatenation
deriveLit ''ArrayRangeExpression
deriveLit ''StreamExpression
deriveLit ''StreamConcatenation
deriveLit ''StreamingConcatenation