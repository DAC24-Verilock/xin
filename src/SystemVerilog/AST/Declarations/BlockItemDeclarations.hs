{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Declarations.BlockItemDeclarations where

import SystemVerilog.AST.Declarations.LetDeclarations (LetDeclaration)
import SystemVerilog.AST.Declarations.ModuleParameterDeclarations (LocalParameterDeclaration, ParameterDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TypeDeclarations (DataDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import SystemVerilog.AST.SpecialNodes (Symbol)
import Util.Lit (deriveLit)

data BlockItemDeclaration
  = MkBlockItemDeclarationData BlockItemDeclarationData
  | MkBlockItemDeclarationLocalParameter BlockItemDeclarationLocalParameter
  | MkBlockItemDeclarationParameter BlockItemDeclarationParameter
  | MkBlockItemDeclarationLet BlockItemDeclarationLet
  deriving (Eq, Show)

data BlockItemDeclarationData
  = BlockItemDeclarationData
      [AttributeInstance]
      DataDeclaration
  deriving (Eq, Show)

data BlockItemDeclarationLocalParameter
  = BlockItemDeclarationLocalParameter
      [AttributeInstance]
      LocalParameterDeclaration
      Symbol
  deriving (Eq, Show)

data BlockItemDeclarationParameter
  = BlockItemDeclarationParameter
      [AttributeInstance]
      ParameterDeclaration
      Symbol
  deriving (Eq, Show)

data BlockItemDeclarationLet
  = BlockItemDeclarationLet
      [AttributeInstance]
      LetDeclaration
  deriving (Eq, Show)

deriveLit ''BlockItemDeclarationData
deriveLit ''BlockItemDeclarationLocalParameter
deriveLit ''BlockItemDeclarationParameter
deriveLit ''BlockItemDeclarationLet
deriveLit ''BlockItemDeclaration