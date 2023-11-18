{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Declarations.FunctionDeclarations where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (FunctionStatementOrNull)
import SystemVerilog.AST.Declarations.BlockItemDeclarations (BlockItemDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (ClassScope, DataTypeOrVoid, ImplicitDataType)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TaskDeclarations (TaskPrototype, TfItemDeclaration, TfPortList)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TypeDeclarations (Lifetime)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (CIdentifier, FunctionIdentifier, InterfaceIdentifier, TaskIdentifier)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Symbol)
import Util.Lit (deriveLit)

data FunctionDataTypeOrImplicit
  = MkDataTypeOrVoid DataTypeOrVoid
  | MkImplicitDataType ImplicitDataType
  deriving (Eq, Show)

data FunctionDeclaration
  = FunctionDeclaration
      Keyword
      (Maybe Lifetime)
      FunctionBodyDeclaration
  deriving (Eq, Show)

data FunctionBodyDeclaration
  = MkFunctionBodyDeclarationWithoutPort FunctionBodyDeclarationWithoutPort
  | MkFunctionBodyDeclarationWithPort FunctionBodyDeclarationWithPort
  deriving (Eq, Show)

data FunctionBodyDeclarationWithoutPort
  = FunctionBodyDeclarationWithoutPort
      FunctionDataTypeOrImplicit
      (Maybe InterfaceIdentifierOrClassScope)
      FunctionIdentifier
      Symbol
      [TfItemDeclaration]
      [FunctionStatementOrNull]
      Keyword
      (Maybe (Symbol, FunctionIdentifier))
  deriving (Eq, Show)

data FunctionBodyDeclarationWithPort
  = FunctionBodyDeclarationWithPort
      FunctionDataTypeOrImplicit
      (Maybe InterfaceIdentifierOrClassScope)
      FunctionIdentifier
      (Paren (Maybe TfPortList))
      Symbol
      [BlockItemDeclaration]
      [FunctionStatementOrNull]
      Keyword
      (Maybe (Symbol, FunctionIdentifier))
  deriving (Eq, Show)

data InterfaceIdentifierOrClassScope
  = MkInterfaceIdentifier InterfaceIdentifier Symbol
  | MkClassScope ClassScope
  deriving (Eq, Show)

data FunctionPrototype
  = FunctionPrototype
      Keyword
      DataTypeOrVoid
      FunctionIdentifier
      (Maybe (Paren (Maybe TfPortList)))
  deriving (Eq, Show)

data DpiImportExport
  = MkDpiImportExportImportFunction DpiImportExportImportFunction
  | MkDpiImportExportImportTask DpiImportExportImportTask
  | MkDpiImportExportExportFunction DpiImportExportExportFunction
  | MkDpiImportExportExportTask DpiImportExportExportTask
  deriving (Eq, Show)

data DpiImportExportImportFunction
  = DpiImportExportImportFunction
      Keyword
      DpiSpecString
      (Maybe DpiFunctionImportProperty)
      (Maybe (CIdentifier, Symbol))
      DpiFunctionProto
      Symbol
  deriving (Eq, Show)

data DpiImportExportImportTask
  = DpiImportExportImportTask
      Keyword
      DpiSpecString
      (Maybe DpiTaskImportProperty)
      (Maybe (CIdentifier, Symbol))
      DpiTaskProto
      Symbol
  deriving (Eq, Show)

data DpiImportExportExportFunction
  = DpiImportExportExportFunction
      Keyword
      DpiSpecString
      (Maybe (CIdentifier, Symbol))
      Keyword
      FunctionIdentifier
      Symbol
  deriving (Eq, Show)

data DpiImportExportExportTask
  = DpiImportExportExportTask
      Keyword
      DpiSpecString
      (Maybe (CIdentifier, Symbol))
      Keyword
      TaskIdentifier
      Symbol
  deriving (Eq, Show)

data DpiSpecString
  = DpiC Keyword
  | Dpi Keyword
  deriving (Eq, Show)

data DpiFunctionImportProperty
  = Context Keyword
  | Pure Keyword
  deriving (Eq, Show)

newtype DpiTaskImportProperty = DpiTaskImportProperty Keyword deriving (Eq, Show)

newtype DpiFunctionProto = DpiFunctionProto FunctionPrototype deriving (Eq, Show)

newtype DpiTaskProto = DpiTaskProto TaskPrototype deriving (Eq, Show)

deriveLit ''FunctionDataTypeOrImplicit
deriveLit ''InterfaceIdentifierOrClassScope
deriveLit ''FunctionPrototype
deriveLit ''DpiSpecString
deriveLit ''DpiFunctionImportProperty
deriveLit ''DpiTaskImportProperty
deriveLit ''DpiFunctionProto
deriveLit ''DpiTaskProto
deriveLit ''DpiImportExportImportFunction
deriveLit ''DpiImportExportImportTask
deriveLit ''DpiImportExportExportFunction
deriveLit ''DpiImportExportExportTask
deriveLit ''DpiImportExport
deriveLit ''FunctionBodyDeclarationWithoutPort
deriveLit ''FunctionBodyDeclarationWithPort
deriveLit ''FunctionBodyDeclaration
deriveLit ''FunctionDeclaration