module SystemVerilog.AST.Expressions.ExpressionLeftsideValues where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Patterns
  ( AssignmentPatternExpressionType,
    AssignmentPatternNetLvalue,
    AssignmentPatternVariableLvalue,
  )
import SystemVerilog.AST.Expressions.Concatenations (StreamingConcatenation)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries
  ( ConstantSelect,
    NonrangeSelect,
    Select,
  )
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers
  ( HierarchicalVariableIdentifier,
    ImplicitClassHandleOrPackageScope,
    PsOrHierarchicalNetIdentifier,
  )
import SystemVerilog.AST.SpecialNodes (Brace, Splits, Symbol)
import Util.Lit (Lit(..))
import qualified Data.Text as T

data NetLvalue
  = MkNetLvalueIdentifier NetLvalueIdentifier
  | MkNetLvalueLvalue NetLvalueLvalue
  | MkNetLvaluePattern NetLvaluePattern
  deriving (Eq, Show)

instance Lit NetLvalue where
  lit (MkNetLvalueIdentifier x) = lit x
  lit (MkNetLvalueLvalue x) = lit x
  lit (MkNetLvaluePattern x) = lit x

data NetLvalueIdentifier
  = NetLvalueIdentifier
      PsOrHierarchicalNetIdentifier
      ConstantSelect
  deriving (Eq, Show)

instance Lit NetLvalueIdentifier where
  lit (NetLvalueIdentifier a b) = lit a `T.append` lit b

newtype NetLvalueLvalue = NetLvalueLvalue (Brace (Splits Symbol NetLvalue)) deriving (Eq, Show)

instance Lit NetLvalueLvalue where
  lit (NetLvalueLvalue x) = lit x

data NetLvaluePattern
  = NetLvaluePattern
      (Maybe AssignmentPatternExpressionType)
      AssignmentPatternNetLvalue
  deriving (Eq, Show)

instance Lit NetLvaluePattern where
  lit (NetLvaluePattern a b) = lit a `T.append` lit b

data VariableLvalue
  = MkVariableLvalueIdentifier VariableLvalueIdentifier
  | MkVariableLvalueLvalue VariableLvalueLvalue
  | MkVariableLvaluePattern VariableLvaluePattern
  | MkStreamingConcatenation StreamingConcatenation
  deriving (Eq, Show)

instance Lit VariableLvalue where
  lit (MkVariableLvalueIdentifier x) = lit x
  lit (MkVariableLvalueLvalue x) = lit x
  lit (MkVariableLvaluePattern x) = lit x
  lit (MkStreamingConcatenation x) = lit x

data VariableLvalueIdentifier
  = VariableLvalueIdentifier
      (Maybe ImplicitClassHandleOrPackageScope)
      HierarchicalVariableIdentifier
      Select
  deriving (Eq, Show)

instance Lit VariableLvalueIdentifier where
  lit (VariableLvalueIdentifier a b c) = T.concat [lit a, lit b, lit c]

newtype VariableLvalueLvalue
  = VariableLvalueLvalue (Brace (Splits Symbol VariableLvalue))
  deriving (Eq, Show)

instance Lit VariableLvalueLvalue where
  lit (VariableLvalueLvalue x) = lit x

data VariableLvaluePattern
  = VariableLvaluePattern
      (Maybe AssignmentPatternExpressionType)
      AssignmentPatternVariableLvalue
  deriving (Eq, Show)

instance Lit VariableLvaluePattern where
  lit (VariableLvaluePattern a b) = lit a `T.append` lit b

data NonrangeVariableLvalue
  = NonrangeVariableLvalue
      (Maybe ImplicitClassHandleOrPackageScope)
      HierarchicalVariableIdentifier
      NonrangeSelect
  deriving (Eq, Show)

instance Lit NonrangeVariableLvalue where
  lit (NonrangeVariableLvalue a b c) = T.concat [lit a, lit b, lit c]