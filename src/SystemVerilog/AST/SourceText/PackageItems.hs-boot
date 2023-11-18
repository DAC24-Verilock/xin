module SystemVerilog.AST.SourceText.PackageItems where
    
import Util.Lit (Lit)

data PackageItem

instance Eq PackageItem

instance Show PackageItem

instance Lit PackageItem

data PackageOrGenerateItemDeclaration

instance Eq PackageOrGenerateItemDeclaration

instance Show PackageOrGenerateItemDeclaration

instance Lit PackageOrGenerateItemDeclaration

data AnonymousProgram

instance Eq AnonymousProgram

instance Show AnonymousProgram

instance Lit AnonymousProgram

data AnonymousProgramItem

instance Eq AnonymousProgramItem

instance Show AnonymousProgramItem

instance Lit AnonymousProgramItem
