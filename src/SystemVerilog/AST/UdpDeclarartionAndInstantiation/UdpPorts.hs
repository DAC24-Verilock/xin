{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.UdpDeclarartionAndInstantiation.UdpPorts where

import SystemVerilog.AST.Declarations.DeclarationLists (ListOfUdpPortIdentifiers)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (InputPortIdentifier, OutputPortIdentifier, PortIdentifier, VariableIdentifier)
import SystemVerilog.AST.SpecialNodes (Keyword, Splits, Symbol)
import Util.Lit (deriveLit)

data UdpPortList
  = UdpPortList
      OutputPortIdentifier
      Symbol
      (Splits Symbol InputPortIdentifier)
  deriving (Eq, Show)

data UdpDeclarationPortList
  = UdpDeclarationPortList
      UdpOutputDeclaration
      Symbol
      (Splits Symbol UdpInputDeclaration)
  deriving (Eq, Show)

data UdpPortDeclaration
  = MkUdpOutputDeclaration UdpOutputDeclaration Symbol
  | MkUdpInputDeclaration UdpInputDeclaration Symbol
  | MkUdpRegDeclaration UdpRegDeclaration Symbol
  deriving (Eq, Show)

data UdpOutputDeclaration
  = MkUdpOutputDeclarationNonreg UdpOutputDeclarationNonreg
  | MkUdpOutputDeclarationReg UdpOutputDeclarationReg
  deriving (Eq, Show)

data UdpOutputDeclarationNonreg
  = UdpOutputDeclarationNonreg
      [AttributeInstance]
      Keyword
      PortIdentifier
  deriving (Eq, Show)

data UdpOutputDeclarationReg
  = UdpOutputDeclarationReg
      [AttributeInstance]
      Keyword
      Keyword
      PortIdentifier
      (Maybe (Symbol, ConstantExpression))
  deriving (Eq, Show)

data UdpInputDeclaration
  = UdpInputDeclaration
      [AttributeInstance]
      Keyword
      ListOfUdpPortIdentifiers
  deriving (Eq, Show)

data UdpRegDeclaration
  = UdpRegDeclaration
      [AttributeInstance]
      Keyword
      VariableIdentifier
  deriving (Eq, Show)

deriveLit ''UdpPortList
deriveLit ''UdpOutputDeclarationNonreg
deriveLit ''UdpOutputDeclarationReg
deriveLit ''UdpInputDeclaration
deriveLit ''UdpRegDeclaration
deriveLit ''UdpOutputDeclaration
deriveLit ''UdpPortDeclaration
deriveLit ''UdpDeclarationPortList