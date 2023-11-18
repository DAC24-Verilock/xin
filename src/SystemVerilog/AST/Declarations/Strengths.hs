{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Declarations.Strengths where

import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Symbol)
import Util.Lit (deriveLit)

data DriveStrength
  = MkDriveStrength01 DriveStrength01
  | MkDriveStrength10 DriveStrength10
  | MkDriveStrength0z DriveStrength0z
  | MkDriveStrength1z DriveStrength1z
  | MkDriveStrengthz0 DriveStrengthz0
  | MkDriveStrengthz1 DriveStrengthz1
  deriving (Eq, Show)

newtype DriveStrength01
  = DriveStrength01
      (Paren (Strength0, Symbol, Strength1))
  deriving (Eq, Show)

newtype DriveStrength10
  = DriveStrength10
      (Paren (Strength1, Symbol, Strength0))
  deriving (Eq, Show)

newtype DriveStrength0z
  = DriveStrength0z
      (Paren (Strength0, Symbol, Keyword))
  deriving (Eq, Show)

newtype DriveStrength1z
  = DriveStrength1z
      (Paren (Strength1, Symbol, Keyword))
  deriving (Eq, Show)

newtype DriveStrengthz1
  = DriveStrengthz1
      (Paren (Keyword, Symbol, Strength1))
  deriving (Eq, Show)

newtype DriveStrengthz0
  = DriveStrengthz0
      (Paren (Keyword, Symbol, Strength0))
  deriving (Eq, Show)

data Strength0
  = Supply0 Keyword
  | Strong0 Keyword
  | Pull0 Keyword
  | Weak0 Keyword
  deriving (Eq, Show)

data Strength1
  = Supply1 Keyword
  | Strong1 Keyword
  | Pull1 Keyword
  | Weak1 Keyword
  deriving (Eq, Show)

data ChargeStrength
  = MkChargeStrengthSmall ChargeStrengthSmall
  | MkChargeStrengthMedium ChargeStrengthMedium
  | MkChargeStrengthLarge ChargeStrengthLarge
  deriving (Eq, Show)

newtype ChargeStrengthSmall
  = ChargeStrengthSmall (Paren Keyword)
  deriving (Eq, Show)

newtype ChargeStrengthMedium
  = ChargeStrengthMedium (Paren Keyword)
  deriving (Eq, Show)

newtype ChargeStrengthLarge
  = ChargeStrengthLarge (Paren Keyword)
  deriving (Eq, Show)

deriveLit ''Strength0
deriveLit ''Strength1
deriveLit ''ChargeStrengthSmall
deriveLit ''ChargeStrengthMedium
deriveLit ''ChargeStrengthLarge
deriveLit ''ChargeStrength
deriveLit ''DriveStrength01
deriveLit ''DriveStrength10
deriveLit ''DriveStrength0z
deriveLit ''DriveStrength1z
deriveLit ''DriveStrengthz1
deriveLit ''DriveStrengthz0
deriveLit ''DriveStrength