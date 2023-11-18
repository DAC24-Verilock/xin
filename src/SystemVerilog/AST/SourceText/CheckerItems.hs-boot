module SystemVerilog.AST.SourceText.CheckerItems where
    
import Util.Lit (Lit)

data CheckerPortList

instance Eq CheckerPortList

instance Show CheckerPortList

instance Lit CheckerPortList

data CheckerPortItem

instance Eq CheckerPortItem

instance Show CheckerPortItem

instance Lit CheckerPortItem

data CheckerPortDirection

instance Eq CheckerPortDirection

instance Show CheckerPortDirection

instance Lit CheckerPortDirection

data CheckerOrGenerateItem

instance Eq CheckerOrGenerateItem

instance Show CheckerOrGenerateItem

instance Lit CheckerOrGenerateItem

data CheckerOrGenerateItemDeclaration

instance Eq CheckerOrGenerateItemDeclaration

instance Show CheckerOrGenerateItemDeclaration

instance Lit CheckerOrGenerateItemDeclaration

data CheckerOrGenerateItemDeclarationData

instance Eq CheckerOrGenerateItemDeclarationData

instance Show CheckerOrGenerateItemDeclarationData

instance Lit CheckerOrGenerateItemDeclarationData

data Rand

instance Eq Rand

instance Show Rand

instance Lit Rand

data CheckerOrGenerateItemDeclarationClocking

instance Eq CheckerOrGenerateItemDeclarationClocking

instance Show CheckerOrGenerateItemDeclarationClocking

instance Lit CheckerOrGenerateItemDeclarationClocking

data CheckerOrGenerateItemDeclarationDisable

instance Eq CheckerOrGenerateItemDeclarationDisable

instance Show CheckerOrGenerateItemDeclarationDisable

instance Lit CheckerOrGenerateItemDeclarationDisable

data CheckerGenerateItem

instance Eq CheckerGenerateItem

instance Show CheckerGenerateItem

instance Lit CheckerGenerateItem
