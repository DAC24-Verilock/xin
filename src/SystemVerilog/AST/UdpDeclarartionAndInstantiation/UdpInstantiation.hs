{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.UdpDeclarartionAndInstantiation.UdpInstantiation where

import SystemVerilog.AST.Declarations.Delays (Delay2)
import SystemVerilog.AST.Declarations.Strengths (DriveStrength)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (UdpIdentifier)
import SystemVerilog.AST.Instantiations.ModuleInstantiation (NameOfInstance)
import SystemVerilog.AST.PrimitiveInstances.PrimitiveTerminals (InputTerminal, OutputTerminal)
import SystemVerilog.AST.SpecialNodes (Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data UdpInstantiation
  = UdpInstantiation
      UdpIdentifier
      (Maybe DriveStrength)
      (Maybe Delay2)
      (Splits Symbol UdpInstance)
      Symbol
  deriving (Eq, Show)

data UdpInstance
  = UdpInstance
      (Maybe NameOfInstance)
      ( Paren
          ( OutputTerminal,
            Symbol,
            InputTerminal,
            [(Symbol, InputTerminal)]
          )
      )
  deriving (Eq, Show)

deriveLit ''UdpInstance
deriveLit ''UdpInstantiation