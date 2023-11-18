module SystemVerilog.AST.SourceText.ClassItems where
    
import Util.Lit (Lit)

data ClassItem

instance Eq ClassItem

instance Show ClassItem

instance Lit ClassItem

data ClassItemProperty

instance Eq ClassItemProperty

instance Show ClassItemProperty

instance Lit ClassItemProperty

data ClassItemMethod

instance Eq ClassItemMethod

instance Show ClassItemMethod

instance Lit ClassItemMethod

data ClassItemConstraint

instance Eq ClassItemConstraint

instance Show ClassItemConstraint

instance Lit ClassItemConstraint

data ClassItemDeclaration

instance Eq ClassItemDeclaration

instance Show ClassItemDeclaration

instance Lit ClassItemDeclaration

data ClassItemCovergroup

instance Eq ClassItemCovergroup

instance Show ClassItemCovergroup

instance Lit ClassItemCovergroup

data ClassProperty

instance Eq ClassProperty

instance Show ClassProperty

instance Lit ClassProperty

data ClassPropertyNonConst

instance Eq ClassPropertyNonConst

instance Show ClassPropertyNonConst

instance Lit ClassPropertyNonConst

data ClassPropertyConst

instance Eq ClassPropertyConst

instance Show ClassPropertyConst

instance Lit ClassPropertyConst

data ClassPropertyConstExpression

instance Eq ClassPropertyConstExpression

instance Show ClassPropertyConstExpression

instance Lit ClassPropertyConstExpression

data ClassMethod

instance Eq ClassMethod

instance Show ClassMethod

instance Lit ClassMethod

data ClassMethodTask

instance Eq ClassMethodTask

instance Show ClassMethodTask

instance Lit ClassMethodTask

data ClassMethodFunction

instance Eq ClassMethodFunction

instance Show ClassMethodFunction

instance Lit ClassMethodFunction

data ClassMethodPureVirtual

instance Eq ClassMethodPureVirtual

instance Show ClassMethodPureVirtual

instance Lit ClassMethodPureVirtual

data ClassMethodExternMethod

instance Eq ClassMethodExternMethod

instance Show ClassMethodExternMethod

instance Lit ClassMethodExternMethod

data ClassMethodConstructor

instance Eq ClassMethodConstructor

instance Show ClassMethodConstructor

instance Lit ClassMethodConstructor

data ClassMethodExternConstructor

instance Eq ClassMethodExternConstructor

instance Show ClassMethodExternConstructor

instance Lit ClassMethodExternConstructor

data ClassConstructorPrototype

instance Eq ClassConstructorPrototype

instance Show ClassConstructorPrototype

instance Lit ClassConstructorPrototype

data ClassConstraint

instance Eq ClassConstraint

instance Show ClassConstraint

instance Lit ClassConstraint

data ClassItemQualifier

instance Eq ClassItemQualifier

instance Show ClassItemQualifier

instance Lit ClassItemQualifier

data PropertyQualifier

instance Eq PropertyQualifier

instance Show PropertyQualifier

instance Lit PropertyQualifier

data RandomQualifier

instance Eq RandomQualifier

instance Show RandomQualifier

instance Lit RandomQualifier

data MethodQualifier

instance Eq MethodQualifier

instance Show MethodQualifier

instance Lit MethodQualifier

data MethodPrototype

instance Eq MethodPrototype

instance Show MethodPrototype

instance Lit MethodPrototype

data ClassConstructorDeclaration

instance Eq ClassConstructorDeclaration

instance Show ClassConstructorDeclaration

instance Lit ClassConstructorDeclaration

data New

instance Eq New

instance Show New

instance Lit New
