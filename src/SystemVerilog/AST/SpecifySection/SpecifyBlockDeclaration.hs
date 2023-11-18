{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SpecifySection.SpecifyBlockDeclaration where

import SystemVerilog.AST.Declarations.ModuleParameterDeclarations (SpecparamDeclaration)
import SystemVerilog.AST.SpecialNodes (Keyword, Symbol)
import {-# SOURCE #-} SystemVerilog.AST.SpecifySection.SpecifyPathDeclarations (ListOfPathOutputs, PathDeclaration)
import SystemVerilog.AST.SpecifySection.SystemTimingCheckCommands (SystemTimingCheck)
import Util.Lit (deriveLit)

data SpecifyBlock
  = SpecifyBlock
      Keyword
      [SpecifyItem]
      Keyword
  deriving (Eq, Show)

data SpecifyItem
  = MkSpecparamDeclaration SpecparamDeclaration
  | MkPulsestyleDeclaration PulsestyleDeclaration
  | MkShowcancelledDeclaration ShowcancelledDeclaration
  | MkPathDeclaration PathDeclaration
  | MkSystemTimingCheck SystemTimingCheck
  deriving (Eq, Show)

data PulsestyleDeclaration
  = PulsestyleDeclaration
      Keyword
      ListOfPathOutputs
      Symbol
  deriving (Eq, Show)

data ShowcancelledDeclaration
  = ShowcancelledDeclaration
      Keyword
      ListOfPathOutputs
      Symbol
  deriving (Eq, Show)

deriveLit ''PulsestyleDeclaration
deriveLit ''ShowcancelledDeclaration
deriveLit ''SpecifyItem
deriveLit ''SpecifyBlock