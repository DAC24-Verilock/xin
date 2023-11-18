{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.PrimitiveInstances.PrimitiveStrengths where

import SystemVerilog.AST.Declarations.Strengths (Strength0, Strength1)
import SystemVerilog.AST.SpecialNodes (Paren, Symbol)
import Util.Lit (deriveLit)

data PulldownStrength
  = MkPulldownStrength01 PulldownStrength01
  | MkPulldownStrength10 PulldownStrength10
  | MkPulldownStrength0 PulldownStrength0
  deriving (Eq, Show)

newtype PulldownStrength01
  = PulldownStrength01
      (Paren (Strength0, Symbol, Strength1))
  deriving (Eq, Show)

newtype PulldownStrength10
  = PulldownStrength10
      (Paren (Strength1, Symbol, Strength0))
  deriving (Eq, Show)

newtype PulldownStrength0
  = PulldownStrength0
      (Paren Strength0)
  deriving (Eq, Show)

data PullupStrength
  = MkPullupStrength01 PullupStrength01
  | MkPullupStrength10 PullupStrength10
  | MkPullupStrength1 PullupStrength1
  deriving (Eq, Show)

newtype PullupStrength01
  = PullupStrength01
      (Paren (Strength0, Symbol, Strength1))
  deriving (Eq, Show)

newtype PullupStrength10
  = PullupStrength10
      (Paren (Strength1, Symbol, Strength0))
  deriving (Eq, Show)

newtype PullupStrength1
  = PullupStrength1
      (Paren Strength1)
  deriving (Eq, Show)

deriveLit ''PulldownStrength01
deriveLit ''PulldownStrength10
deriveLit ''PulldownStrength0
deriveLit ''PullupStrength01
deriveLit ''PullupStrength10
deriveLit ''PullupStrength1
deriveLit ''PullupStrength
deriveLit ''PulldownStrength