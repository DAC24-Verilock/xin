{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Expressions.Numbers where

import qualified Data.Text as T
import SystemVerilog.AST.Lib (Locate)
import SystemVerilog.AST.SpecialNodes (Symbol, WhiteSpace)
import Util.Lit (Lit (..), deriveLit)

data Number
  = MkIntegralNumber IntegralNumber
  | MkRealNumber RealNumber
  deriving (Eq, Show)

data IntegralNumber
  = MkDecimalNumber DecimalNumber
  | MkOctalNumber OctalNumber
  | MkBinaryNumber BinaryNumber
  | MkHexNumber HexNumber
  deriving (Eq, Show)

data DecimalNumber
  = MKUnsignedNumber UnsignedNumber
  | MkDecimalNumberBaseUnsigned DecimalNumberBaseUnsigned
  | MKDecimalNumberBaseXNumber DecimalNumberBaseXNumber
  | MkDecimalNumberBaseZNumber DecimalNumberBaseZNumber
  deriving (Eq, Show)

data DecimalNumberBaseUnsigned
  = DecimalNumberBaseUnsigned
      (Maybe Size)
      DecimalBase
      UnsignedNumber
  deriving (Eq, Show)

data DecimalNumberBaseXNumber
  = DecimalNumberBaseXNumber
      (Maybe Size)
      DecimalBase
      XNumber
  deriving (Eq, Show)

data DecimalNumberBaseZNumber
  = DecimalNumberBaseZNumber
      (Maybe Size)
      DecimalBase
      ZNumber
  deriving (Eq, Show)

data BinaryNumber
  = BinaryNumber
      (Maybe Size)
      BinaryBase
      BinaryValue
  deriving (Eq, Show)

data OctalNumber
  = OctalNumber
      (Maybe Size)
      OctalBase
      OctalValue
  deriving (Eq, Show)

data HexNumber
  = HexNumber
      (Maybe Size)
      HexBase
      HexValue
  deriving (Eq, Show)

data Sign
  = Plus Symbol
  | Minus Symbol
  deriving (Eq, Show)

newtype Size = Size NonZeroUnsignedNumber deriving (Eq, Show)

data NonZeroUnsignedNumber
  = NonZeroUnsignedNumber
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit NonZeroUnsignedNumber where
  lit (NonZeroUnsignedNumber t _ l) = t `T.append` lit l

data RealNumber
  = MkFixedPointNumber FixedPointNumber
  | MkRealNumberFloating RealNumberFloating
  deriving (Eq, Show)

data RealNumberFloating
  = RealNumberFloating
      UnsignedNumber
      (Maybe (Symbol, UnsignedNumber))
      Exp
      (Maybe Sign)
      UnsignedNumber
  deriving (Eq, Show)

data FixedPointNumber
  = FixedPointNumber
      UnsignedNumber
      Symbol
      UnsignedNumber
  deriving (Eq, Show)

newtype Exp = Exp Symbol deriving (Eq, Show)

data UnsignedNumber
  = UnsignedNumber
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit UnsignedNumber where
  lit (UnsignedNumber t _ l) = t `T.append` lit l

data BinaryValue
  = BinaryValue
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit BinaryValue where
  lit (BinaryValue t _ l) = t `T.append` lit l

data OctalValue
  = OctalValue
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit OctalValue where
  lit (OctalValue t _ l) = t `T.append` lit l

data HexValue
  = HexValue
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit HexValue where
  lit (HexValue t _ l) = t `T.append` lit l

data DecimalBase
  = DecimalBase
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit DecimalBase where
  lit (DecimalBase t _ l) = t `T.append` lit l

data BinaryBase
  = BinaryBase
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit BinaryBase where
  lit (BinaryBase t _ l) = t `T.append` lit l

data OctalBase
  = OctalBase
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit OctalBase where
  lit (OctalBase t _ l) = t `T.append` lit l

data HexBase
  = HexBase
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit HexBase where
  lit (HexBase t _ l) = t `T.append` lit l

data XNumber
  = XNumber
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit XNumber where
  lit (XNumber t _ l) = t `T.append` lit l

data ZNumber
  = ZNumber
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit ZNumber where
  lit (ZNumber t _ l) = t `T.append` lit l

newtype UnbasedUnsizedLiteral = UnbasedUnsizedLiteral Symbol deriving (Eq, Show)

deriveLit ''Sign
deriveLit ''Size
deriveLit ''FixedPointNumber
deriveLit ''Exp
deriveLit ''UnbasedUnsizedLiteral
deriveLit ''RealNumberFloating
deriveLit ''DecimalNumberBaseUnsigned
deriveLit ''DecimalNumberBaseXNumber
deriveLit ''DecimalNumberBaseZNumber
deriveLit ''BinaryNumber
deriveLit ''OctalNumber
deriveLit ''HexNumber
deriveLit ''DecimalNumber
deriveLit ''IntegralNumber
deriveLit ''RealNumber
deriveLit ''Number