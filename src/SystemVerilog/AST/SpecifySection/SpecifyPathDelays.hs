module SystemVerilog.AST.SpecifySection.SpecifyPathDelays where

import qualified Data.Text as T
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantMintypmaxExpression, Expression, ModulePathExpression)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol)
import SystemVerilog.AST.SpecifySection.SpecifyBlockTerminals (SpecifyInputTerminalDescriptor, SpecifyOutputTerminalDescriptor)
import {-# SOURCE #-} SystemVerilog.AST.SpecifySection.SpecifyPathDeclarations (ListOfPathInputs, ListOfPathOutputs, SimplePathDeclaration)
import Util.Lit (Lit(..))

data PathDelayValue
  = MkListOfPathDelayExpressions ListOfPathDelayExpressions
  | MkPathDelayValueParen PathDelayValueParen
  deriving (Eq, Show)

instance Lit PathDelayValue where
  lit (MkListOfPathDelayExpressions x) = lit x
  lit (MkPathDelayValueParen x) = lit x

newtype PathDelayValueParen
  = PathDelayValueParen
      (Paren ListOfPathDelayExpressions)
  deriving (Eq, Show)

instance Lit PathDelayValueParen where
  lit (PathDelayValueParen x) = lit x

newtype ListOfPathDelayExpressions
  = ListOfPathDelayExpressions
      (Splits Symbol TPathDelayExpression)
  deriving (Eq, Show)

instance Lit ListOfPathDelayExpressions where
  lit (ListOfPathDelayExpressions x) = lit x

newtype TPathDelayExpression
  = TPathDelayExpression
      PathDelayExpression
  deriving (Eq, Show)

instance Lit TPathDelayExpression where
  lit (TPathDelayExpression x) = lit x

newtype PathDelayExpression
  = PathDelayExpression
      ConstantMintypmaxExpression
  deriving (Eq, Show)

instance Lit PathDelayExpression where
  lit (PathDelayExpression x) = lit x

data EdgeSensitivePathDeclaration
  = MkEdgeSensitivePathDeclarationParallel EdgeSensitivePathDeclarationParallel
  | MkEdgeSensitivePathDeclarationFull EdgeSensitivePathDeclarationFull
  deriving (Eq, Show)

instance Lit EdgeSensitivePathDeclaration where
  lit (MkEdgeSensitivePathDeclarationParallel x) = lit x
  lit (MkEdgeSensitivePathDeclarationFull x) = lit x

data EdgeSensitivePathDeclarationParallel
  = EdgeSensitivePathDeclarationParallel
      ParallelEdgeSensitivePathDescription
      Symbol
      PathDelayValue
  deriving (Eq, Show)

instance Lit EdgeSensitivePathDeclarationParallel where
  lit (EdgeSensitivePathDeclarationParallel a b c) = T.concat [lit a, lit b, lit c]

data EdgeSensitivePathDeclarationFull
  = EdgeSensitivePathDeclarationFull
      FullEdgeSensitivePathDescription
      Symbol
      PathDelayValue
  deriving (Eq, Show)

instance Lit EdgeSensitivePathDeclarationFull where
  lit (EdgeSensitivePathDeclarationFull a b c) = T.concat [lit a, lit b, lit c]

newtype ParallelEdgeSensitivePathDescription
  = ParallelEdgeSensitivePathDescription
      ( Paren
          ( Maybe EdgeIdentifier,
            SpecifyInputTerminalDescriptor,
            Maybe PolarityOperator,
            Symbol,
            Paren (SpecifyOutputTerminalDescriptor, Maybe PolarityOperator, Symbol, DataSourceExpression)
          )
      )
  deriving (Eq, Show)

instance Lit ParallelEdgeSensitivePathDescription where
  lit (ParallelEdgeSensitivePathDescription x) = lit x

newtype FullEdgeSensitivePathDescription
  = FullEdgeSensitivePathDescription
      ( Paren
          ( Maybe EdgeIdentifier,
            ListOfPathInputs,
            Maybe PolarityOperator,
            Symbol,
            Paren (ListOfPathOutputs, Maybe PolarityOperator, Symbol, DataSourceExpression)
          )
      )
  deriving (Eq, Show)

instance Lit FullEdgeSensitivePathDescription where
  lit (FullEdgeSensitivePathDescription x) = lit x

newtype DataSourceExpression
  = DataSourceExpression
      Expression
  deriving (Eq, Show)

instance Lit DataSourceExpression where
  lit (DataSourceExpression x) = lit x

data EdgeIdentifier
  = Posedge Keyword
  | Negedge Keyword
  | Edge Keyword
  deriving (Eq, Show)

instance Lit EdgeIdentifier where
  lit (Posedge x) = lit x
  lit (Negedge x) = lit x
  lit (Edge x) = lit x

data StateDependentPathDeclaration
  = MkStateDependentPathDeclarationIfSimple StateDependentPathDeclarationIfSimple
  | MkStateDependentPathDeclarationIfEdgeSensitive StateDependentPathDeclarationIfEdgeSensitive
  | MkStateDependentPathDeclarationIfNone StateDependentPathDeclarationIfNone
  deriving (Eq, Show)

instance Lit StateDependentPathDeclaration where
  lit (MkStateDependentPathDeclarationIfSimple x) = lit x
  lit (MkStateDependentPathDeclarationIfEdgeSensitive x) = lit x
  lit (MkStateDependentPathDeclarationIfNone x) = lit x

data StateDependentPathDeclarationIfSimple
  = StateDependentPathDeclarationIfSimple
      Keyword
      (Paren ModulePathExpression)
      SimplePathDeclaration
  deriving (Eq, Show)

instance Lit StateDependentPathDeclarationIfSimple where
  lit (StateDependentPathDeclarationIfSimple a b c) = T.concat [lit a, lit b, lit c]

data StateDependentPathDeclarationIfEdgeSensitive
  = StateDependentPathDeclarationIfEdgeSensitive
      Keyword
      (Paren ModulePathExpression)
      EdgeSensitivePathDeclaration
  deriving (Eq, Show)

instance Lit StateDependentPathDeclarationIfEdgeSensitive where
  lit (StateDependentPathDeclarationIfEdgeSensitive a b c) = T.concat [lit a, lit b, lit c]

data StateDependentPathDeclarationIfNone
  = StateDependentPathDeclarationIfNone
      Keyword
      SimplePathDeclaration
  deriving (Eq, Show)

instance Lit StateDependentPathDeclarationIfNone where
  lit (StateDependentPathDeclarationIfNone a b) = lit a `T.append` lit b

newtype PolarityOperator
  = PolarityOperator
      Symbol
  deriving (Eq, Show)

instance Lit PolarityOperator where
  lit (PolarityOperator s) = lit s