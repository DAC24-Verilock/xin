module SystemVerilog.AST.Declarations.CovergroupDeclarations where

import qualified Data.Text as T
import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.ClockingBlock (ClockingEvent)
import SystemVerilog.AST.Declarations.FunctionDeclarations (FunctionDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (ClassScope, DataTypeOrImplicit)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TaskDeclarations (TfPortList)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression, Expression)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (BinIdentifier, CoverPointIdentifier, CovergroupIdentifier, CrossIdentifier, HierarchicalBlockIdentifier, HierarchicalIdentifier, HierarchicalTfIdentifier, MemberIdentifier, MethodIdentifier, VariableIdentifier)
import SystemVerilog.AST.SpecialNodes (Brace, Bracket, Keyword, Paren, Splits, Symbol)
import Util.Lit (Lit(..))

data CovergroupDeclaration
  = CovergroupDeclaration
      Keyword
      CovergroupIdentifier
      (Maybe (Paren (Maybe TfPortList)))
      (Maybe CoverageEvent)
      Symbol
      [CoverageSpecOrOption]
      Keyword
      (Maybe (Symbol, CovergroupIdentifier))
  deriving (Eq, Show)

instance Lit CovergroupDeclaration where
  lit (CovergroupDeclaration a b c d e f g h) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g, lit h]

data CoverageSpecOrOption
  = MkCoverageSpecOrOptionSpec CoverageSpecOrOptionSpec
  | MkCoverageSpecOrOptionOption CoverageSpecOrOptionOption
  deriving (Eq, Show)

instance Lit CoverageSpecOrOption where
  lit (MkCoverageSpecOrOptionSpec x) = lit x
  lit (MkCoverageSpecOrOptionOption x) = lit x

data CoverageSpecOrOptionSpec
  = CoverageSpecOrOptionSpec
      [AttributeInstance]
      CoverageSpec
  deriving (Eq, Show)

instance Lit CoverageSpecOrOptionSpec where
  lit (CoverageSpecOrOptionSpec a b) = lit a `T.append` lit b

data CoverageSpecOrOptionOption
  = CoverageSpecOrOptionOption
      [AttributeInstance]
      CoverageOption
      Symbol
  deriving (Eq, Show)

instance Lit CoverageSpecOrOptionOption where
  lit (CoverageSpecOrOptionOption a b c) = T.concat [lit a, lit b, lit c]

data CoverageOption
  = MkCoverageOptionOption CoverageOptionOption
  | MkCoverageOptionTypeOption CoverageOptionTypeOption
  deriving (Eq, Show)

instance Lit CoverageOption where
  lit (MkCoverageOptionOption x) = lit x
  lit (MkCoverageOptionTypeOption x) = lit x

data CoverageOptionOption
  = CoverageOptionOption
      Keyword
      Symbol
      MemberIdentifier
      Symbol
      Expression
  deriving (Eq, Show)

instance Lit CoverageOptionOption where
  lit (CoverageOptionOption a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data CoverageOptionTypeOption
  = CoverageOptionTypeOption
      Keyword
      Symbol
      MemberIdentifier
      Symbol
      ConstantExpression
  deriving (Eq, Show)

instance Lit CoverageOptionTypeOption where
  lit (CoverageOptionTypeOption a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data CoverageSpec
  = MkCoverPoint CoverPoint
  | MkCoverCross CoverCross
  deriving (Eq, Show)

instance Lit CoverageSpec where
  lit (MkCoverPoint x) = lit x
  lit (MkCoverCross x) = lit x

data CoverageEvent
  = MkClockingEvent ClockingEvent
  | MkCoverageEventSample CoverageEventSample
  | MkCoverageEventAt CoverageEventAt
  deriving (Eq, Show)

instance Lit CoverageEvent where
  lit (MkClockingEvent x) = lit x
  lit (MkCoverageEventSample x) = lit x
  lit (MkCoverageEventAt x) = lit x

data CoverageEventSample
  = CoverageEventSample
      Keyword
      Keyword
      Keyword
      (Paren (Maybe TfPortList))
  deriving (Eq, Show)

instance Lit CoverageEventSample where
  lit (CoverageEventSample a b c d) = T.concat [lit a, lit b, lit c, lit d]

data CoverageEventAt
  = CoverageEventAt
      Symbol
      (Paren BlockEventExpression)
  deriving (Eq, Show)

instance Lit CoverageEventAt where
  lit (CoverageEventAt a b) = lit a `T.append` lit b

data BlockEventExpression
  = MkBlockEventExpressionOr BlockEventExpressionOr
  | MkBlockEventExpressionBegin BlockEventExpressionBegin
  | MkBlockEventExpressionEnd BlockEventExpressionEnd
  deriving (Eq, Show)

instance Lit BlockEventExpression where
  lit (MkBlockEventExpressionOr x) = lit x
  lit (MkBlockEventExpressionBegin x) = lit x
  lit (MkBlockEventExpressionEnd x) = lit x

data BlockEventExpressionOr
  = BlockEventExpressionOr
      BlockEventExpression
      Keyword
      BlockEventExpression
  deriving (Eq, Show)

instance Lit BlockEventExpressionOr where
  lit (BlockEventExpressionOr a b c) = T.concat [lit a, lit b, lit c]

data BlockEventExpressionBegin
  = BlockEventExpressionBegin
      Keyword
      HierarchicalBtfIdentifier
  deriving (Eq, Show)

instance Lit BlockEventExpressionBegin where
  lit (BlockEventExpressionBegin a b) = lit a `T.append` lit b

data BlockEventExpressionEnd
  = BlockEventExpressionEnd
      Keyword
      HierarchicalBtfIdentifier
  deriving (Eq, Show)

instance Lit BlockEventExpressionEnd where
  lit (BlockEventExpressionEnd a b) = lit a `T.append` lit b

data HierarchicalBtfIdentifier
  = MkHierarchicalTfIdentifier HierarchicalTfIdentifier
  | MKHierarchicalBlockIdentifier HierarchicalBlockIdentifier
  | MkHierarchicalBtfIdentifierMethod HierarchicalBtfIdentifierMethod
  deriving (Eq, Show)

instance Lit HierarchicalBtfIdentifier where
  lit (MkHierarchicalTfIdentifier x) = lit x
  lit (MKHierarchicalBlockIdentifier x) = lit x
  lit (MkHierarchicalBtfIdentifierMethod x) = lit x

data HierarchicalBtfIdentifierMethod
  = HierarchicalBtfIdentifierMethod
      (Maybe HierarchicalIdentifierOrClassScope)
      MethodIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalBtfIdentifierMethod where
  lit (HierarchicalBtfIdentifierMethod a b) = lit a `T.append` lit b

data HierarchicalIdentifierOrClassScope
  = MkHierarchicalIdentifier HierarchicalIdentifier Symbol
  | MkClassScope ClassScope
  deriving (Eq, Show)

instance Lit HierarchicalIdentifierOrClassScope where
  lit (MkHierarchicalIdentifier a b) = lit a `T.append` lit b
  lit (MkClassScope x) = lit x

data CoverPoint
  = CoverPoint
      (Maybe (Maybe DataTypeOrImplicit, CoverPointIdentifier, Symbol))
      Keyword
      Expression
      (Maybe (Keyword, Paren Expression))
      BinsOrEmpty
  deriving (Eq, Show)

instance Lit CoverPoint where
  lit (CoverPoint a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data BinsOrEmpty
  = MkBinsOrEmptyNonEmpty BinsOrEmptyNonEmpty
  | Empty Symbol
  deriving (Eq, Show)

instance Lit BinsOrEmpty where
  lit (MkBinsOrEmptyNonEmpty x) = lit x
  lit (Empty x) = lit x

newtype BinsOrEmptyNonEmpty
  = BinsOrEmptyNonEmpty
      (Brace ([AttributeInstance], [(BinsOrOptions, Symbol)]))
  deriving (Eq, Show)

instance Lit BinsOrEmptyNonEmpty where
  lit (BinsOrEmptyNonEmpty x) = lit x

data BinsOrOptions
  = MkCoverageOption CoverageOption
  | MkBinsOrOptionsCovergroup BinsOrOptionsCovergroup
  | MkBinsOrOptionsCoverPoint BinsOrOptionsCoverPoint
  | MkBinsOrOptionsSetCovergroup BinsOrOptionsSetCovergroup
  | MkBinsOrOptionsTransList BinsOrOptionsTransList
  | MkBinsOrOptionsDefault BinsOrOptionsDefault
  | MkBinsOrOptionsDefaultSequence BinsOrOptionsDefaultSequence
  deriving (Eq, Show)

instance Lit BinsOrOptions where
  lit (MkCoverageOption x) = lit x
  lit (MkBinsOrOptionsCovergroup x) = lit x
  lit (MkBinsOrOptionsCoverPoint x) = lit x
  lit (MkBinsOrOptionsSetCovergroup x) = lit x
  lit (MkBinsOrOptionsTransList x) = lit x
  lit (MkBinsOrOptionsDefault x) = lit x
  lit (MkBinsOrOptionsDefaultSequence x) = lit x

data BinsOrOptionsCovergroup
  = BinsOrOptionsCovergroup
      (Maybe Wildcard)
      BinsKeyword
      BinIdentifier
      (Maybe (Bracket (Maybe CovergroupExpression)))
      Symbol
      (Brace CovergroupRangeList)
      (Maybe (Keyword, Paren WithCovergroupExpression))
      (Maybe (Keyword, Paren Expression))
  deriving (Eq, Show)

instance Lit BinsOrOptionsCovergroup where
  lit (BinsOrOptionsCovergroup a b c d e f g h) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g, lit h]

newtype Wildcard = Wildcard Keyword deriving (Eq, Show)

instance Lit Wildcard where
  lit (Wildcard x) = lit x

data BinsOrOptionsCoverPoint
  = BinsOrOptionsCoverPoint
      (Maybe Wildcard)
      BinsKeyword
      BinIdentifier
      (Maybe (Bracket (Maybe CovergroupExpression)))
      Symbol
      CoverPointIdentifier
      Keyword
      (Paren WithCovergroupExpression)
      (Maybe (Keyword, Paren Expression))
  deriving (Eq, Show)

instance Lit BinsOrOptionsCoverPoint where
  lit (BinsOrOptionsCoverPoint a b c d e f g h i) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g, lit h, lit i]

data BinsOrOptionsSetCovergroup
  = BinsOrOptionsSetCovergroup
      (Maybe Wildcard)
      BinsKeyword
      BinIdentifier
      (Maybe (Bracket (Maybe CovergroupExpression)))
      Symbol
      SetCovergroupExpression
      (Maybe (Keyword, Paren Expression))
  deriving (Eq, Show)

instance Lit BinsOrOptionsSetCovergroup where
  lit (BinsOrOptionsSetCovergroup a b c d e f g) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g]

data BinsOrOptionsTransList
  = BinsOrOptionsTransList
      (Maybe Wildcard)
      BinsKeyword
      BinIdentifier
      (Maybe (Symbol, Symbol))
      Symbol
      TransList
      (Maybe (Keyword, Paren Expression))
  deriving (Eq, Show)

instance Lit BinsOrOptionsTransList where
  lit (BinsOrOptionsTransList a b c d e f g) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g]

data BinsOrOptionsDefault
  = BinsOrOptionsDefault
      BinsKeyword
      BinIdentifier
      (Maybe (Bracket (Maybe CovergroupExpression)))
      Symbol
      Keyword
      (Maybe (Keyword, Paren Expression))
  deriving (Eq, Show)

instance Lit BinsOrOptionsDefault where
  lit (BinsOrOptionsDefault a b c d e f) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f]

data BinsOrOptionsDefaultSequence
  = BinsOrOptionsDefaultSequence
      BinsKeyword
      BinIdentifier
      Symbol
      Keyword
      Keyword
      (Maybe (Keyword, Paren Expression))
  deriving (Eq, Show)

instance Lit BinsOrOptionsDefaultSequence where
  lit (BinsOrOptionsDefaultSequence a b c d e f) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f]

data BinsKeyword
  = Bins Keyword
  | IllegalBins Keyword
  | IgnoreBins Keyword
  deriving (Eq, Show)

instance Lit BinsKeyword where
  lit (Bins x) = lit x
  lit (IllegalBins x) = lit x
  lit (IgnoreBins x) = lit x

newtype TransList = TransList (Splits Symbol TransSet) deriving (Eq, Show)

instance Lit TransList where
  lit (TransList x) = lit x

newtype TransSet = TransSet (Splits Symbol TransRangeList) deriving (Eq, Show)

instance Lit TransSet where
  lit (TransSet x) = lit x

data TransRangeList
  = MkTransItem TransItem
  | MkTransRangeListAsterisk TransRangeListAsterisk
  | MkTransRangeListArrow TransRangeListArrow
  | MkTransRangeListEqual TransRangeListEqual
  deriving (Eq, Show)

instance Lit TransRangeList where
  lit (MkTransItem x) = lit x
  lit (MkTransRangeListAsterisk x) = lit x
  lit (MkTransRangeListArrow x) = lit x
  lit (MkTransRangeListEqual x) = lit x

data TransRangeListAsterisk
  = TransRangeListAsterisk
      TransItem
      (Bracket (Symbol, RepeatRange))
  deriving (Eq, Show)

instance Lit TransRangeListAsterisk where
  lit (TransRangeListAsterisk a b) = lit a `T.append` lit b

data TransRangeListArrow
  = TransRangeListArrow
      TransItem
      (Bracket (Symbol, RepeatRange))
  deriving (Eq, Show)

instance Lit TransRangeListArrow where
  lit (TransRangeListArrow a b) = lit a `T.append` lit b

data TransRangeListEqual
  = TransRangeListEqual
      TransItem
      (Bracket (Symbol, RepeatRange))
  deriving (Eq, Show)

instance Lit TransRangeListEqual where
  lit (TransRangeListEqual a b) = lit a `T.append` lit b

newtype TransItem = TransItem CovergroupRangeList deriving (Eq, Show)

instance Lit TransItem where
  lit (TransItem x) = lit x

data RepeatRange
  = MkCovergroupExpression CovergroupExpression
  | MkRepeatRangeBinary RepeatRangeBinary
  deriving (Eq, Show)

instance Lit RepeatRange where
  lit (MkCovergroupExpression x) = lit x
  lit (MkRepeatRangeBinary x) = lit x

data RepeatRangeBinary
  = RepeatRangeBinary
      CovergroupExpression
      Symbol
      CovergroupExpression
  deriving (Eq, Show)

instance Lit RepeatRangeBinary where
  lit (RepeatRangeBinary a b c) = T.concat [lit a, lit b, lit c]

data CoverCross
  = CoverCross
      (Maybe (CrossIdentifier, Symbol))
      Keyword
      ListOfCrossItems
      (Maybe (Keyword, Paren Expression))
      CrossBody
  deriving (Eq, Show)

instance Lit CoverCross where
  lit (CoverCross a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data ListOfCrossItems
  = ListOfCrossItems
      CrossItem
      Symbol
      (Splits Symbol CrossItem)
  deriving (Eq, Show)

instance Lit ListOfCrossItems where
  lit (ListOfCrossItems a b c) = T.concat [lit a, lit b, lit c]

data CrossItem
  = MkCoverPointIdentifier CoverPointIdentifier
  | MkVariableIdentifier VariableIdentifier
  deriving (Eq, Show)

instance Lit CrossItem where
  lit (MkCoverPointIdentifier x) = lit x
  lit (MkVariableIdentifier x) = lit x

data CrossBody
  = MkCrossBodyNonEmpty CrossBodyNonEmpty
  | EmptyCrossBody Symbol
  deriving (Eq, Show)

instance Lit CrossBody where
  lit (MkCrossBodyNonEmpty x) = lit x
  lit (EmptyCrossBody x) = lit x

newtype CrossBodyNonEmpty = CrossBodyNonEmpty (Bracket [CrossBodyItem]) deriving (Eq, Show)

instance Lit CrossBodyNonEmpty where
  lit (CrossBodyNonEmpty x) = lit x

data CrossBodyItem
  = MkFunctionDeclaration FunctionDeclaration
  | MkBinsSelectionOrOption BinsSelectionOrOption Symbol
  deriving (Eq, Show)

instance Lit CrossBodyItem where
  lit (MkFunctionDeclaration x) = lit x
  lit (MkBinsSelectionOrOption a b) = lit a `T.append` lit b

data BinsSelectionOrOption
  = MkBinsSelectionOrOptionCoverage BinsSelectionOrOptionCoverage
  | MkBinsSelectionOrOptionBins BinsSelectionOrOptionBins
  deriving (Eq, Show)

instance Lit BinsSelectionOrOption where
  lit (MkBinsSelectionOrOptionCoverage x) = lit x
  lit (MkBinsSelectionOrOptionBins x) = lit x

data BinsSelectionOrOptionCoverage
  = BinsSelectionOrOptionCoverage
      [AttributeInstance]
      CoverageOption
  deriving (Eq, Show)

instance Lit BinsSelectionOrOptionCoverage where
  lit (BinsSelectionOrOptionCoverage a b) = lit a `T.append` lit b

data BinsSelectionOrOptionBins
  = BinsSelectionOrOptionBins
      [AttributeInstance]
      BinsSelection
  deriving (Eq, Show)

instance Lit BinsSelectionOrOptionBins where
  lit (BinsSelectionOrOptionBins a b) = lit a `T.append` lit b

data BinsSelection
  = BinsSelection
      BinsKeyword
      BinIdentifier
      Symbol
      SelectExpression
      (Maybe (Keyword, Paren Expression))
  deriving (Eq, Show)

instance Lit BinsSelection where
  lit (BinsSelection a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data SelectExpression
  = MkSelectCondition SelectCondition
  | MkSelectExpressionNot SelectExpressionNot
  | MkSelectExpressionAnd SelectExpressionAnd
  | MkSelectExpressionOr SelectExpressionOr
  | MkSelectExpressionParen SelectExpressionParen
  | MkSelectExpressionWith SelectExpressionWith
  | MkCrossIdentifier CrossIdentifier
  | MkSelectExpressionCrossSet SelectExpressionCrossSet
  deriving (Eq, Show)

instance Lit SelectExpression where
  lit (MkSelectCondition x) = lit x
  lit (MkSelectExpressionNot x) = lit x
  lit (MkSelectExpressionAnd x) = lit x
  lit (MkSelectExpressionOr x) = lit x
  lit (MkSelectExpressionParen x) = lit x
  lit (MkSelectExpressionWith x) = lit x
  lit (MkCrossIdentifier x) = lit x
  lit (MkSelectExpressionCrossSet x) = lit x

data SelectExpressionNot
  = SelectExpressionNot
      Symbol
      SelectCondition
  deriving (Eq, Show)

instance Lit SelectExpressionNot where
  lit (SelectExpressionNot a b) = lit a `T.append` lit b

data SelectExpressionAnd
  = SelectExpressionAnd
      SelectExpression
      Symbol
      SelectExpression
  deriving (Eq, Show)

instance Lit SelectExpressionAnd where
  lit (SelectExpressionAnd a b c) = T.concat [lit a, lit b, lit c]

data SelectExpressionOr
  = SelectExpressionOr
      SelectExpression
      Symbol
      SelectExpression
  deriving (Eq, Show)

instance Lit SelectExpressionOr where
  lit (SelectExpressionOr a b c) = T.concat [lit a, lit b, lit c]

newtype SelectExpressionParen = SelectExpressionParen (Paren SelectExpression) deriving (Eq, Show)

instance Lit SelectExpressionParen where
  lit (SelectExpressionParen x) = lit x

data SelectExpressionWith
  = SelectExpressionWith
      SelectExpression
      Keyword
      (Paren WithCovergroupExpression)
      (Maybe (Keyword, IntegerCovergroupExpression))
  deriving (Eq, Show)

instance Lit SelectExpressionWith where
  lit (SelectExpressionWith a b c d) = T.concat [lit a, lit b, lit c, lit d]

data SelectExpressionCrossSet
  = SelectExpressionCrossSet
      CrossSetExpression
      (Maybe (Keyword, IntegerCovergroupExpression))
  deriving (Eq, Show)

instance Lit SelectExpressionCrossSet where
  lit (SelectExpressionCrossSet a b) = lit a `T.append` lit b

data SelectCondition
  = SelectCondition
      Keyword
      (Paren BinsExpression)
      (Maybe (Keyword, Brace CovergroupRangeList))
  deriving (Eq, Show)

instance Lit SelectCondition where
  lit (SelectCondition a b c) = T.concat [lit a, lit b, lit c]

data BinsExpression
  = MkBinsExpressionVariableIdentifier VariableIdentifier
  | MkBinsExpressionCoverPoint BinsExpressionCoverPoint
  deriving (Eq, Show)

instance Lit BinsExpression where
  lit (MkBinsExpressionVariableIdentifier x) = lit x
  lit (MkBinsExpressionCoverPoint x) = lit x

data BinsExpressionCoverPoint
  = BinsExpressionCoverPoint
      CoverPointIdentifier
      (Maybe (Symbol, BinIdentifier))
  deriving (Eq, Show)

instance Lit BinsExpressionCoverPoint where
  lit (BinsExpressionCoverPoint a b) = lit a `T.append` lit b

newtype CovergroupRangeList = CovergroupRangeList (Splits Symbol CovergroupValueRange) deriving (Eq, Show)

instance Lit CovergroupRangeList where
  lit (CovergroupRangeList x) = lit x

data CovergroupValueRange
  = MkCovergroupValueRangeCovergroupExpression CovergroupExpression
  | MkCovergroupValueRangeBinary CovergroupValueRangeBinary
  deriving (Eq, Show)

instance Lit CovergroupValueRange where
  lit (MkCovergroupValueRangeCovergroupExpression x) = lit x
  lit (MkCovergroupValueRangeBinary x) = lit x

newtype CovergroupValueRangeBinary
  = CovergroupValueRangeBinary (Bracket (CovergroupExpression, Symbol, CovergroupExpression))
  deriving (Eq, Show)

instance Lit CovergroupValueRangeBinary where
  lit (CovergroupValueRangeBinary x) = lit x

newtype WithCovergroupExpression = WithCovergroupExpression CovergroupExpression deriving (Eq, Show)

instance Lit WithCovergroupExpression where
  lit (WithCovergroupExpression x) = lit x

newtype SetCovergroupExpression = SetCovergroupExpression CovergroupExpression deriving (Eq, Show)

instance Lit SetCovergroupExpression where
  lit (SetCovergroupExpression x) = lit x

newtype IntegerCovergroupExpression = IntegerCovergroupExpression CovergroupExpression deriving (Eq, Show)

instance Lit IntegerCovergroupExpression where
  lit (IntegerCovergroupExpression x) = lit x

newtype CrossSetExpression = CrossSetExpression CovergroupExpression deriving (Eq, Show)

instance Lit CrossSetExpression where
  lit (CrossSetExpression x) = lit x

newtype CovergroupExpression = CovergroupExpression Expression deriving (Eq, Show)

instance Lit CovergroupExpression where
  lit (CovergroupExpression x) = lit x
