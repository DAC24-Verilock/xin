{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Declarations.PortDeclarations where

import SystemVerilog.AST.Declarations.DeclarationLists (ListOfInterfaceIdentifiers, ListOfPortIdentifiers, ListOfVariableIdentifiers, ListOfVariablePortIdentifiers)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (NetPortType, VariablePortType)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (InterfaceIdentifier, ModportIdentifier)
import SystemVerilog.AST.SpecialNodes (Keyword, Symbol)
import Util.Lit (deriveLit)

data InoutDeclaration
  = InoutDeclaration
      Keyword
      NetPortType
      ListOfPortIdentifiers
  deriving (Eq, Show)

data InputDeclaration
  = MkInputDeclarationNet InputDeclarationNet
  | MkInputDeclarationVariable InputDeclarationVariable
  deriving (Eq, Show)

data InputDeclarationNet
  = InputDeclarationNet
      Keyword
      NetPortType
      ListOfPortIdentifiers
  deriving (Eq, Show)

data InputDeclarationVariable
  = InputDeclarationVariable
      Keyword
      VariablePortType
      ListOfVariableIdentifiers
  deriving (Eq, Show)

data OutputDeclaration
  = MkOutputDeclarationNet OutputDeclarationNet
  | MkOutputDeclarationVariable OutputDeclarationVariable
  deriving (Eq, Show)

data OutputDeclarationNet
  = OutputDeclarationNet
      Keyword
      NetPortType
      ListOfPortIdentifiers
  deriving (Eq, Show)

data OutputDeclarationVariable
  = OutputDeclarationVariable
      Keyword
      VariablePortType
      ListOfVariablePortIdentifiers
  deriving (Eq, Show)

data InterfacePortDeclaration
  = InterfacePortDeclaration
      InterfaceIdentifier
      (Maybe (Symbol, ModportIdentifier))
      ListOfInterfaceIdentifiers
  deriving (Eq, Show)

data RefDeclaration
  = RefDeclaration
      Keyword
      VariablePortType
      ListOfVariableIdentifiers
  deriving (Eq, Show)

deriveLit ''InoutDeclaration
deriveLit ''InputDeclarationNet
deriveLit ''InputDeclarationVariable
deriveLit ''OutputDeclarationNet
deriveLit ''OutputDeclarationVariable
deriveLit ''InterfacePortDeclaration
deriveLit ''RefDeclaration
deriveLit ''OutputDeclaration
deriveLit ''InputDeclaration