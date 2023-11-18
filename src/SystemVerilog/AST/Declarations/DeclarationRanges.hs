{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.Declarations.DeclarationRanges where

import SystemVerilog.AST.Declarations.NetAndVariableTypes (DataType)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression, ConstantRange)
import SystemVerilog.AST.SpecialNodes (Bracket, Symbol)
import Util.Lit (deriveLit)

data UnpackedDimension
  = MkUnpackedDimensionRange UnpackedDimensionRange
  | MkUnpackedDimensionExpression UnpackedDimensionExpression
  deriving (Eq, Show)

data UnpackedDimensionRange = UnpackedDimensionRange (Bracket ConstantRange) deriving (Eq, Show)

data UnpackedDimensionExpression = UnpackedDimensionExpression (Bracket ConstantExpression) deriving (Eq, Show)

data PackedDimension
  = MkPackedDimensionRange PackedDimensionRange
  | MkUnsizedDimension UnsizedDimension
  deriving (Eq, Show)

data PackedDimensionRange = PackedDimensionRange (Bracket ConstantRange) deriving (Eq, Show)

data AssociativeDimension
  = MkAssociativeDimensionDataType AssociativeDimensionDataType
  | MkAssociativeDimensionAsterisk AssociativeDimensionAsterisk
  deriving (Eq, Show)

data AssociativeDimensionDataType = AssociativeDimensionDataType (Bracket DataType) deriving (Eq, Show)

data AssociativeDimensionAsterisk = AssociativeDimensionAsterisk (Bracket Symbol) deriving (Eq, Show)

data VariableDimension
  = MkVariableDimensionUnsizedDimension UnsizedDimension
  | MkUnpackedDimension UnpackedDimension
  | MkAssociativeDimension AssociativeDimension
  | MkQueueDimension QueueDimension
  deriving (Eq, Show)

data QueueDimension = QueueDimension (Bracket (Symbol, Maybe (Symbol, ConstantExpression))) deriving (Eq, Show)

data UnsizedDimension = UnsizedDimension Symbol Symbol deriving (Eq, Show)

deriveLit ''UnpackedDimensionRange
deriveLit ''UnpackedDimensionExpression
deriveLit ''PackedDimensionRange
deriveLit ''AssociativeDimensionDataType
deriveLit ''AssociativeDimensionAsterisk
deriveLit ''QueueDimension
deriveLit ''UnsizedDimension
deriveLit ''UnpackedDimension
deriveLit ''AssociativeDimension
deriveLit ''VariableDimension
deriveLit ''PackedDimension