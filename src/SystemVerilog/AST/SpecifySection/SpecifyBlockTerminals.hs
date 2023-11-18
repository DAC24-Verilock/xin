{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SpecifySection.SpecifyBlockTerminals where

import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantRangeExpression)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (InoutPortIdentifier, InputPortIdentifier, InterfaceIdentifier, OutputPortIdentifier, PortIdentifier)
import SystemVerilog.AST.SpecialNodes (Bracket, Symbol)
import Util.Lit (deriveLit)

data SpecifyInputTerminalDescriptor
  = SpecifyInputTerminalDescriptor
      InputIdentifier
      (Maybe (Bracket ConstantRangeExpression))
  deriving (Eq, Show)

data SpecifyOutputTerminalDescriptor
  = SpecifyOutputTerminalDescriptor
      OutputIdentifier
      (Maybe (Bracket ConstantRangeExpression))
  deriving (Eq, Show)

data InputIdentifier
  = MkInputPortIdentifier InputPortIdentifier
  | MkInoutPortIdentifier InoutPortIdentifier
  | MkInputIdentifierInterface InputIdentifierInterface
  deriving (Eq, Show)

data InputIdentifierInterface
  = InputIdentifierInterface
      InterfaceIdentifier
      Symbol
      PortIdentifier
  deriving (Eq, Show)

data OutputIdentifier
  = MkOutputPortIdentifier OutputPortIdentifier
  | MkOutputIdentifierInoutPortIdentifier InoutPortIdentifier
  | MkOutputIdentifierInterface OutputIdentifierInterface
  deriving (Eq, Show)

data OutputIdentifierInterface
  = OutputIdentifierInterface
      InterfaceIdentifier
      Symbol
      PortIdentifier
  deriving (Eq, Show)

deriveLit ''InputIdentifierInterface
deriveLit ''OutputIdentifierInterface
deriveLit ''OutputIdentifier
deriveLit ''SpecifyOutputTerminalDescriptor
deriveLit ''InputIdentifier
deriveLit ''SpecifyInputTerminalDescriptor