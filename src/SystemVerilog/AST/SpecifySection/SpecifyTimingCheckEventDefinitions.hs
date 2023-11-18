{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SpecifySection.SpecifyTimingCheckEventDefinitions where

import SystemVerilog.AST.SpecialNodes (Keyword, Bracket, Symbol, Paren, Splits)
import SystemVerilog.AST.SpecifySection.SpecifyBlockTerminals (SpecifyInputTerminalDescriptor, SpecifyOutputTerminalDescriptor)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression)
import Util.Lit (deriveLit)


data TimingCheckEvent
    = TimingCheckEvent
    (Maybe TimingCheckEventControl)
    SpecifyTerminalDescriptor
    (Maybe (Symbol, TimingCheckCondition))
    deriving (Eq, Show)

data ControlledTimingCheckEvent
    = ControlledTimingCheckEvent
    TimingCheckEventControl
    SpecifyTerminalDescriptor
    (Maybe (Symbol, TimingCheckCondition))
    deriving (Eq, Show)

data TimingCheckEventControl
    = Posedge Keyword
    | Negedge Keyword
    | Edge Keyword
    | MkEdgeControlSpecifier EdgeControlSpecifier
    deriving (Eq, Show)

data SpecifyTerminalDescriptor
    = MkSpecifyInputTerminalDescriptor SpecifyInputTerminalDescriptor
    | MkSpecifyOutputTerminalDescriptor SpecifyOutputTerminalDescriptor
    deriving (Eq, Show)

data EdgeControlSpecifier
    = EdgeControlSpecifier
    Keyword
    (Bracket (Splits Symbol EdgeDescriptor))
    deriving (Eq, Show)

newtype EdgeDescriptor = EdgeDescriptor Keyword deriving (Eq, Show)

data TimingCheckCondition
    = MkScalarTimingCheckCondition ScalarTimingCheckCondition
    | MkTimingCheckConditionParen TimingCheckConditionParen
    deriving (Eq, Show)

newtype TimingCheckConditionParen
    = TimingCheckConditionParen
    (Paren ScalarTimingCheckCondition)
    deriving (Eq, Show)

data ScalarTimingCheckCondition
    = MkExpression Expression
    | MkScalarTimingCheckConditionUnary ScalarTimingCheckConditionUnary
    | MkScalarTimingCheckConditionBinary ScalarTimingCheckConditionBinary
    deriving (Eq, Show)

data ScalarTimingCheckConditionUnary
    = ScalarTimingCheckConditionUnary
    Symbol
    Expression
    deriving (Eq, Show)

data ScalarTimingCheckConditionBinary
    = ScalarTimingCheckConditionBinary
    Expression
    Symbol
    ScalarConstant
    deriving (Eq, Show)

newtype ScalarConstant = ScalarConstant Keyword deriving (Eq, Show)

deriveLit ''SpecifyTerminalDescriptor
deriveLit ''EdgeDescriptor
deriveLit ''ScalarTimingCheckConditionUnary
deriveLit ''ScalarConstant
deriveLit ''ScalarTimingCheckConditionBinary
deriveLit ''ScalarTimingCheckCondition
deriveLit ''TimingCheckConditionParen
deriveLit ''TimingCheckCondition
deriveLit ''EdgeControlSpecifier
deriveLit ''TimingCheckEventControl
deriveLit ''TimingCheckEvent
deriveLit ''ControlledTimingCheckEvent