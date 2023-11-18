{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.PrimitiveInstances.PrimitiveInstantiationAndInstances where

import SystemVerilog.AST.Declarations.Delays (Delay2, Delay3)
import SystemVerilog.AST.Declarations.Strengths (DriveStrength)
import SystemVerilog.AST.Instantiations.ModuleInstantiation (NameOfInstance)
import SystemVerilog.AST.PrimitiveInstances.PrimitiveGateAndSwitchTypes (CmosSwitchtype, EnableGatetype, MosSwitchtype, NInputGatetype, NOutputGatetype, PassEnSwitchtype, PassSwitchtype)
import SystemVerilog.AST.PrimitiveInstances.PrimitiveStrengths (PulldownStrength, PullupStrength)
import SystemVerilog.AST.PrimitiveInstances.PrimitiveTerminals (EnableTerminal, InoutTerminal, InputTerminal, NcontrolTerminal, OutputTerminal, PcontrolTerminal)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data GateInstantiation
  = MkGateInstantiationCmos GateInstantiationCmos
  | MkGateInstantiationEnable GateInstantiationEnable
  | MkGateInstantiationMos GateInstantiationMos
  | MkGateInstantiationNInput GateInstantiationNInput
  | MkGateInstantiationNOutput GateInstantiationNOutput
  | MkGateInstantiationPassEn GateInstantiationPassEn
  | MkGateInstantiationPass GateInstantiationPass
  | MkGateInstantiationPulldown GateInstantiationPulldown
  | MkGateInstantiationPullup GateInstantiationPullup
  deriving (Eq, Show)

data GateInstantiationCmos
  = GateInstantiationCmos
      CmosSwitchtype
      (Maybe Delay3)
      (Splits Symbol CmosSwitchInstance)
      Symbol
  deriving (Eq, Show)

data GateInstantiationEnable
  = GateInstantiationEnable
      EnableGatetype
      (Maybe DriveStrength)
      (Maybe Delay3)
      (Splits Symbol EnableGateInstance)
      Symbol
  deriving (Eq, Show)

data GateInstantiationMos
  = GateInstantiationMos
      MosSwitchtype
      (Maybe Delay3)
      (Splits Symbol MosSwitchInstance)
      Symbol
  deriving (Eq, Show)

data GateInstantiationNInput
  = GateInstantiationNInput
      NInputGatetype
      (Maybe DriveStrength)
      (Maybe Delay2)
      (Splits Symbol NInputGateInstance)
      Symbol
  deriving (Eq, Show)

data GateInstantiationNOutput
  = GateInstantiationNOutput
      NOutputGatetype
      (Maybe DriveStrength)
      (Maybe Delay2)
      (Splits Symbol NOutputGateInstance)
      Symbol
  deriving (Eq, Show)

data GateInstantiationPassEn
  = GateInstantiationPassEn
      PassEnSwitchtype
      (Maybe Delay2)
      (Splits Symbol PassEnableSwitchInstance)
      Symbol
  deriving (Eq, Show)

data GateInstantiationPass
  = GateInstantiationPass
      PassSwitchtype
      (Splits Symbol PassSwitchInstance)
      Symbol
  deriving (Eq, Show)

data GateInstantiationPulldown
  = GateInstantiationPulldown
      Keyword
      (Maybe PulldownStrength)
      (Splits Symbol PullGateInstance)
      Symbol
  deriving (Eq, Show)

data GateInstantiationPullup
  = GateInstantiationPullup
      Keyword
      (Maybe PullupStrength)
      (Splits Symbol PullGateInstance)
      Symbol
  deriving (Eq, Show)

data CmosSwitchInstance
  = CmosSwitchInstance
      (Maybe NameOfInstance)
      ( Paren
          ( OutputTerminal,
            Symbol,
            InputTerminal,
            Symbol,
            NcontrolTerminal,
            Symbol,
            PcontrolTerminal
          )
      )
  deriving (Eq, Show)

data EnableGateInstance
  = EnableGateInstance
      (Maybe NameOfInstance)
      ( Paren
          ( OutputTerminal,
            Symbol,
            InputTerminal,
            Symbol,
            EnableTerminal
          )
      )
  deriving (Eq, Show)

data MosSwitchInstance
  = MosSwitchInstance
      (Maybe NameOfInstance)
      ( Paren
          ( OutputTerminal,
            Symbol,
            InputTerminal,
            Symbol,
            EnableTerminal
          )
      )
  deriving (Eq, Show)

data NInputGateInstance
  = NInputGateInstance
      (Maybe NameOfInstance)
      (Paren (OutputTerminal, Symbol, Splits Symbol InputTerminal))
  deriving (Eq, Show)

data NOutputGateInstance
  = NOutputGateInstance
      (Maybe NameOfInstance)
      (Paren (Splits Symbol OutputTerminal, Symbol, InputTerminal))
  deriving (Eq, Show)

data PassSwitchInstance
  = PassSwitchInstance
      (Maybe NameOfInstance)
      (Paren (InoutTerminal, Symbol, InoutTerminal))
  deriving (Eq, Show)

data PassEnableSwitchInstance
  = PassEnableSwitchInstance
      (Maybe NameOfInstance)
      (Paren (InoutTerminal, Symbol, InoutTerminal, Symbol, EnableTerminal))
  deriving (Eq, Show)

data PullGateInstance
  = PullGateInstance
      (Maybe NameOfInstance)
      (Paren OutputTerminal)
  deriving (Eq, Show)

deriveLit ''CmosSwitchInstance
deriveLit ''EnableGateInstance
deriveLit ''MosSwitchInstance
deriveLit ''NInputGateInstance
deriveLit ''NOutputGateInstance
deriveLit ''PassSwitchInstance
deriveLit ''PassEnableSwitchInstance
deriveLit ''PullGateInstance
deriveLit ''GateInstantiationCmos
deriveLit ''GateInstantiationEnable
deriveLit ''GateInstantiationMos
deriveLit ''GateInstantiationNInput
deriveLit ''GateInstantiationNOutput
deriveLit ''GateInstantiationPassEn
deriveLit ''GateInstantiationPass
deriveLit ''GateInstantiationPulldown
deriveLit ''GateInstantiationPullup
deriveLit ''GateInstantiation