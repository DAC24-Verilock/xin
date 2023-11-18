{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.PrimitiveInstances.PrimitiveTerminals where

import SystemVerilog.AST.Expressions.ExpressionLeftsideValues (NetLvalue)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import Util.Lit (deriveLit)

newtype EnableTerminal
  = EnableTerminal
      Expression
  deriving (Eq, Show)

newtype InoutTerminal = InoutTerminal NetLvalue deriving (Eq, Show)

newtype InputTerminal = InputTerminal Expression deriving (Eq, Show)

newtype NcontrolTerminal = NcontrolTerminal Expression deriving (Eq, Show)

newtype OutputTerminal = OutputTerminal NetLvalue deriving (Eq, Show)

newtype PcontrolTerminal = PcontrolTerminal Expression deriving (Eq, Show)

deriveLit ''EnableTerminal
deriveLit ''InoutTerminal
deriveLit ''InputTerminal
deriveLit ''NcontrolTerminal
deriveLit ''OutputTerminal
deriveLit ''PcontrolTerminal