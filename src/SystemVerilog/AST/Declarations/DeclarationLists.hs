{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Declarations.DeclarationLists where

import SystemVerilog.AST.Declarations.DeclarationAssignments (DefparamAssignment, NetDeclAssignment, ParamAssignment, SpecparamAssignment, TypeAssignment, VariableDeclAssignment)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.DeclarationRanges (UnpackedDimension, VariableDimension)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression, Expression)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (GenvarIdentifier, InterfaceIdentifier, PortIdentifier, VariableIdentifier)
import SystemVerilog.AST.SpecialNodes (Splits, Symbol)
import Util.Lit (deriveLit)

newtype ListOfDefparamAssignments
  = ListOfDefparamAssignments (Splits Symbol DefparamAssignment)
  deriving (Eq, Show)

newtype ListOfGenvarIdentifiers
  = ListOfGenvarIdentifiers (Splits Symbol GenvarIdentifier)
  deriving (Eq, Show)

newtype ListOfInterfaceIdentifiers
  = ListOfInterfaceIdentifiers
      (Splits Symbol (InterfaceIdentifier, [UnpackedDimension]))
  deriving (Eq, Show)

newtype ListOfNetDeclAssignments
  = ListOfNetDeclAssignments
      (Splits Symbol NetDeclAssignment)
  deriving (Eq, Show)

newtype ListOfParamAssignments
  = ListOfParamAssignments
      (Splits Symbol ParamAssignment)
  deriving (Eq, Show)

newtype ListOfPortIdentifiers
  = ListOfPortIdentifiers
      (Splits Symbol (PortIdentifier, [UnpackedDimension]))
  deriving (Eq, Show)

newtype ListOfUdpPortIdentifiers
  = ListOfUdpPortIdentifiers
      (Splits Symbol PortIdentifier)
  deriving (Eq, Show)

newtype ListOfSpecparamAssignments
  = ListOfSpecparamAssignments
      (Splits Symbol SpecparamAssignment)
  deriving (Eq, Show)

newtype ListOfTfVariableIdentifiers
  = ListOfTfVariableIdentifiers
      (Splits Symbol (PortIdentifier, [VariableDimension], Maybe (Symbol, Expression)))
  deriving (Eq, Show)

newtype ListOfTypeAssignments
  = ListOfTypeAssignments
      (Splits Symbol TypeAssignment)
  deriving (Eq, Show)

newtype ListOfVariableDeclAssignments
  = ListOfVariableDeclAssignments
      (Splits Symbol VariableDeclAssignment)
  deriving (Eq, Show)

newtype ListOfVariableIdentifiers
  = ListOfVariableIdentifiers
      (Splits Symbol (VariableIdentifier, [VariableDimension]))
  deriving (Eq, Show)

newtype ListOfVariablePortIdentifiers
  = ListOfVariablePortIdentifiers
      (Splits Symbol (PortIdentifier, [VariableDimension], Maybe (Symbol, ConstantExpression)))
  deriving (Eq, Show)

deriveLit ''ListOfDefparamAssignments
deriveLit ''ListOfGenvarIdentifiers
deriveLit ''ListOfInterfaceIdentifiers
deriveLit ''ListOfNetDeclAssignments
deriveLit ''ListOfParamAssignments
deriveLit ''ListOfPortIdentifiers
deriveLit ''ListOfUdpPortIdentifiers
deriveLit ''ListOfSpecparamAssignments
deriveLit ''ListOfTfVariableIdentifiers
deriveLit ''ListOfTypeAssignments
deriveLit ''ListOfVariableDeclAssignments
deriveLit ''ListOfVariableIdentifiers
deriveLit ''ListOfVariablePortIdentifiers
