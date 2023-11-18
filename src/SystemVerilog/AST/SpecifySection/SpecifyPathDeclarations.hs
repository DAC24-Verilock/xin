{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.SpecifySection.SpecifyPathDeclarations where

import SystemVerilog.AST.SpecialNodes (Paren, Splits, Symbol)
import SystemVerilog.AST.SpecifySection.SpecifyBlockTerminals (SpecifyInputTerminalDescriptor, SpecifyOutputTerminalDescriptor)
import SystemVerilog.AST.SpecifySection.SpecifyPathDelays (EdgeSensitivePathDeclaration, PathDelayValue, PolarityOperator, StateDependentPathDeclaration)
import Util.Lit (deriveLit)

data PathDeclaration
  = MkSimplePathDeclaration SimplePathDeclaration Symbol
  | MkEdgeSensitivePathDeclaration EdgeSensitivePathDeclaration Symbol
  | MkStateDependentPathDeclaration StateDependentPathDeclaration Symbol
  deriving (Eq, Show)

data SimplePathDeclaration
  = MkSimplePathDeclarationParallel SimplePathDeclarationParallel
  | MkSimplePathDeclarationFull SimplePathDeclarationFull
  deriving (Eq, Show)

data SimplePathDeclarationParallel
  = SimplePathDeclarationParallel
      ParallelPathDescription
      Symbol
      PathDelayValue
  deriving (Eq, Show)

data SimplePathDeclarationFull
  = SimplePathDeclarationFull
      FullPathDescription
      Symbol
      PathDelayValue
  deriving (Eq, Show)

data ParallelPathDescription
  = ParallelPathDescription
      (Paren (SpecifyInputTerminalDescriptor, Maybe PolarityOperator, Symbol, SpecifyOutputTerminalDescriptor))
  deriving (Eq, Show)

data FullPathDescription
  = FullPathDescription
      (Paren (ListOfPathInputs, Maybe PolarityOperator, Symbol, ListOfPathOutputs))
  deriving (Eq, Show)

data ListOfPathInputs
  = ListOfPathInputs
      (Splits Symbol SpecifyInputTerminalDescriptor)
  deriving (Eq, Show)

data ListOfPathOutputs
  = ListOfPathOutputs
      (Splits Symbol SpecifyOutputTerminalDescriptor)
  deriving (Eq, Show)

deriveLit ''ParallelPathDescription
deriveLit ''ListOfPathInputs
deriveLit ''ListOfPathOutputs
deriveLit ''FullPathDescription
deriveLit ''SimplePathDeclarationParallel
deriveLit ''SimplePathDeclarationFull
deriveLit ''SimplePathDeclaration
deriveLit ''PathDeclaration