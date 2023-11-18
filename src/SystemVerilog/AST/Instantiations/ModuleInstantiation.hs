{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Instantiations.ModuleInstantiation where

import {-# SOURCE #-} SystemVerilog.AST.Declarations.DeclarationRanges (UnpackedDimension)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression, ParamExpression)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (InstanceIdentifier, ModuleIdentifier, ParameterIdentifier, PortIdentifier)
import SystemVerilog.AST.SpecialNodes (Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data ModuleInstantiation
  = ModuleInstantiation
      ModuleIdentifier
      (Maybe ParameterValueAssignment)
      (Splits Symbol HierarchicalInstance)
      Symbol
  deriving (Eq, Show)

data ParameterValueAssignment
  = ParameterValueAssignment
      Symbol
      (Paren (Maybe ListOfParameterAssignments))
  deriving (Eq, Show)

data ListOfParameterAssignments
  = MkListOfParameterAssignmentsOrdered ListOfParameterAssignmentsOrdered
  | MkListOfParameterAssignmentsNamed ListOfParameterAssignmentsNamed
  deriving (Eq, Show)

newtype ListOfParameterAssignmentsOrdered
  = ListOfParameterAssignmentsOrdered
      (Splits Symbol OrderedParameterAssignment)
  deriving (Eq, Show)

newtype ListOfParameterAssignmentsNamed
  = ListOfParameterAssignmentsNamed
      (Splits Symbol NamedParameterAssignment)
  deriving (Eq, Show)

newtype OrderedParameterAssignment
  = OrderedParameterAssignment
      ParamExpression
  deriving (Eq, Show)

data NamedParameterAssignment
  = NamedParameterAssignment
      Symbol
      ParameterIdentifier
      (Paren (Maybe ParamExpression))
  deriving (Eq, Show)

data HierarchicalInstance
  = HierarchicalInstance
      NameOfInstance
      (Paren (Maybe ListOfPortConnections))
  deriving (Eq, Show)

data NameOfInstance
  = NameOfInstance
      InstanceIdentifier
      [UnpackedDimension]
  deriving (Eq, Show)

data ListOfPortConnections
  = MkListOfPortConnectionsOrdered ListOfPortConnectionsOrdered
  | MkListOfPortConnectionsNamed ListOfPortConnectionsNamed
  deriving (Eq, Show)

newtype ListOfPortConnectionsOrdered
  = ListOfPortConnectionsOrdered
      (Splits Symbol OrderedPortConnection)
  deriving (Eq, Show)

newtype ListOfPortConnectionsNamed
  = ListOfPortConnectionsNamed
      (Splits Symbol NamedPortConnection)
  deriving (Eq, Show)

data OrderedPortConnection
  = OrderedPortConnection
      [AttributeInstance]
      (Maybe Expression)
  deriving (Eq, Show)

data NamedPortConnection
  = MkNamedPortConnectionIdentifier NamedPortConnectionIdentifier
  | MkNamedPortConnectionAsterisk NamedPortConnectionAsterisk
  deriving (Eq, Show)

data NamedPortConnectionIdentifier
  = NamedPortConnectionIdentifier
      [AttributeInstance]
      Symbol
      PortIdentifier
      (Maybe (Paren (Maybe Expression)))
  deriving (Eq, Show)

data NamedPortConnectionAsterisk
  = NamedPortConnectionAsterisk
      [AttributeInstance]
      Symbol
  deriving (Eq, Show)

deriveLit ''OrderedParameterAssignment
deriveLit ''NamedParameterAssignment
deriveLit ''NameOfInstance
deriveLit ''OrderedPortConnection
deriveLit ''NamedPortConnectionIdentifier
deriveLit ''NamedPortConnectionAsterisk
deriveLit ''NamedPortConnection
deriveLit ''ListOfPortConnectionsOrdered
deriveLit ''ListOfPortConnectionsNamed
deriveLit ''ListOfPortConnections
deriveLit ''HierarchicalInstance
deriveLit ''ListOfParameterAssignmentsOrdered
deriveLit ''ListOfParameterAssignmentsNamed
deriveLit ''ListOfParameterAssignments
deriveLit ''ParameterValueAssignment
deriveLit ''ModuleInstantiation