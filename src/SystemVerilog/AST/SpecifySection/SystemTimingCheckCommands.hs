{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SpecifySection.SystemTimingCheckCommands where

import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Symbol)
import SystemVerilog.AST.SpecifySection.SystemTimingCheckCommandArguments
  ( ControlledReferenceEvent,
    DataEvent,
    DelayedData,
    DelayedReference,
    EndEdgeOffset,
    EventBasedFlag,
    Notifier,
    ReferenceEvent,
    RemainActiveFlag,
    StartEdgeOffset,
    Threshold,
    TimecheckCondition,
    TimestampCondition,
    TimingCheckLimit,
  )
import Util.Lit (deriveLit)

data SystemTimingCheck
  = MkSetupTimingCheck SetupTimingCheck
  | MkHoldTimingCheck HoldTimingCheck
  | MkSetupholdTimingCheck SetupholdTimingCheck
  | MkRecoveryTimingCheck RecoveryTimingCheck
  | MkRemovalTimingCheck RemovalTimingCheck
  | MkRecremTimingCheck RecremTimingCheck
  | MkSkewTimingCheck SkewTimingCheck
  | MkTimeskewTimingCheck TimeskewTimingCheck
  | MkFullskewTimingCheck FullskewTimingCheck
  | MkPeriodTimingCheck PeriodTimingCheck
  | MkWidthTimingCheck WidthTimingCheck
  | MkNochangeTimingCheck NochangeTimingCheck
  deriving (Eq, Show)

data SetupTimingCheck
  = SetupTimingCheck
      Keyword
      ( Paren
          ( DataEvent,
            Symbol,
            ReferenceEvent,
            Symbol,
            TimingCheckLimit,
            Maybe (Symbol, Maybe Notifier)
          )
      )
      Symbol
  deriving (Eq, Show)

data HoldTimingCheck
  = HoldTimingCheck
      Keyword
      ( Paren
          ( ReferenceEvent,
            Symbol,
            DataEvent,
            Symbol,
            TimingCheckLimit,
            Maybe (Symbol, Maybe Notifier)
          )
      )
      Symbol
  deriving (Eq, Show)

data SetupholdTimingCheck
  = SetupholdTimingCheck
      Keyword
      ( Paren
          ( ReferenceEvent,
            Symbol,
            DataEvent,
            Symbol,
            TimingCheckLimit,
            Symbol,
            TimingCheckLimit,
            Maybe
              ( Symbol,
                Maybe Notifier,
                Maybe
                  ( Symbol,
                    Maybe TimestampCondition,
                    Maybe
                      ( Symbol,
                        Maybe TimecheckCondition,
                        Maybe
                          ( Symbol,
                            Maybe DelayedReference,
                            Maybe (Symbol, Maybe DelayedData)
                          )
                      )
                  )
              )
          )
      )
      Symbol
  deriving (Eq, Show)

data RecoveryTimingCheck
  = RecoveryTimingCheck
      Keyword
      ( Paren
          ( ReferenceEvent,
            Symbol,
            DataEvent,
            Symbol,
            TimingCheckLimit,
            Maybe (Symbol, Maybe Notifier)
          )
      )
      Symbol
  deriving (Eq, Show)

data RemovalTimingCheck
  = RemovalTimingCheck
      Keyword
      ( Paren
          ( ReferenceEvent,
            Symbol,
            DataEvent,
            Symbol,
            TimingCheckLimit,
            Maybe (Symbol, Maybe Notifier)
          )
      )
      Symbol
  deriving (Eq, Show)

data RecremTimingCheck
  = RecremTimingCheck
      Keyword
      ( Paren
          ( ReferenceEvent,
            Symbol,
            DataEvent,
            Symbol,
            TimingCheckLimit,
            Symbol,
            TimingCheckLimit,
            Maybe
              ( Symbol,
                Maybe Notifier,
                Maybe
                  ( Symbol,
                    Maybe TimestampCondition,
                    Maybe
                      ( Symbol,
                        Maybe TimecheckCondition,
                        Maybe
                          ( Symbol,
                            Maybe DelayedReference,
                            Maybe (Symbol, Maybe DelayedData)
                          )
                      )
                  )
              )
          )
      )
      Symbol
  deriving (Eq, Show)

data SkewTimingCheck
  = SkewTimingCheck
      Keyword
      ( Paren
          ( ReferenceEvent,
            Symbol,
            DataEvent,
            Symbol,
            TimingCheckLimit,
            Paren (Symbol, Maybe Notifier)
          )
      )
      Symbol
  deriving (Eq, Show)

data TimeskewTimingCheck
  = TimeskewTimingCheck
      Keyword
      ( Paren
          ( ReferenceEvent,
            Symbol,
            DataEvent,
            Symbol,
            TimingCheckLimit,
            Maybe
              ( Symbol,
                Maybe Notifier,
                Maybe
                  ( Symbol,
                    Maybe EventBasedFlag,
                    Maybe (Symbol, Maybe RemainActiveFlag)
                  )
              )
          )
      )
      Symbol
  deriving (Eq, Show)

data FullskewTimingCheck
  = FullskewTimingCheck
      Keyword
      ( Paren
          ( ReferenceEvent,
            Symbol,
            DataEvent,
            Symbol,
            TimingCheckLimit,
            Symbol,
            TimingCheckLimit,
            Maybe
              ( Symbol,
                Maybe Notifier,
                Maybe
                  ( Symbol,
                    Maybe EventBasedFlag,
                    Maybe (Symbol, Maybe RemainActiveFlag)
                  )
              )
          )
      )
      Symbol
  deriving (Eq, Show)

data PeriodTimingCheck
  = PeriodTimingCheck
      Keyword
      ( Paren
          ( ControlledReferenceEvent,
            Symbol,
            TimingCheckLimit,
            Maybe (Symbol, Maybe Notifier)
          )
      )
      Symbol
  deriving (Eq, Show)

data WidthTimingCheck
  = WidthTimingCheck
      Keyword
      ( Paren
          ( ControlledReferenceEvent,
            Symbol,
            TimingCheckLimit,
            Symbol,
            Threshold,
            Maybe (Symbol, Maybe Notifier)
          )
      )
      Symbol
  deriving (Eq, Show)

data NochangeTimingCheck
  = NochangeTimingCheck
      Keyword
      ( Paren
          ( ReferenceEvent,
            Symbol,
            DataEvent,
            Symbol,
            StartEdgeOffset,
            Symbol,
            EndEdgeOffset,
            Maybe (Symbol, Maybe Notifier)
          )
      )
      Symbol
  deriving (Eq, Show)

deriveLit ''SetupTimingCheck
deriveLit ''HoldTimingCheck
deriveLit ''SetupholdTimingCheck
deriveLit ''RecoveryTimingCheck
deriveLit ''RemovalTimingCheck
deriveLit ''RecremTimingCheck
deriveLit ''SkewTimingCheck
deriveLit ''TimeskewTimingCheck
deriveLit ''FullskewTimingCheck
deriveLit ''PeriodTimingCheck
deriveLit ''WidthTimingCheck
deriveLit ''NochangeTimingCheck
deriveLit ''SystemTimingCheck