{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Instantiations.CheckerInstantiation where

import {-# SOURCE #-} SystemVerilog.AST.Declarations.AssertionDeclarations (PropertyActualArg)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (FormalPortIdentifier, PsCheckerIdentifier)
import SystemVerilog.AST.Instantiations.ModuleInstantiation (NameOfInstance)
import SystemVerilog.AST.SpecialNodes (Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data CheckerInstantiation
  = CheckerInstantiation
      PsCheckerIdentifier
      NameOfInstance
      (Paren (Maybe ListOfCheckerPortConnections))
      Symbol
  deriving (Eq, Show)

data ListOfCheckerPortConnections
  = MkListOfCheckerPortConnectionsOrdered ListOfCheckerPortConnectionsOrdered
  | MkListOfCheckerPortConnectionsNamed ListOfCheckerPortConnectionsNamed
  deriving (Eq, Show)

newtype ListOfCheckerPortConnectionsOrdered
  = ListOfCheckerPortConnectionsOrdered
      (Splits Symbol OrderedCheckerPortConnection)
  deriving (Eq, Show)

newtype ListOfCheckerPortConnectionsNamed
  = ListOfCheckerPortConnectionsNamed
      (Splits Symbol NamedCheckerPortConnection)
  deriving (Eq, Show)

data OrderedCheckerPortConnection
  = OrderedCheckerPortConnection
      [AttributeInstance]
      (Maybe PropertyActualArg)
  deriving (Eq, Show)

data NamedCheckerPortConnection
  = MkNamedCheckerPortConnectionIdentifier NamedCheckerPortConnectionIdentifier
  | MkNamedCheckerPortConnectionAsterisk NamedCheckerPortConnectionAsterisk
  deriving (Eq, Show)

data NamedCheckerPortConnectionIdentifier
  = NamedCheckerPortConnectionIdentifier
      [AttributeInstance]
      Symbol
      FormalPortIdentifier
      (Maybe (Paren (Maybe PropertyActualArg)))
  deriving (Eq, Show)

data NamedCheckerPortConnectionAsterisk
  = NamedCheckerPortConnectionAsterisk
      [AttributeInstance]
      Symbol
  deriving (Eq, Show)

deriveLit ''OrderedCheckerPortConnection
deriveLit ''NamedCheckerPortConnectionIdentifier
deriveLit ''NamedCheckerPortConnectionAsterisk
deriveLit ''NamedCheckerPortConnection
deriveLit ''ListOfCheckerPortConnectionsNamed
deriveLit ''ListOfCheckerPortConnectionsOrdered
deriveLit ''ListOfCheckerPortConnections
deriveLit ''CheckerInstantiation