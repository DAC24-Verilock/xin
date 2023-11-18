{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.BehavioralStatements.AssertionStatements where

import SystemVerilog.AST.BehavioralStatements.ParallelAndSequentialBlocks (ActionBlock)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (StatementOrNull)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.AssertionDeclarations (ConcurrentAssertionItem, ConcurrentAssertionStatement)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (BlockIdentifier)
import SystemVerilog.AST.Instantiations.CheckerInstantiation (CheckerInstantiation)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Symbol)
import Util.Lit (deriveLit)

data AssertionItem
  = MkConcurrentAssertionItem ConcurrentAssertionItem
  | MkImmediateAssertionItem DeferredImmediateAssetionItem
  deriving (Eq, Show)

data DeferredImmediateAssetionItem
  = DeferredImmediateAssetionItem (Maybe (BlockIdentifier, Symbol)) DeferredImmediateAssertionStatement
  deriving (Eq, Show)

data ProceduralAssertionStatement
  = MkConcurrentProceduralAssertionStatement ConcurrentAssertionStatement
  | MkImmediateProceduralAssertionStatement ImmediateAssertionStatement
  | MkCheckerInstantiation CheckerInstantiation
  deriving (Eq, Show)

data ImmediateAssertionStatement
  = MkSimpleImmediateAssertionStatement SimpleImmediateAssertionStatement
  | MkDeferredImmediateAssertionStatement DeferredImmediateAssertionStatement
  deriving (Eq, Show)

data SimpleImmediateAssertionStatement
  = SimpleImmediateAssertionStatement
      Keyword
      (Paren Expression)
      ActionBlock
  deriving (Eq, Show)

data SimpleImmediateCoverStatement
  = SimpleImmediateCoverStatement
      Keyword
      (Paren Expression)
      StatementOrNull
  deriving (Eq, Show)

data DeferredImmediateAssertionStatement
  = MkDeferredImmediateAssertStatement DeferredImmediateAssertStatement
  | MkDeferredImmediateAssumeStatement DeferredImmediateAssumeStatement
  | MkDeferredImmediateCoverStatement DeferredImmediateCoverStatement
  deriving (Eq, Show)

data DeferredImmediateAssertStatement
  = DeferredImmediateAssertStatement
      Keyword
      AssertingTime
      (Paren Expression)
      ActionBlock
  deriving (Eq, Show)

data DeferredImmediateAssumeStatement
  = DeferredImmediateAssumeStatement
      Keyword
      AssertingTime
      (Paren Expression)
      ActionBlock
  deriving (Eq, Show)

data DeferredImmediateCoverStatement
  = DeferredImmediateCoverStatement
      Keyword
      AssertingTime
      (Paren Expression)
      StatementOrNull
  deriving (Eq, Show)

data AssertingTime
  = Zero Symbol
  | Final Keyword
  deriving (Eq, Show)

deriveLit ''SimpleImmediateAssertionStatement
deriveLit ''SimpleImmediateCoverStatement
deriveLit ''AssertingTime
deriveLit ''DeferredImmediateCoverStatement
deriveLit ''DeferredImmediateAssumeStatement
deriveLit ''DeferredImmediateAssertStatement
deriveLit ''DeferredImmediateAssertionStatement
deriveLit ''ImmediateAssertionStatement
deriveLit ''ProceduralAssertionStatement
deriveLit ''DeferredImmediateAssetionItem
deriveLit ''AssertionItem