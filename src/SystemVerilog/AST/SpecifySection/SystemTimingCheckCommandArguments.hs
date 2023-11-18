{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SpecifySection.SystemTimingCheckCommandArguments where

import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression, ConstantMintypmaxExpression, Expression, MintypmaxExpression)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (TerminalIdentifier, VariableIdentifier)
import SystemVerilog.AST.SpecialNodes (Bracket)
import SystemVerilog.AST.SpecifySection.SpecifyTimingCheckEventDefinitions (ControlledTimingCheckEvent, TimingCheckEvent)
import Util.Lit (deriveLit)

newtype TimecheckCondition
  = TimecheckCondition
      MintypmaxExpression
  deriving (Eq, Show)

newtype ControlledReferenceEvent
  = ControlledReferenceEvent
      ControlledTimingCheckEvent
  deriving (Eq, Show)

newtype DataEvent
  = DataEvent
      TimingCheckEvent
  deriving (Eq, Show)

data DelayedData
  = MkTerminalIdentifier TerminalIdentifier
  | MkDelayedDataWithMintypmax DelayedDataWithMintypmax
  deriving (Eq, Show)

data DelayedDataWithMintypmax
  = DelayedDataWithMintypmax
      TerminalIdentifier
      (Bracket ConstantMintypmaxExpression)
  deriving (Eq, Show)

data DelayedReference
  = MkDelayedReferenceTerminalIdentifier TerminalIdentifier
  | MkDelayedReferenceWithMintypmax DelayedReferenceWithMintypmax
  deriving (Eq, Show)

data DelayedReferenceWithMintypmax
  = DelayedReferenceWithMintypmax
      TerminalIdentifier
      (Bracket ConstantMintypmaxExpression)
  deriving (Eq, Show)

newtype EndEdgeOffset
  = EndEdgeOffset
      MintypmaxExpression
  deriving (Eq, Show)

newtype EventBasedFlag
  = EventBasedFlag
      ConstantExpression
  deriving (Eq, Show)

newtype Notifier
  = Notifier
      VariableIdentifier
  deriving (Eq, Show)

newtype ReferenceEvent
  = ReferenceEvent
      TimingCheckEvent
  deriving (Eq, Show)

newtype RemainActiveFlag
  = RemainActiveFlag
      ConstantMintypmaxExpression
  deriving (Eq, Show)

newtype TimestampCondition
  = TimestampCondition
      MintypmaxExpression
  deriving (Eq, Show)

newtype StartEdgeOffset
  = StartEdgeOffset
      MintypmaxExpression
  deriving (Eq, Show)

newtype Threshold
  = Threshold
      ConstantExpression
  deriving (Eq, Show)

newtype TimingCheckLimit
  = TimingCheckLimit
      Expression
  deriving (Eq, Show)

deriveLit ''TimecheckCondition
deriveLit ''ControlledReferenceEvent
deriveLit ''DataEvent
deriveLit ''DelayedDataWithMintypmax
deriveLit ''DelayedReferenceWithMintypmax
deriveLit ''EndEdgeOffset
deriveLit ''EventBasedFlag
deriveLit ''Notifier
deriveLit ''ReferenceEvent
deriveLit ''RemainActiveFlag
deriveLit ''TimestampCondition
deriveLit ''StartEdgeOffset
deriveLit ''Threshold
deriveLit ''TimingCheckLimit
deriveLit ''DelayedReference
deriveLit ''DelayedData