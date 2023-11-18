{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.BehavioralStatements.ContinuousAssignmentAndNetAliasStatements where

import SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments (VariableAssignment)
import SystemVerilog.AST.BehavioralStatements.TimingControlStatements (DelayControl)
import SystemVerilog.AST.Declarations.Delays (Delay3)
import SystemVerilog.AST.Declarations.Strengths (DriveStrength)
import SystemVerilog.AST.Expressions.ExpressionLeftsideValues (NetLvalue)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import SystemVerilog.AST.SpecialNodes (Keyword, Splits, Symbol)
import Util.Lit (deriveLit)

data ContinuousAssign
  = MkContinuousAssignNet ContinuousAssignNet
  | MkContinuousAssignVariable ContinuousAssignVariable
  deriving (Eq, Show)

data ContinuousAssignNet
  = ContinuousAssignNet
      Keyword
      (Maybe DriveStrength)
      (Maybe Delay3)
      ListOfNetAssignments
      Symbol
  deriving (Eq, Show)

data ContinuousAssignVariable
  = ContinuousAssignVariable
      Keyword
      (Maybe DelayControl)
      ListOfVariableAssignments
      Symbol
  deriving (Eq, Show)

data ListOfNetAssignments
  = ListOfNetAssignments (Splits Symbol NetAssignment)
  deriving (Eq, Show)

data ListOfVariableAssignments
  = ListOfVariableAssignments (Splits Symbol VariableAssignment)
  deriving (Eq, Show)

data NetAlias
  = NetAlias
      Keyword
      NetLvalue
      Symbol
      (Splits Symbol NetLvalue)
      Symbol
  deriving (Eq, Show)

data NetAssignment
  = NetAssignment
      NetLvalue
      Symbol
      Expression
  deriving (Eq, Show)

deriveLit ''ListOfVariableAssignments
deriveLit ''NetAlias
deriveLit ''NetAssignment
deriveLit ''ContinuousAssignVariable
deriveLit ''ListOfNetAssignments
deriveLit ''ContinuousAssignNet
deriveLit ''ContinuousAssign