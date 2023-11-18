{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Declarations.LetDeclarations where

import SystemVerilog.AST.Declarations.DeclarationRanges (VariableDimension)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (DataTypeOrImplicit)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (FormalPortIdentifier, Identifier, PackageScope)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data LetDeclaration
  = LetDeclaration
      Keyword
      LetIdentifier
      (Maybe (Paren (Maybe LetPortList)))
      Symbol
      Expression
      Symbol
  deriving (Eq, Show)

newtype LetIdentifier = LetIdentifier Identifier deriving (Eq, Show)

newtype LetPortList = LetPortList (Splits Symbol LetPortItem) deriving (Eq, Show)

data LetPortItem
  = LetPortItem
      [AttributeInstance]
      LetFormalType
      FormalPortIdentifier
      [VariableDimension]
      (Maybe (Symbol, Expression))
  deriving (Eq, Show)

data LetFormalType
  = MkDataTypeOrImplicit DataTypeOrImplicit
  | Untyped Keyword
  deriving (Eq, Show)

data LetExpression
  = LetExpression
      (Maybe PackageScope)
      LetIdentifier
      (Maybe (Paren (Maybe LetListOfArguments)))
  deriving (Eq, Show)

data LetListOfArguments
  = MkLetListOfArgumentsOrdered LetListOfArgumentsOrdered
  | MkLetListOfArgumentsNamed LetListOfArgumentsNamed
  deriving (Eq, Show)

data LetListOfArgumentsOrdered
  = LetListOfArgumentsOrdered
      (Splits Symbol (Maybe LetActualArg))
      [(Symbol, Symbol, Identifier, Paren (Maybe LetActualArg))]
  deriving (Eq, Show)

newtype LetListOfArgumentsNamed
  = LetListOfArgumentsNamed
      (Splits Symbol (Symbol, Identifier, Paren (Maybe LetActualArg)))
  deriving (Eq, Show)

newtype LetActualArg = LetActualArg Expression deriving (Eq, Show)

deriveLit ''LetIdentifier
deriveLit ''LetFormalType
deriveLit ''LetActualArg
deriveLit ''LetListOfArgumentsOrdered
deriveLit ''LetListOfArgumentsNamed
deriveLit ''LetListOfArguments
deriveLit ''LetExpression
deriveLit ''LetPortItem
deriveLit ''LetPortList
deriveLit ''LetDeclaration