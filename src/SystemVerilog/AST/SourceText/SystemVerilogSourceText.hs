{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SourceText.SystemVerilogSourceText where

import SystemVerilog.AST.Declarations.ModuleParameterDeclarations (LocalParameterDeclaration, ParameterDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (ClassType)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TypeDeclarations (Lifetime, PackageImportDeclaration, TypeDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (TimeLiteral)
import SystemVerilog.AST.Expressions.SubroutineCalls (ListOfArguments)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.CompilerDirectives (ResetallCompilerDirective)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (CheckerIdentifier, ClassIdentifier, InterfaceIdentifier, ModuleIdentifier, PackageIdentifier, ProgramIdentifier, PsClassIdentifier)
import SystemVerilog.AST.Instantiations.ModuleInstantiation (ParameterValueAssignment)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.CheckerItems (CheckerOrGenerateItem, CheckerPortList)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.ClassItems (ClassItem, MethodPrototype)
import SystemVerilog.AST.SourceText.ConfigurationSourceText (ConfigDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.InterfaceItems (InterfaceItem, NonPortInterfaceItem)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.ModuleItems (BindDirective, ModuleItem, NonPortModuleItem)
import SystemVerilog.AST.SourceText.ModuleParametersAndPorts (ListOfPortDeclarations, ListOfPorts, ParameterPortList)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.PackageItems (PackageItem)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.ProgramItems (NonPortProgramItem, ProgramItem)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol, WhiteSpace)
import SystemVerilog.AST.UdpDeclarartionAndInstantiation.UdpDeclaration (UdpDeclaration)
import Util.Lit (deriveLit)

data SourceText
  = SourceText
      [WhiteSpace]
      (Maybe TimeunitsDeclaration)
      [Description]
  deriving (Eq, Show)

data Description
  = MkResetallCompilerDirective ResetallCompilerDirective
  | MkModuleDeclaration ModuleDeclaration
  | MkUdpDeclaration UdpDeclaration
  | MkInterfaceDeclaration InterfaceDeclaration
  | MkInterfaceClassDeclaration InterfaceClassDeclaration
  | MkProgramDeclaration ProgramDeclaration
  | MkPackageDeclaration PackageDeclaration
  | MkDescriptionPackageItem DescriptionPackageItem
  | MkDescriptionBindDirective DescriptionBindDirective
  | MkConfigDeclaration ConfigDeclaration
  deriving (Eq, Show)

data DescriptionPackageItem
  = DescriptionPackageItem
      [AttributeInstance]
      PackageItem
  deriving (Eq, Show)

data DescriptionBindDirective
  = DescriptionBindDirective
      [AttributeInstance]
      BindDirective
  deriving (Eq, Show)

data ModuleNonansiHeader
  = ModuleNonansiHeader
      [AttributeInstance]
      ModuleKeyword
      (Maybe Lifetime)
      ModuleIdentifier
      [PackageImportDeclaration]
      (Maybe ParameterPortList)
      ListOfPorts
      Symbol
  deriving (Eq, Show)

data ModuleAnsiHeader
  = ModuleAnsiHeader
      [AttributeInstance]
      ModuleKeyword
      (Maybe Lifetime)
      ModuleIdentifier
      [PackageImportDeclaration]
      (Maybe ParameterPortList)
      (Maybe ListOfPortDeclarations)
      Symbol
  deriving (Eq, Show)

data ModuleDeclaration
  = MkModuleDeclarationNonansi ModuleDeclarationNonansi
  | MkModuleDeclarationAnsi ModuleDeclarationAnsi
  | MkModuleDeclarationWildcard ModuleDeclarationWildcard
  | MkModuleDeclarationExternNonansi ModuleDeclarationExternNonansi
  | MkModuleDeclarationExternAnsi ModuleDeclarationExternAnsi
  deriving (Eq, Show)

data ModuleDeclarationNonansi
  = ModuleDeclarationNonansi
      ModuleNonansiHeader
      (Maybe TimeunitsDeclaration)
      [ModuleItem]
      Keyword
      (Maybe (Symbol, ModuleIdentifier))
  deriving (Eq, Show)

data ModuleDeclarationAnsi
  = ModuleDeclarationAnsi
      ModuleAnsiHeader
      (Maybe TimeunitsDeclaration)
      [NonPortModuleItem]
      Keyword
      (Maybe (Symbol, ModuleIdentifier))
  deriving (Eq, Show)

data ModuleDeclarationWildcard
  = ModuleDeclarationWildcard
      [AttributeInstance]
      ModuleKeyword
      (Maybe Lifetime)
      ModuleIdentifier
      (Paren Symbol)
      Symbol
      (Maybe TimeunitsDeclaration)
      [ModuleItem]
      Keyword
      (Maybe (Symbol, ModuleIdentifier))
  deriving (Eq, Show)

data ModuleDeclarationExternNonansi
  = ModuleDeclarationExternNonansi
      Keyword
      ModuleNonansiHeader
  deriving (Eq, Show)

data ModuleDeclarationExternAnsi
  = ModuleDeclarationExternAnsi
      Keyword
      ModuleAnsiHeader
  deriving (Eq, Show)

data ModuleKeyword
  = Module Keyword
  | Macromodule Keyword
  deriving (Eq, Show)

data InterfaceDeclaration
  = MkInterfaceDeclarationNonansi InterfaceDeclarationNonansi
  | MkInterfaceDeclarationAnsi InterfaceDeclarationAnsi
  | MkInterfaceDeclarationWildcard InterfaceDeclarationWildcard
  | MkInterfaceDeclarationExternNonansi InterfaceDeclarationExternNonansi
  | MkInterfaceDeclarationExternAnsi InterfaceDeclarationExternAnsi
  deriving (Eq, Show)

data InterfaceDeclarationNonansi
  = InterfaceDeclarationNonansi
      InterfaceNonansiHeader
      (Maybe TimeunitsDeclaration)
      [InterfaceItem]
      Keyword
      (Maybe (Symbol, InterfaceIdentifier))
  deriving (Eq, Show)

data InterfaceDeclarationAnsi
  = InterfaceDeclarationAnsi
      InterfaceAnsiHeader
      (Maybe TimeunitsDeclaration)
      [NonPortInterfaceItem]
      Keyword
      (Maybe (Symbol, InterfaceIdentifier))
  deriving (Eq, Show)

data InterfaceDeclarationWildcard
  = InterfaceDeclarationWildcard
      [AttributeInstance]
      Keyword
      (Maybe Lifetime)
      InterfaceIdentifier
      (Paren Symbol)
      Symbol
      (Maybe TimeunitsDeclaration)
      [InterfaceItem]
      Keyword
      (Maybe (Symbol, InterfaceIdentifier))
  deriving (Eq, Show)

data InterfaceDeclarationExternNonansi
  = InterfaceDeclarationExternNonansi
      Keyword
      InterfaceNonansiHeader
  deriving (Eq, Show)

data InterfaceDeclarationExternAnsi
  = InterfaceDeclarationExternAnsi
      Keyword
      InterfaceAnsiHeader
  deriving (Eq, Show)

data InterfaceNonansiHeader
  = InterfaceNonansiHeader
      [AttributeInstance]
      Keyword
      (Maybe Lifetime)
      InterfaceIdentifier
      [PackageImportDeclaration]
      (Maybe ParameterPortList)
      ListOfPorts
      Symbol
  deriving (Eq, Show)

data InterfaceAnsiHeader
  = InterfaceAnsiHeader
      [AttributeInstance]
      Keyword
      (Maybe Lifetime)
      InterfaceIdentifier
      [PackageImportDeclaration]
      (Maybe ParameterPortList)
      (Maybe ListOfPortDeclarations)
      Symbol
  deriving (Eq, Show)

data ProgramDeclaration
  = MkProgramDeclarationNonansi ProgramDeclarationNonansi
  | MkProgramDeclarationAnsi ProgramDeclarationAnsi
  | MkProgramDeclarationWildcard ProgramDeclarationWildcard
  | MkProgramDeclarationExternNonansi ProgramDeclarationExternNonansi
  | MkProgramDeclarationExternAnsi ProgramDeclarationExternAnsi
  deriving (Eq, Show)

data ProgramDeclarationNonansi
  = ProgramDeclarationNonansi
      ProgramNonansiHeader
      (Maybe TimeunitsDeclaration)
      [ProgramItem]
      Keyword
      (Maybe (Symbol, ProgramIdentifier))
  deriving (Eq, Show)

data ProgramDeclarationAnsi
  = ProgramDeclarationAnsi
      ProgramAnsiHeader
      (Maybe TimeunitsDeclaration)
      [NonPortProgramItem]
      Keyword
      (Maybe (Symbol, ProgramIdentifier))
  deriving (Eq, Show)

data ProgramDeclarationWildcard
  = ProgramDeclarationWildcard
      [AttributeInstance]
      Keyword
      ProgramIdentifier
      (Paren Symbol)
      Symbol
      (Maybe TimeunitsDeclaration)
      [ProgramItem]
      Keyword
      (Maybe (Symbol, ProgramIdentifier))
  deriving (Eq, Show)

data ProgramDeclarationExternNonansi
  = ProgramDeclarationExternNonansi
      Keyword
      ProgramNonansiHeader
  deriving (Eq, Show)

data ProgramDeclarationExternAnsi
  = ProgramDeclarationExternAnsi
      Keyword
      ProgramAnsiHeader
  deriving (Eq, Show)

data ProgramNonansiHeader
  = ProgramNonansiHeader
      [AttributeInstance]
      Keyword
      (Maybe Lifetime)
      ProgramIdentifier
      [PackageImportDeclaration]
      (Maybe ParameterPortList)
      ListOfPorts
      Symbol
  deriving (Eq, Show)

data ProgramAnsiHeader
  = ProgramAnsiHeader
      [AttributeInstance]
      Keyword
      (Maybe Lifetime)
      ProgramIdentifier
      [PackageImportDeclaration]
      (Maybe ParameterPortList)
      (Maybe ListOfPortDeclarations)
      Symbol
  deriving (Eq, Show)

data CheckerDeclaration
  = CheckerDeclaration
      Keyword
      CheckerIdentifier
      (Maybe (Paren (Maybe CheckerPortList)))
      Symbol
      [([AttributeInstance], CheckerOrGenerateItem)]
      Keyword
      (Maybe (Symbol, CheckerIdentifier))
  deriving (Eq, Show)

data ClassDeclaration
  = ClassDeclaration
      (Maybe Virtual)
      Keyword
      (Maybe Lifetime)
      ClassIdentifier
      (Maybe ParameterPortList)
      (Maybe (Keyword, ClassType, Maybe (Paren ListOfArguments)))
      (Maybe (Keyword, Splits Symbol InterfaceClassType))
      Symbol
      [ClassItem]
      Keyword
      (Maybe (Symbol, ClassIdentifier))
  deriving (Eq, Show)

newtype Virtual = Virtual Keyword deriving (Eq, Show)

data InterfaceClassType
  = InterfaceClassType
      PsClassIdentifier
      (Maybe ParameterValueAssignment)
  deriving (Eq, Show)

data InterfaceClassDeclaration
  = InterfaceClassDeclaration
      Keyword
      Keyword
      ClassIdentifier
      (Maybe ParameterPortList)
      (Maybe (Keyword, Splits Symbol InterfaceClassType))
      Symbol
      [InterfaceClassItem]
      Keyword
      (Maybe (Symbol, ClassIdentifier))
  deriving (Eq, Show)

data InterfaceClassItem
  = MkTypeDeclaration TypeDeclaration
  | MkInterfaceClassItemMethod InterfaceClassItemMethod
  | MkLocalParameterDeclaration LocalParameterDeclaration Symbol
  | MkParameterDeclaration ParameterDeclaration Symbol
  | Null Symbol
  deriving (Eq, Show)

data InterfaceClassItemMethod
  = InterfaceClassItemMethod
      [AttributeInstance]
      InterfaceClassMethod
  deriving (Eq, Show)

data InterfaceClassMethod
  = InterfaceClassMethod
      Keyword
      Keyword
      MethodPrototype
      Symbol
  deriving (Eq, Show)

data PackageDeclaration
  = PackageDeclaration
      [AttributeInstance]
      Keyword
      (Maybe Lifetime)
      PackageIdentifier
      Symbol
      (Maybe TimeunitsDeclaration)
      [([AttributeInstance], PackageItem)]
      Keyword
      (Maybe (Symbol, PackageIdentifier))
  deriving (Eq, Show)

data TimeunitsDeclaration
  = MkTimeunitsDeclarationTimeunit TimeunitsDeclarationTimeunit
  | MkTimeunitsDeclarationTimeprecision TimeunitsDeclarationTimeprecision
  | MkTimeunitsDeclarationTimeunitTimeprecision TimeunitsDeclarationTimeunitTimeprecision
  | MkTimeunitsDeclarationTimeprecisionTimeunit TimeunitsDeclarationTimeprecisionTimeunit
  deriving (Eq, Show)

data TimeunitsDeclarationTimeunit
  = TimeunitsDeclarationTimeunit
      Keyword
      TimeLiteral
      (Maybe (Symbol, TimeLiteral))
      Symbol
  deriving (Eq, Show)

data TimeunitsDeclarationTimeprecision
  = TimeunitsDeclarationTimeprecision
      Keyword
      TimeLiteral
      Symbol
  deriving (Eq, Show)

data TimeunitsDeclarationTimeunitTimeprecision
  = TimeunitsDeclarationTimeunitTimeprecision
      Keyword
      TimeLiteral
      Symbol
      Keyword
      TimeLiteral
      Symbol
  deriving (Eq, Show)

data TimeunitsDeclarationTimeprecisionTimeunit
  = TimeunitsDeclarationTimeprecisionTimeunit
      Keyword
      TimeLiteral
      Symbol
      Keyword
      TimeLiteral
      Symbol
  deriving (Eq, Show)

deriveLit ''DescriptionPackageItem
deriveLit ''DescriptionBindDirective
deriveLit ''ModuleKeyword
deriveLit ''InterfaceNonansiHeader
deriveLit ''InterfaceAnsiHeader
deriveLit ''ProgramNonansiHeader
deriveLit ''ProgramAnsiHeader
deriveLit ''CheckerDeclaration
deriveLit ''Virtual
deriveLit ''InterfaceClassType
deriveLit ''InterfaceClassMethod
deriveLit ''TimeunitsDeclarationTimeunit
deriveLit ''TimeunitsDeclarationTimeprecision
deriveLit ''TimeunitsDeclarationTimeunitTimeprecision
deriveLit ''TimeunitsDeclarationTimeprecisionTimeunit
deriveLit ''TimeunitsDeclaration
deriveLit ''PackageDeclaration
deriveLit ''InterfaceClassItemMethod
deriveLit ''InterfaceClassItem
deriveLit ''InterfaceClassDeclaration
deriveLit ''ClassDeclaration
deriveLit ''ProgramDeclarationNonansi
deriveLit ''ProgramDeclarationAnsi
deriveLit ''ProgramDeclarationWildcard
deriveLit ''ProgramDeclarationExternNonansi
deriveLit ''ProgramDeclarationExternAnsi
deriveLit ''ProgramDeclaration
deriveLit ''InterfaceDeclarationNonansi
deriveLit ''InterfaceDeclarationAnsi
deriveLit ''InterfaceDeclarationWildcard
deriveLit ''InterfaceDeclarationExternNonansi
deriveLit ''InterfaceDeclarationExternAnsi
deriveLit ''InterfaceDeclaration
deriveLit ''ModuleNonansiHeader
deriveLit ''ModuleAnsiHeader
deriveLit ''ModuleDeclarationExternNonansi
deriveLit ''ModuleDeclarationExternAnsi
deriveLit ''ModuleDeclarationNonansi
deriveLit ''ModuleDeclarationAnsi
deriveLit ''ModuleDeclarationWildcard
deriveLit ''ModuleDeclaration
deriveLit ''Description
deriveLit ''SourceText