{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SourceText.InterfaceItems where

import SystemVerilog.AST.Declarations.InterfaceDeclarations (ModportDeclaration)
import SystemVerilog.AST.Declarations.TaskDeclarations (TaskPrototype)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.Instantiations.GeneratedInstantiation (GenerateRegion)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.ClassItems (MethodPrototype)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.ModuleItems (ModuleCommonItem)
import SystemVerilog.AST.SourceText.ModuleParametersAndPorts (PortDeclaration)
import SystemVerilog.AST.SourceText.SystemVerilogSourceText (InterfaceDeclaration, ProgramDeclaration, TimeunitsDeclaration)
import SystemVerilog.AST.SpecialNodes (Keyword, Symbol)
import Util.Lit (deriveLit)

data InterfaceOrGenerateItem
  = MkInterfaceOrGenerateItemModule InterfaceOrGenerateItemModule
  | MkInterfaceOrGenerateItemExtern InterfaceOrGenerateItemExtern
  deriving (Eq, Show)

data InterfaceOrGenerateItemModule
  = InterfaceOrGenerateItemModule
      [AttributeInstance]
      ModuleCommonItem
  deriving (Eq, Show)

data InterfaceOrGenerateItemExtern
  = InterfaceOrGenerateItemExtern
      [AttributeInstance]
      ExternTfDeclaration
  deriving (Eq, Show)

data ExternTfDeclaration
  = MkExternTfDeclarationMethod ExternTfDeclarationMethod
  | MkExternTfDeclarationTask ExternTfDeclarationTask
  deriving (Eq, Show)

data ExternTfDeclarationMethod
  = ExternTfDeclarationMethod
      Keyword
      MethodPrototype
      Symbol
  deriving (Eq, Show)

data ExternTfDeclarationTask
  = ExternTfDeclarationTask
      Keyword
      Keyword
      TaskPrototype
      Symbol
  deriving (Eq, Show)

data InterfaceItem
  = MkPortDeclaration PortDeclaration Symbol
  | MkNonPortInterfaceItem NonPortInterfaceItem
  deriving (Eq, Show)

data NonPortInterfaceItem
  = MkGenerateRegion GenerateRegion
  | MkInterfaceOrGenerateItem InterfaceOrGenerateItem
  | MkProgramDeclaration ProgramDeclaration
  | MkModportDeclaration ModportDeclaration
  | MkInterfaceDeclaration InterfaceDeclaration
  | MkTimeunitsDeclaration TimeunitsDeclaration
  deriving (Eq, Show)

deriveLit ''InterfaceOrGenerateItemModule
deriveLit ''ExternTfDeclarationMethod
deriveLit ''ExternTfDeclarationTask
deriveLit ''ExternTfDeclaration
deriveLit ''InterfaceOrGenerateItemExtern
deriveLit ''InterfaceOrGenerateItem
deriveLit ''NonPortInterfaceItem
deriveLit ''InterfaceItem