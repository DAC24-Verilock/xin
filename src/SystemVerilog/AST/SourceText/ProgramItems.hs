{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SourceText.ProgramItems where

import SystemVerilog.AST.BehavioralStatements.ContinuousAssignmentAndNetAliasStatements (ContinuousAssign)
import SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments (FinalConstruct, InitialConstruct)
import SystemVerilog.AST.Declarations.AssertionDeclarations (ConcurrentAssertionItem)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import SystemVerilog.AST.Instantiations.GeneratedInstantiation (ConditionalGenerateConstruct, GenerateRegion, LoopGenerateConstruct)
import SystemVerilog.AST.SourceText.ModuleItems (ElaborationSystemTask, ModuleOrGenerateItemDeclaration)
import SystemVerilog.AST.SourceText.ModuleParametersAndPorts (PortDeclaration)
import SystemVerilog.AST.SourceText.SystemVerilogSourceText (TimeunitsDeclaration)
import SystemVerilog.AST.SpecialNodes (Symbol)
import Util.Lit (deriveLit)

data ProgramItem
  = MkPortDeclaration PortDeclaration Symbol
  | MkNonPortProgramItem NonPortProgramItem
  deriving (Eq, Show)

data NonPortProgramItem
  = MkNonPortProgramItemAssign NonPortProgramItemAssign
  | MkNonPortProgramItemModule NonPortProgramItemModule
  | MkNonPortProgramItemInitial NonPortProgramItemInitial
  | MkNonPortProgramItemFinal NonPortProgramItemFinal
  | MkNonPortProgramItemAssertion NonPortProgramItemAssertion
  | MkTimeunitsDeclaration TimeunitsDeclaration
  | MkProgramGenerateItem ProgramGenerateItem
  deriving (Eq, Show)

data NonPortProgramItemAssign
  = NonPortProgramItemAssign
      [AttributeInstance]
      ContinuousAssign
  deriving (Eq, Show)

data NonPortProgramItemModule
  = NonPortProgramItemModule
      [AttributeInstance]
      ModuleOrGenerateItemDeclaration
  deriving (Eq, Show)

data NonPortProgramItemInitial
  = NonPortProgramItemInitial
      [AttributeInstance]
      InitialConstruct
  deriving (Eq, Show)

data NonPortProgramItemFinal
  = NonPortProgramItemFinal
      [AttributeInstance]
      FinalConstruct
  deriving (Eq, Show)

data NonPortProgramItemAssertion
  = NonPortProgramItemAssertion
      [AttributeInstance]
      ConcurrentAssertionItem
  deriving (Eq, Show)

data ProgramGenerateItem
  = MkLoopGenerateConstruct LoopGenerateConstruct
  | MkConditionalGenerateConstruct ConditionalGenerateConstruct
  | MkGenerateRegion GenerateRegion
  | MkElaborationSystemTask ElaborationSystemTask
  deriving (Eq, Show)

deriveLit ''NonPortProgramItemAssign
deriveLit ''NonPortProgramItemModule
deriveLit ''NonPortProgramItemInitial
deriveLit ''NonPortProgramItemFinal
deriveLit ''NonPortProgramItemAssertion
deriveLit ''ProgramGenerateItem
deriveLit ''NonPortProgramItem
deriveLit ''ProgramItem