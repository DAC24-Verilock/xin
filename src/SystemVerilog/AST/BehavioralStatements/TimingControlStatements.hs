module SystemVerilog.AST.BehavioralStatements.TimingControlStatements where

import qualified Data.Text as T
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.ClockingBlock (CycleDelay)
import SystemVerilog.AST.BehavioralStatements.ParallelAndSequentialBlocks (ActionBlock)
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (StatementOrNull)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.AssertionDeclarations (SequenceInstance)
import SystemVerilog.AST.Declarations.Delays (DelayValue)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (Expression, MintypmaxExpression)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (HierarchicalBlockIdentifier, HierarchicalEventIdentifier, HierarchicalIdentifier, HierarchicalTaskIdentifier, PsOrHierarchicalSequenceIdentifier)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import SystemVerilog.AST.SpecifySection.SpecifyPathDelays (EdgeIdentifier)
import Util.Lit (Lit(..))

data ProceduralTimingControlStatement
  = ProceduralTimingControlStatement
      ProceduralTimingControl
      StatementOrNull
  deriving (Eq, Show)

instance Lit ProceduralTimingControlStatement where
  lit (ProceduralTimingControlStatement a b) = lit a `T.append` lit b

data DelayOrEventControl
  = MkDelayControl DelayControl
  | MkEventControl EventControl
  | MkDelayOrEventControlRepeat DelayOrEventControlRepeat
  deriving (Eq, Show)

instance Lit DelayOrEventControl where
  lit (MkDelayControl x) = lit x
  lit (MkEventControl x) = lit x
  lit (MkDelayOrEventControlRepeat x) = lit x

data DelayOrEventControlRepeat
  = DelayOrEventControlRepeat
      Keyword
      (Paren Expression)
      EventControl
  deriving (Eq, Show)

instance Lit DelayOrEventControlRepeat where
  lit (DelayOrEventControlRepeat a b c) = T.concat [lit a, lit b, lit c]

data DelayControl
  = MkDelayControlDelay DelayControlDelay
  | MkDelayControlMintypmax DelayControlMintypmax
  deriving (Eq, Show)

instance Lit DelayControl where
  lit (MkDelayControlDelay x) = lit x
  lit (MkDelayControlMintypmax x) = lit x

data DelayControlDelay
  = DelayControlDelay
      Symbol
      DelayValue
  deriving (Eq, Show)

instance Lit DelayControlDelay where
  lit (DelayControlDelay a b) = lit a `T.append` lit b

data DelayControlMintypmax
  = DelayControlMintypmax
      Symbol
      (Paren MintypmaxExpression)
  deriving (Eq, Show)

instance Lit DelayControlMintypmax where
  lit (DelayControlMintypmax a b) = lit a `T.append` lit b

data EventControl
  = MkEventControlEventIdentifier EventControlEventIdentifier
  | MkEventControlEventExpression EventControlEventExpression
  | MkEventControlAsterisk EventControlAsterisk
  | MkEventControlParenAsterisk EventControlParenAsterisk
  | MkEventControlSequenceIdentifier EventControlSequenceIdentifier
  deriving (Eq, Show)

instance Lit EventControl where
  lit (MkEventControlEventIdentifier x) = lit x
  lit (MkEventControlEventExpression x) = lit x
  lit (MkEventControlAsterisk x) = lit x
  lit (MkEventControlParenAsterisk x) = lit x
  lit (MkEventControlSequenceIdentifier x) = lit x

data EventControlEventIdentifier
  = EventControlEventIdentifier
      Symbol
      HierarchicalEventIdentifier
  deriving (Eq, Show)

instance Lit EventControlEventIdentifier where
  lit (EventControlEventIdentifier a b) = lit a `T.append` lit b

data EventControlEventExpression
  = EventControlEventExpression
      Symbol
      (Paren EventExpression)
  deriving (Eq, Show)

instance Lit EventControlEventExpression where
  lit (EventControlEventExpression a b) = lit a `T.append` lit b

newtype EventControlAsterisk
  = EventControlAsterisk Symbol
  deriving (Eq, Show)

instance Lit EventControlAsterisk where
  lit (EventControlAsterisk x) = lit x

data EventControlParenAsterisk
  = EventControlParenAsterisk
      Symbol
      (Paren Symbol)
  deriving (Eq, Show)

instance Lit EventControlParenAsterisk where
  lit (EventControlParenAsterisk a b) = lit a `T.append` lit b

data EventControlSequenceIdentifier
  = EventControlSequenceIdentifier
      Symbol
      PsOrHierarchicalSequenceIdentifier
  deriving (Eq, Show)

instance Lit EventControlSequenceIdentifier where
  lit (EventControlSequenceIdentifier a b) = lit a `T.append` lit b

data EventExpression
  = MkEventExpressionExpression EventExpressionExpression
  | MkEventExpressionSequence EventExpressionSequence
  | MkEventExpressionOr EventExpressionOr
  | MkEventExpressionComma EventExpressionComma
  | MkEventExpressionParen EventExpressionParen
  deriving (Eq, Show)

instance Lit EventExpression where
  lit (MkEventExpressionExpression x) = lit x
  lit (MkEventExpressionSequence x) = lit x
  lit (MkEventExpressionOr x) = lit x
  lit (MkEventExpressionComma x) = lit x
  lit (MkEventExpressionParen x) = lit x

data EventExpressionExpression
  = EventExpressionExpression
      (Maybe EdgeIdentifier)
      Expression
      (Maybe (Keyword, Expression))
  deriving (Eq, Show)

instance Lit EventExpressionExpression where
  lit (EventExpressionExpression a b c) = T.concat [lit a, lit b, lit c]

data EventExpressionSequence
  = EventExpressionSequence
      SequenceInstance
      (Maybe (Keyword, Expression))
  deriving (Eq, Show)

instance Lit EventExpressionSequence where
  lit (EventExpressionSequence a b) = lit a `T.append` lit b

data EventExpressionOr
  = EventExpressionOr
      EventExpression
      Keyword
      EventExpression
  deriving (Eq, Show)

instance Lit EventExpressionOr where
  lit (EventExpressionOr a b c) = T.concat [lit a, lit b, lit c]

data EventExpressionComma
  = EventExpressionComma
      EventExpression
      Symbol
      EventExpression
  deriving (Eq, Show)

instance Lit EventExpressionComma where
  lit (EventExpressionComma a b c) = T.concat [lit a, lit b, lit c]

newtype EventExpressionParen
  = EventExpressionParen (Paren EventExpression)
  deriving (Eq, Show)

instance Lit EventExpressionParen where
  lit (EventExpressionParen x) = lit x

data ProceduralTimingControl
  = MkProceduralTimingControlDelayControl DelayControl
  | MkProceduralTimingControlEventControl EventControl
  | MkCycleDelay CycleDelay
  deriving (Eq, Show)

instance Lit ProceduralTimingControl where
  lit (MkProceduralTimingControlDelayControl x) = lit x
  lit (MkProceduralTimingControlEventControl x) = lit x
  lit (MkCycleDelay x) = lit x

data JumpStatement
  = MkJumpStatementReturn JumpStatementReturn
  | MkJumpStatementBreak JumpStatementBreak
  | MkJumpStatementContinue JumpStatementContinue
  deriving (Eq, Show)

instance Lit JumpStatement where
  lit (MkJumpStatementReturn x) = lit x
  lit (MkJumpStatementBreak x) = lit x
  lit (MkJumpStatementContinue x) = lit x

data JumpStatementReturn
  = JumpStatementReturn
      Keyword
      (Maybe Expression)
      Symbol
  deriving (Eq, Show)

instance Lit JumpStatementReturn where
  lit (JumpStatementReturn a b c) = T.concat [lit a, lit b, lit c]

data JumpStatementBreak
  = JumpStatementBreak
      Keyword
      Symbol
  deriving (Eq, Show)

instance Lit JumpStatementBreak where
  lit (JumpStatementBreak a b) = lit a `T.append` lit b

data JumpStatementContinue
  = JumpStatementContinue
      Keyword
      Symbol
  deriving (Eq, Show)

instance Lit JumpStatementContinue where
  lit (JumpStatementContinue a b) = lit a `T.append` lit b

data WaitStatement
  = MkWaitStatementWait WaitStatementWait
  | MkWaitStatementFork WaitStatementFork
  | MkWaitStatementOrder WaitStatementOrder
  deriving (Eq, Show)

instance Lit WaitStatement where
  lit (MkWaitStatementWait x) = lit x
  lit (MkWaitStatementFork x) = lit x
  lit (MkWaitStatementOrder x) = lit x

data WaitStatementWait
  = WaitStatementWait
      Keyword
      (Paren Expression)
      StatementOrNull
  deriving (Eq, Show)

instance Lit WaitStatementWait where
  lit (WaitStatementWait a b c) = T.concat [lit a, lit b, lit c]

data WaitStatementFork
  = WaitStatementFork
      Keyword
      Keyword
      Symbol
  deriving (Eq, Show)

instance Lit WaitStatementFork where
  lit (WaitStatementFork a b c) = T.concat [lit a, lit b, lit c]

data WaitStatementOrder
  = WaitStatementOrder
      Keyword
      (Paren (Splits Symbol HierarchicalIdentifier))
      ActionBlock
  deriving (Eq, Show)

instance Lit WaitStatementOrder where
  lit (WaitStatementOrder a b c) = T.concat [lit a, lit b, lit c]

data EventTrigger
  = MkEventTriggerNamed EventTriggerNamed
  | MkEventTriggerNonblocking EventTriggerNonblocking
  deriving (Eq, Show)

instance Lit EventTrigger where
  lit (MkEventTriggerNamed x) = lit x
  lit (MkEventTriggerNonblocking x) = lit x

data EventTriggerNamed
  = EventTriggerNamed
      Symbol
      HierarchicalEventIdentifier
      Symbol
  deriving (Eq, Show)

instance Lit EventTriggerNamed where
  lit (EventTriggerNamed a b c) = T.concat [lit a, lit b, lit c]

data EventTriggerNonblocking
  = EventTriggerNonblocking
      Symbol
      (Maybe DelayOrEventControl)
      HierarchicalEventIdentifier
      Symbol
  deriving (Eq, Show)

instance Lit EventTriggerNonblocking where
  lit (EventTriggerNonblocking a b c d) = T.concat [lit a, lit b, lit c, lit d]

data DisableStatement
  = MkDisableStatementTask DisableStatementTask
  | MkDisableStatementBlock DisableStatementBlock
  | MkDisableStatementFork DisableStatementFork
  deriving (Eq, Show)

instance Lit DisableStatement where
  lit (MkDisableStatementTask x) = lit x
  lit (MkDisableStatementBlock x) = lit x
  lit (MkDisableStatementFork x) = lit x

data DisableStatementTask
  = DisableStatementTask
      Keyword
      HierarchicalTaskIdentifier
      Symbol
  deriving (Eq, Show)

instance Lit DisableStatementTask where
  lit (DisableStatementTask a b c) = T.concat [lit a, lit b, lit c]

data DisableStatementBlock
  = DisableStatementBlock
      Keyword
      HierarchicalBlockIdentifier
      Symbol
  deriving (Eq, Show)

instance Lit DisableStatementBlock where
  lit (DisableStatementBlock a b c) = T.concat [lit a, lit b, lit c]

data DisableStatementFork
  = DisableStatementFork
      Keyword
      Keyword
      Symbol
  deriving (Eq, Show)

instance Lit DisableStatementFork where
  lit (DisableStatementFork a b c) = T.concat [lit a, lit b, lit c]