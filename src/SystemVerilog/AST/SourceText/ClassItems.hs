{-# HLINT ignore "Use newtype instead of data" #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module SystemVerilog.AST.SourceText.ClassItems where

import {-# SOURCE #-} SystemVerilog.AST.BehavioralStatements.Statements (FunctionStatementOrNull)
import SystemVerilog.AST.Declarations.BlockItemDeclarations (BlockItemDeclaration)
import SystemVerilog.AST.Declarations.CovergroupDeclarations (CovergroupDeclaration)
import SystemVerilog.AST.Declarations.DeclarationAssignments (ClassNew)
import SystemVerilog.AST.Declarations.FunctionDeclarations (FunctionDeclaration, FunctionPrototype)
import SystemVerilog.AST.Declarations.ModuleParameterDeclarations (LocalParameterDeclaration, ParameterDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.NetAndVariableTypes (ClassScope, DataType)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TaskDeclarations (TaskDeclaration, TaskPrototype, TfPortList)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TypeDeclarations (DataDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Expressions (ConstantExpression)
import SystemVerilog.AST.Expressions.SubroutineCalls (ListOfArguments)
import {-# SOURCE #-} SystemVerilog.AST.General.Attributes (AttributeInstance)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (ConstIdentifier)
import {-# SOURCE #-} SystemVerilog.AST.SourceText.Constraints (ConstraintDeclaration, ConstraintPrototype)
import SystemVerilog.AST.SourceText.SystemVerilogSourceText (ClassDeclaration)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Symbol)
import Util.Lit (deriveLit)

data ClassItem
  = MkClassItemProperty ClassItemProperty
  | MkClassItemMethod ClassItemMethod
  | MkClassItemConstraint ClassItemConstraint
  | MkClassItemDeclaration ClassItemDeclaration
  | MkClassItemCovergroup ClassItemCovergroup
  | MkLocalParameterDeclaration LocalParameterDeclaration Symbol
  | MkParameterDeclaration ParameterDeclaration Symbol
  | Empty Symbol
  deriving (Eq, Show)

data ClassItemProperty
  = ClassItemProperty
      [AttributeInstance]
      ClassProperty
  deriving (Eq, Show)

data ClassItemMethod
  = ClassItemMethod
      [AttributeInstance]
      ClassMethod
  deriving (Eq, Show)

data ClassItemConstraint
  = ClassItemConstraint
      [AttributeInstance]
      ClassConstraint
  deriving (Eq, Show)

data ClassItemDeclaration
  = ClassItemDeclaration
      [AttributeInstance]
      ClassDeclaration
  deriving (Eq, Show)

data ClassItemCovergroup
  = ClassItemCovergroup
      [AttributeInstance]
      CovergroupDeclaration
  deriving (Eq, Show)

data ClassProperty
  = MkClassPropertyNonConst ClassPropertyNonConst
  | MkClassPropertyConst ClassPropertyConst
  deriving (Eq, Show)

data ClassPropertyNonConst
  = ClassPropertyNonConst
      [PropertyQualifier]
      DataDeclaration
  deriving (Eq, Show)

data ClassPropertyConst
  = ClassPropertyConst
      Keyword
      [ClassItemQualifier]
      DataType
      ConstIdentifier
      (Maybe (Symbol, ClassPropertyConstExpression))
      Symbol
  deriving (Eq, Show)

data ClassPropertyConstExpression
  = MkConstantExpression ConstantExpression
  | MkClassNew ClassNew
  deriving (Eq, Show)

data ClassMethod
  = MkClassMethodTask ClassMethodTask
  | MkClassMethodFunction ClassMethodFunction
  | MkClassMethodPureVirtual ClassMethodPureVirtual
  | MkClassMethodExternMethod ClassMethodExternMethod
  | MkClassMethodConstructor ClassMethodConstructor
  | MkClassMethodExternConstructor ClassMethodExternConstructor
  deriving (Eq, Show)

data ClassMethodTask
  = ClassMethodTask
      [MethodQualifier]
      TaskDeclaration
  deriving (Eq, Show)

data ClassMethodFunction
  = ClassMethodFunction
      [MethodQualifier]
      FunctionDeclaration
  deriving (Eq, Show)

data ClassMethodPureVirtual
  = ClassMethodPureVirtual
      Keyword
      Keyword
      [ClassItemQualifier]
      MethodPrototype
      Symbol
  deriving (Eq, Show)

data ClassMethodExternMethod
  = ClassMethodExternMethod
      Keyword
      [MethodQualifier]
      MethodPrototype
      Symbol
  deriving (Eq, Show)

data ClassMethodConstructor
  = ClassMethodConstructor
      [MethodQualifier]
      ClassConstructorDeclaration
  deriving (Eq, Show)

data ClassMethodExternConstructor
  = ClassMethodExternConstructor
      Keyword
      [MethodQualifier]
      ClassConstructorPrototype
  deriving (Eq, Show)

data ClassConstructorPrototype
  = ClassConstructorPrototype
      Keyword
      Keyword
      (Maybe (Paren (Maybe TfPortList)))
      Symbol
  deriving (Eq, Show)

data ClassConstraint
  = MkConstraintPrototype ConstraintPrototype
  | MkConstraintDeclaration ConstraintDeclaration
  deriving (Eq, Show)

data ClassItemQualifier
  = Static Keyword
  | Protected Keyword
  | Local Keyword
  deriving (Eq, Show)

data PropertyQualifier
  = MkRandomQualifier RandomQualifier
  | MkClassItemQualifier ClassItemQualifier
  deriving (Eq, Show)

data RandomQualifier
  = Rand Keyword
  | Randc Keyword
  deriving (Eq, Show)

data MethodQualifier
  = Virtual Keyword
  | PureVirtual Keyword Keyword
  | MkMethodQualifierClassItemQualifier ClassItemQualifier
  deriving (Eq, Show)

data MethodPrototype
  = MkTaskPrototype TaskPrototype
  | MkFunctionPrototype FunctionPrototype
  deriving (Eq, Show)

data ClassConstructorDeclaration
  = ClassConstructorDeclaration
      Keyword
      (Maybe ClassScope)
      Keyword
      (Maybe (Paren (Maybe TfPortList)))
      Symbol
      [BlockItemDeclaration]
      (Maybe (Keyword, Symbol, Keyword, Maybe (Paren ListOfArguments), Symbol))
      [FunctionStatementOrNull]
      Keyword
      (Maybe (Symbol, New))
  deriving (Eq, Show)

data New = New Keyword deriving (Eq, Show)

deriveLit ''ClassItemDeclaration
deriveLit ''ClassItemCovergroup
deriveLit ''ClassPropertyConstExpression
deriveLit ''ClassConstructorPrototype
deriveLit ''ClassConstraint
deriveLit ''ClassItemQualifier
deriveLit ''RandomQualifier
deriveLit ''MethodQualifier
deriveLit ''MethodPrototype
deriveLit ''New
deriveLit ''ClassConstructorDeclaration
deriveLit ''PropertyQualifier
deriveLit ''ClassMethodTask
deriveLit ''ClassMethodFunction
deriveLit ''ClassMethodPureVirtual
deriveLit ''ClassMethodExternMethod
deriveLit ''ClassMethodConstructor
deriveLit ''ClassMethodExternConstructor
deriveLit ''ClassMethod
deriveLit ''ClassPropertyNonConst
deriveLit ''ClassPropertyConst
deriveLit ''ClassProperty
deriveLit ''ClassItemProperty
deriveLit ''ClassItemMethod
deriveLit ''ClassItemConstraint
deriveLit ''ClassItem