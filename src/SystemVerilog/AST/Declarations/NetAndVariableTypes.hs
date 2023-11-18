{-# HLINT ignore "Use newtype instead of data" #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.Declarations.NetAndVariableTypes where

import qualified Data.Text as T
import SystemVerilog.AST.Declarations.DeclarationLists (ListOfVariableDeclAssignments)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.DeclarationRanges (PackedDimension)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression, Expression)
import SystemVerilog.AST.Expressions.Numbers (IntegralNumber)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (ConstantPrimary)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (ClassIdentifier, EnumIdentifier, InterfaceIdentifier, ModportIdentifier, NetTypeIdentifier, PackageScopeOrClassScope, PsClassIdentifier, PsCovergroupIdentifier, PsParameterIdentifier, PsTypeIdentifier, TypeIdentifier)
import SystemVerilog.AST.Instantiations.ModuleInstantiation (ParameterValueAssignment)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.ClassItems (RandomQualifier)
import SystemVerilog.AST.SpecialNodes (Brace, Bracket, Keyword, Paren, Splits, Symbol)
import Util.Lit (Lit(..))

data CastingType
  = SimpleType SimpleType
  | ConstantPrimary ConstantPrimary
  | Signing Signing
  | String Keyword
  | Const Keyword
  deriving (Eq, Show)

instance Lit CastingType where
  lit (SimpleType x) = lit x
  lit (ConstantPrimary x) = lit x
  lit (Signing x) = lit x
  lit (String x) = lit x
  lit (Const x) = lit x

data DataType
  = MkDataTypeVector DataTypeVector
  | MkDataTypeAtom DataTypeAtom
  | MkNonIntegerType NonIntegerType
  | MkDataTypeStructUnion DataTypeStructUnion
  | MkDataTypeEnum DataTypeEnum
  | StringDataType Keyword
  | ChandleDataType Keyword
  | MkDataTypeVirtual DataTypeVirtual
  | MkDataTypeType DataTypeType
  | MkClassType ClassType
  | Event Keyword
  | MkPsCovergroupIdentifier PsCovergroupIdentifier
  | MkTypeReference TypeReference
  deriving (Eq, Show)
  
instance Lit DataType where
  lit (MkDataTypeVector x) = lit x
  lit (MkDataTypeAtom x) = lit x
  lit (MkNonIntegerType x) = lit x
  lit (MkDataTypeStructUnion x) = lit x
  lit (MkDataTypeEnum x) = lit x
  lit (StringDataType x) = lit x
  lit (ChandleDataType x) = lit x
  lit (MkDataTypeVirtual x) = lit x
  lit (MkDataTypeType x) = lit x
  lit (MkClassType x) = lit x
  lit (Event x) = lit x
  lit (MkPsCovergroupIdentifier x) = lit x
  lit (MkTypeReference x) = lit x

data DataTypeVector
  = DataTypeVector
      IntegerVectorType
      (Maybe Signing)
      [PackedDimension]
  deriving (Eq, Show)

instance Lit DataTypeVector where
  lit (DataTypeVector a b c) = T.concat [lit a, lit b, lit c]

data DataTypeAtom
  = DataTypeAtom
      IntegerAtomType
      (Maybe Signing)
  deriving (Eq, Show)

instance Lit DataTypeAtom where
  lit (DataTypeAtom a b) = lit a `T.append` lit b

data DataTypeStructUnion
  = DataTypeStructUnion
      StructUnion
      (Maybe (Packed, Maybe Signing))
      (Brace (StructUnionMember, [StructUnionMember]))
      [PackedDimension]
  deriving (Eq, Show)

instance Lit DataTypeStructUnion where
  lit (DataTypeStructUnion a b c d) = T.concat [lit a, lit b, lit c, lit d]

data Packed = Packed Keyword deriving (Eq, Show)

instance Lit Packed where
  lit (Packed x) = lit x

data DataTypeEnum
  = DataTypeEnum
      Keyword
      (Maybe EnumBaseType)
      (Brace (Splits Symbol EnumNameDeclaration))
      [PackedDimension]
  deriving (Eq, Show)

instance Lit DataTypeEnum where
  lit (DataTypeEnum a b c d) = T.concat [lit a, lit b, lit c, lit d]

data DataTypeVirtual
  = DataTypeVirtual
      Keyword
      (Maybe Interface)
      InterfaceIdentifier
      (Maybe ParameterValueAssignment)
      (Maybe (Symbol, ModportIdentifier))
  deriving (Eq, Show)

instance Lit DataTypeVirtual where
  lit (DataTypeVirtual a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data Interface = Interface Keyword deriving (Eq, Show)

instance Lit Interface where
  lit (Interface x) = lit x

data DataTypeType
  = DataTypeType
      (Maybe PackageScopeOrClassScope)
      TypeIdentifier
      [PackedDimension]
  deriving (Eq, Show)

instance Lit DataTypeType where
  lit (DataTypeType a b c) = T.concat [lit a, lit b, lit c]

data DataTypeOrImplicit
  = MkDataType DataType
  | MkImplicitDataType ImplicitDataType
  deriving (Eq, Show)

instance Lit DataTypeOrImplicit where
  lit (MkDataType x) = lit x
  lit (MkImplicitDataType x) = lit x

data ImplicitDataType
  = ImplicitDataType
      (Maybe Signing)
      [PackedDimension]
  deriving (Eq, Show)

instance Lit ImplicitDataType where
  lit (ImplicitDataType a b) = lit a `T.append` lit b

data EnumBaseType
  = MkEnumBaseTypeAtom EnumBaseTypeAtom
  | MkEnumBaseTypeVector EnumBaseTypeVector
  | MkEnumBaseTypeType EnumBaseTypeType
  deriving (Eq, Show)

instance Lit EnumBaseType where
  lit (MkEnumBaseTypeAtom x) = lit x
  lit (MkEnumBaseTypeVector x) = lit x
  lit (MkEnumBaseTypeType x) = lit x

data EnumBaseTypeAtom
  = EnumBaseTypeAtom
      IntegerAtomType
      (Maybe Signing)
  deriving (Eq, Show)

instance Lit EnumBaseTypeAtom where
  lit (EnumBaseTypeAtom a b) = lit a `T.append` lit b

data EnumBaseTypeVector
  = EnumBaseTypeVector
      IntegerVectorType
      (Maybe Signing)
      (Maybe PackedDimension)
  deriving (Eq, Show)

instance Lit EnumBaseTypeVector where
  lit (EnumBaseTypeVector a b c) = T.concat [lit a, lit b, lit c]

data EnumBaseTypeType
  = EnumBaseTypeType
      TypeIdentifier
      (Maybe PackedDimension)
  deriving (Eq, Show)

instance Lit EnumBaseTypeType where
  lit (EnumBaseTypeType a b) = lit a `T.append` lit b

data EnumNameDeclaration
  = EnumNameDeclaration
      EnumIdentifier
      (Maybe (Bracket (IntegralNumber, Maybe (Symbol, IntegralNumber))))
      (Maybe (Symbol, ConstantExpression))
  deriving (Eq, Show)

instance Lit EnumNameDeclaration where
  lit (EnumNameDeclaration a b c) = T.concat [lit a, lit b, lit c]

data ClassScope
  = ClassScope
      ClassType
      Symbol
  deriving (Eq, Show)

instance Lit ClassScope where
  lit (ClassScope a b) = lit a `T.append` lit b

data ClassType
  = ClassType
      PsClassIdentifier
      (Maybe ParameterValueAssignment)
      [(Symbol, ClassIdentifier, Maybe ParameterValueAssignment)]
  deriving (Eq, Show)

instance Lit ClassType where
  lit (ClassType a b c) = T.concat [lit a, lit b, lit c]

data IntegerType
  = MkIntegerVectorType IntegerVectorType
  | MkIntegerAtomType IntegerAtomType
  deriving (Eq, Show)

instance Lit IntegerType where
  lit (MkIntegerVectorType x) = lit x
  lit (MkIntegerAtomType x) = lit x

data IntegerAtomType
  = Byte Keyword
  | Shortint Keyword
  | Int Keyword
  | Longint Keyword
  | Integer Keyword
  | Time Keyword
  deriving (Eq, Show)

instance Lit IntegerAtomType where
  lit (Byte x) = lit x
  lit (Shortint x) = lit x
  lit (Int x) = lit x
  lit (Longint x) = lit x
  lit (Integer x) = lit x
  lit (Time x) = lit x

data IntegerVectorType
  = Bit Keyword
  | Logic Keyword
  | Reg Keyword
  deriving (Eq, Show)

instance Lit IntegerVectorType where
  lit (Bit x) = lit x
  lit (Logic x) = lit x
  lit (Reg x) = lit x

data NonIntegerType
  = Shortreal Keyword
  | Real Keyword
  | Realtime Keyword
  deriving (Eq, Show)

instance Lit NonIntegerType where
  lit (Shortreal x) = lit x
  lit (Real x) = lit x
  lit (Realtime x) = lit x

data NetType
  = Supply0 Keyword
  | Supply1 Keyword
  | Tri Keyword
  | Triand Keyword
  | Trior Keyword
  | Trireg Keyword
  | Tri0 Keyword
  | Tri1 Keyword
  | Uwire Keyword
  | Wire Keyword
  | Wand Keyword
  | Wor Keyword
  deriving (Eq, Show)

instance Lit NetType where
  lit (Supply0 x) = lit x
  lit (Supply1 x) = lit x
  lit (Tri x) = lit x
  lit (Triand x) = lit x
  lit (Trior x) = lit x
  lit (Trireg x) = lit x
  lit (Tri0 x) = lit x
  lit (Tri1 x) = lit x
  lit (Uwire x) = lit x
  lit (Wire x) = lit x
  lit (Wand x) = lit x
  lit (Wor x) = lit x

data NetPortType
  = MkNetPortTypeDataType NetPortTypeDataType
  | MkNetTypeIdentifier NetTypeIdentifier
  | MkNetPortTypeInterconnect NetPortTypeInterconnect
  deriving (Eq, Show)

instance Lit NetPortType where
  lit (MkNetPortTypeDataType x) = lit x
  lit (MkNetTypeIdentifier x) = lit x
  lit (MkNetPortTypeInterconnect x) = lit x

data NetPortTypeDataType
  = NetPortTypeDataType
      (Maybe NetType)
      DataTypeOrImplicit
  deriving (Eq, Show)

instance Lit NetPortTypeDataType where
  lit (NetPortTypeDataType a b) = lit a `T.append` lit b

data NetPortTypeInterconnect
  = NetPortTypeInterconnect
      Keyword
      ImplicitDataType
  deriving (Eq, Show)

instance Lit NetPortTypeInterconnect where
  lit (NetPortTypeInterconnect a b) = lit a `T.append` lit b

data VariablePortType = VariablePortType VarDataType deriving (Eq, Show)

instance Lit VariablePortType where
  lit (VariablePortType x) = lit x

data VarDataType
  = MkLiteralDataType DataType
  | MkVarDataTypeVar VarDataTypeVar
  deriving (Eq, Show)

instance Lit VarDataType where
  lit (MkLiteralDataType x) = lit x
  lit (MkVarDataTypeVar x) = lit x

data VarDataTypeVar
  = VarDataTypeVar
      Keyword
      DataTypeOrImplicit
  deriving (Eq, Show)

instance Lit VarDataTypeVar where
  lit (VarDataTypeVar a b) = lit a `T.append` lit b

data Signing
  = Signed Keyword
  | Unsigned Keyword
  deriving (Eq, Show)

instance Lit Signing where
  lit (Signed x) = lit x
  lit (Unsigned x) = lit x

data SimpleType
  = MkIntegerType IntegerType
  | MkSimpleNonIntegerType NonIntegerType
  | MkPsTypeIdentifier PsTypeIdentifier
  | MkPsParameterIdentifier PsParameterIdentifier
  deriving (Eq, Show)

instance Lit SimpleType where
  lit (MkIntegerType x) = lit x
  lit (MkSimpleNonIntegerType x) = lit x
  lit (MkPsTypeIdentifier x) = lit x
  lit (MkPsParameterIdentifier x) = lit x

data StructUnionMember
  = StructUnionMember
      [AttributeInstance]
      (Maybe RandomQualifier)
      DataTypeOrVoid
      ListOfVariableDeclAssignments
      Symbol
  deriving (Eq, Show)

instance Lit StructUnionMember where
  lit (StructUnionMember a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data DataTypeOrVoid
  = DataType DataType
  | Void Keyword
  deriving (Eq, Show)

instance Lit DataTypeOrVoid where
  lit (DataType x) = lit x
  lit (Void x) = lit x

data StructUnion
  = Struct Keyword
  | Union Keyword
  | UnionTagged Keyword Keyword
  deriving (Eq, Show)

instance Lit StructUnion where
  lit (Struct x) = lit x
  lit (Union x) = lit x
  lit (UnionTagged a b) = lit a `T.append` lit b

data TypeReference
  = MkTypeReferenceExpression TypeReferenceExpression
  | MkTypeReferenceDataType TypeReferenceDataType
  deriving (Eq, Show)

instance Lit TypeReference where
  lit (MkTypeReferenceExpression x) = lit x
  lit (MkTypeReferenceDataType x) = lit x

data TypeReferenceExpression
  = TypeReferenceExpression
      Keyword
      (Paren Expression)
  deriving (Eq, Show)

instance Lit TypeReferenceExpression where
  lit (TypeReferenceExpression a b) = lit a `T.append` lit b

data TypeReferenceDataType
  = TypeReferenceDataType
      Keyword
      (Paren DataType)
  deriving (Eq, Show)

instance Lit TypeReferenceDataType where
  lit (TypeReferenceDataType a b) = lit a `T.append` lit b