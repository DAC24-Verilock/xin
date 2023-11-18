module SystemVerilog.AST.SourceText.InterfaceItems where
    
import Util.Lit (Lit)

data InterfaceOrGenerateItem

instance Eq InterfaceOrGenerateItem

instance Show InterfaceOrGenerateItem

instance Lit InterfaceOrGenerateItem

data InterfaceOrGenerateItemModule

instance Eq InterfaceOrGenerateItemModule

instance Show InterfaceOrGenerateItemModule

instance Lit InterfaceOrGenerateItemModule

data InterfaceOrGenerateItemExtern

instance Eq InterfaceOrGenerateItemExtern

instance Show InterfaceOrGenerateItemExtern

instance Lit InterfaceOrGenerateItemExtern

data ExternTfDeclaration

instance Eq ExternTfDeclaration

instance Show ExternTfDeclaration

instance Lit ExternTfDeclaration

data ExternTfDeclarationMethod

instance Eq ExternTfDeclarationMethod

instance Show ExternTfDeclarationMethod

instance Lit ExternTfDeclarationMethod

data ExternTfDeclarationTask

instance Eq ExternTfDeclarationTask

instance Show ExternTfDeclarationTask

instance Lit ExternTfDeclarationTask

data InterfaceItem

instance Eq InterfaceItem

instance Show InterfaceItem

instance Lit InterfaceItem

data NonPortInterfaceItem

instance Eq NonPortInterfaceItem

instance Show NonPortInterfaceItem

instance Lit NonPortInterfaceItem
