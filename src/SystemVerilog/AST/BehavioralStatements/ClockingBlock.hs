{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.BehavioralStatements.ClockingBlock where

import SystemVerilog.AST.BehavioralStatements.TimingControlStatements (DelayControl, EventExpression)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.AssertionDeclarations (AssertionItemDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import SystemVerilog.AST.Expressions.Numbers (IntegralNumber)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (Select)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (ClockingIdentifier, HierarchicalIdentifier, Identifier, SignalIdentifier)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import SystemVerilog.AST.SpecifySection.SpecifyPathDelays (EdgeIdentifier)
import Util.Lit (deriveLit)

data ClockingDeclaration
  = MkClockingDeclarationLocal ClockingDeclarationLocal
  | MkClockingDeclarationGlobal ClockingDeclarationGlobal
  deriving (Eq, Show)

data ClockingDeclarationLocal
  = ClockingDeclarationLocal
      (Maybe Default)
      Keyword
      (Maybe ClockingIdentifier)
      ClockingEvent
      Symbol
      [ClockingItem]
      Keyword
      (Maybe (Symbol, ClockingIdentifier))
  deriving (Eq, Show)

data Default = Default Keyword deriving (Eq, Show)

data ClockingDeclarationGlobal
  = ClockingDeclarationGlobal
      Keyword
      Keyword
      (Maybe ClockingIdentifier)
      ClockingEvent
      Symbol
      Keyword
      (Maybe (Symbol, ClockingIdentifier))
  deriving (Eq, Show)

data ClockingEvent
  = MkClockingEventIdentifier ClockingEventIdentifier
  | MkClockingEventExpression ClockingEventExpression
  deriving (Eq, Show)

data ClockingEventIdentifier
  = ClockingEventIdentifier
      Symbol
      Identifier
  deriving (Eq, Show)

data ClockingEventExpression
  = ClockingEventExpression
      Symbol
      (Paren EventExpression)
  deriving (Eq, Show)

data ClockingItem
  = MkClockingItemDefault ClockingItemDefault
  | MkClockingItemDirection ClockingItemDirection
  | MkClockingItemAssertion ClockingItemAssertion
  deriving (Eq, Show)

data ClockingItemDefault
  = ClockingItemDefault
      Keyword
      DefaultSkew
      Symbol
  deriving (Eq, Show)

data ClockingItemDirection
  = ClockingItemDirection
      ClockingDirection
      ListOfClockingDeclAssign
      Symbol
  deriving (Eq, Show)

data ClockingItemAssertion
  = ClockingItemAssertion
      [AttributeInstance]
      AssertionItemDeclaration
  deriving (Eq, Show)

data DefaultSkew
  = MkDefaultSkewInput DefaultSkewInput
  | MkDefaultSkewOutput DefaultSkewOutput
  | MkDefaultSkewInputOutput DefaultSkewInputOutput
  deriving (Eq, Show)

data DefaultSkewInput
  = DefaultSkewInput Keyword ClockingSkew
  deriving (Eq, Show)

data DefaultSkewOutput
  = DefaultSkewOutput Keyword ClockingSkew
  deriving (Eq, Show)

data DefaultSkewInputOutput
  = DefaultSkewInputOutput
      Keyword
      ClockingSkew
      Keyword
      ClockingSkew
  deriving (Eq, Show)

data ClockingDirection
  = MkClockingDirectionInput ClockingDirectionInput
  | MkClockingDirectionOutput ClockingDirectionOutput
  | MkClockingDirectionInputOutput ClockingDirectionInputOutput
  | MkKeyword Keyword
  deriving (Eq, Show)

data ClockingDirectionInput
  = ClockingDirectionInput Keyword (Maybe ClockingSkew)
  deriving (Eq, Show)

data ClockingDirectionOutput
  = ClockingDirectionOutput Keyword (Maybe ClockingSkew)
  deriving (Eq, Show)

data ClockingDirectionInputOutput
  = ClockingDirectionInputOutput
      Keyword
      (Maybe ClockingSkew)
      Keyword
      (Maybe ClockingSkew)
  deriving (Eq, Show)

data ListOfClockingDeclAssign
  = ListOfClockingDeclAssign (Splits Symbol ClockingDeclAssign)
  deriving (Eq, Show)

data ClockingDeclAssign
  = ClockingDeclAssign
      SignalIdentifier
      (Maybe (Symbol, Expression))
  deriving (Eq, Show)

data ClockingSkew
  = MkClockingSkewEdge ClockingSkewEdge
  | MkDelayControl DelayControl
  deriving (Eq, Show)

data ClockingSkewEdge
  = ClockingSkewEdge
      EdgeIdentifier
      (Maybe DelayControl)
  deriving (Eq, Show)

data ClockingDrive
  = ClockingDrive
      ClockvarExpression
      Symbol
      (Maybe CycleDelay)
      Expression
  deriving (Eq, Show)

data CycleDelay
  = MkCycleDelayIntegral CycleDelayIntegral
  | MkCycleDelayIdentifier CycleDelayIdentifier
  | MkCycleDelayExpression CycleDelayExpression
  deriving (Eq, Show)

data CycleDelayIntegral
  = CycleDelayIntegral
      Symbol
      IntegralNumber
  deriving (Eq, Show)

data CycleDelayIdentifier
  = CycleDelayIdentifier
      Symbol
      Identifier
  deriving (Eq, Show)

data CycleDelayExpression
  = CycleDelayExpression
      Symbol
      (Paren Expression)
  deriving (Eq, Show)

data Clockvar
  = ClockVar HierarchicalIdentifier
  deriving (Eq, Show)

data ClockvarExpression
  = ClockvarExpression
      Clockvar
      Select
  deriving (Eq, Show)

deriveLit ''Default
deriveLit ''ClockingEventIdentifier
deriveLit ''ClockingEventExpression
deriveLit ''ClockingItemAssertion
deriveLit ''ClockingDeclAssign
deriveLit ''ClockingSkewEdge
deriveLit ''CycleDelayIntegral
deriveLit ''CycleDelayIdentifier
deriveLit ''CycleDelayExpression
deriveLit ''Clockvar
deriveLit ''ClockvarExpression
deriveLit ''CycleDelay
deriveLit ''ClockingDrive
deriveLit ''ClockingSkew
deriveLit ''DefaultSkewInput
deriveLit ''DefaultSkewOutput
deriveLit ''DefaultSkewInputOutput
deriveLit ''DefaultSkew
deriveLit ''ClockingDirectionInput
deriveLit ''ClockingDirectionOutput
deriveLit ''ClockingDirectionInputOutput
deriveLit ''ListOfClockingDeclAssign
deriveLit ''ClockingDirection
deriveLit ''ClockingItemDefault
deriveLit ''ClockingItemDirection
deriveLit ''ClockingItem
deriveLit ''ClockingEvent
deriveLit ''ClockingDeclarationGlobal
deriveLit ''ClockingDeclarationLocal
deriveLit ''ClockingDeclaration