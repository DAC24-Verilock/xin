module SystemVerilog.AST.BehavioralStatements.LoopingStatements where

import Util.Lit (Lit)

data LoopStatement

instance Eq LoopStatement

instance Show LoopStatement

instance Lit LoopStatement

data LoopStatementForever

instance Eq LoopStatementForever

instance Show LoopStatementForever

instance Lit LoopStatementForever

data LoopStatementRepeat

instance Eq LoopStatementRepeat

instance Show LoopStatementRepeat

instance Lit LoopStatementRepeat

data LoopStatementWhile

instance Eq LoopStatementWhile

instance Show LoopStatementWhile

instance Lit LoopStatementWhile

data LoopStatementFor

instance Eq LoopStatementFor

instance Show LoopStatementFor

instance Lit LoopStatementFor

data LoopStatementDoWhile

instance Eq LoopStatementDoWhile

instance Show LoopStatementDoWhile

instance Lit LoopStatementDoWhile

data LoopStatementForeach

instance Eq LoopStatementForeach

instance Show LoopStatementForeach

instance Lit LoopStatementForeach

data ForInitialization

instance Eq ForInitialization

instance Show ForInitialization

instance Lit ForInitialization

data ForInitializationDeclaration

instance Eq ForInitializationDeclaration

instance Show ForInitializationDeclaration

instance Lit ForInitializationDeclaration

data ForVariableDeclaration

instance Eq ForVariableDeclaration

instance Show ForVariableDeclaration

instance Lit ForVariableDeclaration

data Var

instance Eq Var

instance Show Var

instance Lit Var

data ForStep

instance Eq ForStep

instance Show ForStep

instance Lit ForStep

data ForStepAssignment

instance Eq ForStepAssignment

instance Show ForStepAssignment

instance Lit ForStepAssignment

data LoopVariables

instance Eq LoopVariables

instance Show LoopVariables

instance Lit LoopVariables
