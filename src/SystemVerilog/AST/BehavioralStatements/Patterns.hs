{-# HLINT ignore "Use newtype instead of data" #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.BehavioralStatements.Patterns where

import qualified Data.Text as T
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (IntegerAtomType, SimpleType, TypeReference)
import SystemVerilog.AST.Expressions.ExpressionLeftsideValues (NetLvalue, VariableLvalue)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions
  ( ConstantExpression,
    Expression,
  )
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers
  ( MemberIdentifier,
    PsParameterIdentifier,
    PsTypeIdentifier,
    VariableIdentifier,
  )
import SystemVerilog.AST.SpecialNodes (ApostropheBrace, Brace, Keyword, Splits, Symbol)
import Util.Lit (Lit(..))

data Pattern
  = MkPatternVariable PatternVariable
  | MkSymbol Symbol
  | MkConstantExpression ConstantExpression
  | MkPatternTagged PatternTagged
  | MkPatternList PatternList
  | MkPatternIdentifierList PatternIdentifierList
  deriving (Eq, Show)

instance Lit Pattern where
  lit (MkPatternVariable x) = lit x
  lit (MkSymbol x) = lit x
  lit (MkConstantExpression x) = lit x
  lit (MkPatternTagged x) = lit x
  lit (MkPatternList x) = lit x
  lit (MkPatternIdentifierList x) = lit x

data PatternVariable
  = PatternVariable Symbol VariableIdentifier
  deriving (Eq, Show)

instance Lit PatternVariable where
  lit (PatternVariable a b) = lit a `T.append` lit b

data PatternTagged
  = PatternTagged
      Keyword
      MemberIdentifier
      (Maybe Pattern)
  deriving (Eq, Show)

instance Lit PatternTagged where
  lit (PatternTagged a b c) = T.concat [lit a, lit b, lit c]

data PatternList
  = PatternList (ApostropheBrace (Splits Symbol Pattern))
  deriving (Eq, Show)

instance Lit PatternList where
  lit (PatternList x) = lit x

data PatternIdentifierList
  = PatternIdentifierList (ApostropheBrace (Splits Symbol (MemberIdentifier, Symbol, Pattern)))
  deriving (Eq, Show)

instance Lit PatternIdentifierList where
  lit (PatternIdentifierList x) = lit x

data AssignmentPattern
  = MkAssignmentPatternList AssignmentPatternList
  | MkAssignmentPatternStructure AssignmentPatternStructure
  | MkAssignmentPatternArray AssignmentPatternArray
  | MkAssignmentPatternRepeat AssignmentPatternRepeat
  deriving (Eq, Show)

instance Lit AssignmentPattern where
  lit (MkAssignmentPatternList x) = lit x
  lit (MkAssignmentPatternStructure x) = lit x
  lit (MkAssignmentPatternArray x) = lit x
  lit (MkAssignmentPatternRepeat x) = lit x

data AssignmentPatternList
  = AssignmentPatternList (ApostropheBrace (Splits Symbol Expression))
  deriving (Eq, Show)

instance Lit AssignmentPatternList where
  lit (AssignmentPatternList x) = lit x

data AssignmentPatternStructure
  = AssignmentPatternStructure (ApostropheBrace (Splits Symbol (StructurePatternKey, Symbol, Expression)))
  deriving (Eq, Show)

instance Lit AssignmentPatternStructure where
  lit (AssignmentPatternStructure x) = lit x

data AssignmentPatternArray
  = AssignmentPatternArray (ApostropheBrace (Splits Symbol (ArrayPatternKey, Symbol, Expression)))
  deriving (Eq, Show)

instance Lit AssignmentPatternArray where
  lit (AssignmentPatternArray x) = lit x

data AssignmentPatternRepeat
  = AssignmentPatternRepeat (ApostropheBrace (ConstantExpression, Brace (Splits Symbol Expression)))
  deriving (Eq, Show)

instance Lit AssignmentPatternRepeat where
  lit (AssignmentPatternRepeat x) = lit x

data StructurePatternKey
  = MkMemberIdentifier MemberIdentifier
  | MkAssignmentPatternKey AssignmentPatternKey
  deriving (Eq, Show)

instance Lit StructurePatternKey where
  lit (MkMemberIdentifier x) = lit x
  lit (MkAssignmentPatternKey x) = lit x

data ArrayPatternKey
  = MkArrayPatternKeyConstantExpression ConstantExpression
  | MkArrayPatternKeyAssignmentPatternKey AssignmentPatternKey
  deriving (Eq, Show)

instance Lit ArrayPatternKey where
  lit (MkArrayPatternKeyConstantExpression x) = lit x
  lit (MkArrayPatternKeyAssignmentPatternKey x) = lit x

data AssignmentPatternKey
  = MkSimpleType SimpleType
  | MkKeyword Keyword
  deriving (Eq, Show)

instance Lit AssignmentPatternKey where
  lit (MkSimpleType x) = lit x
  lit (MkKeyword x) = lit x

data AssignmentPatternExpression
  = AssignmentPatternExpression
      (Maybe AssignmentPatternExpressionType)
      AssignmentPattern
  deriving (Eq, Show)

instance Lit AssignmentPatternExpression where
  lit (AssignmentPatternExpression a b) = lit a `T.append` lit b

data AssignmentPatternExpressionType
  = MkPsTypeIdentifier PsTypeIdentifier
  | MkPsParameterIdentifier PsParameterIdentifier
  | MkIntegerAtomType IntegerAtomType
  | MkTypeReference TypeReference
  deriving (Eq, Show)

instance Lit AssignmentPatternExpressionType where
  lit (MkPsTypeIdentifier x) = lit x
  lit (MkPsParameterIdentifier x) = lit x
  lit (MkIntegerAtomType x) = lit x
  lit (MkTypeReference x) = lit x

data ConstantAssignmentPatternExpression
  = ConstantAssignmentPatternExpression AssignmentPatternExpression
  deriving (Eq, Show)

instance Lit ConstantAssignmentPatternExpression where
  lit (ConstantAssignmentPatternExpression x) = lit x

data AssignmentPatternNetLvalue
  = AssignmentPatternNetLvalue (ApostropheBrace (Splits Symbol NetLvalue))
  deriving (Eq, Show)

instance Lit AssignmentPatternNetLvalue where
  lit (AssignmentPatternNetLvalue x) = lit x

data AssignmentPatternVariableLvalue
  = AssignmentPatternVariableLvalue (ApostropheBrace (Splits Symbol VariableLvalue))
  deriving (Eq, Show)

instance Lit AssignmentPatternVariableLvalue where
  lit (AssignmentPatternVariableLvalue x) = lit x