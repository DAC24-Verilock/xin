{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Declarations.ModuleParameterDeclarations where

import SystemVerilog.AST.Declarations.DeclarationLists (ListOfParamAssignments, ListOfSpecparamAssignments, ListOfTypeAssignments)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.DeclarationRanges (PackedDimension)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (DataTypeOrImplicit)
import SystemVerilog.AST.SpecialNodes (Keyword, Symbol)
import Util.Lit (deriveLit)

data LocalParameterDeclaration
  = MkLocalParameterDeclarationParam LocalParameterDeclarationParam
  | MkLocalParameterDeclarationType LocalParameterDeclarationType
  deriving (Eq, Show)

data LocalParameterDeclarationParam
  = LocalParameterDeclarationParam
      Keyword
      DataTypeOrImplicit
      ListOfParamAssignments
  deriving (Eq, Show)

data LocalParameterDeclarationType
  = LocalParameterDeclarationType
      Keyword
      Keyword
      ListOfTypeAssignments
  deriving (Eq, Show)

data ParameterDeclaration
  = MkParameterDeclarationParam ParameterDeclarationParam
  | MkParameterDeclarationType ParameterDeclarationType
  deriving (Eq, Show)

data ParameterDeclarationParam
  = ParameterDeclarationParam
      Keyword
      DataTypeOrImplicit
      ListOfParamAssignments
  deriving (Eq, Show)

data ParameterDeclarationType
  = ParameterDeclarationType
      Keyword
      Keyword
      ListOfTypeAssignments
  deriving (Eq, Show)

data SpecparamDeclaration
  = SpecparamDeclaration
      Keyword
      (Maybe PackedDimension)
      ListOfSpecparamAssignments
      Symbol
  deriving (Eq, Show)

deriveLit ''LocalParameterDeclarationParam
deriveLit ''LocalParameterDeclarationType
deriveLit ''ParameterDeclarationParam
deriveLit ''ParameterDeclarationType
deriveLit ''SpecparamDeclaration
deriveLit ''ParameterDeclaration
deriveLit ''LocalParameterDeclaration