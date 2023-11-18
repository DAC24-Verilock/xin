{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.BehavioralStatements.ParallelAndSequentialBlocks where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (Statement, StatementOrNull)
import SystemVerilog.AST.Declarations.BlockItemDeclarations (BlockItemDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (BlockIdentifier)
import SystemVerilog.AST.SpecialNodes (Keyword, Symbol)
import Util.Lit (deriveLit)

data ActionBlock
  = MkStatementOrNull StatementOrNull
  | MkActionBlockElse ActionBlockElse
  deriving (Eq, Show)

data ActionBlockElse
  = ActionBlockElse
      (Maybe Statement)
      Keyword
      StatementOrNull
  deriving (Eq, Show)

data SeqBlock
  = SeqBlock
      Keyword
      (Maybe (Symbol, BlockIdentifier))
      [BlockItemDeclaration]
      [StatementOrNull]
      Keyword
      (Maybe (Symbol, BlockIdentifier))
  deriving (Eq, Show)

data ParBlock
  = ParBlock
      Keyword
      (Maybe (Symbol, BlockIdentifier))
      [BlockItemDeclaration]
      [StatementOrNull]
      JoinKeyword
      (Maybe (Symbol, BlockIdentifier))
  deriving (Eq, Show)

data JoinKeyword
  = Join Keyword
  | JoinAny Keyword
  | JoinNone Keyword
  deriving (Eq, Show)

deriveLit ''ActionBlockElse
deriveLit ''SeqBlock
deriveLit ''JoinKeyword
deriveLit ''ParBlock
deriveLit ''ActionBlock