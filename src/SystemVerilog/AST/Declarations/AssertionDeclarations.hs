{-# HLINT ignore "Use newtype instead of data" #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.Declarations.AssertionDeclarations where

import qualified Data.Text as T
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.ClockingBlock (ClockingEvent)
import SystemVerilog.AST.BehavioralStatements.ParallelAndSequentialBlocks (ActionBlock)
import SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments (OperatorAssignment)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (StatementOrNull)
import SystemVerilog.AST.BehavioralStatements.TimingControlStatements
  ( EventExpression,
  )
import SystemVerilog.AST.Declarations.DeclarationLists (ListOfVariableDeclAssignments)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.DeclarationRanges (VariableDimension)
import SystemVerilog.AST.Declarations.LetDeclarations (LetDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (DataTypeOrImplicit, VarDataType)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression, Expression, IncOrDecExpression)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (ConstantPrimary)
import SystemVerilog.AST.Expressions.SubroutineCalls (SubroutineCall)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (BlockIdentifier, FormalPortIdentifier, Identifier, MethodIdentifier, PropertyIdentifier, PsOrHierarchicalPropertyIdentifier, PsOrHierarchicalSequenceIdentifier, SequenceIdentifier)
import SystemVerilog.AST.Instantiations.CheckerInstantiation (CheckerInstantiation)
import SystemVerilog.AST.SourceText.Constraints (DistList)
import SystemVerilog.AST.SpecialNodes (Brace, Bracket, Keyword, Paren, Splits, Symbol)
import Util.Lit (Lit (..))

data ConcurrentAssertionItem
  = MkConcurrentAssertionItemStatement ConcurrentAssertionItemStatement
  | MkCheckerInstantiation CheckerInstantiation
  deriving (Eq, Show)

instance Lit ConcurrentAssertionItem where
  lit (MkConcurrentAssertionItemStatement x) = lit x
  lit (MkCheckerInstantiation x) = lit x

data ConcurrentAssertionItemStatement
  = ConcurrentAssertionItemStatement
      (Maybe (BlockIdentifier, Symbol))
      ConcurrentAssertionStatement
  deriving (Eq, Show)

instance Lit ConcurrentAssertionItemStatement where
  lit (ConcurrentAssertionItemStatement a b) = lit a `T.append` lit b

data ConcurrentAssertionStatement
  = MkAssertPropertyStatement AssertPropertyStatement
  | MkAssumePropertyStatement AssumePropertyStatement
  | MkCoverPropertyStatement CoverPropertyStatement
  | MkCoverSequenceStatement CoverSequenceStatement
  | MkRestrictPropertyStatement RestrictPropertyStatement
  deriving (Eq, Show)

instance Lit ConcurrentAssertionStatement where
  lit (MkAssertPropertyStatement x) = lit x
  lit (MkAssumePropertyStatement x) = lit x
  lit (MkCoverPropertyStatement x) = lit x
  lit (MkCoverSequenceStatement x) = lit x
  lit (MkRestrictPropertyStatement x) = lit x

data AssertPropertyStatement
  = AssertPropertyStatement
      Keyword
      Keyword
      (Paren PropertySpec)
      ActionBlock
  deriving (Eq, Show)

instance Lit AssertPropertyStatement where
  lit (AssertPropertyStatement a b c d) = T.concat [lit a, lit b, lit c, lit d]

data AssumePropertyStatement
  = AssumePropertyStatement
      Keyword
      Keyword
      (Paren PropertySpec)
      ActionBlock
  deriving (Eq, Show)

instance Lit AssumePropertyStatement where
  lit (AssumePropertyStatement a b c d) = T.concat [lit a, lit b, lit c, lit d]

data CoverPropertyStatement
  = CoverPropertyStatement
      Keyword
      Keyword
      (Paren PropertySpec)
      StatementOrNull
  deriving (Eq, Show)

instance Lit CoverPropertyStatement where
  lit (CoverPropertyStatement a b c d) = T.concat [lit a, lit b, lit c, lit d]

data ExpectPropertyStatement
  = ExpectPropertyStatement
      Keyword
      (Paren PropertySpec)
      ActionBlock
  deriving (Eq, Show)

instance Lit ExpectPropertyStatement where
  lit (ExpectPropertyStatement a b c) = T.concat [lit a, lit b, lit c]

data CoverSequenceStatement
  = CoverSequenceStatement
      Keyword
      Keyword
      (Paren (Maybe ClockingEvent, Maybe (Keyword, Keyword, Paren ExpressionOrDist), SequenceExpr))
      StatementOrNull
  deriving (Eq, Show)

instance Lit CoverSequenceStatement where
  lit (CoverSequenceStatement a b c d) = T.concat [lit a, lit b, lit c, lit d]

data RestrictPropertyStatement
  = RestrictPropertyStatement
      Keyword
      Keyword
      (Paren PropertySpec)
      Symbol
  deriving (Eq, Show)

instance Lit RestrictPropertyStatement where
  lit (RestrictPropertyStatement a b c d) = T.concat [lit a, lit b, lit c, lit d]

data PropertyInstance
  = PropertyInstance
      PsOrHierarchicalPropertyIdentifier
      (Maybe (Paren (Maybe PropertyListOfArguments)))
  deriving (Eq, Show)

instance Lit PropertyInstance where
  lit (PropertyInstance a b) = lit a `T.append` lit b

data PropertyListOfArguments
  = MkPropertyListOfArgumentsOrdered PropertyListOfArgumentsOrdered
  | MkPropertyListOfArgumentsNamed PropertyListOfArgumentsNamed
  deriving (Eq, Show)

instance Lit PropertyListOfArguments where
  lit (MkPropertyListOfArgumentsOrdered x) = lit x
  lit (MkPropertyListOfArgumentsNamed x) = lit x

data PropertyListOfArgumentsOrdered
  = PropertyListOfArgumentsOrdered
      (Splits Symbol (Maybe PropertyActualArg))
      [(Symbol, Symbol, Identifier, Paren (Maybe PropertyActualArg))]
  deriving (Eq, Show)

instance Lit PropertyListOfArgumentsOrdered where
  lit (PropertyListOfArgumentsOrdered a b) = lit a `T.append` lit b

data PropertyListOfArgumentsNamed
  = PropertyListOfArgumentsNamed
      (Splits Symbol (Symbol, Identifier, Paren (Maybe PropertyActualArg)))
  deriving (Eq, Show)

instance Lit PropertyListOfArgumentsNamed where
  lit (PropertyListOfArgumentsNamed x) = lit x

data PropertyActualArg
  = MkPropertyExpr PropertyExpr
  | MkSequenceActualArg SequenceActualArg
  deriving (Eq, Show)

instance Lit PropertyActualArg where
  lit (MkPropertyExpr x) = lit x
  lit (MkSequenceActualArg x) = lit x

data AssertionItemDeclaration
  = MkPropertyDeclaration PropertyDeclaration
  | MkSequenceDeclaration SequenceDeclaration
  | MkLetDeclaration LetDeclaration
  deriving (Eq, Show)

instance Lit AssertionItemDeclaration where
  lit (MkPropertyDeclaration x) = lit x
  lit (MkSequenceDeclaration x) = lit x
  lit (MkLetDeclaration x) = lit x

data PropertyDeclaration
  = PropertyDeclaration
      Keyword
      PropertyIdentifier
      (Maybe (Paren (Maybe PropertyPortList)))
      Symbol
      [AssertionVariableDeclaration]
      PropertySpec
      (Maybe Symbol)
      Keyword
      (Maybe (Symbol, PropertyIdentifier))
  deriving (Eq, Show)

instance Lit PropertyDeclaration where
  lit (PropertyDeclaration a b c d e f g h i) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g, lit h, lit i]

data PropertyPortList
  = PropertyPortList
      (Splits Symbol PropertyPortItem)
  deriving (Eq, Show)

instance Lit PropertyPortList where
  lit (PropertyPortList x) = lit x

data PropertyPortItem
  = PropertyPortItem
      [AttributeInstance]
      (Maybe (Keyword, Maybe PropertyLvarPortDirection))
      PropertyFormalType
      FormalPortIdentifier
      [VariableDimension]
      (Maybe (Symbol, PropertyActualArg))
  deriving (Eq, Show)

instance Lit PropertyPortItem where
  lit (PropertyPortItem a b c d e f) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f]

data PropertyLvarPortDirection = Input Keyword deriving (Eq, Show)

instance Lit PropertyLvarPortDirection where
  lit (Input x) = lit x

data PropertyFormalType
  = MkSequenceFormalType SequenceFormalType
  | Property Keyword
  deriving (Eq, Show)

instance Lit PropertyFormalType where
  lit (MkSequenceFormalType x) = lit x
  lit (Property x) = lit x

data PropertySpec
  = PropertySpec
      (Maybe ClockingEvent)
      (Maybe (Keyword, Keyword, Paren ExpressionOrDist))
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertySpec where
  lit (PropertySpec a b c) = T.concat [lit a, lit b, lit c]

data PropertyExpr
  = MkSequenceExpr SequenceExpr
  | MkPropertyExprStrong PropertyExprStrong
  | MkPropertyExprWeak PropertyExprWeak
  | MkPropertyExprParen PropertyExprParen
  | MkPropertyExprNot PropertyExprNot
  | MkPropertyExprBinaryProperty PropertyExprBinaryProperty
  | MkPropertyExprBinarySequence PropertyExprBinarySequence
  | MkPropertyExprIf PropertyExprIf
  | MkPropertyExprCase PropertyExprCase
  | MkPropertyExprNexttime PropertyExprNexttime
  | MkPropertyExprAlways PropertyExprAlways
  | MkPropertyExprSAlways PropertyExprSAlways
  | MkPropertyExprEventually PropertyExprEventually
  | MkPropertyExprSEventually PropertyExprSEventually
  | MkPropertyExprAcceptOn PropertyExprAcceptOn
  | MkPropertyExprRejectOn PropertyExprRejectOn
  | MkPropertyExprSyncAcceptOn PropertyExprSyncAcceptOn
  | MkPropertyExprSyncRejectOn PropertyExprSyncRejectOn
  | MkPropertyInstance PropertyInstance
  | MkPropertyExprClockingEvent PropertyExprClockingEvent
  deriving (Eq, Show)

instance Lit PropertyExpr where
  lit (MkSequenceExpr x) = lit x
  lit (MkPropertyExprStrong x) = lit x
  lit (MkPropertyExprWeak x) = lit x
  lit (MkPropertyExprParen x) = lit x
  lit (MkPropertyExprNot x) = lit x
  lit (MkPropertyExprBinaryProperty x) = lit x
  lit (MkPropertyExprBinarySequence x) = lit x
  lit (MkPropertyExprIf x) = lit x
  lit (MkPropertyExprCase x) = lit x
  lit (MkPropertyExprNexttime x) = lit x
  lit (MkPropertyExprAlways x) = lit x
  lit (MkPropertyExprSAlways x) = lit x
  lit (MkPropertyExprEventually x) = lit x
  lit (MkPropertyExprSEventually x) = lit x
  lit (MkPropertyExprAcceptOn x) = lit x
  lit (MkPropertyExprRejectOn x) = lit x
  lit (MkPropertyExprSyncAcceptOn x) = lit x
  lit (MkPropertyExprSyncRejectOn x) = lit x
  lit (MkPropertyInstance x) = lit x
  lit (MkPropertyExprClockingEvent x) = lit x

data PropertyExprStrong
  = PropertyExprStrong
      Keyword
      (Paren SequenceExpr)
  deriving (Eq, Show)

instance Lit PropertyExprStrong where
  lit (PropertyExprStrong a b) = lit a `T.append` lit b

data PropertyExprWeak
  = PropertyExprWeak
      Keyword
      (Paren SequenceExpr)
  deriving (Eq, Show)

instance Lit PropertyExprWeak where
  lit (PropertyExprWeak a b) = lit a `T.append` lit b

data PropertyExprParen
  = PropertyExprParen
      (Paren PropertyExpr)
  deriving (Eq, Show)

instance Lit PropertyExprParen where
  lit (PropertyExprParen x) = lit x

data PropertyExprNot
  = PropertyExprNot
      Keyword
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprNot where
  lit (PropertyExprNot a b) = lit a `T.append` lit b

data PropertyExprBinaryProperty
  = PropertyExprBinaryProperty
      PropertyExpr
      Keyword
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprBinaryProperty where
  lit (PropertyExprBinaryProperty a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprBinarySequence
  = PropertyExprBinarySequence
      SequenceExpr
      Symbol
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprBinarySequence where
  lit (PropertyExprBinarySequence a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprIf
  = PropertyExprIf
      Keyword
      (Paren ExpressionOrDist)
      PropertyExpr
      (Maybe (Keyword, PropertyExpr))
  deriving (Eq, Show)

instance Lit PropertyExprIf where
  lit (PropertyExprIf a b c d) = T.concat [lit a, lit b, lit c, lit d]

data PropertyExprCase
  = PropertyExprCase
      Keyword
      (Paren ExpressionOrDist)
      PropertyCaseItem
      [PropertyCaseItem]
      Keyword
  deriving (Eq, Show)

instance Lit PropertyExprCase where
  lit (PropertyExprCase a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data PropertyExprNexttime
  = PropertyExprNexttime
      Keyword
      (Maybe (Bracket ConstantExpression))
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprNexttime where
  lit (PropertyExprNexttime a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprSNexttime
  = PropertyExprSNexttime
      Keyword
      (Maybe (Bracket ConstantExpression))
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprSNexttime where
  lit (PropertyExprSNexttime a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprAlways
  = PropertyExprAlways
      Keyword
      (Maybe (Bracket CycleDelayConstRangeExpression))
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprAlways where
  lit (PropertyExprAlways a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprSAlways
  = PropertyExprSAlways
      Keyword
      (Bracket CycleDelayConstRangeExpression)
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprSAlways where
  lit (PropertyExprSAlways a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprEventually
  = PropertyExprEventually
      Keyword
      (Bracket ConstantExpression)
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprEventually where
  lit (PropertyExprEventually a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprSEventually
  = PropertyExprSEventually
      Keyword
      (Maybe (Bracket CycleDelayConstRangeExpression))
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprSEventually where
  lit (PropertyExprSEventually a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprAcceptOn
  = PropertyExprAcceptOn
      Keyword
      (Paren ExpressionOrDist)
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprAcceptOn where
  lit (PropertyExprAcceptOn a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprRejectOn
  = PropertyExprRejectOn
      Keyword
      (Paren ExpressionOrDist)
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprRejectOn where
  lit (PropertyExprRejectOn a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprSyncAcceptOn
  = PropertyExprSyncAcceptOn
      Keyword
      (Paren ExpressionOrDist)
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprSyncAcceptOn where
  lit (PropertyExprSyncAcceptOn a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprSyncRejectOn
  = PropertyExprSyncRejectOn
      Keyword
      (Paren ExpressionOrDist)
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprSyncRejectOn where
  lit (PropertyExprSyncRejectOn a b c) = T.concat [lit a, lit b, lit c]

data PropertyExprClockingEvent
  = PropertyExprClockingEvent
      ClockingEvent
      PropertyExpr
  deriving (Eq, Show)

instance Lit PropertyExprClockingEvent where
  lit (PropertyExprClockingEvent a b) = lit a `T.append` lit b

data PropertyCaseItem
  = MkPropertyCaseItemNondefault PropertyCaseItemNondefault
  | MkPropertyCaseItemDefault PropertyCaseItemDefault
  deriving (Eq, Show)

instance Lit PropertyCaseItem where
  lit (MkPropertyCaseItemNondefault x) = lit x
  lit (MkPropertyCaseItemDefault x) = lit x

data PropertyCaseItemNondefault
  = PropertyCaseItemNondefault
      (Splits Symbol ExpressionOrDist)
      Symbol
      PropertyExpr
      Symbol
  deriving (Eq, Show)

instance Lit PropertyCaseItemNondefault where
  lit (PropertyCaseItemNondefault a b c d) = T.concat [lit a, lit b, lit c, lit d]

data PropertyCaseItemDefault
  = PropertyCaseItemDefault
      Keyword
      (Maybe Symbol)
      PropertyExpr
      Symbol
  deriving (Eq, Show)

instance Lit PropertyCaseItemDefault where
  lit (PropertyCaseItemDefault a b c d) = T.concat [lit a, lit b, lit c, lit d]

data SequenceDeclaration
  = SequenceDeclaration
      Keyword
      SequenceIdentifier
      (Maybe (Paren (Maybe SequencePortList)))
      Symbol
      [AssertionVariableDeclaration]
      SequenceExpr
      (Maybe Symbol)
      Keyword
      (Maybe (Symbol, SequenceIdentifier))
  deriving (Eq, Show)

instance Lit SequenceDeclaration where
  lit (SequenceDeclaration a b c d e f g h i) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g, lit h, lit i]

data SequencePortList
  = SequencePortList
      (Splits Symbol SequencePortItem)
  deriving (Eq, Show)

instance Lit SequencePortList where
  lit (SequencePortList x) = lit x

data SequencePortItem
  = SequencePortItem
      [AttributeInstance]
      (Maybe (Symbol, SequenceActualArg))
  deriving (Eq, Show)

instance Lit SequencePortItem where
  lit (SequencePortItem a b) = lit a `T.append` lit b

data SequenceLvarPortDirection
  = MkInput Keyword
  | Inout Keyword
  | Output Keyword
  deriving (Eq, Show)

instance Lit SequenceLvarPortDirection where
  lit (MkInput x) = lit x
  lit (Inout x) = lit x
  lit (Output x) = lit x

data SequenceFormalType
  = MkDataTypeOrImplicit DataTypeOrImplicit
  | Sequence Keyword
  | Untyped Keyword
  deriving (Eq, Show)

instance Lit SequenceFormalType where
  lit (MkDataTypeOrImplicit x) = lit x
  lit (Sequence x) = lit x
  lit (Untyped x) = lit x

data SequenceExpr
  = MkSequenceExprCycleDelayExpr SequenceExprCycleDelayExpr
  | MkSequenceExprExprCycleDelayExpr SequenceExprExprCycleDelayExpr
  | MkSequenceExprExpression SequenceExprExpression
  | MkSequenceExprInstance SequenceExprInstance
  | MkSequenceExprParen SequenceExprParen
  | MkSequenceExprBinary SequenceExprBinary
  | MkSequenceExprFirstMatch SequenceExprFirstMatch
  | MkSequenceExprThroughout SequenceExprThroughout
  | MkSequenceExprClockingEvent SequenceExprClockingEvent
  deriving (Eq, Show)

instance Lit SequenceExpr where
  lit (MkSequenceExprCycleDelayExpr x) = lit x
  lit (MkSequenceExprExprCycleDelayExpr x) = lit x
  lit (MkSequenceExprExpression x) = lit x
  lit (MkSequenceExprInstance x) = lit x
  lit (MkSequenceExprParen x) = lit x
  lit (MkSequenceExprBinary x) = lit x
  lit (MkSequenceExprFirstMatch x) = lit x
  lit (MkSequenceExprThroughout x) = lit x
  lit (MkSequenceExprClockingEvent x) = lit x

data SequenceExprCycleDelayExpr
  = SequenceExprCycleDelayExpr
      CycleDelayRange
      SequenceExpr
      [(CycleDelayRange, SequenceExpr)]
  deriving (Eq, Show)

instance Lit SequenceExprCycleDelayExpr where
  lit (SequenceExprCycleDelayExpr a b c) = T.concat [lit a, lit b, lit c]

data SequenceExprExprCycleDelayExpr
  = SequenceExprExprCycleDelayExpr
      SequenceExpr
      CycleDelayRange
      SequenceExpr
      [(CycleDelayRange, SequenceExpr)]
  deriving (Eq, Show)

instance Lit SequenceExprExprCycleDelayExpr where
  lit (SequenceExprExprCycleDelayExpr a b c d) = T.concat [lit a, lit b, lit c, lit d]

data SequenceExprExpression
  = SequenceExprExpression
      ExpressionOrDist
      (Maybe BooleanAbbrev)
  deriving (Eq, Show)

instance Lit SequenceExprExpression where
  lit (SequenceExprExpression a b) = lit a `T.append` lit b

data SequenceExprInstance
  = SequenceExprInstance
      SequenceExprInstance
      (Maybe SequenceAbbrev)
  deriving (Eq, Show)

instance Lit SequenceExprInstance where
  lit (SequenceExprInstance a b) = lit a `T.append` lit b

data SequenceExprParen
  = SequenceExprParen
      (Paren (SequenceExpr, [(Symbol, SequenceMatchItem)]))
      (Maybe SequenceAbbrev)
  deriving (Eq, Show)

instance Lit SequenceExprParen where
  lit (SequenceExprParen a b) = lit a `T.append` lit b

data SequenceExprBinary
  = SequenceExprBinary
      SequenceExpr
      Keyword
      SequenceExpr
  deriving (Eq, Show)

instance Lit SequenceExprBinary where
  lit (SequenceExprBinary a b c) = T.concat [lit a, lit b, lit c]

data SequenceExprFirstMatch
  = SequenceExprFirstMatch
      Keyword
      (Paren (SequenceExpr, [(Symbol, SequenceMatchItem)]))
  deriving (Eq, Show)

instance Lit SequenceExprFirstMatch where
  lit (SequenceExprFirstMatch a b) = lit a `T.append` lit b

data SequenceExprThroughout
  = SequenceExprThroughout
      ExpressionOrDist
      Keyword
      SequenceExpr
  deriving (Eq, Show)

instance Lit SequenceExprThroughout where
  lit (SequenceExprThroughout a b c) = T.concat [lit a, lit b, lit c]

data SequenceExprClockingEvent
  = SequenceExprClockingEvent
      ClockingEvent
      SequenceExpr
  deriving (Eq, Show)

instance Lit SequenceExprClockingEvent where
  lit (SequenceExprClockingEvent a b) = lit a `T.append` lit b

data CycleDelayRange
  = MkCycleDelayRangePrimary CycleDelayRangePrimary
  | MkCycleDelayRangeExpression CycleDelayRangeExpression
  | MkCycleDelayRangeAsterisk CycleDelayRangeAsterisk
  | MkCycleDelayRangePlus CycleDelayRangePlus
  deriving (Eq, Show)

instance Lit CycleDelayRange where
  lit (MkCycleDelayRangePrimary x) = lit x
  lit (MkCycleDelayRangeExpression x) = lit x
  lit (MkCycleDelayRangeAsterisk x) = lit x
  lit (MkCycleDelayRangePlus x) = lit x

data CycleDelayRangePrimary
  = CycleDelayRangePrimary
      Symbol
      ConstantPrimary
  deriving (Eq, Show)

instance Lit CycleDelayRangePrimary where
  lit (CycleDelayRangePrimary a b) = lit a `T.append` lit b

data CycleDelayRangeExpression
  = CycleDelayRangeExpression
      Symbol
      (Bracket CycleDelayConstRangeExpression)
  deriving (Eq, Show)

instance Lit CycleDelayRangeExpression where
  lit (CycleDelayRangeExpression a b) = lit a `T.append` lit b

data CycleDelayRangeAsterisk
  = CycleDelayRangeAsterisk
      Symbol
      (Bracket Symbol)
  deriving (Eq, Show)

instance Lit CycleDelayRangeAsterisk where
  lit (CycleDelayRangeAsterisk a b) = lit a `T.append` lit b

data CycleDelayRangePlus
  = CycleDelayRangePlus
      Symbol
      (Bracket Symbol)
  deriving (Eq, Show)

instance Lit CycleDelayRangePlus where
  lit (CycleDelayRangePlus a b) = lit a `T.append` lit b

data SequenceMethodCall
  = SequenceMethodCall
      SequenceInstance
      Symbol
      MethodIdentifier
  deriving (Eq, Show)

instance Lit SequenceMethodCall where
  lit (SequenceMethodCall a b c) = T.concat [lit a, lit b, lit c]

data SequenceMatchItem
  = MkOperatorAssignment OperatorAssignment
  | MkIncOrDecExpression IncOrDecExpression
  | MkSubroutineCall SubroutineCall
  deriving (Eq, Show)

instance Lit SequenceMatchItem where
  lit (MkOperatorAssignment x) = lit x
  lit (MkIncOrDecExpression x) = lit x
  lit (MkSubroutineCall x) = lit x

data SequenceInstance
  = SequenceInstance
      PsOrHierarchicalSequenceIdentifier
      (Maybe (Paren (Maybe SequenceListOfArguments)))
  deriving (Eq, Show)

instance Lit SequenceInstance where
  lit (SequenceInstance a b) = lit a `T.append` lit b

data SequenceListOfArguments
  = MkSequenceListOfArgumentsOrdered SequenceListOfArgumentsOrdered
  | MkSequenceListOfArgumentsNamed SequenceListOfArgumentsNamed
  deriving (Eq, Show)

instance Lit SequenceListOfArguments where
  lit (MkSequenceListOfArgumentsOrdered x) = lit x
  lit (MkSequenceListOfArgumentsNamed x) = lit x

data SequenceListOfArgumentsOrdered
  = SequenceListOfArgumentsOrdered
      (Splits Symbol (Maybe SequenceActualArg))
      [(Symbol, Symbol, Identifier, Paren (Maybe SequenceActualArg))]
  deriving (Eq, Show)

instance Lit SequenceListOfArgumentsOrdered where
  lit (SequenceListOfArgumentsOrdered a b) = lit a `T.append` lit b

data SequenceListOfArgumentsNamed
  = SequenceListOfArgumentsNamed
      (Splits Symbol (Symbol, Identifier, Paren (Maybe SequenceActualArg)))
  deriving (Eq, Show)

instance Lit SequenceListOfArgumentsNamed where
  lit (SequenceListOfArgumentsNamed x) = lit x

data SequenceActualArg
  = MkEventExpression EventExpression
  | MkSequenceActualArgSequenceExpr SequenceExpr
  deriving (Eq, Show)

instance Lit SequenceActualArg where
  lit (MkEventExpression x) = lit x
  lit (MkSequenceActualArgSequenceExpr x) = lit x

data BooleanAbbrev
  = MkConsecutiveRepetition ConsecutiveRepetition
  | MkNonConsecutiveRepetition NonConsecutiveRepetition
  | MkGotoRepetition GotoRepetition
  deriving (Eq, Show)

instance Lit BooleanAbbrev where
  lit (MkConsecutiveRepetition x) = lit x
  lit (MkNonConsecutiveRepetition x) = lit x
  lit (MkGotoRepetition x) = lit x

data SequenceAbbrev = SequenceAbbrev ConsecutiveRepetition deriving (Eq, Show)

instance Lit SequenceAbbrev where
  lit (SequenceAbbrev x) = lit x

data ConsecutiveRepetition
  = MkConsecutiveRepetitionExpression ConsecutiveRepetitionExpression
  | MkConsecutiveRepetitionAsterisk ConsecutiveRepetitionAsterisk
  | MkConsecutiveRepetitionPlus ConsecutiveRepetitionPlus
  deriving (Eq, Show)

instance Lit ConsecutiveRepetition where
  lit (MkConsecutiveRepetitionExpression x) = lit x
  lit (MkConsecutiveRepetitionAsterisk x) = lit x
  lit (MkConsecutiveRepetitionPlus x) = lit x

data ConsecutiveRepetitionExpression
  = ConsecutiveRepetitionExpression
      (Bracket (Symbol, ConstOrRangeExpression))
  deriving (Eq, Show)

instance Lit ConsecutiveRepetitionExpression where
  lit (ConsecutiveRepetitionExpression x) = lit x

data ConsecutiveRepetitionAsterisk = ConsecutiveRepetitionAsterisk (Bracket Symbol) deriving (Eq, Show)

instance Lit ConsecutiveRepetitionAsterisk where
  lit (ConsecutiveRepetitionAsterisk x) = lit x

data ConsecutiveRepetitionPlus = ConsecutiveRepetitionPlus (Bracket Symbol) deriving (Eq, Show)

instance Lit ConsecutiveRepetitionPlus where
  lit (ConsecutiveRepetitionPlus x) = lit x

data NonConsecutiveRepetition = NonConsecutiveRepetition (Bracket (Symbol, ConstOrRangeExpression)) deriving (Eq, Show)

instance Lit NonConsecutiveRepetition where
  lit (NonConsecutiveRepetition x) = lit x

data GotoRepetition = GotoRepetition (Bracket (Symbol, ConstOrRangeExpression)) deriving (Eq, Show)

instance Lit GotoRepetition where
  lit (GotoRepetition x) = lit x

data ConstOrRangeExpression
  = MkConstantExpression ConstantExpression
  | MkCycleDelayConstRangeExpression CycleDelayConstRangeExpression
  deriving (Eq, Show)

instance Lit ConstOrRangeExpression where
  lit (MkConstantExpression x) = lit x
  lit (MkCycleDelayConstRangeExpression x) = lit x

data CycleDelayConstRangeExpression
  = MkCycleDelayConstRangeExpressionBinary CycleDelayConstRangeExpressionBinary
  | MkCycleDelayConstRangeExpressionDollar CycleDelayConstRangeExpressionDollar
  deriving (Eq, Show)

instance Lit CycleDelayConstRangeExpression where
  lit (MkCycleDelayConstRangeExpressionBinary x) = lit x
  lit (MkCycleDelayConstRangeExpressionDollar x) = lit x

data CycleDelayConstRangeExpressionBinary
  = CycleDelayConstRangeExpressionBinary
      ConstantExpression
      Symbol
      ConstantExpression
  deriving (Eq, Show)

instance Lit CycleDelayConstRangeExpressionBinary where
  lit (CycleDelayConstRangeExpressionBinary a b c) = T.concat [lit a, lit b, lit c]

data CycleDelayConstRangeExpressionDollar
  = CycleDelayConstRangeExpressionDollar
      ConstantExpression
      Symbol
      Symbol
  deriving (Eq, Show)

instance Lit CycleDelayConstRangeExpressionDollar where
  lit (CycleDelayConstRangeExpressionDollar a b c) = T.concat [lit a, lit b, lit c]

data ExpressionOrDist
  = ExpressionOrDist
      Expression
      (Maybe (Keyword, Brace DistList))
  deriving (Eq, Show)

instance Lit ExpressionOrDist where
  lit (ExpressionOrDist a b) = lit a `T.append` lit b

data AssertionVariableDeclaration
  = AssertionVariableDeclaration
      VarDataType
      ListOfVariableDeclAssignments
      Symbol
  deriving (Eq, Show)

instance Lit AssertionVariableDeclaration where
  lit (AssertionVariableDeclaration a b c) = T.concat [lit a, lit b, lit c]