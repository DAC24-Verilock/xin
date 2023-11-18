{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Declarations.DeclarationAssignments where

import {-# SOURCE #-} SystemVerilog.AST.Declarations.DeclarationRanges (UnpackedDimension, UnsizedDimension, VariableDimension)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (ClassScope, DataType)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantMintypmaxExpression, ConstantParamExpression, Expression)
import SystemVerilog.AST.Expressions.SubroutineCalls (ListOfArguments)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (ClassVariableIdentifier, DynamicArrayVariableIdentifier, HierarchicalParameterIdentifier, NetIdentifier, ParameterIdentifier, SpecparamIdentifier, TypeIdentifier, VariableIdentifier)
import SystemVerilog.AST.SpecialNodes (Bracket, Keyword, Paren, Symbol)
import SystemVerilog.AST.SpecifySection.SpecifyBlockTerminals (SpecifyInputTerminalDescriptor, SpecifyOutputTerminalDescriptor)
import Util.Lit (deriveLit)

data DefparamAssignment
  = DefparamAssignment
      HierarchicalParameterIdentifier
      Symbol
      ConstantMintypmaxExpression
  deriving (Eq, Show)

data NetDeclAssignment
  = NetDeclAssignment
      NetIdentifier
      [UnpackedDimension]
      (Maybe (Symbol, Expression))
  deriving (Eq, Show)

data ParamAssignment
  = ParamAssignment
      ParameterIdentifier
      [UnpackedDimension]
      (Maybe (Symbol, ConstantParamExpression))
  deriving (Eq, Show)

data SpecparamAssignment
  = MkSpecparamAssignmentMintypmax SpecparamAssignmentMintypmax
  | MkPulseControlSpecparam PulseControlSpecparam
  deriving (Eq, Show)

data SpecparamAssignmentMintypmax
  = SpecparamAssignmentMintypmax
      SpecparamIdentifier
      Symbol
      ConstantMintypmaxExpression
  deriving (Eq, Show)

data TypeAssignment
  = TypeAssignment
      TypeIdentifier
      (Maybe (Symbol, DataType))
  deriving (Eq, Show)

data PulseControlSpecparam
  = MkPulseControlSpecparamWithoutDescriptor PulseControlSpecparamWithoutDescriptor
  | MkPulseControlSpecparamWithDescriptor PulseControlSpecparamWithDescriptor
  deriving (Eq, Show)

data PulseControlSpecparamWithoutDescriptor
  = PulseControlSpecparamWithoutDescriptor
      Symbol
      Symbol
      (Paren (RejectLimitValue, Maybe (Symbol, ErrorLimitValue)))
  deriving (Eq, Show)

data PulseControlSpecparamWithDescriptor
  = PulseControlSpecparamWithDescriptor
      Symbol
      SpecifyInputTerminalDescriptor
      Symbol
      SpecifyOutputTerminalDescriptor
      Symbol
      (Paren (RejectLimitValue, Maybe (Symbol, ErrorLimitValue)))
  deriving (Eq, Show)

newtype ErrorLimitValue = ErrorLimitValue LimitValue deriving (Eq, Show)

newtype RejectLimitValue = RejectLimitValue LimitValue deriving (Eq, Show)

newtype LimitValue = LimitValue ConstantMintypmaxExpression deriving (Eq, Show)

data VariableDeclAssignment
  = MkVariableDeclAssignmentVariable VariableDeclAssignmentVariable
  | MkVariableDeclAssignmentDynamicArray VariableDeclAssignmentDynamicArray
  | MkVariableDeclAssignmentClass VariableDeclAssignmentClass
  deriving (Eq, Show)

data VariableDeclAssignmentVariable
  = VariableDeclAssignmentVariable
      VariableIdentifier
      [VariableDimension]
      (Maybe (Symbol, Expression))
  deriving (Eq, Show)

data VariableDeclAssignmentDynamicArray
  = VariableDeclAssignmentDynamicArray
      DynamicArrayVariableIdentifier
      UnsizedDimension
      [VariableDimension]
      (Maybe (Symbol, DynamicArrayNew))
  deriving (Eq, Show)

data VariableDeclAssignmentClass
  = VariableDeclAssignmentClass
      ClassVariableIdentifier
      (Symbol, ClassNew)
  deriving (Eq, Show)

data ClassNew
  = MkClassNewArgument ClassNewArgument
  | MkClassNewExpression ClassNewExpression
  deriving (Eq, Show)

data ClassNewArgument
  = ClassNewArgument
      (Maybe ClassScope)
      Keyword
      (Maybe (Paren ListOfArguments))
  deriving (Eq, Show)

data ClassNewExpression
  = ClassNewExpression
      Keyword
      Expression
  deriving (Eq, Show)

data DynamicArrayNew
  = DynamicArrayNew
      Keyword
      (Bracket Expression)
      (Maybe (Paren Expression))
  deriving (Eq, Show)

deriveLit ''DefparamAssignment
deriveLit ''NetDeclAssignment
deriveLit ''ParamAssignment
deriveLit ''SpecparamAssignmentMintypmax
deriveLit ''TypeAssignment
deriveLit ''LimitValue
deriveLit ''VariableDeclAssignmentVariable
deriveLit ''ClassNewArgument
deriveLit ''ClassNewExpression
deriveLit ''DynamicArrayNew
deriveLit ''VariableDeclAssignmentDynamicArray
deriveLit ''ClassNew
deriveLit ''VariableDeclAssignmentClass
deriveLit ''VariableDeclAssignment
deriveLit ''ErrorLimitValue
deriveLit ''RejectLimitValue
deriveLit ''PulseControlSpecparamWithoutDescriptor
deriveLit ''PulseControlSpecparamWithDescriptor
deriveLit ''PulseControlSpecparam
deriveLit ''SpecparamAssignment