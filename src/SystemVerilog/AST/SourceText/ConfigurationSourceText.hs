{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SourceText.ConfigurationSourceText where

import SystemVerilog.AST.Declarations.ModuleParameterDeclarations (LocalParameterDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (CellIdentifier, ConfigIdentifier, InstanceIdentifier, LibraryIdentifier, TopmoduleIdentifier)
import SystemVerilog.AST.Instantiations.ModuleInstantiation (NamedParameterAssignment)
import SystemVerilog.AST.SpecialNodes (Keyword, Splits, Symbol)
import Util.Lit (deriveLit)

data ConfigDeclaration
  = ConfigDeclaration
      Keyword
      ConfigIdentifier
      Symbol
      [(LocalParameterDeclaration, Symbol)]
      DesignStatement
      [ConfigRuleStatement]
      Keyword
      (Maybe (Symbol, ConfigIdentifier))
  deriving (Eq, Show)

data DesignStatement
  = DesignStatement
      Keyword
      [(Maybe (LibraryIdentifier, Symbol), CellIdentifier)]
      Symbol
  deriving (Eq, Show)

data ConfigRuleStatement
  = MkConfigRuleStatementDefault ConfigRuleStatementDefault
  | MkConfigRuleStatementInstLib ConfigRuleStatementInstLib
  | MkConfigRuleStatementInstUse ConfigRuleStatementInstUse
  | MkConfigRuleStatementCellLib ConfigRuleStatementCellLib
  | MkConfigRuleStatementCellUse ConfigRuleStatementCellUse
  deriving (Eq, Show)

data ConfigRuleStatementDefault
  = ConfigRuleStatementDefault
      DefaultClause
      LiblistClause
      Symbol
  deriving (Eq, Show)

data ConfigRuleStatementInstLib
  = ConfigRuleStatementInstLib
      InstClause
      LiblistClause
      Symbol
  deriving (Eq, Show)

data ConfigRuleStatementInstUse
  = ConfigRuleStatementInstUse
      InstClause
      UseClause
      Symbol
  deriving (Eq, Show)

data ConfigRuleStatementCellLib
  = ConfigRuleStatementCellLib
      CellClause
      LiblistClause
      Symbol
  deriving (Eq, Show)

data ConfigRuleStatementCellUse
  = ConfigRuleStatementCellUse
      CellClause
      UseClause
      Symbol
  deriving (Eq, Show)

newtype DefaultClause = DefaultClause Keyword deriving (Eq, Show)

data InstClause
  = InstClause
      Keyword
      InstName
  deriving (Eq, Show)

data InstName
  = InstName
      TopmoduleIdentifier
      [(Symbol, InstanceIdentifier)]
  deriving (Eq, Show)

data CellClause
  = CellClause
      Keyword
      (Maybe (LibraryIdentifier, Symbol))
      CellIdentifier
  deriving (Eq, Show)

data LiblistClause
  = LiblistClause
      Keyword
      [LibraryIdentifier]
  deriving (Eq, Show)

data UseClause
  = MkUseClauseCell UseClauseCell
  | MkUseClauseNamed UseClauseNamed
  | MkUseClauseCellNamed UseClauseCellNamed
  deriving (Eq, Show)

data UseClauseCell
  = UseClauseCell
      Keyword
      (Maybe (LibraryIdentifier, Symbol))
      CellIdentifier
      (Maybe (Symbol, Config))
  deriving (Eq, Show)

data UseClauseNamed
  = UseClauseNamed
      Keyword
      (Splits Symbol NamedParameterAssignment)
      (Maybe (Symbol, Config))
  deriving (Eq, Show)

data UseClauseCellNamed
  = UseClauseCellNamed
      Keyword
      (Maybe (LibraryIdentifier, Symbol))
      CellIdentifier
      (Splits Symbol NamedParameterAssignment)
      (Maybe (Symbol, Config))
  deriving (Eq, Show)

newtype Config = Config Keyword deriving (Eq, Show)

deriveLit ''DesignStatement
deriveLit ''DefaultClause
deriveLit ''InstName
deriveLit ''CellClause
deriveLit ''LiblistClause
deriveLit ''Config
deriveLit ''UseClauseCell
deriveLit ''UseClauseNamed
deriveLit ''UseClauseCellNamed
deriveLit ''UseClause
deriveLit ''InstClause
deriveLit ''ConfigRuleStatementDefault
deriveLit ''ConfigRuleStatementInstLib
deriveLit ''ConfigRuleStatementInstUse
deriveLit ''ConfigRuleStatementCellLib
deriveLit ''ConfigRuleStatementCellUse
deriveLit ''ConfigRuleStatement
deriveLit ''ConfigDeclaration