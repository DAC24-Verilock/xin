{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SourceText.ModuleParametersAndPorts where

import SystemVerilog.AST.Declarations.DeclarationLists (ListOfParamAssignments, ListOfTypeAssignments)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.DeclarationRanges (UnpackedDimension, VariableDimension)
import SystemVerilog.AST.Declarations.ModuleParameterDeclarations (LocalParameterDeclaration, ParameterDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (DataType, NetPortType, VariablePortType)
import SystemVerilog.AST.Declarations.PortDeclarations (InoutDeclaration, InputDeclaration, InterfacePortDeclaration, OutputDeclaration, RefDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression, Expression)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (ConstantSelect)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (InterfaceIdentifier, ModportIdentifier, PortIdentifier)
import SystemVerilog.AST.SpecialNodes (Brace, Keyword, Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data ParameterPortList
  = MkParameterPortListAssignment ParameterPortListAssignment
  | MkParameterPortListDeclaration ParameterPortListDeclaration
  | Empty Symbol Symbol Symbol
  deriving (Eq, Show)

data ParameterPortListAssignment
  = ParameterPortListAssignment
      Symbol
      (Paren (ListOfParamAssignments, [(Symbol, ParameterPortDeclaration)]))
  deriving (Eq, Show)

data ParameterPortListDeclaration
  = ParameterPortListDeclaration
      Symbol
      (Paren (Splits Symbol ParameterPortDeclaration))
  deriving (Eq, Show)

data ParameterPortDeclaration
  = MkParameterDeclaration ParameterDeclaration
  | MkLocalParameterDeclaration LocalParameterDeclaration
  | MkParameterPortDeclarationParamList ParameterPortDeclarationParamList
  | MkParameterPortDeclarationTypeList ParameterPortDeclarationTypeList
  deriving (Eq, Show)

data ParameterPortDeclarationParamList
  = ParameterPortDeclarationParamList
      DataType
      ListOfParamAssignments
  deriving (Eq, Show)

data ParameterPortDeclarationTypeList
  = ParameterPortDeclarationTypeList
      Keyword
      ListOfTypeAssignments
  deriving (Eq, Show)

newtype ListOfPorts = ListOfPorts (Paren (Splits Symbol Port)) deriving (Eq, Show)

newtype ListOfPortDeclarations
  = ListOfPortDeclarations
      (Paren (Maybe (Splits Symbol ([AttributeInstance], AnsiPortDeclaration))))
  deriving (Eq, Show)

data PortDeclaration
  = MkPortDeclarationInout PortDeclarationInout
  | MkPortDeclarationInput PortDeclarationInput
  | MkPortDeclarationOutput PortDeclarationOutput
  | MkPortDeclarationRef PortDeclarationRef
  | MkPortDeclarationInterface PortDeclarationInterface
  deriving (Eq, Show)

data PortDeclarationInout
  = PortDeclarationInout
      [AttributeInstance]
      InoutDeclaration
  deriving (Eq, Show)

data PortDeclarationInput
  = PortDeclarationInput
      [AttributeInstance]
      InputDeclaration
  deriving (Eq, Show)

data PortDeclarationOutput
  = PortDeclarationOutput
      [AttributeInstance]
      OutputDeclaration
  deriving (Eq, Show)

data PortDeclarationRef
  = PortDeclarationRef
      [AttributeInstance]
      RefDeclaration
  deriving (Eq, Show)

data PortDeclarationInterface
  = PortDeclarationInterface
      [AttributeInstance]
      InterfacePortDeclaration
  deriving (Eq, Show)

data Port
  = MkPortNonNamed PortNonNamed
  | MkPortNamed PortNamed
  deriving (Eq, Show)

newtype PortNonNamed = PortNonNamed (Maybe PortExpression) deriving (Eq, Show)

data PortNamed
  = PortNamed
      Symbol
      PortIdentifier
      (Paren (Maybe PortExpression))
  deriving (Eq, Show)

data PortExpression
  = MkPortReference PortReference
  | MkPortExpressionBrace PortExpressionBrace
  deriving (Eq, Show)

newtype PortExpressionBrace = PortExpressionBrace (Brace (Splits Symbol PortReference)) deriving (Eq, Show)

data PortReference
  = PortReference
      PortIdentifier
      ConstantSelect
  deriving (Eq, Show)

data PortDirection
  = Input Keyword
  | Output Keyword
  | Inout Keyword
  | Ref Keyword
  deriving (Eq, Show)

data NetPortHeader
  = NetPortHeader
      (Maybe PortDirection)
      NetPortType
  deriving (Eq, Show)

data VariablePortHeader
  = VariablePortHeader
      (Maybe PortDirection)
      VariablePortType
  deriving (Eq, Show)

data InterfacePortHeader
  = MkInterfacePortHeaderIdentifier InterfacePortHeaderIdentifier
  | MkInterfacePortHeaderInterface InterfacePortHeaderInterface
  deriving (Eq, Show)

data InterfacePortHeaderIdentifier
  = InterfacePortHeaderIdentifier
      InterfaceIdentifier
      (Maybe (Symbol, ModportIdentifier))
  deriving (Eq, Show)

data InterfacePortHeaderInterface
  = InterfacePortHeaderInterface
      Keyword
      (Maybe (Symbol, ModportIdentifier))
  deriving (Eq, Show)

data NetPortHeaderOrInterfacePortHeader
  = MkNetPortHeader NetPortHeader
  | MkInterfacePortHeader InterfacePortHeader
  deriving (Eq, Show)

data AnsiPortDeclaration
  = MkAnsiPortDeclarationNet AnsiPortDeclarationNet
  | MkAnsiPortDeclarationVariable AnsiPortDeclarationVariable
  | MkAnsiPortDeclarationParen AnsiPortDeclarationParen
  deriving (Eq, Show)

data AnsiPortDeclarationNet
  = AnsiPortDeclarationNet
      (Maybe NetPortHeaderOrInterfacePortHeader)
      PortIdentifier
      [UnpackedDimension]
      (Maybe (Symbol, ConstantExpression))
  deriving (Eq, Show)

data AnsiPortDeclarationVariable
  = AnsiPortDeclarationVariable
      (Maybe VariablePortHeader)
      PortIdentifier
      [VariableDimension]
      (Maybe (Symbol, ConstantExpression))
  deriving (Eq, Show)

data AnsiPortDeclarationParen
  = AnsiPortDeclarationParen
      (Maybe PortDirection)
      Symbol
      PortIdentifier
      (Paren (Maybe Expression))
  deriving (Eq, Show)

deriveLit ''ParameterPortDeclarationParamList
deriveLit ''ParameterPortDeclarationTypeList
deriveLit ''PortDeclarationInout
deriveLit ''PortDeclarationInput
deriveLit ''PortDeclarationOutput
deriveLit ''PortDeclarationRef
deriveLit ''PortDeclarationInterface
deriveLit ''PortDeclaration
deriveLit ''PortReference
deriveLit ''PortExpressionBrace
deriveLit ''PortExpression
deriveLit ''PortNonNamed
deriveLit ''PortNamed
deriveLit ''Port
deriveLit ''PortDirection
deriveLit ''NetPortHeader
deriveLit ''VariablePortHeader
deriveLit ''InterfacePortHeaderIdentifier
deriveLit ''InterfacePortHeaderInterface
deriveLit ''InterfacePortHeader
deriveLit ''NetPortHeaderOrInterfacePortHeader
deriveLit ''AnsiPortDeclarationNet
deriveLit ''AnsiPortDeclarationVariable
deriveLit ''AnsiPortDeclarationParen
deriveLit ''AnsiPortDeclaration
deriveLit ''ListOfPorts
deriveLit ''ListOfPortDeclarations
deriveLit ''ParameterPortDeclaration
deriveLit ''ParameterPortListAssignment
deriveLit ''ParameterPortListDeclaration
deriveLit ''ParameterPortList