{-# HLINT ignore "Use newtype instead of data" #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.BehavioralStatements.Statements where

import qualified Data.Text as T
import SystemVerilog.AST.BehavioralStatements.AssertionStatements (ProceduralAssertionStatement)
import SystemVerilog.AST.BehavioralStatements.CaseStatements (CaseStatement, RandcaseStatement)
import SystemVerilog.AST.BehavioralStatements.ClockingBlock (ClockingDrive)
import SystemVerilog.AST.BehavioralStatements.ConditionalStatements (ConditionalStatement)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.LoopingStatements (LoopStatement)
import SystemVerilog.AST.BehavioralStatements.ParallelAndSequentialBlocks (ParBlock, SeqBlock)
import SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments (BlockingAssignment, NonblockingAssignment, ProceduralContinuousAssignment)
import SystemVerilog.AST.BehavioralStatements.Randsequences (RandsequenceStatement)
import SystemVerilog.AST.BehavioralStatements.SubroutineCallStatements (SubroutineCallStatement)
import SystemVerilog.AST.BehavioralStatements.TimingControlStatements
  ( DisableStatement,
    EventTrigger,
    JumpStatement,
    ProceduralTimingControlStatement,
    WaitStatement,
  )
import {-# SOURCE #-} SystemVerilog.AST.Declarations.AssertionDeclarations (ExpectPropertyStatement)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (IncOrDecExpression)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (BlockIdentifier, VariableIdentifier)
import SystemVerilog.AST.SpecialNodes (Splits, Symbol)
import Util.Lit (Lit (..))

data StatementOrNull
  = MkStatement Statement
  | MkStatementOrNullAttribute StatementOrNullAttribute
  deriving (Eq, Show)

instance Lit StatementOrNull where
  lit (MkStatement x) = lit x
  lit (MkStatementOrNullAttribute x) = lit x

data StatementOrNullAttribute
  = StatementOrNullAttribute
      [AttributeInstance]
      Symbol
  deriving (Eq, Show)

instance Lit StatementOrNullAttribute where
  lit (StatementOrNullAttribute l s) = lit l `T.append` lit s

data Statement
  = Statement
      (Maybe (BlockIdentifier, Symbol))
      [AttributeInstance]
      StatementItem
  deriving (Eq, Show)

instance Lit Statement where
  lit (Statement a b c) = T.concat [lit a, lit b, lit c]

data StatementItem
  = BlockingAssignment BlockingAssignment Symbol
  | NonblockingAssignment NonblockingAssignment Symbol
  | ProceduralContinuousAssignment ProceduralContinuousAssignment Symbol
  | MkCaseStatement CaseStatement
  | MkConditionalStatement ConditionalStatement
  | IncOrDecExpression IncOrDecExpression Symbol
  | MkSubroutineCallStatement SubroutineCallStatement
  | MkDisableStatement DisableStatement
  | MkEventTrigger EventTrigger
  | MkLoopStatement LoopStatement
  | MkJumpStatement JumpStatement
  | MkParBlock ParBlock
  | MkProceduralTimingControlStatement ProceduralTimingControlStatement
  | MkSeqBlock SeqBlock
  | MkWaitStatement WaitStatement
  | MkProceduralAssertionStatement ProceduralAssertionStatement
  | ClockingDrive ClockingDrive Symbol
  | MkRandsequenceStatement RandsequenceStatement
  | MkRandcaseStatement RandcaseStatement
  | MkExpectPropertyStatement ExpectPropertyStatement
  deriving (Eq, Show)

instance Lit StatementItem where
  lit (BlockingAssignment a b) = lit a `T.append` lit b
  lit (NonblockingAssignment a b) = lit a `T.append` lit b
  lit (ProceduralContinuousAssignment a b) = lit a `T.append` lit b
  lit (MkCaseStatement a) = lit a
  lit (MkConditionalStatement a) = lit a
  lit (IncOrDecExpression a b) = lit a `T.append` lit b
  lit (MkSubroutineCallStatement a) = lit a
  lit (MkDisableStatement a) = lit a
  lit (MkEventTrigger a) = lit a
  lit (MkLoopStatement a) = lit a
  lit (MkJumpStatement a) = lit a
  lit (MkParBlock a) = lit a
  lit (MkProceduralTimingControlStatement a) = lit a
  lit (MkSeqBlock a) = lit a
  lit (MkWaitStatement a) = lit a
  lit (MkProceduralAssertionStatement a) = lit a
  lit (ClockingDrive a b) = lit a `T.append` lit b
  lit (MkRandsequenceStatement a) = lit a
  lit (MkRandcaseStatement a) = lit a
  lit (MkExpectPropertyStatement a) = lit a

data FunctionStatement
  = FunctionStatement Statement
  deriving (Eq, Show)

instance Lit FunctionStatement where
  lit (FunctionStatement s) = lit s

data FunctionStatementOrNull
  = MkFunctionStatement FunctionStatement
  | MkFunctionStatementOrNullAttribute FunctionStatementOrNullAttribute
  deriving (Eq, Show)

instance Lit FunctionStatementOrNull where
  lit (MkFunctionStatement x) = lit x
  lit (MkFunctionStatementOrNullAttribute x) = lit x

data FunctionStatementOrNullAttribute
  = FunctionStatementOrNullAttribute
      [AttributeInstance]
      Symbol
  deriving (Eq, Show)

instance Lit FunctionStatementOrNullAttribute where
  lit (FunctionStatementOrNullAttribute l s) = lit l `T.append` lit s

data VariableIdentifierList
  = VariableIdentifierList (Splits Symbol VariableIdentifier)
  deriving (Eq, Show)

instance Lit VariableIdentifierList where
  lit (VariableIdentifierList x) = lit x