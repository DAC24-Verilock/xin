module SystemVerilog.AST.Declarations.NetAndVariableTypes where
    
import Util.Lit (Lit)

data CastingType

instance Eq CastingType

instance Show CastingType

instance Lit CastingType

data DataType

instance Eq DataType

instance Show DataType

instance Lit DataType

data DataTypeVector

instance Eq DataTypeVector

instance Show DataTypeVector

instance Lit DataTypeVector

data DataTypeAtom

instance Eq DataTypeAtom

instance Show DataTypeAtom

instance Lit DataTypeAtom

data DataTypeStructUnion

instance Eq DataTypeStructUnion

instance Show DataTypeStructUnion

instance Lit DataTypeStructUnion

data Packed

instance Eq Packed

instance Show Packed

instance Lit Packed

data DataTypeEnum

instance Eq DataTypeEnum

instance Show DataTypeEnum

instance Lit DataTypeEnum

data DataTypeVirtual

instance Eq DataTypeVirtual

instance Show DataTypeVirtual

instance Lit DataTypeVirtual

data Interface

instance Eq Interface

instance Show Interface

instance Lit Interface

data DataTypeType

instance Eq DataTypeType

instance Show DataTypeType

instance Lit DataTypeType

data DataTypeOrImplicit

instance Eq DataTypeOrImplicit

instance Show DataTypeOrImplicit

instance Lit DataTypeOrImplicit

data ImplicitDataType

instance Eq ImplicitDataType

instance Show ImplicitDataType

instance Lit ImplicitDataType

data EnumBaseType

instance Eq EnumBaseType

instance Show EnumBaseType

instance Lit EnumBaseType

data EnumBaseTypeAtom

instance Eq EnumBaseTypeAtom

instance Show EnumBaseTypeAtom

instance Lit EnumBaseTypeAtom

data EnumBaseTypeVector

instance Eq EnumBaseTypeVector

instance Show EnumBaseTypeVector

instance Lit EnumBaseTypeVector

data EnumBaseTypeType

instance Eq EnumBaseTypeType

instance Show EnumBaseTypeType

instance Lit EnumBaseTypeType

data EnumNameDeclaration

instance Eq EnumNameDeclaration

instance Show EnumNameDeclaration

instance Lit EnumNameDeclaration

data ClassScope

instance Eq ClassScope

instance Show ClassScope

instance Lit ClassScope

data ClassType

instance Eq ClassType

instance Show ClassType

instance Lit ClassType

data IntegerType

instance Eq IntegerType

instance Show IntegerType

instance Lit IntegerType

data IntegerAtomType

instance Eq IntegerAtomType

instance Show IntegerAtomType

instance Lit IntegerAtomType

data IntegerVectorType

instance Eq IntegerVectorType

instance Show IntegerVectorType

instance Lit IntegerVectorType

data NonIntegerType

instance Eq NonIntegerType

instance Show NonIntegerType

instance Lit NonIntegerType

data NetType

instance Eq NetType

instance Show NetType

instance Lit NetType

data NetPortType

instance Eq NetPortType

instance Show NetPortType

instance Lit NetPortType

data NetPortTypeDataType

instance Eq NetPortTypeDataType

instance Show NetPortTypeDataType

instance Lit NetPortTypeDataType

data NetPortTypeInterconnect

instance Eq NetPortTypeInterconnect

instance Show NetPortTypeInterconnect

instance Lit NetPortTypeInterconnect

data VariablePortType

instance Eq VariablePortType

instance Show VariablePortType

instance Lit VariablePortType

data VarDataType

instance Eq VarDataType

instance Show VarDataType

instance Lit VarDataType

data VarDataTypeVar

instance Eq VarDataTypeVar

instance Show VarDataTypeVar

instance Lit VarDataTypeVar

data Signing

instance Eq Signing

instance Show Signing

instance Lit Signing

data SimpleType

instance Eq SimpleType

instance Show SimpleType

instance Lit SimpleType

data StructUnionMember

instance Eq StructUnionMember

instance Show StructUnionMember

instance Lit StructUnionMember

data DataTypeOrVoid

instance Eq DataTypeOrVoid

instance Show DataTypeOrVoid

instance Lit DataTypeOrVoid

data StructUnion

instance Eq StructUnion

instance Show StructUnion

instance Lit StructUnion

data TypeReference

instance Eq TypeReference

instance Show TypeReference

instance Lit TypeReference

data TypeReferenceExpression

instance Eq TypeReferenceExpression

instance Show TypeReferenceExpression

instance Lit TypeReferenceExpression

data TypeReferenceDataType

instance Eq TypeReferenceDataType

instance Show TypeReferenceDataType

instance Lit TypeReferenceDataType