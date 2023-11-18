{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.Declarations.TypeDeclarations where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.LoopingStatements (Var)
import SystemVerilog.AST.BehavioralStatements.TimingControlStatements (DelayControl)
import SystemVerilog.AST.Declarations.DeclarationLists (ListOfGenvarIdentifiers, ListOfNetDeclAssignments, ListOfVariableDeclAssignments)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.DeclarationRanges (UnpackedDimension, VariableDimension)
import SystemVerilog.AST.Declarations.Delays (Delay3, DelayValue)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (DataType, DataTypeOrImplicit, ImplicitDataType)
import SystemVerilog.AST.Declarations.Strengths (ChargeStrength, DriveStrength)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (ConstantBitSelect)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (Identifier, InterfaceInstanceIdentifier, NetIdentifier, NetTypeIdentifier, PackageIdentifier, PackageScopeOrClassScope, TfIdentifier, TypeIdentifier)
import SystemVerilog.AST.SpecialNodes (Keyword, Splits, Symbol)
import Util.Lit (deriveLit)

data DataDeclaration
  = MkDataDeclarationVariable DataDeclarationVariable
  | MkTypeDeclaration TypeDeclaration
  | MkPackageImportDeclaration PackageImportDeclaration
  | MkNetTypeDeclaration NetTypeDeclaration
  deriving (Eq, Show)

data DataDeclarationVariable
  = DataDeclarationVariable
      (Maybe Const)
      (Maybe Var)
      (Maybe Lifetime)
      DataTypeOrImplicit
      ListOfVariableDeclAssignments
      Symbol
  deriving (Eq, Show)

data Const = Const Keyword deriving (Eq, Show)

data PackageImportDeclaration
  = PackageImportDeclaration
      Keyword
      (Splits Symbol PackageImportItem)
      Symbol
  deriving (Eq, Show)

data PackageImportItem
  = MkPackageImportItemIdentifier PackageImportItemIdentifier
  | MkPackageImportItemAsterisk PackageImportItemAsterisk
  deriving (Eq, Show)

data PackageImportItemIdentifier
  = PackageImportItemIdentifier
      PackageIdentifier
      Symbol
      Identifier
  deriving (Eq, Show)

data PackageImportItemAsterisk
  = PackageImportItemAsterisk
      PackageIdentifier
      Symbol
      Symbol
  deriving (Eq, Show)

data PackageExportDeclaration
  = MkPackageExportDeclarationAsterisk PackageExportDeclarationAsterisk
  | MkPackageExportDeclarationItem PackageExportDeclarationItem
  deriving (Eq, Show)

data PackageExportDeclarationAsterisk
  = PackageExportDeclarationAsterisk
      Keyword
      Symbol
      Symbol
  deriving (Eq, Show)

data PackageExportDeclarationItem
  = PackageExportDeclarationItem
      Keyword
      (Splits Symbol PackageImportItem)
      Symbol
  deriving (Eq, Show)

data GenvarDeclaration
  = GenvarDeclaration
      Keyword
      ListOfGenvarIdentifiers
      Symbol
  deriving (Eq, Show)

data NetDeclaration
  = MkNetDeclarationNetType NetDeclarationNetType
  | MkNetDeclarationNetTypeIdentifier NetDeclarationNetTypeIdentifier
  | MkNetDeclarationInterconnect NetDeclarationInterconnect
  deriving (Eq, Show)

data NetDeclarationNetType
  = NetDeclarationNetType
      NetTypeDeclaration
      (Maybe Strength)
      (Maybe VectorScalar)
      DataTypeOrImplicit
      (Maybe Delay3)
      ListOfNetDeclAssignments
      Symbol
  deriving (Eq, Show)

data Strength
  = MkDriveStrength DriveStrength
  | MkChargeStrength ChargeStrength
  deriving (Eq, Show)

data VectorScalar
  = Vectored Keyword
  | Scalared Keyword
  deriving (Eq, Show)

data NetDeclarationNetTypeIdentifier
  = NetDeclarationNetTypeIdentifier
      NetTypeIdentifier
      (Maybe DelayControl)
      ListOfNetDeclAssignments
      Symbol
  deriving (Eq, Show)

data NetDeclarationInterconnect
  = NetDeclarationInterconnect
      Keyword
      ImplicitDataType
      (Maybe (Symbol, DelayValue))
      NetIdentifier
      [UnpackedDimension]
      (Maybe (Symbol, NetIdentifier, [UnpackedDimension]))
      Symbol
  deriving (Eq, Show)

data TypeDeclaration
  = MkTypeDeclarationDataType TypeDeclarationDataType
  | MkTypeDeclarationInterface TypeDeclarationInterface
  | MkTypeDeclarationReserved TypeDeclarationReserved
  deriving (Eq, Show)

data TypeDeclarationDataType
  = TypeDeclarationDataType
      Keyword
      DataType
      TypeIdentifier
      [VariableDimension]
      Symbol
  deriving (Eq, Show)

data TypeDeclarationInterface
  = TypeDeclarationInterface
      Keyword
      InterfaceInstanceIdentifier
      ConstantBitSelect
      Symbol
      TypeIdentifier
      TypeIdentifier
      Symbol
  deriving (Eq, Show)

data TypeDeclarationReserved
  = TypeDeclarationReserved
      Keyword
      (Maybe TypeDeclarationKeyword)
      TypeIdentifier
      Symbol
  deriving (Eq, Show)

data TypeDeclarationKeyword
  = EnumKeyword Keyword
  | StructKeyword Keyword
  | UnionKeyword Keyword
  | ClassKeyword Keyword
  | InterfaceClass Keyword Keyword
  deriving (Eq, Show)

data NetTypeDeclaration
  = MkNetTypeDeclarationDataType NetTypeDeclarationDataType
  | MkNetTypeDeclarationNetType NetTypeDeclarationNetType
  deriving (Eq, Show)

data NetTypeDeclarationDataType
  = NetTypeDeclarationDataType
      Keyword
      DataType
      NetTypeIdentifier
      (Maybe (Keyword, Maybe PackageScopeOrClassScope, TfIdentifier))
      Symbol
  deriving (Eq, Show)

data NetTypeDeclarationNetType
  = NetTypeDeclarationNetType
      Keyword
      (Maybe PackageScopeOrClassScope)
      NetTypeIdentifier
      NetTypeIdentifier
      Symbol
  deriving (Eq, Show)

data Lifetime
  = Static Keyword
  | Automatic Keyword
  deriving (Eq, Show)

deriveLit ''Const
deriveLit ''PackageImportItemIdentifier
deriveLit ''PackageImportItemAsterisk
deriveLit ''PackageExportDeclarationAsterisk
deriveLit ''GenvarDeclaration
deriveLit ''Strength
deriveLit ''VectorScalar
deriveLit ''NetDeclarationNetTypeIdentifier
deriveLit ''NetDeclarationInterconnect
deriveLit ''TypeDeclarationDataType
deriveLit ''TypeDeclarationInterface
deriveLit ''TypeDeclarationKeyword
deriveLit ''NetTypeDeclarationDataType
deriveLit ''NetTypeDeclarationNetType
deriveLit ''Lifetime
deriveLit ''NetTypeDeclaration
deriveLit ''TypeDeclarationReserved
deriveLit ''TypeDeclaration
deriveLit ''NetDeclarationNetType
deriveLit ''NetDeclaration
deriveLit ''PackageImportItem
deriveLit ''PackageImportDeclaration
deriveLit ''PackageExportDeclarationItem
deriveLit ''PackageExportDeclaration
deriveLit ''DataDeclarationVariable
deriveLit ''DataDeclaration
