{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use newtype instead of data" #-}

module SystemVerilog.AST.SourceText.Constraints where

import qualified Data.Text as T
import SystemVerilog.AST.BehavioralStatements.CaseStatements (OpenRangeList)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.LoopingStatements (LoopVariables)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.AssertionDeclarations (ExpressionOrDist)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (ClassScope)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression, ValueRange)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (Select)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (ConstraintIdentifier, HierarchicalIdentifier, Identifier, ImplicitClassHandleOrClassScope, PsOrHierarchicalArrayIdentifier)
import SystemVerilog.AST.SpecialNodes (Brace, Bracket, Keyword, Paren, Splits, Symbol)
import Util.Lit (Lit (..))

data ConstraintDeclaration
  = ConstraintDeclaration
      (Maybe Static)
      Keyword
      ConstraintIdentifier
      ConstraintBlock
  deriving (Eq, Show)

instance Lit ConstraintDeclaration where
  lit (ConstraintDeclaration a b c d) = T.concat [lit a, lit b, lit c, lit d]

data Static = Static Keyword deriving (Eq, Show)

instance Lit Static where
  lit (Static x) = lit x

data ConstraintBlock = ConstraintBlock (Brace [ConstraintBlockItem]) deriving (Eq, Show)

instance Lit ConstraintBlock where
  lit (ConstraintBlock x) = lit x

data ConstraintBlockItem
  = MkConstraintBlockItemSolve ConstraintBlockItemSolve
  | MkConstraintExpression ConstraintExpression
  deriving (Eq, Show)

instance Lit ConstraintBlockItem where
  lit (MkConstraintBlockItemSolve x) = lit x
  lit (MkConstraintExpression x) = lit x

data ConstraintBlockItemSolve
  = ConstraintBlockItemSolve
      Keyword
      SolveBeforeList
      Keyword
      SolveBeforeList
      Symbol
  deriving (Eq, Show)

instance Lit ConstraintBlockItemSolve where
  lit (ConstraintBlockItemSolve a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data SolveBeforeList
  = SolveBeforeList
      (Splits Symbol ConstraintPrimary)
  deriving (Eq, Show)

instance Lit SolveBeforeList where
  lit (SolveBeforeList x) = lit x

data ConstraintPrimary
  = ConstraintPrimary
      (Maybe ImplicitClassHandleOrClassScope)
      HierarchicalIdentifier
      Select
  deriving (Eq, Show)

instance Lit ConstraintPrimary where
  lit (ConstraintPrimary a b c) = T.concat [lit a, lit b, lit c]

data ConstraintExpression
  = MkConstraintExpressionExpression ConstraintExpressionExpression
  | MkUniquenessConstraint UniquenessConstraint Symbol
  | MkConstraintExpressionArrow ConstraintExpressionArrow
  | MkConstraintExpressionIf ConstraintExpressionIf
  | MkConstraintExpressionForeach ConstraintExpressionForeach
  | MkConstraintExpressionDisable ConstraintExpressionDisable
  deriving (Eq, Show)

instance Lit ConstraintExpression where
  lit (MkConstraintExpressionExpression x) = lit x
  lit (MkUniquenessConstraint a b) = lit a `T.append` lit b
  lit (MkConstraintExpressionArrow x) = lit x
  lit (MkConstraintExpressionIf x) = lit x
  lit (MkConstraintExpressionForeach x) = lit x
  lit (MkConstraintExpressionDisable x) = lit x

data ConstraintExpressionExpression
  = ConstraintExpressionExpression
      (Maybe Soft)
      ExpressionOrDist
      Symbol
  deriving (Eq, Show)

instance Lit ConstraintExpressionExpression where
  lit (ConstraintExpressionExpression a b c) = T.concat [lit a, lit b, lit c]

data Soft = Soft Keyword deriving (Eq, Show)

instance Lit Soft where
  lit (Soft x) = lit x

data ConstraintExpressionArrow
  = ConstraintExpressionArrow
      Expression
      Symbol
      ConstraintSet
  deriving (Eq, Show)

instance Lit ConstraintExpressionArrow where
  lit (ConstraintExpressionArrow a b c) = T.concat [lit a, lit b, lit c]

data ConstraintExpressionIf
  = ConstraintExpressionIf
      Keyword
      (Paren Expression)
      ConstraintSet
      (Maybe (Keyword, ConstraintSet))
  deriving (Eq, Show)

instance Lit ConstraintExpressionIf where
  lit (ConstraintExpressionIf a b c d) = T.concat [lit a, lit b, lit c, lit d]

data ConstraintExpressionForeach
  = ConstraintExpressionForeach
      Keyword
      (Paren (PsOrHierarchicalArrayIdentifier, Bracket LoopVariables))
      ConstraintSet
  deriving (Eq, Show)

instance Lit ConstraintExpressionForeach where
  lit (ConstraintExpressionForeach a b c) = T.concat [lit a, lit b, lit c]

data ConstraintExpressionDisable
  = ConstraintExpressionDisable
      Keyword
      Keyword
      ConstraintPrimary
      Symbol
  deriving (Eq, Show)

instance Lit ConstraintExpressionDisable where
  lit (ConstraintExpressionDisable a b c d) = T.concat [lit a, lit b, lit c, lit d]

data UniquenessConstraint
  = UniquenessConstraint
      Keyword
      (Brace OpenRangeList)
  deriving (Eq, Show)

instance Lit UniquenessConstraint where
  lit (UniquenessConstraint a b) = lit a `T.append` lit b

data ConstraintSet
  = MkConstraintSetConstraintExpression ConstraintExpression
  | MkConstraintSetBrace ConstraintSetBrace
  deriving (Eq, Show)

instance Lit ConstraintSet where
  lit (MkConstraintSetConstraintExpression x) = lit x
  lit (MkConstraintSetBrace x) = lit x

data ConstraintSetBrace
  = ConstraintSetBrace
      (Brace [ConstraintExpression])
  deriving (Eq, Show)

instance Lit ConstraintSetBrace where
  lit (ConstraintSetBrace x) = lit x

data DistList
  = DistList
      (Splits Symbol DistItem)
  deriving (Eq, Show)

instance Lit DistList where
  lit (DistList x) = lit x

data DistItem
  = DistItem
      ValueRange
      (Maybe DistWeight)
  deriving (Eq, Show)

instance Lit DistItem where
  lit (DistItem a b) = lit a `T.append` lit b

data DistWeight
  = MkDistWeightEqual DistWeightEqual
  | MkDistWeightDivide DistWeightDivide
  deriving (Eq, Show)

instance Lit DistWeight where
  lit (MkDistWeightEqual x) = lit x
  lit (MkDistWeightDivide x) = lit x

data DistWeightEqual
  = DistWeightEqual
      Symbol
      Expression
  deriving (Eq, Show)

instance Lit DistWeightEqual where
  lit (DistWeightEqual a b) = lit a `T.append` lit b

data DistWeightDivide
  = DistWeightDivide
      Symbol
      Expression
  deriving (Eq, Show)

instance Lit DistWeightDivide where
  lit (DistWeightDivide a b) = lit a `T.append` lit b

data ConstraintPrototype
  = ConstraintPrototype
      (Maybe ConstraintPrototypeQualifier)
      (Maybe Static)
      Keyword
      ConstraintIdentifier
      Symbol
  deriving (Eq, Show)

instance Lit ConstraintPrototype where
  lit (ConstraintPrototype a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data ConstraintPrototypeQualifier
  = Extern Keyword
  | Pure Keyword
  deriving (Eq, Show)

instance Lit ConstraintPrototypeQualifier where
  lit (Extern x) = lit x
  lit (Pure x) = lit x

data ExternConstraintDeclaration
  = ExternConstraintDeclaration
      (Maybe Static)
      Keyword
      ClassScope
      ConstraintIdentifier
      ConstraintBlock
  deriving (Eq, Show)

instance Lit ExternConstraintDeclaration where
  lit (ExternConstraintDeclaration a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data IdentifierList = IdentifierList (Splits Symbol Identifier) deriving (Eq, Show)

instance Lit IdentifierList where
  lit (IdentifierList x) = lit x