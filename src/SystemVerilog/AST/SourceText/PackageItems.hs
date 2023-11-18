{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SourceText.PackageItems where

import SystemVerilog.AST.SpecialNodes (Symbol, Keyword)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.TypeDeclarations (PackageExportDeclaration, NetDeclaration, DataDeclaration)
import SystemVerilog.AST.SourceText.SystemVerilogSourceText (TimeunitsDeclaration, CheckerDeclaration, ClassDeclaration, InterfaceClassDeclaration)
import SystemVerilog.AST.Declarations.TaskDeclarations (TaskDeclaration)
import SystemVerilog.AST.Declarations.FunctionDeclarations (FunctionDeclaration, DpiImportExport)
import SystemVerilog.AST.SourceText.Constraints (ExternConstraintDeclaration)
import SystemVerilog.AST.SourceText.ClassItems (ClassConstructorDeclaration)
import SystemVerilog.AST.Declarations.ModuleParameterDeclarations (LocalParameterDeclaration, ParameterDeclaration)
import SystemVerilog.AST.Declarations.CovergroupDeclarations (CovergroupDeclaration)
import {-# SOURCE #-} SystemVerilog.AST.Declarations.AssertionDeclarations (AssertionItemDeclaration)
import Util.Lit (deriveLit)

data PackageItem
    = MkPackageOrGenerateItemDeclaration PackageOrGenerateItemDeclaration
    | MkAnonymousProgram AnonymousProgram
    | MkPackageExportDeclaration PackageExportDeclaration
    | MkTimeunitsDeclaration TimeunitsDeclaration
    deriving (Eq, Show)

data PackageOrGenerateItemDeclaration
    = MkNetDeclaration NetDeclaration
    | MkDataDeclaration DataDeclaration
    | MkTaskDeclaration TaskDeclaration
    | MkFunctionDeclaration FunctionDeclaration
    | MkCheckerDeclaration CheckerDeclaration
    | MkDpiImportExport DpiImportExport
    | MkExternConstraintDeclaration ExternConstraintDeclaration
    | MkClassDeclaration ClassDeclaration
    | MkInterfaceClassDeclaration InterfaceClassDeclaration
    | MkClassConstructorDeclaration ClassConstructorDeclaration
    | MkLocalParameterDeclaration LocalParameterDeclaration Symbol
    | MkParameterDeclaration ParameterDeclaration Symbol
    | MkCovergroupDeclaration CovergroupDeclaration
    | MkAssertionItemDeclaration AssertionItemDeclaration
    | Empty Symbol
    deriving (Eq, Show)

data AnonymousProgram
    = AnonymousProgram
    Keyword
    Symbol
    [AnonymousProgramItem]
    Keyword
    deriving (Eq, Show)

data AnonymousProgramItem
    = MkAnonymousProgramItemTaskDeclaration TaskDeclaration
    | MkAnonymousProgramItemFunctionDeclaration FunctionDeclaration
    | MkAnonymousProgramItemClassDeclaration ClassDeclaration
    | MkAnonymousProgramItemInterfaceClassDeclaration InterfaceClassDeclaration
    | MkAnonymousProgramItemCovergroupDeclaration CovergroupDeclaration
    | MkAnonymousProgramItemClassConstructorDeclaration ClassConstructorDeclaration
    | MkEmpty Symbol
    deriving (Eq, Show)

deriveLit ''PackageOrGenerateItemDeclaration
deriveLit ''AnonymousProgramItem
deriveLit ''AnonymousProgram
deriveLit ''PackageItem