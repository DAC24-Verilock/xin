{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.Expressions.Primaries where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Patterns (AssignmentPatternExpression, ConstantAssignmentPatternExpression)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.AssertionDeclarations (SequenceMethodCall)
import SystemVerilog.AST.Declarations.LetDeclarations (LetExpression)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (CastingType, TypeReference)
import SystemVerilog.AST.Expressions.Concatenations (Concatenation, ConstantConcatenation, ConstantMultipleConcatenation, EmptyUnpackedArrayConcatenation, ModulePathConcatenation, ModulePathMultipleConcatenation, MultipleConcatenation, StreamingConcatenation)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions
  ( ConstantExpression,
    ConstantMintypmaxExpression,
    ConstantPartSelectRange,
    ConstantRangeExpression,
    Expression,
    MintypmaxExpression,
    ModulePathMintypmaxExpression,
    PartSelectRange,
  )
import SystemVerilog.AST.Expressions.Numbers (FixedPointNumber, Number, UnbasedUnsizedLiteral, UnsignedNumber)
import SystemVerilog.AST.Expressions.Strings (StringLiteral)
import SystemVerilog.AST.Expressions.SubroutineCalls (ConstantFunctionCall, FunctionSubroutineCall)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers
  ( EnumIdentifier,
    FormalPortIdentifier,
    GenvarIdentifier,
    HierarchicalIdentifier,
    Identifier,
    ImplicitClassHandleOrClassScope,
    Local,
    MemberIdentifier,
    PackageScope,
    PackageScopeOrClassScope,
    PsParameterIdentifier,
    SpecparamIdentifier,
  )
import SystemVerilog.AST.SpecialNodes (Bracket, Keyword, Paren, Symbol)
import Util.Lit (deriveLit)

data ConstantPrimary
  = MkConstantPrimaryPrimaryLiteral PrimaryLiteral
  | MkConstantPrimaryPsParameter ConstantPrimaryPsParameter
  | MkConstantPrimarySpecparam ConstantPrimarySpecparam
  | MkGenvarIdentifier GenvarIdentifier
  | MkConstantPrimaryFormalPort ConstantPrimaryFormalPort
  | MkConstantPrimaryEnum ConstantPrimaryEnum
  | MkConstantPrimaryConcatenation ConstantPrimaryConcatenation
  | MkConstantPrimaryMultipleConcatenation ConstantPrimaryMultipleConcatenation
  | MkConstantFunctionCall ConstantFunctionCall
  | MkConstantLetExpression ConstantLetExpression
  | MkConstantPrimaryMintypmaxExpression ConstantPrimaryMintypmaxExpression
  | MkConstantCast ConstantCast
  | MkConstantAssignmentPatternExpression ConstantAssignmentPatternExpression
  | MkTypeReference TypeReference
  | Null Keyword
  | Dollar Keyword
  deriving (Eq, Show)

data ConstantPrimaryPsParameter
  = ConstantPrimaryPsParameter
      PsParameterIdentifier
      ConstantSelect
  deriving (Eq, Show)

data ConstantPrimarySpecparam
  = ConstantPrimarySpecparam
      SpecparamIdentifier
      (Maybe (Bracket ConstantRangeExpression))
  deriving (Eq, Show)

data ConstantPrimaryFormalPort
  = ConstantPrimaryFormalPort
      FormalPortIdentifier
      ConstantSelect
  deriving (Eq, Show)

data ConstantPrimaryEnum
  = ConstantPrimaryEnum
      PackageScopeOrClassScope
      EnumIdentifier
  deriving (Eq, Show)

data ConstantPrimaryConcatenation
  = ConstantPrimaryConcatenation
      ConstantConcatenation
      (Maybe (Bracket ConstantRangeExpression))
  deriving (Eq, Show)

data ConstantPrimaryMultipleConcatenation
  = ConstantPrimaryMultipleConcatenation
      ConstantMultipleConcatenation
      (Maybe (Bracket ConstantRangeExpression))
  deriving (Eq, Show)

data ConstantPrimaryMintypmaxExpression
  = ConstantPrimaryMintypmaxExpression
      (Paren ConstantMintypmaxExpression)
  deriving (Eq, Show)

data ModulePathPrimary
  = MkNumber Number
  | MkIdentifier Identifier
  | MkModulePathConcatenation ModulePathConcatenation
  | MkModulePathMultipleConcatenation ModulePathMultipleConcatenation
  | MkFunctionSubroutineCall FunctionSubroutineCall
  | MkModulePathPrimaryMintypmax ModulePathPrimaryMintypmax
  deriving (Eq, Show)

data ModulePathPrimaryMintypmax
  = ModulePathPrimaryMintypmax
      (Paren ModulePathMintypmaxExpression)
  deriving (Eq, Show)

data Primary
  = MkPrimaryLiteral PrimaryLiteral
  | MkPrimaryHierarchical PrimaryHierarchical
  | MkEmptyUnpackedArrayConcatenation EmptyUnpackedArrayConcatenation
  | MkPrimaryConcatenation PrimaryConcatenation
  | MkPrimaryMultipleConcatenation PrimaryMultipleConcatenation
  | MkPrimaryFunctionSubroutineCall FunctionSubroutineCall
  | MKLetExpression LetExpression
  | MkPrimaryMintypmaxExpression PrimaryMintypmaxExpression
  | MkCast Cast
  | MkAssignmentPatternExpression AssignmentPatternExpression
  | MkStreamingConcatenation StreamingConcatenation
  | MkSequenceMethodCall SequenceMethodCall
  | MkThis Keyword
  | MkDollar Keyword
  | MkNull Keyword
  deriving (Eq, Show)

data PrimaryHierarchical
  = PrimaryHierarchical
      (Maybe ClassQualifierOrPackageScope)
      HierarchicalIdentifier
      Select
  deriving (Eq, Show)

data PrimaryConcatenation
  = PrimaryConcatenation
      Concatenation
      (Maybe (Bracket RangeExpression))
  deriving (Eq, Show)

data PrimaryMultipleConcatenation
  = PrimaryMultipleConcatenation
      MultipleConcatenation
      (Maybe (Bracket RangeExpression))
  deriving (Eq, Show)

data PrimaryMintypmaxExpression = PrimaryMintypmaxExpression (Paren MintypmaxExpression) deriving (Eq, Show)

data ClassQualifierOrPackageScope
  = MkClassQualifier ClassQualifier
  | MkClassQualifierOrPackageScopePackageScope PackageScope
  deriving (Eq, Show)

data ClassQualifier
  = ClassQualifier
      (Maybe Local)
      (Maybe ImplicitClassHandleOrClassScope)
  deriving (Eq, Show)

data RangeExpression
  = MkExpression Expression
  | MkPartSelectRange PartSelectRange
  deriving (Eq, Show)

data PrimaryLiteral
  = MkPrimaryLiteralNumber Number
  | MkTimeLiteral TimeLiteral
  | MkUnbasedUnsizedLiteral UnbasedUnsizedLiteral
  | MkStringLiteral StringLiteral
  deriving (Eq, Show)

data TimeLiteral
  = MkTimeLiteralUnsigned TimeLiteralUnsigned
  | MkTimeLiteralFixedPoint TimeLiteralFixedPoint
  deriving (Eq, Show)

data TimeLiteralUnsigned
  = TimeLiteralUnsigned
      UnsignedNumber
      TimeUnit
  deriving (Eq, Show)

data TimeLiteralFixedPoint
  = TimeLiteralFixedPoint
      FixedPointNumber
      TimeUnit
  deriving (Eq, Show)

data TimeUnit
  = S Keyword
  | MS Keyword
  | US Keyword
  | NS Keyword
  | PS Keyword
  | FS Keyword
  deriving (Eq, Show)

data ImplicitClassHandle
  = This Keyword
  | Super Keyword
  | ThisSuper Keyword Symbol Keyword
  deriving (Eq, Show)

data BitSelect
  = BitSelect [Bracket Expression]
  deriving (Eq, Show)

data Select
  = Select
      (Maybe ([(Symbol, MemberIdentifier, BitSelect)], Symbol, MemberIdentifier))
      BitSelect
      (Maybe (Bracket PartSelectRange))
  deriving (Eq, Show)

data NonrangeSelect
  = NonrangeSelect
      (Maybe ([(Symbol, MemberIdentifier, BitSelect)], Symbol, MemberIdentifier))
      BitSelect
  deriving (Eq, Show)

data ConstantBitSelect = ConstantBitSelect [Bracket ConstantExpression] deriving (Eq, Show)

data ConstantSelect
  = ConstantSelect
      (Maybe ([(Symbol, MemberIdentifier, ConstantBitSelect)], Symbol, MemberIdentifier))
      ConstantBitSelect
      (Maybe (Bracket ConstantPartSelectRange))
  deriving (Eq, Show)

data ConstantCast
  = ConstantCast
      CastingType
      Symbol
      (Paren ConstantExpression)
  deriving (Eq, Show)

data ConstantLetExpression = ConstantLetExpression LetExpression deriving (Eq, Show)

data Cast
  = Cast
      CastingType
      Symbol
      (Paren Expression)
  deriving (Eq, Show)

deriveLit ''ConstantPrimarySpecparam
deriveLit ''ConstantPrimaryEnum
deriveLit ''ConstantPrimaryConcatenation
deriveLit ''ConstantPrimaryMultipleConcatenation
deriveLit ''ConstantPrimaryMintypmaxExpression
deriveLit ''ModulePathPrimaryMintypmax
deriveLit ''ModulePathPrimary
deriveLit ''PrimaryMintypmaxExpression
deriveLit ''ClassQualifier
deriveLit ''RangeExpression
deriveLit ''TimeUnit
deriveLit ''ImplicitClassHandle
deriveLit ''BitSelect
deriveLit ''Select
deriveLit ''NonrangeSelect
deriveLit ''ConstantBitSelect
deriveLit ''ConstantSelect
deriveLit ''ConstantPrimaryFormalPort
deriveLit ''ConstantCast
deriveLit ''ConstantLetExpression
deriveLit ''Cast
deriveLit ''TimeLiteralUnsigned
deriveLit ''TimeLiteralFixedPoint
deriveLit ''TimeLiteral
deriveLit ''PrimaryLiteral
deriveLit ''ClassQualifierOrPackageScope
deriveLit ''PrimaryHierarchical
deriveLit ''PrimaryConcatenation
deriveLit ''PrimaryMultipleConcatenation
deriveLit ''Primary
deriveLit ''ConstantPrimaryPsParameter
deriveLit ''ConstantPrimary