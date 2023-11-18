{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Instantiations.ProgramInstantiation where

import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (ProgramIdentifier)
import SystemVerilog.AST.Instantiations.ModuleInstantiation (HierarchicalInstance, ParameterValueAssignment)
import SystemVerilog.AST.SpecialNodes (Splits, Symbol)
import Util.Lit (deriveLit)

data ProgramInstantiation
  = ProgramInstantiation
      ProgramIdentifier
      (Maybe ParameterValueAssignment)
      (Splits Symbol HierarchicalInstance)
      Symbol
  deriving (Eq, Show)

deriveLit ''ProgramInstantiation