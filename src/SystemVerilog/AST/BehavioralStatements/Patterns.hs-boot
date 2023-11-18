module SystemVerilog.AST.BehavioralStatements.Patterns where

import Util.Lit (Lit)

data Pattern 

instance Eq Pattern

instance Show Pattern

instance Lit Pattern

data PatternVariable

instance Eq PatternVariable

instance Show PatternVariable

instance Lit PatternVariable

data PatternTagged

instance Eq PatternTagged

instance Show PatternTagged

instance Lit PatternTagged

data PatternList

instance Eq PatternList

instance Show PatternList

instance Lit PatternList

data PatternIdentifierList

instance Eq PatternIdentifierList

instance Show PatternIdentifierList

instance Lit PatternIdentifierList

data AssignmentPattern

instance Eq AssignmentPattern

instance Show AssignmentPattern

instance Lit AssignmentPattern

data AssignmentPatternList

instance Eq AssignmentPatternList

instance Show AssignmentPatternList

instance Lit AssignmentPatternList

data AssignmentPatternStructure

instance Eq AssignmentPatternStructure

instance Show AssignmentPatternStructure

instance Lit AssignmentPatternStructure

data AssignmentPatternArray

instance Eq AssignmentPatternArray

instance Show AssignmentPatternArray

instance Lit AssignmentPatternArray

data AssignmentPatternRepeat

instance Eq AssignmentPatternRepeat

instance Show AssignmentPatternRepeat

instance Lit AssignmentPatternRepeat

data StructurePatternKey

instance Eq StructurePatternKey

instance Show StructurePatternKey

instance Lit StructurePatternKey

data ArrayPatternKey

instance Eq ArrayPatternKey

instance Show ArrayPatternKey

instance Lit ArrayPatternKey

data AssignmentPatternKey

instance Eq AssignmentPatternKey

instance Show AssignmentPatternKey

instance Lit AssignmentPatternKey

data AssignmentPatternExpression

instance Eq AssignmentPatternExpression

instance Show AssignmentPatternExpression

instance Lit AssignmentPatternExpression

data AssignmentPatternExpressionType

instance Eq AssignmentPatternExpressionType

instance Show AssignmentPatternExpressionType

instance Lit AssignmentPatternExpressionType

data ConstantAssignmentPatternExpression

instance Eq ConstantAssignmentPatternExpression

instance Show ConstantAssignmentPatternExpression

instance Lit ConstantAssignmentPatternExpression

data AssignmentPatternNetLvalue

instance Eq AssignmentPatternNetLvalue

instance Show AssignmentPatternNetLvalue

instance Lit AssignmentPatternNetLvalue

data AssignmentPatternVariableLvalue

instance Eq AssignmentPatternVariableLvalue

instance Show AssignmentPatternVariableLvalue

instance Lit AssignmentPatternVariableLvalue