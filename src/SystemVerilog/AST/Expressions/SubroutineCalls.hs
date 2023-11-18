{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Expressions.SubroutineCalls where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.ClockingBlock (ClockingEvent)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (VariableIdentifierList)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (DataType)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (ImplicitClassHandle, Primary)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (Identifier, MethodIdentifier, PsOrHierarchicalTfIdentifier, SystemTfIdentifier)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.Constraints (ConstraintBlock, IdentifierList)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren(..), Splits, Symbol)
import Util.Lit (deriveLit)

newtype ConstantFunctionCall
  = ConstantFunctionCall
      FunctionSubroutineCall
  deriving (Eq, Show)

data TfCall
  = TfCall
      PsOrHierarchicalTfIdentifier
      [AttributeInstance]
      (Maybe (Paren ListOfArguments))
  deriving (Eq, Show)

data SystemTfCall
  = MkSystemTfCallArgOptional SystemTfCallArgOptional
  | MkSystemTfCallArgDataType SystemTfCallArgDataType
  | MkSystemTfCallArgExpression SystemTfCallArgExpression
  deriving (Eq, Show)

data SystemTfCallArgOptional
  = SystemTfCallArgOptional
      SystemTfIdentifier
      (Maybe (Paren ListOfArguments))
  deriving (Eq, Show)

data SystemTfCallArgDataType
  = SystemTfCallArgDataType
      SystemTfIdentifier
      (Paren (DataType, Maybe (Symbol, Expression)))
  deriving (Eq, Show)

data SystemTfCallArgExpression
  = SystemTfCallArgExpression
      SystemTfIdentifier
      (Paren (Splits Symbol (Maybe Expression), Maybe (Symbol, Maybe ClockingEvent)))
  deriving (Eq, Show)

data SubroutineCall
  = MkTfCall TfCall
  | MkSystemTfCall SystemTfCall
  | MkMethodCall MethodCall
  | MkSubroutineCallRandomize SubroutineCallRandomize
  deriving (Eq, Show)

data SubroutineCallRandomize
  = SubroutineCallRandomize
      (Maybe (Keyword, Symbol))
      RandomizeCall
  deriving (Eq, Show)

newtype FunctionSubroutineCall
  = FunctionSubroutineCall
      SubroutineCall
  deriving (Eq, Show)

data ListOfArguments
  = MkListOfArgumentsOrdered ListOfArgumentsOrdered
  | MkListOfArgumentsNamed ListOfArgumentsNamed
  deriving (Eq, Show)

data ListOfArgumentsOrdered
  = ListOfArgumentsOrdered
      (Splits Symbol (Maybe Expression))
      [(Symbol, Symbol, Identifier, Paren (Maybe Expression))]
  deriving (Eq, Show)

data ListOfArgumentsNamed
  = ListOfArgumentsNamed
      Symbol
      Identifier
      (Paren (Maybe Expression))
      [(Symbol, Symbol, Identifier, Paren (Maybe Expression))]
  deriving (Eq, Show)

data MethodCall
  = MethodCall
      MethodCallRoot
      Symbol
      MethodCallBody
  deriving (Eq, Show)

data MethodCallBody
  = MkMethodCallBodyUser MethodCallBodyUser
  | MkBuiltInMethodCall BuiltInMethodCall
  deriving (Eq, Show)

data MethodCallBodyUser
  = MethodCallBodyUser
      MethodIdentifier
      [AttributeInstance]
      (Maybe (Paren ListOfArguments))
  deriving (Eq, Show)

data BuiltInMethodCall
  = MkArrayManipulationCall ArrayManipulationCall
  | MkRandomizeCall RandomizeCall
  deriving (Eq, Show)

data ArrayManipulationCall
  = ArrayManipulationCall
      ArrayMethodName
      [AttributeInstance]
      (Maybe (Paren ListOfArguments))
      (Maybe (Keyword, Paren Expression))
  deriving (Eq, Show)

data RandomizeCall
  = RandomizeCall
      Keyword
      [AttributeInstance]
      (Maybe (Paren (Maybe VariableIdentifierListOrNull)))
      (Maybe (Keyword, Maybe (Paren (Paren IdentifierList)), ConstraintBlock))
  deriving (Eq, Show)

data VariableIdentifierListOrNull
  = MkVariableIdentifierList VariableIdentifierList
  | MkNull Keyword
  deriving (Eq, Show)

data MethodCallRoot
  = MkPrimary Primary
  | MkImplicitClassHandle ImplicitClassHandle
  deriving (Eq, Show)

data ArrayMethodName
  = MkMethodIdentifier MethodIdentifier
  | Unique Keyword
  | And Keyword
  | Or Keyword
  | Xor Keyword
  deriving (Eq, Show)

deriveLit ''SystemTfCallArgDataType
deriveLit ''SystemTfCallArgExpression
deriveLit ''ListOfArgumentsOrdered
deriveLit ''ListOfArgumentsNamed
deriveLit ''ListOfArguments
deriveLit ''MethodCallBodyUser
deriveLit ''VariableIdentifierListOrNull
deriveLit ''MethodCallRoot
deriveLit ''ArrayMethodName
deriveLit ''ArrayManipulationCall
deriveLit ''RandomizeCall
deriveLit ''BuiltInMethodCall
deriveLit ''MethodCallBody
deriveLit ''MethodCall
deriveLit ''SubroutineCallRandomize
deriveLit ''TfCall
deriveLit ''SystemTfCallArgOptional
deriveLit ''SystemTfCall
deriveLit ''SubroutineCall
deriveLit ''FunctionSubroutineCall
deriveLit ''ConstantFunctionCall