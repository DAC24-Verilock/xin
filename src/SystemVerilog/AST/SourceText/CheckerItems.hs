{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.SourceText.CheckerItems where

import SystemVerilog.AST.BehavioralStatements.AssertionStatements (AssertionItem)
import SystemVerilog.AST.BehavioralStatements.ClockingBlock (ClockingDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.ContinuousAssignmentAndNetAliasStatements (ContinuousAssign)
import SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments (AlwaysConstruct, FinalConstruct, InitialConstruct)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.AssertionDeclarations (AssertionItemDeclaration, ExpressionOrDist, PropertyActualArg, PropertyFormalType)
import SystemVerilog.AST.Declarations.CovergroupDeclarations (CovergroupDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.DeclarationRanges (VariableDimension)
import SystemVerilog.AST.Declarations.FunctionDeclarations (FunctionDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TypeDeclarations (DataDeclaration, GenvarDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (ClockingIdentifier, FormalPortIdentifier)
import {-# SOURCE #-} SystemVerilog.AST.Instantiations.GeneratedInstantiation (ConditionalGenerateConstruct, GenerateRegion, LoopGenerateConstruct)
import SystemVerilog.AST.SourceText.ModuleItems (ElaborationSystemTask)
import SystemVerilog.AST.SourceText.SystemVerilogSourceText (CheckerDeclaration)
import SystemVerilog.AST.SpecialNodes (Keyword, Splits, Symbol)
import Util.Lit (deriveLit)

data CheckerPortList
  = CheckerPortList
      (Splits Symbol CheckerPortItem)
  deriving (Eq, Show)

data CheckerPortItem
  = CheckerPortItem
      [AttributeInstance]
      (Maybe CheckerPortDirection)
      PropertyFormalType
      FormalPortIdentifier
      [VariableDimension]
      (Maybe (Symbol, PropertyActualArg))
  deriving (Eq, Show)

data CheckerPortDirection
  = Input Keyword
  | Output Keyword
  deriving (Eq, Show)

data CheckerOrGenerateItem
  = MkCheckerOrGenerateItemDeclaration CheckerOrGenerateItemDeclaration
  | MkInitialConstruct InitialConstruct
  | MkAlwaysConstruct AlwaysConstruct
  | MkFinalConstruct FinalConstruct
  | MkAssertionItem AssertionItem
  | MkContinuousAssign ContinuousAssign
  | MkCheckerGenerateItem CheckerGenerateItem
  deriving (Eq, Show)

data CheckerOrGenerateItemDeclaration
  = MkCheckerOrGenerateItemDeclarationData CheckerOrGenerateItemDeclarationData
  | MkFunctionDeclaration FunctionDeclaration
  | MkCheckerDeclaration CheckerDeclaration
  | MkAssertionItemDeclaration AssertionItemDeclaration
  | MkCovergroupDeclaration CovergroupDeclaration
  | MkGenvarDeclaration GenvarDeclaration
  | MkClockingDeclaration ClockingDeclaration
  | MkCheckerOrGenerateItemDeclarationClocking CheckerOrGenerateItemDeclarationClocking
  | MkCheckerOrGenerateItemDeclarationDisable CheckerOrGenerateItemDeclarationDisable
  | Empty Symbol
  deriving (Eq, Show)

data CheckerOrGenerateItemDeclarationData
  = CheckerOrGenerateItemDeclarationData
      (Maybe Rand)
      DataDeclaration
  deriving (Eq, Show)

data Rand = Rand Keyword deriving (Eq, Show)

data CheckerOrGenerateItemDeclarationClocking
  = CheckerOrGenerateItemDeclarationClocking
      Keyword
      Keyword
      ClockingIdentifier
      Symbol
  deriving (Eq, Show)

data CheckerOrGenerateItemDeclarationDisable
  = CheckerOrGenerateItemDeclarationDisable
      Keyword
      Keyword
      Keyword
      ExpressionOrDist
      Symbol
  deriving (Eq, Show)

data CheckerGenerateItem
  = MkLoopGenerateConstruct LoopGenerateConstruct
  | MkConditionalGenerateConstruct ConditionalGenerateConstruct
  | MkGenerateRegion GenerateRegion
  | MkElaborationSystemTask ElaborationSystemTask
  deriving (Eq, Show)

deriveLit ''CheckerPortDirection
deriveLit ''Rand
deriveLit ''CheckerOrGenerateItemDeclarationClocking
deriveLit ''CheckerOrGenerateItemDeclarationDisable
deriveLit ''CheckerGenerateItem
deriveLit ''CheckerOrGenerateItemDeclarationData
deriveLit ''CheckerOrGenerateItemDeclaration
deriveLit ''CheckerOrGenerateItem
deriveLit ''CheckerPortItem
deriveLit ''CheckerPortList