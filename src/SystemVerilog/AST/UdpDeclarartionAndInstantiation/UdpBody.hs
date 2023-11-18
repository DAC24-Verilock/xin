{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.UdpDeclarartionAndInstantiation.UdpBody where

import SystemVerilog.AST.General.Identifiers (OutputPortIdentifier)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Symbol)
import Util.Lit (deriveLit)

data UdpBody
  = MkCombinationalBody CombinationalBody
  | MkSequentialBody SequentialBody
  deriving (Eq, Show)

data CombinationalBody
  = CombinationalBody
      Keyword
      CombinationalEntry
      [CombinationalEntry]
      Keyword
  deriving (Eq, Show)

data CombinationalEntry
  = CombinationalEntry
      LevelInputList
      Symbol
      OutputSymbol
      Symbol
  deriving (Eq, Show)

data SequentialBody
  = SequentialBody
      (Maybe UdpInitialStatement)
      Keyword
      SequentialEntry
      [SequentialEntry]
      Keyword
  deriving (Eq, Show)

data UdpInitialStatement
  = UdpInitialStatement
      Keyword
      OutputPortIdentifier
      Symbol
      InitVal
      Symbol
  deriving (Eq, Show)

newtype InitVal = InitVal Keyword deriving (Eq, Show)

data SequentialEntry
  = SequentialEntry
      SeqInputList
      Symbol
      CurrentState
      Symbol
      NextState
      Symbol
  deriving (Eq, Show)

data SeqInputList
  = MkLevelInputList LevelInputList
  | MkEdgeInputList EdgeInputList
  deriving (Eq, Show)

data LevelInputList
  = LevelInputList
      LevelSymbol
      [LevelSymbol]
  deriving (Eq, Show)

data EdgeInputList
  = EdgeInputList
      [LevelSymbol]
      EdgeIndicator
      [LevelSymbol]
  deriving (Eq, Show)

data EdgeIndicator
  = MkEdgeIndicatorParen EdgeIndicatorParen
  | MkEdgeSymbol EdgeSymbol
  deriving (Eq, Show)

newtype EdgeIndicatorParen = EdgeIndicatorParen (Paren (LevelSymbol, LevelSymbol)) deriving (Eq, Show)

newtype CurrentState = CurrentState LevelSymbol deriving (Eq, Show)

data NextState
  = MkOutputSymbol OutputSymbol
  | Minus Symbol
  deriving (Eq, Show)

newtype OutputSymbol = OutputSymbol Symbol deriving (Eq, Show)

newtype LevelSymbol = LevelSymbol Symbol deriving (Eq, Show)

newtype EdgeSymbol = EdgeSymbol Symbol deriving (Eq, Show)

-- the order matters
deriveLit ''InitVal
deriveLit ''OutputSymbol
deriveLit ''LevelSymbol
deriveLit ''EdgeSymbol
deriveLit ''NextState
deriveLit ''CurrentState
deriveLit ''EdgeIndicatorParen
deriveLit ''EdgeIndicator
deriveLit ''EdgeInputList
deriveLit ''LevelInputList
deriveLit ''SeqInputList
deriveLit ''SequentialEntry
deriveLit ''UdpInitialStatement
deriveLit ''SequentialBody
deriveLit ''CombinationalEntry
deriveLit ''CombinationalBody
deriveLit ''UdpBody