module SystemVerilog.AST.Declarations.TaskDeclarations where
    
import Util.Lit (Lit)

data TaskDeclaration

instance Eq TaskDeclaration

instance Show TaskDeclaration

instance Lit TaskDeclaration

data TaskBodyDeclaration

instance Eq TaskBodyDeclaration

instance Show TaskBodyDeclaration

instance Lit TaskBodyDeclaration

data TaskBodyDeclarationWithoutPort

instance Eq TaskBodyDeclarationWithoutPort

instance Show TaskBodyDeclarationWithoutPort

instance Lit TaskBodyDeclarationWithoutPort

data TaskBodyDeclarationWithPort

instance Eq TaskBodyDeclarationWithPort

instance Show TaskBodyDeclarationWithPort

instance Lit TaskBodyDeclarationWithPort

data TfItemDeclaration

instance Eq TfItemDeclaration

instance Show TfItemDeclaration

instance Lit TfItemDeclaration

data TfPortList

instance Eq TfPortList

instance Show TfPortList

instance Lit TfPortList

data TfPortItem

instance Eq TfPortItem

instance Show TfPortItem

instance Lit TfPortItem

data TfPortDirection

instance Eq TfPortDirection

instance Show TfPortDirection

instance Lit TfPortDirection

data TfPortDeclaration

instance Eq TfPortDeclaration

instance Show TfPortDeclaration

instance Lit TfPortDeclaration

data TaskPrototype

instance Eq TaskPrototype

instance Show TaskPrototype

instance Lit TaskPrototype