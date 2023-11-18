{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.BehavioralStatements.LoopingStatements where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.ContinuousAssignmentAndNetAliasStatements (ListOfVariableAssignments)
import SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments (OperatorAssignment)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (Statement, StatementOrNull)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (DataType)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression, IncOrDecExpression)
import SystemVerilog.AST.Expressions.SubroutineCalls (FunctionSubroutineCall)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (IndexVariableIdentifier, PsOrHierarchicalArrayIdentifier, VariableIdentifier)
import SystemVerilog.AST.SpecialNodes (Bracket, Keyword, Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data LoopStatement
  = MkLoopStatementForever LoopStatementForever
  | MkLoopStatementRepeat LoopStatementRepeat
  | MkLoopStatementWhile LoopStatementWhile
  | MkLoopStatementFor LoopStatementFor
  | MkLoopStatementDoWhile LoopStatementDoWhile
  | MkLoopStatementForeach LoopStatementForeach
  deriving (Eq, Show)

data LoopStatementForever
  = LoopStatementForever Keyword StatementOrNull
  deriving (Eq, Show)

data LoopStatementRepeat
  = LoopStatementRepeat Keyword (Paren Expression) StatementOrNull
  deriving (Eq, Show)

data LoopStatementWhile
  = LoopStatementWhile Keyword (Paren Expression) StatementOrNull
  deriving (Eq, Show)

data LoopStatementFor
  = LoopStatementFor
      Keyword
      (Paren (Maybe ForInitialization, Symbol, Maybe Expression, Symbol, Maybe ForStep))
      StatementOrNull
  deriving (Eq, Show)

data LoopStatementDoWhile
  = LoopStatementDoWhile
      Keyword
      StatementOrNull
      Keyword
      (Paren Expression)
      Symbol
  deriving (Eq, Show)

data LoopStatementForeach
  = LoopStatementForeach
      Keyword
      (Paren (PsOrHierarchicalArrayIdentifier, Bracket LoopVariables))
      Statement
  deriving (Eq, Show)

data ForInitialization
  = MkListOfVariableAssignments ListOfVariableAssignments
  | MkForInitializationDeclaration ForInitializationDeclaration
  deriving (Eq, Show)

data ForInitializationDeclaration
  = ForInitializationDeclaration (Splits Symbol ForVariableDeclaration)
  deriving (Eq, Show)

data ForVariableDeclaration
  = ForVariableDeclaration
      (Maybe Var)
      DataType
      (Splits Symbol (VariableIdentifier, Symbol, Expression))
  deriving (Eq, Show)

data Var
  = Var Keyword
  deriving (Eq, Show)

data ForStep
  = ForStep (Splits Symbol ForStepAssignment)
  deriving (Eq, Show)

data ForStepAssignment
  = MkOperatorAssignment OperatorAssignment
  | MkIncOrDecExpression IncOrDecExpression
  | MkFunctionSubroutineCall FunctionSubroutineCall
  deriving (Eq, Show)

data LoopVariables
  = LoopVariables (Splits Symbol (Maybe IndexVariableIdentifier))
  deriving (Eq, Show)

deriveLit ''LoopStatementForever
deriveLit ''LoopStatementRepeat
deriveLit ''LoopStatementWhile
deriveLit ''LoopStatementDoWhile
deriveLit ''Var
deriveLit ''ForStepAssignment
deriveLit ''LoopVariables
deriveLit ''ForStep
deriveLit ''ForVariableDeclaration
deriveLit ''ForInitializationDeclaration
deriveLit ''ForInitialization
deriveLit ''LoopStatementForeach
deriveLit ''LoopStatementFor
deriveLit ''LoopStatement