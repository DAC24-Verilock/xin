module SystemVerilog.AST.BehavioralStatements.ContinuousAssignmentAndNetAliasStatements where
    
import Util.Lit (Lit)

data ContinuousAssign

instance Eq ContinuousAssign

instance Show ContinuousAssign

instance Lit ContinuousAssign

data ContinuousAssignNet

instance Eq ContinuousAssignNet

instance Show ContinuousAssignNet

instance Lit ContinuousAssignNet

data ContinuousAssignVariable

instance Eq ContinuousAssignVariable

instance Show ContinuousAssignVariable

instance Lit ContinuousAssignVariable

data ListOfNetAssignments

instance Eq ListOfNetAssignments

instance Show ListOfNetAssignments

instance Lit ListOfNetAssignments

data ListOfVariableAssignments

instance Eq ListOfVariableAssignments

instance Show ListOfVariableAssignments

instance Lit ListOfVariableAssignments

data NetAlias

instance Eq NetAlias

instance Show NetAlias

instance Lit NetAlias

data NetAssignment

instance Eq NetAssignment

instance Show NetAssignment

instance Lit NetAssignment