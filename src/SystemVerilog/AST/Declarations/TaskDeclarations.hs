{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.Declarations.TaskDeclarations where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.LoopingStatements (Var)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (StatementOrNull)
import SystemVerilog.AST.Declarations.BlockItemDeclarations (BlockItemDeclaration)
import SystemVerilog.AST.Declarations.DeclarationLists (ListOfTfVariableIdentifiers)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.DeclarationRanges (VariableDimension)
import SystemVerilog.AST.Declarations.FunctionDeclarations (InterfaceIdentifierOrClassScope)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (DataTypeOrImplicit)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TypeDeclarations (Lifetime)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (PortIdentifier, TaskIdentifier)
import SystemVerilog.AST.SourceText.ModuleParametersAndPorts (PortDirection)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data TaskDeclaration
  = TaskDeclaration
      Keyword
      (Maybe Lifetime)
      TaskBodyDeclaration
  deriving (Eq, Show)

data TaskBodyDeclaration
  = MkTaskBodyDeclarationWithoutPort TaskBodyDeclarationWithoutPort
  | MkTaskBodyDeclarationWithPort TaskBodyDeclarationWithPort
  deriving (Eq, Show)

data TaskBodyDeclarationWithoutPort
  = TaskBodyDeclarationWithoutPort
      (Maybe InterfaceIdentifierOrClassScope)
      TaskIdentifier
      Symbol
      [TfItemDeclaration]
      [StatementOrNull]
      Keyword
      (Maybe (Symbol, TaskIdentifier))
  deriving (Eq, Show)

data TaskBodyDeclarationWithPort
  = TaskBodyDeclarationWithPort
      (Maybe InterfaceIdentifierOrClassScope)
      TaskIdentifier
      (Paren (Maybe TfPortList))
      Symbol
      [BlockItemDeclaration]
      [StatementOrNull]
      Keyword
      (Maybe (Symbol, TaskIdentifier))
  deriving (Eq, Show)

data TfItemDeclaration
  = MkBlockItemDeclaration BlockItemDeclaration
  | MkTfPortDeclaration TfPortDeclaration
  deriving (Eq, Show)

data TfPortList
  = TfPortList (Splits Symbol TfPortItem)
  deriving (Eq, Show)

data TfPortItem
  = TfPortItem
      [AttributeInstance]
      (Maybe TfPortDirection)
      (Maybe Var)
      DataTypeOrImplicit
      (Maybe (PortIdentifier, [VariableDimension], Maybe (Symbol, Expression)))
  deriving (Eq, Show)

data TfPortDirection
  = MkPortDirection PortDirection
  | ConstRef Keyword Keyword
  deriving (Eq, Show)

data TfPortDeclaration
  = TfPortDeclaration
      [AttributeInstance]
      TfPortDirection
      (Maybe Var)
      DataTypeOrImplicit
      ListOfTfVariableIdentifiers
      Symbol
  deriving (Eq, Show)

data TaskPrototype
  = TaskPrototype
      Keyword
      TaskIdentifier
      (Maybe (Paren (Maybe TfPortList)))
  deriving (Eq, Show)

deriveLit ''TfPortDirection
deriveLit ''TfPortDeclaration
deriveLit ''TfItemDeclaration
deriveLit ''TfPortItem
deriveLit ''TfPortList
deriveLit ''TaskBodyDeclarationWithPort
deriveLit ''TaskBodyDeclarationWithoutPort
deriveLit ''TaskPrototype
deriveLit ''TaskBodyDeclaration
deriveLit ''TaskDeclaration