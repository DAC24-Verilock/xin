{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.ContinuousAssignmentAndNetAliasStatements (NetAssignment)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (FunctionStatement, Statement, StatementOrNull)
import SystemVerilog.AST.BehavioralStatements.TimingControlStatements (DelayOrEventControl)
import SystemVerilog.AST.Declarations.DeclarationAssignments (ClassNew, DynamicArrayNew)
import SystemVerilog.AST.Expressions.ExpressionLeftsideValues (NetLvalue, NonrangeVariableLvalue, VariableLvalue)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (Select)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (HierarchicalVariableIdentifier, ImplicitClassHandleOrClassScopeOrPackageScope)
import SystemVerilog.AST.SpecialNodes (Keyword, Symbol)
import Util.Lit (deriveLit)

data InitialConstruct
  = InitialConstruct
      Keyword
      StatementOrNull
  deriving (Eq, Show)

data AlwaysConstruct
  = AlwaysConstruct
      AlwaysKeyword
      Statement
  deriving (Eq, Show)

data AlwaysKeyword
  = Always Keyword
  | AlwaysComb Keyword
  | AlwaysLatch Keyword
  | AlwaysFf Keyword
  deriving (Eq, Show)

data FinalConstruct
  = FinalConstruct
      Keyword
      FunctionStatement
  deriving (Eq, Show)

data BlockingAssignment
  = MkBlockingAssignmentVariable BlockingAssignmentVariable
  | MkBlockingAssignmentNonrangeVariable BlockingAssignmentNonrangeVariable
  | MkBlockingAssignmentHierarchicalVariable BlockingAssignmentHierarchicalVariable
  | MkOperatorAssignment OperatorAssignment
  deriving (Eq, Show)

data BlockingAssignmentVariable
  = BlockingAssignmentVariable
      VariableLvalue
      Symbol
      DelayOrEventControl
      Expression
  deriving (Eq, Show)

data BlockingAssignmentNonrangeVariable
  = BlockingAssignmentNonrangeVariable
      NonrangeVariableLvalue
      Symbol
      DynamicArrayNew
  deriving (Eq, Show)

data BlockingAssignmentHierarchicalVariable
  = BlockingAssignmentHierarchicalVariable
      (Maybe ImplicitClassHandleOrClassScopeOrPackageScope)
      HierarchicalVariableIdentifier
      Select
      Symbol
      ClassNew
  deriving (Eq, Show)

data OperatorAssignment
  = OperatorAssignment
      VariableLvalue
      AssignmentOperator
      Expression
  deriving (Eq, Show)

newtype AssignmentOperator
  = AssignmentOperator Symbol
  deriving (Eq, Show)

data NonblockingAssignment
  = NonblockingAssignment
      VariableLvalue
      Symbol
      (Maybe DelayOrEventControl)
      Expression
  deriving (Eq, Show)

data ProceduralContinuousAssignment
  = MkProceduralContinuousAssignmentAssign ProceduralContinuousAssignmentAssign
  | MkProceduralContinuousAssignmentDeassign ProceduralContinuousAssignmentDeassign
  | MkProceduralContinuousAssignmentForceVariable ProceduralContinuousAssignmentForceVariable
  | MkProceduralContinuousAssignmentForceNet ProceduralContinuousAssignmentForceNet
  | MkProceduralContinuousAssignmentReleaseVariable ProceduralContinuousAssignmentReleaseVariable
  | MkProceduralContinuousAssignmentReleaseNet ProceduralContinuousAssignmentReleaseNet
  deriving (Eq, Show)

data ProceduralContinuousAssignmentAssign
  = ProceduralContinuousAssignmentAssign
      Keyword
      VariableAssignment
  deriving (Eq, Show)

data ProceduralContinuousAssignmentDeassign
  = ProceduralContinuousAssignmentDeassign
      Keyword
      VariableLvalue
  deriving (Eq, Show)

data ProceduralContinuousAssignmentForceVariable
  = ProceduralContinuousAssignmentForceVariable
      Keyword
      VariableAssignment
  deriving (Eq, Show)

data ProceduralContinuousAssignmentForceNet
  = ProceduralContinuousAssignmentForceNet
      Keyword
      NetAssignment
  deriving (Eq, Show)

data ProceduralContinuousAssignmentReleaseVariable
  = ProceduralContinuousAssignmentReleaseVariable
      Keyword
      VariableLvalue
  deriving (Eq, Show)

data ProceduralContinuousAssignmentReleaseNet
  = ProceduralContinuousAssignmentReleaseNet
      Keyword
      NetLvalue
  deriving (Eq, Show)

data VariableAssignment
  = VariableAssignment
      VariableLvalue
      Symbol
      Expression
  deriving (Eq, Show)

deriveLit ''InitialConstruct
deriveLit ''AlwaysKeyword
deriveLit ''FinalConstruct
deriveLit ''BlockingAssignmentVariable
deriveLit ''BlockingAssignmentNonrangeVariable
deriveLit ''BlockingAssignmentHierarchicalVariable
deriveLit ''AssignmentOperator
deriveLit ''NonblockingAssignment
deriveLit ''ProceduralContinuousAssignmentDeassign
deriveLit ''ProceduralContinuousAssignmentForceNet
deriveLit ''ProceduralContinuousAssignmentReleaseVariable
deriveLit ''ProceduralContinuousAssignmentReleaseNet
deriveLit ''VariableAssignment
deriveLit ''ProceduralContinuousAssignmentForceVariable
deriveLit ''ProceduralContinuousAssignmentAssign
deriveLit ''ProceduralContinuousAssignment
deriveLit ''OperatorAssignment
deriveLit ''BlockingAssignment
deriveLit ''AlwaysConstruct