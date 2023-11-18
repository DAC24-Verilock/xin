{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Instantiations.InterfaceInstantiation where

import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (InterfaceIdentifier)
import SystemVerilog.AST.Instantiations.ModuleInstantiation (HierarchicalInstance, ParameterValueAssignment)
import SystemVerilog.AST.SpecialNodes (Splits, Symbol)
import Util.Lit (deriveLit)

data InterfaceInstantiation
  = InterfaceInstantiation
      InterfaceIdentifier
      (Maybe ParameterValueAssignment)
      (Splits Symbol HierarchicalInstance)
      Symbol
  deriving (Eq, Show)

deriveLit ''InterfaceInstantiation