module SystemVerilog.AST.Declarations.TypeDeclarations where

import Util.Lit (Lit)

data DataDeclaration

instance Eq DataDeclaration

instance Show DataDeclaration

instance Lit DataDeclaration

data DataDeclarationVariable

instance Eq DataDeclarationVariable

instance Show DataDeclarationVariable

instance Lit DataDeclarationVariable

data Const

instance Eq Const

instance Show Const

instance Lit Const

data PackageImportDeclaration

instance Eq PackageImportDeclaration

instance Show PackageImportDeclaration

instance Lit PackageImportDeclaration

data PackageImportItem

instance Eq PackageImportItem

instance Show PackageImportItem

instance Lit PackageImportItem

data PackageImportItemIdentifier

instance Eq PackageImportItemIdentifier

instance Show PackageImportItemIdentifier

instance Lit PackageImportItemIdentifier

data PackageImportItemAsterisk

instance Eq PackageImportItemAsterisk

instance Show PackageImportItemAsterisk

instance Lit PackageImportItemAsterisk

data PackageExportDeclaration

instance Eq PackageExportDeclaration

instance Show PackageExportDeclaration

instance Lit PackageExportDeclaration

data PackageExportDeclarationAsterisk

instance Eq PackageExportDeclarationAsterisk

instance Show PackageExportDeclarationAsterisk

instance Lit PackageExportDeclarationAsterisk

data PackageExportDeclarationItem

instance Eq PackageExportDeclarationItem

instance Show PackageExportDeclarationItem

instance Lit PackageExportDeclarationItem

data GenvarDeclaration

instance Eq GenvarDeclaration

instance Show GenvarDeclaration

instance Lit GenvarDeclaration

data NetDeclaration

instance Eq NetDeclaration

instance Show NetDeclaration

instance Lit NetDeclaration

data NetDeclarationNetType

instance Eq NetDeclarationNetType

instance Show NetDeclarationNetType

instance Lit NetDeclarationNetType

data Strength

instance Eq Strength

instance Show Strength

instance Lit Strength

data VectorScalar

instance Eq VectorScalar

instance Show VectorScalar

instance Lit VectorScalar

data NetDeclarationNetTypeIdentifier

instance Eq NetDeclarationNetTypeIdentifier

instance Show NetDeclarationNetTypeIdentifier

instance Lit NetDeclarationNetTypeIdentifier

data NetDeclarationInterconnect

instance Eq NetDeclarationInterconnect

instance Show NetDeclarationInterconnect

instance Lit NetDeclarationInterconnect

data TypeDeclaration

instance Eq TypeDeclaration

instance Show TypeDeclaration

instance Lit TypeDeclaration

data TypeDeclarationDataType

instance Eq TypeDeclarationDataType

instance Show TypeDeclarationDataType

instance Lit TypeDeclarationDataType

data TypeDeclarationInterface

instance Eq TypeDeclarationInterface

instance Show TypeDeclarationInterface

instance Lit TypeDeclarationInterface

data TypeDeclarationReserved

instance Eq TypeDeclarationReserved

instance Show TypeDeclarationReserved

instance Lit TypeDeclarationReserved

data TypeDeclarationKeyword

instance Eq TypeDeclarationKeyword

instance Show TypeDeclarationKeyword

instance Lit TypeDeclarationKeyword

data NetTypeDeclaration

instance Eq NetTypeDeclaration

instance Show NetTypeDeclaration

instance Lit NetTypeDeclaration

data NetTypeDeclarationDataType

instance Eq NetTypeDeclarationDataType

instance Show NetTypeDeclarationDataType

instance Lit NetTypeDeclarationDataType

data NetTypeDeclarationNetType

instance Eq NetTypeDeclarationNetType

instance Show NetTypeDeclarationNetType

instance Lit NetTypeDeclarationNetType

data Lifetime

instance Eq Lifetime

instance Show Lifetime
    
instance Lit Lifetime