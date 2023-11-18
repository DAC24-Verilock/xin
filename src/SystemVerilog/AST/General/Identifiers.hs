{-# HLINT ignore "Use newtype instead of data" #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}

module SystemVerilog.AST.General.Identifiers where

import qualified Data.Text as T
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (ClassScope)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (ConstantBitSelect, ImplicitClassHandle)
import SystemVerilog.AST.Lib (Locate)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Symbol, WhiteSpace)
import Util.Lit (Lit (..))

data ArrayIdentifier
  = ArrayIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ArrayIdentifier where
  lit (ArrayIdentifier x) = lit x

data BlockIdentifier
  = BlockIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit BlockIdentifier where
  lit (BlockIdentifier x) = lit x

data BinIdentifier
  = BinIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit BinIdentifier where
  lit (BinIdentifier x) = lit x

data CIdentifier
  = CIdentifier
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit CIdentifier where
  lit (CIdentifier t _ l) = t `T.append` lit l

data CellIdentifier
  = CellIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit CellIdentifier where
  lit (CellIdentifier x) = lit x

data CheckerIdentifier
  = CheckerIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit CheckerIdentifier where
  lit (CheckerIdentifier x) = lit x

data ClassIdentifier
  = ClassIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ClassIdentifier where
  lit (ClassIdentifier x) = lit x

data ClassVariableIdentifier
  = ClassVariableIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ClassVariableIdentifier where
  lit (ClassVariableIdentifier x) = lit x

data ClockingIdentifier
  = ClockingIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ClockingIdentifier where
  lit (ClockingIdentifier x) = lit x

data ConfigIdentifier
  = ConfigIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ConfigIdentifier where
  lit (ConfigIdentifier x) = lit x

data ConstIdentifier
  = ConstIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ConstIdentifier where
  lit (ConstIdentifier x) = lit x

data ConstraintIdentifier
  = ConstraintIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ConstraintIdentifier where
  lit (ConstraintIdentifier x) = lit x

data CovergroupIdentifier
  = CovergroupIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit CovergroupIdentifier where
  lit (CovergroupIdentifier x) = lit x

data CovergroupVariableIdentifier
  = CovergroupVariableIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit CovergroupVariableIdentifier where
  lit (CovergroupVariableIdentifier x) = lit x

data CoverPointIdentifier
  = CoverPointIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit CoverPointIdentifier where
  lit (CoverPointIdentifier x) = lit x

data CrossIdentifier
  = CrossIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit CrossIdentifier where
  lit (CrossIdentifier x) = lit x

data DynamicArrayVariableIdentifier
  = DynamicArrayVariableIdentifier
      VariableIdentifier
  deriving (Eq, Show)

instance Lit DynamicArrayVariableIdentifier where
  lit (DynamicArrayVariableIdentifier x) = lit x

data EnumIdentifier
  = EnumIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit EnumIdentifier where
  lit (EnumIdentifier x) = lit x

data EscapedIdentifier
  = EscapedIdentifier
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit EscapedIdentifier where
  lit (EscapedIdentifier t _ l) = t `T.append` lit l

data FormalIdentifier
  = FormalIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit FormalIdentifier where
  lit (FormalIdentifier x) = lit x

data FormalPortIdentifier
  = FormalPortIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit FormalPortIdentifier where
  lit (FormalPortIdentifier x) = lit x

data FunctionIdentifier
  = FunctionIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit FunctionIdentifier where
  lit (FunctionIdentifier x) = lit x

data GenerateBlockIdentifier
  = GenerateBlockIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit GenerateBlockIdentifier where
  lit (GenerateBlockIdentifier x) = lit x

data GenvarIdentifier
  = GenvarIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit GenvarIdentifier where
  lit (GenvarIdentifier x) = lit x

data HierarchicalArrayIdentifier
  = HierarchicalArrayIdentifier
      HierarchicalIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalArrayIdentifier where
  lit (HierarchicalArrayIdentifier x) = lit x

data HierarchicalBlockIdentifier
  = HierarchicalBlockIdentifier
      HierarchicalIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalBlockIdentifier where
  lit (HierarchicalBlockIdentifier x) = lit x

data HierarchicalEventIdentifier
  = HierarchicalEventIdentifier
      HierarchicalIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalEventIdentifier where
  lit (HierarchicalEventIdentifier x) = lit x

data HierarchicalIdentifier
  = HierarchicalIdentifier
      (Maybe Root)
      [(Identifier, ConstantBitSelect, Symbol)]
      Identifier
  deriving (Eq, Show)

instance Lit HierarchicalIdentifier where
  lit (HierarchicalIdentifier a b c) = T.concat [lit a, lit b, lit c]

data Root
  = Root
      Keyword
      Symbol
  deriving (Eq, Show)

instance Lit Root where
  lit (Root a b) = lit a `T.append` lit b

data HierarchicalNetIdentifier
  = HierarchicalNetIdentifier
      HierarchicalIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalNetIdentifier where
  lit (HierarchicalNetIdentifier x) = lit x

data HierarchicalParameterIdentifier
  = HierarchicalParameterIdentifier
      HierarchicalIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalParameterIdentifier where
  lit (HierarchicalParameterIdentifier x) = lit x

data HierarchicalPropertyIdentifier
  = HierarchicalPropertyIdentifier
      HierarchicalIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalPropertyIdentifier where
  lit (HierarchicalPropertyIdentifier x) = lit x

data HierarchicalSequenceIdentifier
  = HierarchicalSequenceIdentifier
      HierarchicalIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalSequenceIdentifier where
  lit (HierarchicalSequenceIdentifier x) = lit x

data HierarchicalTaskIdentifier
  = HierarchicalTaskIdentifier
      HierarchicalIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalTaskIdentifier where
  lit (HierarchicalTaskIdentifier x) = lit x

data HierarchicalTfIdentifier
  = HierarchicalTfIdentifier
      HierarchicalIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalTfIdentifier where
  lit (HierarchicalTfIdentifier x) = lit x

data HierarchicalVariableIdentifier
  = HierarchicalVariableIdentifier
      HierarchicalIdentifier
  deriving (Eq, Show)

instance Lit HierarchicalVariableIdentifier where
  lit (HierarchicalVariableIdentifier x) = lit x

data Identifier
  = MkSimpleIdentifier SimpleIdentifier
  | MkEscapedIdentifier EscapedIdentifier
  deriving (Eq, Show)

instance Lit Identifier where
  lit (MkSimpleIdentifier x) = lit x
  lit (MkEscapedIdentifier x) = lit x

data IndexVariableIdentifier
  = IndexVariableIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit IndexVariableIdentifier where
  lit (IndexVariableIdentifier x) = lit x

data InterfaceIdentifier
  = InterfaceIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit InterfaceIdentifier where
  lit (InterfaceIdentifier x) = lit x

data InterfaceInstanceIdentifier
  = InterfaceInstanceIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit InterfaceInstanceIdentifier where
  lit (InterfaceInstanceIdentifier x) = lit x

data InoutPortIdentifier
  = InoutPortIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit InoutPortIdentifier where
  lit (InoutPortIdentifier x) = lit x

data InputPortIdentifier
  = InputPortIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit InputPortIdentifier where
  lit (InputPortIdentifier x) = lit x

data InstanceIdentifier
  = InstanceIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit InstanceIdentifier where
  lit (InstanceIdentifier x) = lit x

data LibraryIdentifier
  = LibraryIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit LibraryIdentifier where
  lit (LibraryIdentifier x) = lit x

data MemberIdentifier
  = MemberIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit MemberIdentifier where
  lit (MemberIdentifier x) = lit x

data MethodIdentifier
  = MethodIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit MethodIdentifier where
  lit (MethodIdentifier x) = lit x

data ModportIdentifier
  = ModportIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ModportIdentifier where
  lit (ModportIdentifier x) = lit x

data ModuleIdentifier
  = ModuleIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ModuleIdentifier where
  lit (ModuleIdentifier x) = lit x

data NetIdentifier
  = NetIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit NetIdentifier where
  lit (NetIdentifier x) = lit x

data NetTypeIdentifier
  = NetTypeIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit NetTypeIdentifier where
  lit (NetTypeIdentifier x) = lit x

data OutputPortIdentifier
  = OutputPortIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit OutputPortIdentifier where
  lit (OutputPortIdentifier x) = lit x

data PackageIdentifier
  = PackageIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit PackageIdentifier where
  lit (PackageIdentifier x) = lit x

data PackageScope
  = MkPackageScopePackage PackageScopePackage
  | MkUnit Unit
  deriving (Eq, Show)

instance Lit PackageScope where
  lit (MkPackageScopePackage x) = lit x
  lit (MkUnit x) = lit x

data PackageScopePackage
  = PackageScopePackage
      PackageIdentifier
      Symbol
  deriving (Eq, Show)

instance Lit PackageScopePackage where
  lit (PackageScopePackage a b) = lit a `T.append` lit b

data Unit
  = Unit
      Keyword
      Symbol
  deriving (Eq, Show)

instance Lit Unit where
  lit (Unit a b) = lit a `T.append` lit b

data ParameterIdentifier
  = ParameterIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ParameterIdentifier where
  lit (ParameterIdentifier x) = lit x

data PortIdentifier
  = PortIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit PortIdentifier where
  lit (PortIdentifier x) = lit x

data ProductionIdentifier
  = ProductionIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ProductionIdentifier where
  lit (ProductionIdentifier x) = lit x

data ProgramIdentifier
  = ProgramIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit ProgramIdentifier where
  lit (ProgramIdentifier x) = lit x

data PropertyIdentifier
  = PropertyIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit PropertyIdentifier where
  lit (PropertyIdentifier x) = lit x

data PsClassIdentifier
  = PsClassIdentifier
      (Maybe PackageScope)
      ClassIdentifier
  deriving (Eq, Show)

instance Lit PsClassIdentifier where
  lit (PsClassIdentifier a b) = lit a `T.append` lit b

data PsCovergroupIdentifier
  = PsCovergroupIdentifier
      (Maybe PackageScope)
      CovergroupIdentifier
  deriving (Eq, Show)

instance Lit PsCovergroupIdentifier where
  lit (PsCovergroupIdentifier a b) = lit a `T.append` lit b

data PsCheckerIdentifier
  = PsCheckerIdentifier
      (Maybe PackageScope)
      CheckerIdentifier
  deriving (Eq, Show)

instance Lit PsCheckerIdentifier where
  lit (PsCheckerIdentifier a b) = lit a `T.append` lit b

data PsIdentifier
  = PsIdentifier
      (Maybe PackageScope)
      Identifier
  deriving (Eq, Show)

instance Lit PsIdentifier where
  lit (PsIdentifier a b) = lit a `T.append` lit b

data PsOrHierarchicalArrayIdentifier
  = PsOrHierarchicalArrayIdentifier
      (Maybe ImplicitClassHandleOrClassScopeOrPackageScope)
      HierarchicalArrayIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalArrayIdentifier where
  lit (PsOrHierarchicalArrayIdentifier a b) = lit a `T.append` lit b

data PsOrHierarchicalNetIdentifier
  = MkPsOrHierarchicalNetIdentifierPackageScope PsOrHierarchicalNetIdentifierPackageScope
  | MkHierarchicalNetIdentifier HierarchicalNetIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalNetIdentifier where
  lit (MkPsOrHierarchicalNetIdentifierPackageScope x) = lit x
  lit (MkHierarchicalNetIdentifier x) = lit x

data PsOrHierarchicalNetIdentifierPackageScope
  = PsOrHierarchicalNetIdentifierPackageScope
      (Maybe PackageScope)
      NetIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalNetIdentifierPackageScope where
  lit (PsOrHierarchicalNetIdentifierPackageScope a b) = lit a `T.append` lit b

data PsOrHierarchicalNetIdentifierHierarchical
  = PsOrHierarchicalNetIdentifierHierarchical
      HierarchicalNetIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalNetIdentifierHierarchical where
  lit (PsOrHierarchicalNetIdentifierHierarchical x) = lit x

data PsOrHierarchicalPropertyIdentifier
  = MkPsOrHierarchicalPropertyIdentifierPackageScope PsOrHierarchicalPropertyIdentifierPackageScope
  | MkHierarchicalPropertyIdentifier HierarchicalPropertyIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalPropertyIdentifier where
  lit (MkPsOrHierarchicalPropertyIdentifierPackageScope x) = lit x
  lit (MkHierarchicalPropertyIdentifier x) = lit x

data PsOrHierarchicalPropertyIdentifierPackageScope
  = PsOrHierarchicalPropertyIdentifierPackageScope
      (Maybe PackageScope)
      PropertyIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalPropertyIdentifierPackageScope where
  lit (PsOrHierarchicalPropertyIdentifierPackageScope a b) = lit a `T.append` lit b

data PsOrHierarchicalPropertyIdentifierHierarchical
  = PsOrHierarchicalPropertyIdentifierHierarchical
      HierarchicalPropertyIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalPropertyIdentifierHierarchical where
  lit (PsOrHierarchicalPropertyIdentifierHierarchical x) = lit x

data PsOrHierarchicalSequenceIdentifier
  = MkPsOrHierarchicalSequenceIdentifierPackageScope PsOrHierarchicalSequenceIdentifierPackageScope
  | MkHierarchicalSequenceIdentifier HierarchicalSequenceIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalSequenceIdentifier where
  lit (MkPsOrHierarchicalSequenceIdentifierPackageScope x) = lit x
  lit (MkHierarchicalSequenceIdentifier x) = lit x

data PsOrHierarchicalSequenceIdentifierPackageScope
  = PsOrHierarchicalSequenceIdentifierPackageScope
      (Maybe PackageScope)
      SequenceIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalSequenceIdentifierPackageScope where
  lit (PsOrHierarchicalSequenceIdentifierPackageScope a b) = lit a `T.append` lit b

data PsOrHierarchicalSequenceIdentifierHierarchical
  = PsOrHierarchicalSequenceIdentifierHierarchical
      HierarchicalSequenceIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalSequenceIdentifierHierarchical where
  lit (PsOrHierarchicalSequenceIdentifierHierarchical x) = lit x

data PsOrHierarchicalTfIdentifier
  = MkPsOrHierarchicalTfIdentifierPackageScope PsOrHierarchicalTfIdentifierPackageScope
  | MkHierarchicalTfIdentifier HierarchicalTfIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalTfIdentifier where
  lit (MkPsOrHierarchicalTfIdentifierPackageScope x) = lit x
  lit (MkHierarchicalTfIdentifier x) = lit x

data PsOrHierarchicalTfIdentifierPackageScope
  = PsOrHierarchicalTfIdentifierPackageScope
      (Maybe ImplicitClassHandleOrClassScopeOrPackageScope)
      TfIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalTfIdentifierPackageScope where
  lit (PsOrHierarchicalTfIdentifierPackageScope a b) = lit a `T.append` lit b

data PsOrHierarchicalTfIdentifierHierarchical
  = PsOrHierarchicalTfIdentifierHierarchical
      HierarchicalTfIdentifier
  deriving (Eq, Show)

instance Lit PsOrHierarchicalTfIdentifierHierarchical where
  lit (PsOrHierarchicalTfIdentifierHierarchical x) = lit x

data PsParameterIdentifier
  = MkPsParameterIdentifierScope PsParameterIdentifierScope
  | MkPsParameterIdentifierGenerate PsParameterIdentifierGenerate
  deriving (Eq, Show)

instance Lit PsParameterIdentifier where
  lit (MkPsParameterIdentifierScope x) = lit x
  lit (MkPsParameterIdentifierGenerate x) = lit x

data PsParameterIdentifierScope
  = PsParameterIdentifierScope
      (Maybe PackageScopeOrClassScope)
      ParameterIdentifier
  deriving (Eq, Show)

instance Lit PsParameterIdentifierScope where
  lit (PsParameterIdentifierScope a b) = lit a `T.append` lit b

data PsParameterIdentifierGenerate
  = PsParameterIdentifierGenerate
      [(GenerateBlockIdentifier, Maybe (Paren ConstantExpression), Symbol)]
      ParameterIdentifier
  deriving (Eq, Show)

instance Lit PsParameterIdentifierGenerate where
  lit (PsParameterIdentifierGenerate a b) = lit a `T.append` lit b

data PsTypeIdentifier
  = PsTypeIdentifier
      (Maybe LocalOrPackageScopeOrClassScope)
      TypeIdentifier
  deriving (Eq, Show)

instance Lit PsTypeIdentifier where
  lit (PsTypeIdentifier a b) = lit a `T.append` lit b

data LocalOrPackageScopeOrClassScope
  = MkLocal Local
  | MkPackageScope PackageScope
  | MkClassScope ClassScope
  deriving (Eq, Show)

instance Lit LocalOrPackageScopeOrClassScope where
  lit (MkLocal x) = lit x
  lit (MkPackageScope x) = lit x
  lit (MkClassScope x) = lit x

data Local
  = Local
      Keyword
      Symbol
  deriving (Eq, Show)

instance Lit Local where
  lit (Local a b) = lit a `T.append` lit b

data SequenceIdentifier
  = SequenceIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit SequenceIdentifier where
  lit (SequenceIdentifier x) = lit x

data SignalIdentifier
  = SignalIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit SignalIdentifier where
  lit (SignalIdentifier x) = lit x

data SimpleIdentifier
  = SimpleIdentifier
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit SimpleIdentifier where
  lit (SimpleIdentifier t _ l) = t `T.append` lit l

data SpecparamIdentifier
  = SpecparamIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit SpecparamIdentifier where
  lit (SpecparamIdentifier x) = lit x

data SystemTfIdentifier
  = SystemTfIdentifier
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit SystemTfIdentifier where
  lit (SystemTfIdentifier t _ l) = t `T.append` lit l

data TaskIdentifier
  = TaskIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit TaskIdentifier where
  lit (TaskIdentifier x) = lit x

data TfIdentifier
  = TfIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit TfIdentifier where
  lit (TfIdentifier x) = lit x

data TerminalIdentifier
  = TerminalIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit TerminalIdentifier where
  lit (TerminalIdentifier x) = lit x

data TopmoduleIdentifier
  = TopmoduleIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit TopmoduleIdentifier where
  lit (TopmoduleIdentifier x) = lit x

data TypeIdentifier
  = TypeIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit TypeIdentifier where
  lit (TypeIdentifier x) = lit x

data UdpIdentifier
  = UdpIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit UdpIdentifier where
  lit (UdpIdentifier x) = lit x

data VariableIdentifier
  = VariableIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit VariableIdentifier where
  lit (VariableIdentifier x) = lit x

data ImplicitClassHandleOrClassScopeOrPackageScope
  = ImplicitClassHandle ImplicitClassHandle Symbol
  | MkImplicitClassHandleOrClassScope ClassScope
  | MkImplicitClassHandleOrPackageScope PackageScope
  deriving (Eq, Show)

instance Lit ImplicitClassHandleOrClassScopeOrPackageScope where
  lit (ImplicitClassHandle a b) = lit a `T.append` lit b
  lit (MkImplicitClassHandleOrClassScope x) = lit x
  lit (MkImplicitClassHandleOrPackageScope x) = lit x

data ImplicitClassHandleOrPackageScope
  = ImplicitClassHandleOrPackageScopeImplicitClassHandle ImplicitClassHandle Symbol
  | ImplicitClassHandleOrPackageScopePackageScope PackageScope
  deriving (Eq, Show)

instance Lit ImplicitClassHandleOrPackageScope where
  lit (ImplicitClassHandleOrPackageScopeImplicitClassHandle a b) = lit a `T.append` lit b
  lit (ImplicitClassHandleOrPackageScopePackageScope x) = lit x

data ImplicitClassHandleOrClassScope
  = ImplicitClassHandleOrClassScopeImplicitClassHandle ImplicitClassHandle Symbol
  | ImplicitClassHandleOrClassScopeClassScope ClassScope
  deriving (Eq, Show)

instance Lit ImplicitClassHandleOrClassScope where
  lit (ImplicitClassHandleOrClassScopeImplicitClassHandle a b) = lit a `T.append` lit b
  lit (ImplicitClassHandleOrClassScopeClassScope x) = lit x

data PackageScopeOrClassScope
  = MkPackageScopeOrClassScopePackageScope PackageScope
  | MkPackageScopeOrClassScopeClassScope ClassScope
  deriving (Eq, Show)

instance Lit PackageScopeOrClassScope where
  lit (MkPackageScopeOrClassScopePackageScope x) = lit x
  lit (MkPackageScopeOrClassScopeClassScope x) = lit x