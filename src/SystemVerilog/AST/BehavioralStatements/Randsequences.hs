{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.BehavioralStatements.Randsequences where

import SystemVerilog.AST.BehavioralStatements.CaseStatements (CaseExpression, CaseItemExpression)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (StatementOrNull)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (DataTypeOrVoid)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TaskDeclarations (TfPortList)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TypeDeclarations (DataDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import SystemVerilog.AST.Expressions.Numbers (IntegralNumber)
import SystemVerilog.AST.Expressions.SubroutineCalls (ListOfArguments)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (ProductionIdentifier, PsIdentifier)
import SystemVerilog.AST.SpecialNodes (Brace, Keyword, Paren, Splits, Symbol)
import Util.Lit (deriveLit)

data RandsequenceStatement
  = RandsequenceStatement
      Keyword
      (Paren (Maybe ProductionIdentifier))
      Production
      [Production]
      Keyword
  deriving (Eq, Show)

data Production
  = Production
      (Maybe DataTypeOrVoid)
      ProductionIdentifier
      (Maybe (Paren TfPortList))
      Symbol
      (Splits Symbol RsRule)
      Symbol
  deriving (Eq, Show)

data RsRule
  = RsRule
      RsProductionList
      (Maybe (Symbol, WeightSpecification, Maybe RsCodeBlock))
  deriving (Eq, Show)

data RsProductionList
  = MkRsProductionListProd RsProductionListProd
  | MkRsProductionListJoin RsProductionListJoin
  deriving (Eq, Show)

data RsProductionListProd
  = RsProductionListProd
      RsProd
      [RsProd]
  deriving (Eq, Show)

data RsProductionListJoin
  = RsProductionListJoin
      Keyword
      Keyword
      (Maybe (Paren Expression))
      ProductionItem
      ProductionItem
      [ProductionItem]
  deriving (Eq, Show)

data WeightSpecification
  = MkIntegralNumber IntegralNumber
  | MkPsIdentifier PsIdentifier
  | MkWeightSpecificationExpression WeightSpecificationExpression
  deriving (Eq, Show)

newtype WeightSpecificationExpression
  = WeightSpecificationExpression (Paren Expression)
  deriving (Eq, Show)

newtype RsCodeBlock
  = RsCodeBlock (Brace ([DataDeclaration], [StatementOrNull]))
  deriving (Eq, Show)

data RsProd
  = MkProductionItem ProductionItem
  | MkRsCodeBlock RsCodeBlock
  | MkRsIfElse RsIfElse
  | MkRsRepeat RsRepeat
  | MkRsCase RsCase
  deriving (Eq, Show)

data ProductionItem
  = ProductionItem
      ProductionIdentifier
      (Maybe (Paren ListOfArguments))
  deriving (Eq, Show)

data RsIfElse
  = RsIfElse
      Keyword
      (Paren Expression)
      ProductionItem
      (Maybe (Keyword, ProductionItem))
  deriving (Eq, Show)

data RsRepeat
  = RsRepeat
      Keyword
      (Paren Expression)
      ProductionItem
  deriving (Eq, Show)

data RsCase
  = RsCase
      Keyword
      (Paren CaseExpression)
      RsCaseItem
      [RsCaseItem]
      Keyword
  deriving (Eq, Show)

data RsCaseItem
  = MkRsCaseItemNondefault RsCaseItemNondefault
  | MkRsCaseItemDefault RsCaseItemDefault
  deriving (Eq, Show)

data RsCaseItemNondefault
  = RsCaseItemNondefault
      (Splits Symbol CaseItemExpression)
      Symbol
      ProductionItem
      Symbol
  deriving (Eq, Show)

data RsCaseItemDefault
  = RsCaseItemDefault
      Keyword
      (Maybe Symbol)
      ProductionItem
      Symbol
  deriving (Eq, Show)

deriveLit ''WeightSpecificationExpression
deriveLit ''RsCodeBlock
deriveLit ''ProductionItem
deriveLit ''RsIfElse
deriveLit ''RsRepeat
deriveLit ''RsCaseItemNondefault
deriveLit ''RsCaseItemDefault
deriveLit ''RsCaseItem
deriveLit ''RsCase
deriveLit ''RsProd
deriveLit ''WeightSpecification
deriveLit ''RsProductionListProd
deriveLit ''RsProductionListJoin
deriveLit ''RsProductionList
deriveLit ''RsRule
deriveLit ''Production
deriveLit ''RandsequenceStatement