{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.UdpDeclarartionAndInstantiation.UdpDeclaration where

import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (UdpIdentifier)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Symbol)
import SystemVerilog.AST.UdpDeclarartionAndInstantiation.UdpBody (UdpBody)
import SystemVerilog.AST.UdpDeclarartionAndInstantiation.UdpPorts (UdpDeclarationPortList, UdpPortDeclaration, UdpPortList)
import Util.Lit (deriveLit)

data UdpNonansiDeclaration
  = UdpNonansiDeclaration
      [AttributeInstance]
      Keyword
      UdpIdentifier
      (Paren UdpPortList)
      Symbol
  deriving (Eq, Show)

data UdpAnsiDeclaration
  = UdpAnsiDeclaration
      [AttributeInstance]
      Keyword
      UdpIdentifier
      (Paren UdpDeclarationPortList)
      Symbol
  deriving (Eq, Show)

data UdpDeclaration
  = MkUdpDeclarationNonansi UdpDeclarationNonansi
  | MkUdpDeclarationAnsi UdpDeclarationAnsi
  | MkUdpDeclarationExternNonansi UdpDeclarationExternNonansi
  | MkUdpDeclarationExternAnsi UdpDeclarationExternAnsi
  | MkUdpDeclarationWildcard UdpDeclarationWildcard
  deriving (Eq, Show)

data UdpDeclarationNonansi
  = UdpDeclarationNonansi
      UdpNonansiDeclaration
      UdpPortDeclaration
      [UdpPortDeclaration]
      UdpBody
      Keyword
      (Maybe (Symbol, UdpIdentifier))
  deriving (Eq, Show)

data UdpDeclarationAnsi
  = UdpDeclarationAnsi
      UdpAnsiDeclaration
      UdpBody
      Keyword
      (Maybe (Symbol, UdpIdentifier))
  deriving (Eq, Show)

data UdpDeclarationExternNonansi
  = UdpDeclarationExternNonansi
      Keyword
      UdpNonansiDeclaration
  deriving (Eq, Show)

data UdpDeclarationExternAnsi
  = UdpDeclarationExternAnsi
      Keyword
      UdpAnsiDeclaration
  deriving (Eq, Show)

data UdpDeclarationWildcard
  = UdpDeclarationWildcard
      [AttributeInstance]
      Keyword
      UdpIdentifier
      (Paren Symbol)
      Symbol
      [UdpPortDeclaration]
      UdpBody
      Keyword
      (Maybe (Symbol, UdpIdentifier))
  deriving (Eq, Show)

deriveLit ''UdpNonansiDeclaration
deriveLit ''UdpAnsiDeclaration
deriveLit ''UdpDeclarationNonansi
deriveLit ''UdpDeclarationAnsi
deriveLit ''UdpDeclarationExternNonansi
deriveLit ''UdpDeclarationExternAnsi
deriveLit ''UdpDeclarationWildcard
deriveLit ''UdpDeclaration