{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.PrimitiveInstances.PrimitiveGateAndSwitchTypes where
    
import SystemVerilog.AST.SpecialNodes (Keyword)
import Util.Lit (deriveLit)

newtype CmosSwitchtype = CmosSwitchtype Keyword deriving (Eq, Show)

newtype EnableGatetype = EnableGatetype Keyword deriving (Eq, Show)

newtype MosSwitchtype = MosSwitchtype Keyword deriving (Eq, Show)

newtype NInputGatetype = NInputGatetype Keyword deriving (Eq, Show)

newtype NOutputGatetype = NOutputGatetype Keyword deriving (Eq, Show)

newtype PassEnSwitchtype = PassEnSwitchtype Keyword deriving (Eq, Show)

newtype PassSwitchtype = PassSwitchtype Keyword deriving (Eq, Show)

deriveLit ''CmosSwitchtype
deriveLit ''EnableGatetype
deriveLit ''MosSwitchtype
deriveLit ''NInputGatetype
deriveLit ''NOutputGatetype
deriveLit ''PassEnSwitchtype
deriveLit ''PassSwitchtype