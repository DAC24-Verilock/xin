{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use newtype instead of data" #-}

module SystemVerilog.AST.Expressions.Expressions where

import qualified Data.Text as T
import SystemVerilog.AST.BehavioralStatements.CaseStatements (OpenRangeList)
import SystemVerilog.AST.BehavioralStatements.ConditionalStatements (CondPredicate)
import SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments (OperatorAssignment)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (DataType)
import SystemVerilog.AST.Expressions.ExpressionLeftsideValues (VariableLvalue)
import SystemVerilog.AST.Expressions.Operators (BinaryModulePathOperator, BinaryOperator, IncOrDecOperator, UnaryModulePathOperator, UnaryOperator)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (ConstantPrimary, ModulePathPrimary, Primary)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (MemberIdentifier)
import SystemVerilog.AST.SpecialNodes (Brace, Bracket, Keyword, Paren, Symbol)
import Util.Lit (Lit (..))

data IncOrDecExpression
  = MkIncOrDecExpressionPrefix IncOrDecExpressionPrefix
  | MkIncOrDecExpressionSuffix IncOrDecExpressionSuffix
  deriving (Eq, Show)

instance Lit IncOrDecExpression where
  lit (MkIncOrDecExpressionPrefix x) = lit x
  lit (MkIncOrDecExpressionSuffix x) = lit x

data IncOrDecExpressionPrefix
  = IncOrDecExpressionPrefix
      IncOrDecOperator
      [AttributeInstance]
      VariableLvalue
  deriving (Eq, Show)

instance Lit IncOrDecExpressionPrefix where
  lit (IncOrDecExpressionPrefix a b c) = T.concat [lit a, lit b, lit c]

data IncOrDecExpressionSuffix
  = IncOrDecExpressionSuffix
      VariableLvalue
      [AttributeInstance]
      IncOrDecOperator
  deriving (Eq, Show)

instance Lit IncOrDecExpressionSuffix where
  lit (IncOrDecExpressionSuffix a b c) = T.concat [lit a, lit b, lit c]

data ConditionalExpression
  = ConditionalExpression
      CondPredicate
      Symbol
      [AttributeInstance]
      Expression
      Symbol
      Expression
  deriving (Eq, Show)

instance Lit ConditionalExpression where
  lit (ConditionalExpression a b c d e f) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f]

data ConstantExpression
  = MkConstantPrimary ConstantPrimary
  | MkConstantExpressionUnary ConstantExpressionUnary
  | MkConstantExpressionBinary ConstantExpressionBinary
  | MkConstantExpressionTernary ConstantExpressionTernary
  deriving (Eq, Show)

instance Lit ConstantExpression where
  lit (MkConstantPrimary x) = lit x
  lit (MkConstantExpressionUnary x) = lit x
  lit (MkConstantExpressionBinary x) = lit x
  lit (MkConstantExpressionTernary x) = lit x

data ConstantExpressionUnary
  = ConstantExpressionUnary
      UnaryOperator
      [AttributeInstance]
      ConstantPrimary
  deriving (Eq, Show)

instance Lit ConstantExpressionUnary where
  lit (ConstantExpressionUnary a b c) = T.concat [lit a, lit b, lit c]

data ConstantExpressionBinary
  = ConstantExpressionBinary
      ConstantExpression
      BinaryOperator
      [AttributeInstance]
      ConstantExpression
  deriving (Eq, Show)

instance Lit ConstantExpressionBinary where
  lit (ConstantExpressionBinary a b c d) = T.concat [lit a, lit b, lit c, lit d]

data ConstantExpressionTernary
  = ConstantExpressionTernary
      ConstantExpression
      Symbol
      [AttributeInstance]
      ConstantExpression
      Symbol
      ConstantExpression
  deriving (Eq, Show)

instance Lit ConstantExpressionTernary where
  lit (ConstantExpressionTernary a b c d e f) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f]

data ConstantMintypmaxExpression
  = Unary ConstantExpression
  | Ternary ConstantMintypmaxExpressionTernary
  deriving (Eq, Show)

instance Lit ConstantMintypmaxExpression where
  lit (Unary x) = lit x
  lit (Ternary x) = lit x

data ConstantMintypmaxExpressionTernary
  = ConstantMintypmaxExpressionTernary
      ConstantExpression
      Symbol
      ConstantExpression
      Symbol
      ConstantExpression
  deriving (Eq, Show)

instance Lit ConstantMintypmaxExpressionTernary where
  lit (ConstantMintypmaxExpressionTernary a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data ConstantParamExpression
  = MkConstantMintypmaxExpression ConstantMintypmaxExpression
  | MkDataType DataType
  | MkDollar Symbol
  deriving (Eq, Show)

instance Lit ConstantParamExpression where
  lit (MkConstantMintypmaxExpression x) = lit x
  lit (MkDataType x) = lit x
  lit (MkDollar x) = lit x

data ParamExpression
  = MkMintypmaxExpression MintypmaxExpression
  | ParamDataType DataType
  | ParamDollar Symbol
  deriving (Eq, Show)

instance Lit ParamExpression where
  lit (MkMintypmaxExpression x) = lit x
  lit (ParamDataType x) = lit x
  lit (ParamDollar x) = lit x

data ConstantRangeExpression
  = MkConstantExpression ConstantExpression
  | MkConstantPartSelectRange ConstantPartSelectRange
  deriving (Eq, Show)

instance Lit ConstantRangeExpression where
  lit (MkConstantExpression x) = lit x
  lit (MkConstantPartSelectRange x) = lit x

data ConstantPartSelectRange
  = MkConstantRange ConstantRange
  | MkConstantIndexedRange ConstantIndexedRange
  deriving (Eq, Show)

instance Lit ConstantPartSelectRange where
  lit (MkConstantRange x) = lit x
  lit (MkConstantIndexedRange x) = lit x

data ConstantRange
  = ConstantRange
      ConstantExpression
      Symbol
      ConstantExpression
  deriving (Eq, Show)

instance Lit ConstantRange where
  lit (ConstantRange a b c) = T.concat [lit a, lit b, lit c]

data ConstantIndexedRange
  = ConstantIndexedRange
      ConstantExpression
      Symbol
      ConstantExpression
  deriving (Eq, Show)

instance Lit ConstantIndexedRange where
  lit (ConstantIndexedRange a b c) = T.concat [lit a, lit b, lit c]

data Expression
  = Primary Primary
  | MkExpressionUnary ExpressionUnary
  | IncOrDecExpression IncOrDecExpression
  | MkExpressionOperatorAssignment ExpressionOperatorAssignment
  | MkExpressionBinary ExpressionBinary
  | MkConditionalExpression ConditionalExpression
  | MkInsideExpression InsideExpression
  | MkTaggedUnionExpression TaggedUnionExpression
  deriving (Eq, Show)

instance Lit Expression where
  lit (Primary x) = lit x
  lit (MkExpressionUnary x) = lit x
  lit (IncOrDecExpression x) = lit x
  lit (MkExpressionOperatorAssignment x) = lit x
  lit (MkExpressionBinary x) = lit x
  lit (MkConditionalExpression x) = lit x
  lit (MkInsideExpression x) = lit x
  lit (MkTaggedUnionExpression x) = lit x

data ExpressionUnary
  = ExpressionUnary
      UnaryOperator
      [AttributeInstance]
      Primary
  deriving (Eq, Show)

instance Lit ExpressionUnary where
  lit (ExpressionUnary a b c) = T.concat [lit a, lit b, lit c]

data ExpressionOperatorAssignment
  = ExpressionOperatorAssignment (Paren OperatorAssignment)
  deriving (Eq, Show)

instance Lit ExpressionOperatorAssignment where
  lit (ExpressionOperatorAssignment x) = lit x

data ExpressionBinary
  = ExpressionBinary
      Expression
      BinaryOperator
      [AttributeInstance]
      Expression
  deriving (Eq, Show)

instance Lit ExpressionBinary where
  lit (ExpressionBinary a b c d) = T.concat [lit a, lit b, lit c, lit d]

data TaggedUnionExpression
  = TaggedUnionExpression
      Keyword
      MemberIdentifier
      (Maybe Expression)
  deriving (Eq, Show)

instance Lit TaggedUnionExpression where
  lit (TaggedUnionExpression a b c) = T.concat [lit a, lit b, lit c]

data InsideExpression
  = InsideExpression
      Expression
      Keyword
      (Brace OpenRangeList)
  deriving (Eq, Show)

instance Lit InsideExpression where
  lit (InsideExpression a b c) = T.concat [lit a, lit b, lit c]

data ValueRange
  = MkExpression Expression
  | MkValueRangeBinary ValueRangeBinary
  deriving (Eq, Show)

instance Lit ValueRange where
  lit (MkExpression x) = lit x
  lit (MkValueRangeBinary x) = lit x

data ValueRangeBinary
  = ValueRangeBinary (Bracket (Expression, Symbol, Expression))
  deriving (Eq, Show)

instance Lit ValueRangeBinary where
  lit (ValueRangeBinary x) = lit x

data MintypmaxExpression
  = MkSimpleExpression Expression
  | MkMintypmaxExpressionTernary MintypmaxExpressionTernary
  deriving (Eq, Show)

instance Lit MintypmaxExpression where
  lit (MkSimpleExpression x) = lit x
  lit (MkMintypmaxExpressionTernary x) = lit x

data MintypmaxExpressionTernary
  = MintypmaxExpressionTernary
      Expression
      Symbol
      Expression
      Symbol
      Expression
  deriving (Eq, Show)

instance Lit MintypmaxExpressionTernary where
  lit (MintypmaxExpressionTernary a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data ModulePathConditionalExpression
  = ModulePathConditionalExpression
      ModulePathExpression
      Symbol
      [AttributeInstance]
      ModulePathExpression
      Symbol
      ModulePathExpression
  deriving (Eq, Show)

instance Lit ModulePathConditionalExpression where
  lit (ModulePathConditionalExpression a b c d e f) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f]

data ModulePathExpression
  = MkModulePathPrimary ModulePathPrimary
  | MkModulePathExpressionUnary ModulePathExpressionUnary
  | MkModulePathExpressionBinary ModulePathExpressionBinary
  | MkModulePathConditionalExpression ModulePathConditionalExpression
  deriving (Eq, Show)

instance Lit ModulePathExpression where
  lit (MkModulePathPrimary x) = lit x
  lit (MkModulePathExpressionUnary x) = lit x
  lit (MkModulePathExpressionBinary x) = lit x
  lit (MkModulePathConditionalExpression x) = lit x

data ModulePathExpressionUnary
  = ModulePathExpressionUnary
      UnaryModulePathOperator
      [AttributeInstance]
      ModulePathPrimary
  deriving (Eq, Show)

instance Lit ModulePathExpressionUnary where
  lit (ModulePathExpressionUnary a b c) = T.concat [lit a, lit b, lit c]

data ModulePathExpressionBinary
  = ModulePathExpressionBinary
      ModulePathExpression
      BinaryModulePathOperator
      [AttributeInstance]
      ModulePathExpression
  deriving (Eq, Show)

instance Lit ModulePathExpressionBinary where
  lit (ModulePathExpressionBinary a b c d) = T.concat [lit a, lit b, lit c, lit d]

data ModulePathMintypmaxExpression
  = MkModulePathExpression ModulePathExpression
  | MkModulePathMintypmaxExpressionTernary ModulePathMintypmaxExpressionTernary
  deriving (Eq, Show)

instance Lit ModulePathMintypmaxExpression where
  lit (MkModulePathExpression x) = lit x
  lit (MkModulePathMintypmaxExpressionTernary x) = lit x

data ModulePathMintypmaxExpressionTernary
  = ModulePathMintypmaxExpressionTernary
      ModulePathExpression
      Symbol
      ModulePathExpression
      Symbol
      ModulePathExpression
  deriving (Eq, Show)

instance Lit ModulePathMintypmaxExpressionTernary where
  lit (ModulePathMintypmaxExpressionTernary a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data PartSelectRange
  = MkPartSelectRange ConstantRange
  | MkIndexedRange IndexedRange
  deriving (Eq, Show)

instance Lit PartSelectRange where
  lit (MkPartSelectRange x) = lit x
  lit (MkIndexedRange x) = lit x

data IndexedRange
  = IndexedRange
      Expression
      Symbol
      ConstantExpression
  deriving (Eq, Show)

instance Lit IndexedRange where
  lit (IndexedRange a b c) = T.concat [lit a, lit b, lit c]

data GenvarExpression
  = GenvarExpression ConstantExpression
  deriving (Eq, Show)

instance Lit GenvarExpression where
  lit (GenvarExpression x) = lit x