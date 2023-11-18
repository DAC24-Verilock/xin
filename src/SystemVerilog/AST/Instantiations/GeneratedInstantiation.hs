{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.Instantiations.GeneratedInstantiation where

import SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments (AssignmentOperator)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression, GenvarExpression)
import SystemVerilog.AST.Expressions.Operators (IncOrDecOperator)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (GenerateBlockIdentifier, GenvarIdentifier)
import SystemVerilog.AST.SourceText.CheckerItems (CheckerOrGenerateItem)
import SystemVerilog.AST.SourceText.InterfaceItems (InterfaceOrGenerateItem)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.ModuleItems (ModuleOrGenerateItem)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data GenerateRegion
  = GenerateRegion
      Keyword
      [GenerateItem]
      Keyword
  deriving (Eq, Show)

data LoopGenerateConstruct
  = LoopGenerateConstruct
      Keyword
      (Paren (GenvarInitialization, Symbol, GenvarExpression, Symbol, GenvarIteration))
      GenerateBlock
  deriving (Eq, Show)

data GenvarInitialization
  = GenvarInitialization
      (Maybe Genvar)
      GenvarIdentifier
      Symbol
      ConstantExpression
  deriving (Eq, Show)

data Genvar = Genvar Keyword deriving (Eq, Show)

data GenvarIteration
  = MkGenvarIterationAssignment GenvarIterationAssignment
  | MkGenvarIterationPrefix GenvarIterationPrefix
  | MkGenvarIterationSuffix GenvarIterationSuffix
  deriving (Eq, Show)

data GenvarIterationAssignment
  = GenvarIterationAssignment
      GenvarIdentifier
      AssignmentOperator
      GenvarExpression
  deriving (Eq, Show)

data GenvarIterationPrefix
  = GenvarIterationPrefix
      IncOrDecOperator
      GenvarIdentifier
  deriving (Eq, Show)

data GenvarIterationSuffix
  = GenvarIterationSuffix
      GenvarIdentifier
      IncOrDecOperator
  deriving (Eq, Show)

data ConditionalGenerateConstruct
  = MkIfGenerateConstruct IfGenerateConstruct
  | MkCaseGenerateConstruct CaseGenerateConstruct
  deriving (Eq, Show)

data IfGenerateConstruct
  = IfGenerateConstruct
      Keyword
      (Paren ConstantExpression)
      GenerateBlock
      (Maybe (Keyword, GenerateBlock))
  deriving (Eq, Show)

data CaseGenerateConstruct
  = CaseGenerateConstruct
      Keyword
      (Paren ConstantExpression)
      [CaseGenerateItem]
      Keyword
  deriving (Eq, Show)

data CaseGenerateItem
  = MkCaseGenerateItemNondefault CaseGenerateItemNondefault
  | MkCaseGenerateItemDefault CaseGenerateItemDefault
  deriving (Eq, Show)

data CaseGenerateItemNondefault
  = CaseGenerateItemNondefault
      (Splits Symbol ConstantExpression)
      Symbol
      GenerateBlock
  deriving (Eq, Show)

data CaseGenerateItemDefault
  = CaseGenerateItemDefault
      Keyword
      (Maybe Symbol)
      GenerateBlock
  deriving (Eq, Show)

data GenerateBlock
  = MkGenerateItem GenerateItem
  | MkGenerateBlockMultiple GenerateBlockMultiple
  deriving (Eq, Show)

data GenerateBlockMultiple
  = GenerateBlockMultiple
      (Maybe (GenerateBlockIdentifier, Symbol))
      Keyword
      (Maybe (Symbol, GenerateBlockIdentifier))
      [GenerateItem]
      Keyword
      (Maybe (Symbol, GenerateBlockIdentifier))
  deriving (Eq, Show)

data GenerateItem
  = MkModuleOrGenerateItem ModuleOrGenerateItem
  | MkInterfaceOrGenerateItem InterfaceOrGenerateItem
  | MkCheckerOrGenerateItem CheckerOrGenerateItem
  deriving (Eq, Show)

deriveLit ''Genvar
deriveLit ''GenvarIterationAssignment
deriveLit ''GenvarIterationPrefix
deriveLit ''GenvarIterationSuffix
deriveLit ''GenerateItem
deriveLit ''GenerateBlockMultiple
deriveLit ''GenerateBlock
deriveLit ''IfGenerateConstruct
deriveLit ''CaseGenerateItemNondefault
deriveLit ''CaseGenerateItemDefault
deriveLit ''CaseGenerateItem
deriveLit ''CaseGenerateConstruct
deriveLit ''ConditionalGenerateConstruct
deriveLit ''GenvarIteration
deriveLit ''GenerateRegion
deriveLit ''GenvarInitialization
deriveLit ''LoopGenerateConstruct