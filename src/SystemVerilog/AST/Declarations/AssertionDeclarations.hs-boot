module SystemVerilog.AST.Declarations.AssertionDeclarations where

import Util.Lit (Lit)

data ConcurrentAssertionItem

instance Eq ConcurrentAssertionItem

instance Show ConcurrentAssertionItem

instance Lit ConcurrentAssertionItem

data ConcurrentAssertionItemStatement

instance Eq ConcurrentAssertionItemStatement

instance Show ConcurrentAssertionItemStatement

instance Lit ConcurrentAssertionItemStatement

data ConcurrentAssertionStatement

instance Eq ConcurrentAssertionStatement

instance Show ConcurrentAssertionStatement

instance Lit ConcurrentAssertionStatement

data AssertPropertyStatement

instance Eq AssertPropertyStatement

instance Show AssertPropertyStatement

instance Lit AssertPropertyStatement

data AssumePropertyStatement

instance Eq AssumePropertyStatement

instance Show AssumePropertyStatement

instance Lit AssumePropertyStatement

data CoverPropertyStatement

instance Eq CoverPropertyStatement

instance Show CoverPropertyStatement

instance Lit CoverPropertyStatement

data ExpectPropertyStatement

instance Eq ExpectPropertyStatement

instance Show ExpectPropertyStatement

instance Lit ExpectPropertyStatement

data CoverSequenceStatement

instance Eq CoverSequenceStatement

instance Show CoverSequenceStatement

instance Lit CoverSequenceStatement

data RestrictPropertyStatement

instance Eq RestrictPropertyStatement

instance Show RestrictPropertyStatement

instance Lit RestrictPropertyStatement

data PropertyInstance

instance Eq PropertyInstance

instance Show PropertyInstance

instance Lit PropertyInstance

data PropertyListOfArguments

instance Eq PropertyListOfArguments

instance Show PropertyListOfArguments

instance Lit PropertyListOfArguments

data PropertyListOfArgumentsOrdered

instance Eq PropertyListOfArgumentsOrdered

instance Show PropertyListOfArgumentsOrdered

instance Lit PropertyListOfArgumentsOrdered

data PropertyListOfArgumentsNamed

instance Eq PropertyListOfArgumentsNamed

instance Show PropertyListOfArgumentsNamed

instance Lit PropertyListOfArgumentsNamed

data PropertyActualArg

instance Eq PropertyActualArg

instance Show PropertyActualArg

instance Lit PropertyActualArg

data AssertionItemDeclaration

instance Eq AssertionItemDeclaration

instance Show AssertionItemDeclaration

instance Lit AssertionItemDeclaration

data PropertyDeclaration

instance Eq PropertyDeclaration

instance Show PropertyDeclaration

instance Lit PropertyDeclaration

data PropertyPortList

instance Eq PropertyPortList

instance Show PropertyPortList

instance Lit PropertyPortList

data PropertyPortItem

instance Eq PropertyPortItem

instance Show PropertyPortItem

instance Lit PropertyPortItem

data PropertyLvarPortDirection

instance Eq PropertyLvarPortDirection

instance Show PropertyLvarPortDirection

instance Lit PropertyLvarPortDirection

data PropertyFormalType

instance Eq PropertyFormalType

instance Show PropertyFormalType

instance Lit PropertyFormalType

data PropertySpec

instance Eq PropertySpec

instance Show PropertySpec

instance Lit PropertySpec

data PropertyExpr

instance Eq PropertyExpr

instance Show PropertyExpr

instance Lit PropertyExpr

data PropertyExprStrong

instance Eq PropertyExprStrong

instance Show PropertyExprStrong

instance Lit PropertyExprStrong

data PropertyExprWeak

instance Eq PropertyExprWeak

instance Show PropertyExprWeak

instance Lit PropertyExprWeak

data PropertyExprParen

instance Eq PropertyExprParen

instance Show PropertyExprParen

instance Lit PropertyExprParen

data PropertyExprNot

instance Eq PropertyExprNot

instance Show PropertyExprNot

instance Lit PropertyExprNot

data PropertyExprBinaryProperty

instance Eq PropertyExprBinaryProperty

instance Show PropertyExprBinaryProperty

instance Lit PropertyExprBinaryProperty

data PropertyExprBinarySequence

instance Eq PropertyExprBinarySequence

instance Show PropertyExprBinarySequence

instance Lit PropertyExprBinarySequence

data PropertyExprIf

instance Eq PropertyExprIf

instance Show PropertyExprIf

instance Lit PropertyExprIf

data PropertyExprCase

instance Eq PropertyExprCase

instance Show PropertyExprCase

instance Lit PropertyExprCase

data PropertyExprNexttime

instance Eq PropertyExprNexttime

instance Show PropertyExprNexttime

instance Lit PropertyExprNexttime

data PropertyExprSNexttime

instance Eq PropertyExprSNexttime

instance Show PropertyExprSNexttime

instance Lit PropertyExprSNexttime

data PropertyExprAlways

instance Eq PropertyExprAlways

instance Show PropertyExprAlways

instance Lit PropertyExprAlways

data PropertyExprSAlways

instance Eq PropertyExprSAlways

instance Show PropertyExprSAlways

instance Lit PropertyExprSAlways

data PropertyExprEventually

instance Eq PropertyExprEventually

instance Show PropertyExprEventually

instance Lit PropertyExprEventually

data PropertyExprSEventually

instance Eq PropertyExprSEventually

instance Show PropertyExprSEventually

instance Lit PropertyExprSEventually

data PropertyExprAcceptOn

instance Eq PropertyExprAcceptOn

instance Show PropertyExprAcceptOn

instance Lit PropertyExprAcceptOn

data PropertyExprRejectOn

instance Eq PropertyExprRejectOn

instance Show PropertyExprRejectOn

instance Lit PropertyExprRejectOn

data PropertyExprSyncAcceptOn

instance Eq PropertyExprSyncAcceptOn

instance Show PropertyExprSyncAcceptOn

instance Lit PropertyExprSyncAcceptOn

data PropertyExprSyncRejectOn

instance Eq PropertyExprSyncRejectOn

instance Show PropertyExprSyncRejectOn

instance Lit PropertyExprSyncRejectOn

data PropertyCaseItem

instance Eq PropertyCaseItem

instance Show PropertyCaseItem

instance Lit PropertyCaseItem

data PropertyCaseItemNondefault

instance Eq PropertyCaseItemNondefault

instance Show PropertyCaseItemNondefault

instance Lit PropertyCaseItemNondefault

data PropertyCaseItemDefault

instance Eq PropertyCaseItemDefault

instance Show PropertyCaseItemDefault

instance Lit PropertyCaseItemDefault

data SequenceDeclaration

instance Eq SequenceDeclaration

instance Show SequenceDeclaration

instance Lit SequenceDeclaration

data SequencePortList

instance Eq SequencePortList

instance Show SequencePortList

instance Lit SequencePortList

data SequencePortItem

instance Eq SequencePortItem

instance Show SequencePortItem

instance Lit SequencePortItem

data SequenceLvarPortDirection

instance Eq SequenceLvarPortDirection

instance Show SequenceLvarPortDirection

instance Lit SequenceLvarPortDirection

data SequenceFormalType

instance Eq SequenceFormalType

instance Show SequenceFormalType

instance Lit SequenceFormalType

data SequenceExpr

instance Eq SequenceExpr

instance Show SequenceExpr

instance Lit SequenceExpr

data SequenceExprCycleDelayExpr

instance Eq SequenceExprCycleDelayExpr

instance Show SequenceExprCycleDelayExpr

instance Lit SequenceExprCycleDelayExpr

data SequenceExprExprCycleDelayExpr

instance Eq SequenceExprExprCycleDelayExpr

instance Show SequenceExprExprCycleDelayExpr

instance Lit SequenceExprExprCycleDelayExpr

data SequenceExprExpression

instance Eq SequenceExprExpression

instance Show SequenceExprExpression

instance Lit SequenceExprExpression

data SequenceExprInstance

instance Eq SequenceExprInstance

instance Show SequenceExprInstance

instance Lit SequenceExprInstance

data SequenceExprParen

instance Eq SequenceExprParen

instance Show SequenceExprParen

instance Lit SequenceExprParen

data SequenceExprBinary

instance Eq SequenceExprBinary

instance Show SequenceExprBinary

instance Lit SequenceExprBinary

data SequenceExprFirstMatch

instance Eq SequenceExprFirstMatch

instance Show SequenceExprFirstMatch

instance Lit SequenceExprFirstMatch

data SequenceExprThroughout

instance Eq SequenceExprThroughout

instance Show SequenceExprThroughout

instance Lit SequenceExprThroughout

data SequenceExprClockingEvent

instance Eq SequenceExprClockingEvent

instance Show SequenceExprClockingEvent

instance Lit SequenceExprClockingEvent

data CycleDelayRange

instance Eq CycleDelayRange

instance Show CycleDelayRange

instance Lit CycleDelayRange

data CycleDelayRangePrimary

instance Eq CycleDelayRangePrimary

instance Show CycleDelayRangePrimary

instance Lit CycleDelayRangePrimary

data CycleDelayRangeExpression

instance Eq CycleDelayRangeExpression

instance Show CycleDelayRangeExpression

instance Lit CycleDelayRangeExpression

data CycleDelayRangeAsterisk

instance Eq CycleDelayRangeAsterisk

instance Show CycleDelayRangeAsterisk

instance Lit CycleDelayRangeAsterisk

data CycleDelayRangePlus

instance Eq CycleDelayRangePlus

instance Show CycleDelayRangePlus

instance Lit CycleDelayRangePlus

data SequenceMethodCall

instance Eq SequenceMethodCall

instance Show SequenceMethodCall

instance Lit SequenceMethodCall

data SequenceMatchItem

instance Eq SequenceMatchItem

instance Show SequenceMatchItem

instance Lit SequenceMatchItem

data SequenceInstance

instance Eq SequenceInstance

instance Show SequenceInstance

instance Lit SequenceInstance

data SequenceListOfArguments

instance Eq SequenceListOfArguments

instance Show SequenceListOfArguments

instance Lit SequenceListOfArguments

data SequenceListOfArgumentsOrdered

instance Eq SequenceListOfArgumentsOrdered

instance Show SequenceListOfArgumentsOrdered

instance Lit SequenceListOfArgumentsOrdered

data SequenceListOfArgumentsNamed

instance Eq SequenceListOfArgumentsNamed

instance Show SequenceListOfArgumentsNamed

instance Lit SequenceListOfArgumentsNamed

data SequenceActualArg

instance Eq SequenceActualArg

instance Show SequenceActualArg

instance Lit SequenceActualArg

data BooleanAbbrev

instance Eq BooleanAbbrev

instance Show BooleanAbbrev

instance Lit BooleanAbbrev

data SequenceAbbrev

instance Eq SequenceAbbrev

instance Show SequenceAbbrev

instance Lit SequenceAbbrev

data ConsecutiveRepetition

instance Eq ConsecutiveRepetition

instance Show ConsecutiveRepetition

instance Lit ConsecutiveRepetition

data ConsecutiveRepetitionExpression

instance Eq ConsecutiveRepetitionExpression

instance Show ConsecutiveRepetitionExpression

instance Lit ConsecutiveRepetitionExpression

data ConsecutiveRepetitionAsterisk

instance Eq ConsecutiveRepetitionAsterisk

instance Show ConsecutiveRepetitionAsterisk

instance Lit ConsecutiveRepetitionAsterisk

data ConsecutiveRepetitionPlus

instance Eq ConsecutiveRepetitionPlus

instance Show ConsecutiveRepetitionPlus

instance Lit ConsecutiveRepetitionPlus

data NonConsecutiveRepetition

instance Eq NonConsecutiveRepetition

instance Show NonConsecutiveRepetition

instance Lit NonConsecutiveRepetition

data GotoRepetition

instance Eq GotoRepetition

instance Show GotoRepetition

instance Lit GotoRepetition

data ConstOrRangeExpression 

instance Eq ConstOrRangeExpression

instance Show ConstOrRangeExpression

instance Lit ConstOrRangeExpression

data CycleDelayConstRangeExpression

instance Eq CycleDelayConstRangeExpression

instance Show CycleDelayConstRangeExpression

instance Lit CycleDelayConstRangeExpression

data CycleDelayConstRangeExpressionBinary

instance Eq CycleDelayConstRangeExpressionBinary

instance Show CycleDelayConstRangeExpressionBinary

instance Lit CycleDelayConstRangeExpressionBinary

data CycleDelayConstRangeExpressionDollar

instance Eq CycleDelayConstRangeExpressionDollar

instance Show CycleDelayConstRangeExpressionDollar

instance Lit CycleDelayConstRangeExpressionDollar

data ExpressionOrDist

instance Eq ExpressionOrDist

instance Show ExpressionOrDist

instance Lit ExpressionOrDist

data AssertionVariableDeclaration

instance Eq AssertionVariableDeclaration

instance Show AssertionVariableDeclaration

instance Lit AssertionVariableDeclaration