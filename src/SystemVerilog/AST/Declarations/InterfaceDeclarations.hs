{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Declarations.InterfaceDeclarations where

import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (ClockingIdentifier, ModportIdentifier, PortIdentifier, TfIdentifier)
import SystemVerilog.AST.SourceText.ClassItems (MethodPrototype)
import SystemVerilog.AST.SourceText.ModuleParametersAndPorts (PortDirection)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data ModportDeclaration
  = ModportDeclaration
      Keyword
      (Splits Symbol ModportItem)
      Symbol
  deriving (Eq, Show)

data ModportItem
  = ModportItem
      ModportIdentifier
      (Paren (Splits Symbol ModportPortsDeclaration))
  deriving (Eq, Show)

data ModportPortsDeclaration
  = MkModportPortsDeclarationSimple
  | MkModportPortsDeclarationTf
  | MkModportPortsDeclarationClocking
  deriving (Eq, Show)

data ModportPortsDeclarationSimple
  = ModportPortsDeclarationSimple
      [AttributeInstance]
      ModportSimplePortsDeclaration
  deriving (Eq, Show)

data ModportPortsDeclarationTf
  = ModportPortsDeclarationTf
      [AttributeInstance]
      ModportTfPortsDeclaration
  deriving (Eq, Show)

data ModportPortsDeclarationClocking
  = ModportPortsDeclarationClocking
      [AttributeInstance]
      ModportClockingDeclaration
  deriving (Eq, Show)

data ModportClockingDeclaration
  = ModportClockingDeclaration
      Keyword
      ClockingIdentifier
  deriving (Eq, Show)

data ModportSimplePortsDeclaration
  = ModportSimplePortsDeclaration
      PortDirection
      (Splits Symbol ModportSimplePort)
  deriving (Eq, Show)

data ModportSimplePort
  = MkModportSimplePortOrdered ModportSimplePortOrdered
  | MkModportSimplePortNamed ModportSimplePortNamed
  deriving (Eq, Show)

newtype ModportSimplePortOrdered = ModportSimplePortOrdered PortIdentifier deriving (Eq, Show)

data ModportSimplePortNamed
  = ModportSimplePortNamed
      Symbol
      PortIdentifier
      (Paren (Maybe Expression))
  deriving (Eq, Show)

data ModportTfPortsDeclaration
  = ModportTfPortsDeclaration
      ImportExport
      (Splits Symbol ModportTfPort)
  deriving (Eq, Show)

data ModportTfPort
  = MkMethodPrototype MethodPrototype
  | MkTfIdentifier TfIdentifier
  deriving (Eq, Show)

data ImportExport
  = Import Keyword
  | Export Keyword
  deriving (Eq, Show)

deriveLit ''ModportPortsDeclaration
deriveLit ''ModportClockingDeclaration
deriveLit ''ModportSimplePortOrdered
deriveLit ''ModportSimplePortNamed
deriveLit ''ModportTfPort
deriveLit ''ImportExport
deriveLit ''ModportTfPortsDeclaration
deriveLit ''ModportSimplePort
deriveLit ''ModportSimplePortsDeclaration
deriveLit ''ModportPortsDeclarationSimple
deriveLit ''ModportPortsDeclarationTf
deriveLit ''ModportPortsDeclarationClocking
deriveLit ''ModportItem
deriveLit ''ModportDeclaration