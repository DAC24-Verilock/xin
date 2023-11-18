{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SourceText.ModuleItems where

import SystemVerilog.AST.BehavioralStatements.AssertionStatements (AssertionItem)
import SystemVerilog.AST.BehavioralStatements.ClockingBlock (ClockingDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.ContinuousAssignmentAndNetAliasStatements (ContinuousAssign, NetAlias)
import SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments (AlwaysConstruct, FinalConstruct, InitialConstruct)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.AssertionDeclarations (ExpressionOrDist)
import SystemVerilog.AST.Declarations.DeclarationLists (ListOfDefparamAssignments)
import SystemVerilog.AST.Declarations.ModuleParameterDeclarations (SpecparamDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TypeDeclarations (GenvarDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (ConstantBitSelect)
import SystemVerilog.AST.Expressions.SubroutineCalls (ListOfArguments)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (ClockingIdentifier, HierarchicalIdentifier, InterfaceIdentifier, ModuleIdentifier)
import SystemVerilog.AST.Instantiations.CheckerInstantiation (CheckerInstantiation)
import {-# SOURCE #-} SystemVerilog.AST.Instantiations.GeneratedInstantiation (ConditionalGenerateConstruct, GenerateRegion, LoopGenerateConstruct)
import SystemVerilog.AST.Instantiations.InterfaceInstantiation (InterfaceInstantiation)
import SystemVerilog.AST.Instantiations.ModuleInstantiation (ModuleInstantiation)
import SystemVerilog.AST.Instantiations.ProgramInstantiation (ProgramInstantiation)
import SystemVerilog.AST.PrimitiveInstances.PrimitiveInstantiationAndInstances (GateInstantiation)
import SystemVerilog.AST.SourceText.ModuleParametersAndPorts (PortDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.PackageItems (PackageOrGenerateItemDeclaration)
import SystemVerilog.AST.SourceText.SystemVerilogSourceText (InterfaceDeclaration, ModuleDeclaration, ProgramDeclaration, TimeunitsDeclaration)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import SystemVerilog.AST.SpecifySection.SpecifyBlockDeclaration (SpecifyBlock)
import SystemVerilog.AST.UdpDeclarartionAndInstantiation.UdpInstantiation (UdpInstantiation)
import Util.Lit (deriveLit)

data ElaborationSystemTask
  = MkElaborationSystemTaskFatal ElaborationSystemTaskFatal
  | MkElaborationSystemTaskError ElaborationSystemTaskError
  | MkElaborationSystemTaskWarning ElaborationSystemTaskWarning
  | MkElaborationSystemTaskInfo ElaborationSystemTaskInfo
  deriving (Eq, Show)

data ElaborationSystemTaskFatal
  = ElaborationSystemTaskFatal
      Keyword
      (Maybe (Paren (FinishNumber, Maybe (Symbol, ListOfArguments))))
      Symbol
  deriving (Eq, Show)

data ElaborationSystemTaskError
  = ElaborationSystemTaskError
      Keyword
      (Maybe (Paren (Maybe ListOfArguments)))
      Symbol
  deriving (Eq, Show)

data ElaborationSystemTaskWarning
  = ElaborationSystemTaskWarning
      Keyword
      (Maybe (Paren (Maybe ListOfArguments)))
      Symbol
  deriving (Eq, Show)

data ElaborationSystemTaskInfo
  = ElaborationSystemTaskInfo
      Keyword
      (Maybe (Paren (Maybe ListOfArguments)))
      Symbol
  deriving (Eq, Show)

data FinishNumber
  = Zero Symbol
  | One Symbol
  | Two Symbol
  deriving (Eq, Show)

data ModuleCommonItem
  = MkModuleOrGenerateItemDeclaration ModuleOrGenerateItemDeclaration
  | MkInterfaceInstantiation InterfaceInstantiation
  | MkProgramInstantiation ProgramInstantiation
  | MkAssertionItem AssertionItem
  | MkBindDirective BindDirective
  | MkContinuousAssign ContinuousAssign
  | MkNetAlias NetAlias
  | MkInitialConstruct InitialConstruct
  | MkFinalConstruct FinalConstruct
  | MkAlwaysConstruct AlwaysConstruct
  | MkLoopGenerateConstruct LoopGenerateConstruct
  | MkConditionalGenerateConstruct ConditionalGenerateConstruct
  | MkElaborationSystemTask ElaborationSystemTask
  deriving (Eq, Show)

data ModuleItem
  = MkPortDeclaration PortDeclaration Symbol
  | MkNonPortModuleItem NonPortModuleItem
  deriving (Eq, Show)

data ModuleOrGenerateItem
  = MkModuleOrGenerateItemParameter ModuleOrGenerateItemParameter
  | MkModuleOrGenerateItemGate ModuleOrGenerateItemGate
  | MkModuleOrGenerateItemUdp ModuleOrGenerateItemUdp
  | MkModuleOrGenerateItemModule ModuleOrGenerateItemModule
  | MkModuleOrGenerateItemModuleItem ModuleOrGenerateItemModuleItem
  deriving (Eq, Show)

data ModuleOrGenerateItemParameter
  = ModuleOrGenerateItemParameter
      [AttributeInstance]
      ParameterOverride
  deriving (Eq, Show)

data ModuleOrGenerateItemGate
  = ModuleOrGenerateItemGate
      [AttributeInstance]
      GateInstantiation
  deriving (Eq, Show)

data ModuleOrGenerateItemUdp
  = ModuleOrGenerateItemUdp
      [AttributeInstance]
      UdpInstantiation
  deriving (Eq, Show)

data ModuleOrGenerateItemModule
  = ModuleOrGenerateItemModule
      [AttributeInstance]
      ModuleInstantiation
  deriving (Eq, Show)

data ModuleOrGenerateItemModuleItem
  = ModuleOrGenerateItemModuleItem
      [AttributeInstance]
      ModuleCommonItem
  deriving (Eq, Show)

data ModuleOrGenerateItemDeclaration
  = MkPackageOrGenerateItemDeclaration PackageOrGenerateItemDeclaration
  | MkGenvarDeclaration GenvarDeclaration
  | MkClockingDeclaration ClockingDeclaration
  | MkModuleOrGenerateItemDeclarationClocking ModuleOrGenerateItemDeclarationClocking
  | MkModuleOrGenerateItemDeclarationDisable ModuleOrGenerateItemDeclarationDisable
  deriving (Eq, Show)

data ModuleOrGenerateItemDeclarationClocking
  = ModuleOrGenerateItemDeclarationClocking
      Keyword
      Keyword
      ClockingIdentifier
      Symbol
  deriving (Eq, Show)

data ModuleOrGenerateItemDeclarationDisable
  = ModuleOrGenerateItemDeclarationDisable
      Keyword
      Keyword
      Keyword
      ExpressionOrDist
      Symbol
  deriving (Eq, Show)

data NonPortModuleItem
  = MkGenerateRegion GenerateRegion
  | MkModuleOrGenerateItem ModuleOrGenerateItem
  | MkSpecifyBlock SpecifyBlock
  | MkNonPortModuleItemSpecparam NonPortModuleItemSpecparam
  | MkProgramDeclaration ProgramDeclaration
  | MkModuleDeclaration ModuleDeclaration
  | MkInterfaceDeclaration InterfaceDeclaration
  | MkTimeunitsDeclaration TimeunitsDeclaration
  deriving (Eq, Show)

data NonPortModuleItemSpecparam
  = NonPortModuleItemSpecparam
      [AttributeInstance]
      SpecparamDeclaration
  deriving (Eq, Show)

data ParameterOverride
  = ParameterOverride
      Keyword
      ListOfDefparamAssignments
      Symbol
  deriving (Eq, Show)

data BindDirective
  = MkBindDirectiveScope BindDirectiveScope
  | MkBindDirectiveInstance BindDirectiveInstance
  deriving (Eq, Show)

data BindDirectiveScope
  = BindDirectiveScope
      Keyword
      BindTargetScope
      (Maybe (Symbol, BindTargetInstanceList))
      BindInstantiation
  deriving (Eq, Show)

data BindDirectiveInstance
  = BindDirectiveInstance
      Keyword
      BindTargetInstance
      BindInstantiation
  deriving (Eq, Show)

data BindTargetScope
  = MkModuleIdentifier ModuleIdentifier
  | MkInterfaceIdentifier InterfaceIdentifier
  deriving (Eq, Show)

data BindTargetInstance
  = BindTargetInstance
      HierarchicalIdentifier
      ConstantBitSelect
  deriving (Eq, Show)

newtype BindTargetInstanceList
  = BindTargetInstanceList
      (Splits Symbol BindTargetInstance)
  deriving (Eq, Show)

data BindInstantiation
  = MkBindInstantiationProgramInstantiation ProgramInstantiation
  | MkModuleInstantiation ModuleInstantiation
  | MkBindInstantiationInterfaceInstantiation InterfaceInstantiation
  | MkCheckerInstantiation CheckerInstantiation
  deriving (Eq, Show)

deriveLit ''ElaborationSystemTaskError
deriveLit ''ElaborationSystemTaskWarning
deriveLit ''ElaborationSystemTaskInfo
deriveLit ''FinishNumber
deriveLit ''ElaborationSystemTaskFatal
deriveLit ''ElaborationSystemTask
deriveLit ''ModuleOrGenerateItemGate
deriveLit ''ModuleOrGenerateItemUdp
deriveLit ''ModuleOrGenerateItemModule
deriveLit ''ModuleOrGenerateItemDeclarationClocking
deriveLit ''ModuleOrGenerateItemDeclarationDisable
deriveLit ''NonPortModuleItemSpecparam
deriveLit ''ParameterOverride
deriveLit ''BindTargetScope
deriveLit ''BindTargetInstance
deriveLit ''BindTargetInstanceList
deriveLit ''BindInstantiation
deriveLit ''BindDirectiveScope
deriveLit ''BindDirectiveInstance
deriveLit ''BindDirective
deriveLit ''ModuleOrGenerateItemDeclaration
deriveLit ''ModuleCommonItem
deriveLit ''ModuleOrGenerateItemModuleItem
deriveLit ''ModuleOrGenerateItemParameter
deriveLit ''ModuleOrGenerateItem
deriveLit ''NonPortModuleItem
deriveLit ''ModuleItem