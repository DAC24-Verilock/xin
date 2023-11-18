module SystemVerilog.AST.SpecifySection.SpecifyPathDeclarations where
    
import Util.Lit (Lit)

data PathDeclaration

instance Eq PathDeclaration

instance Show PathDeclaration

instance Lit PathDeclaration

data SimplePathDeclaration

instance Eq SimplePathDeclaration

instance Show SimplePathDeclaration

instance Lit SimplePathDeclaration

data SimplePathDeclarationParallel

instance Eq SimplePathDeclarationParallel

instance Show SimplePathDeclarationParallel

instance Lit SimplePathDeclarationParallel

data SimplePathDeclarationFull

instance Eq SimplePathDeclarationFull

instance Show SimplePathDeclarationFull

instance Lit SimplePathDeclarationFull

data ParallelPathDescription

instance Eq ParallelPathDescription

instance Show ParallelPathDescription

instance Lit ParallelPathDescription

data FullPathDescription

instance Eq FullPathDescription

instance Show FullPathDescription

instance Lit FullPathDescription

data ListOfPathInputs

instance Eq ListOfPathInputs

instance Show ListOfPathInputs

instance Lit ListOfPathInputs

data ListOfPathOutputs

instance Eq ListOfPathOutputs

instance Show ListOfPathOutputs

instance Lit ListOfPathOutputs
