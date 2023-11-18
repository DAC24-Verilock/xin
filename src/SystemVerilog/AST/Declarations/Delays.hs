module SystemVerilog.AST.Declarations.Delays where

import qualified Data.Text as T
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (MintypmaxExpression)
import SystemVerilog.AST.Expressions.Numbers (RealNumber, UnsignedNumber)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (TimeLiteral)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (HierarchicalIdentifier, PsIdentifier)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Symbol)
import Util.Lit (Lit(..))

data Delay3
  = MkDelay3Single Delay3Single
  | MkDelay3Mintypmax Delay3Mintypmax
  deriving (Eq, Show)

instance Lit Delay3 where
  lit (MkDelay3Single x) = lit x
  lit (MkDelay3Mintypmax x) = lit x

data Delay3Single
  = Delay3Single
      Symbol
      DelayValue
  deriving (Eq, Show)

instance Lit Delay3Single where
  lit (Delay3Single a b) = lit a `T.append` lit b

data Delay3Mintypmax
  = Delay3Mintypmax
      Symbol
      (Paren (MintypmaxExpression, Maybe (Symbol, MintypmaxExpression, Maybe (Symbol, MintypmaxExpression))))
  deriving (Eq, Show)

instance Lit Delay3Mintypmax where
  lit (Delay3Mintypmax a b) = lit a `T.append` lit b

data Delay2
  = MkDelay2Single Delay2Single
  | MkDelay2Mintypmax Delay2Mintypmax
  deriving (Eq, Show)

instance Lit Delay2 where
  lit (MkDelay2Single x) = lit x
  lit (MkDelay2Mintypmax x) = lit x

data Delay2Single
  = Delay2Single
      Symbol
      DelayValue
  deriving (Eq, Show)

instance Lit Delay2Single where
  lit (Delay2Single a b) = lit a `T.append` lit b

data Delay2Mintypmax
  = Delay2Mintypmax
      Symbol
      (Paren (MintypmaxExpression, Maybe (Symbol, MintypmaxExpression)))
  deriving (Eq, Show)

instance Lit Delay2Mintypmax where
  lit (Delay2Mintypmax a b) = lit a `T.append` lit b

data DelayValue
  = MkUnsignedNumber UnsignedNumber
  | MkRealNumber RealNumber
  | MkPsIdentifier PsIdentifier
  | MkHierarchicalIdentifier HierarchicalIdentifier
  | MkTimeLiteral TimeLiteral
  | Step1 Keyword
  deriving (Eq, Show)

instance Lit DelayValue where
  lit (MkUnsignedNumber x) = lit x
  lit (MkRealNumber x) = lit x
  lit (MkPsIdentifier x) = lit x
  lit (MkHierarchicalIdentifier x) = lit x
  lit (MkTimeLiteral x) = lit x
  lit (Step1 x) = lit x