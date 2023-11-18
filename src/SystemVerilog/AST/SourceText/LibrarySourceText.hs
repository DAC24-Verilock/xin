{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.SourceText.LibrarySourceText where

import SystemVerilog.AST.Expressions.Strings (StringLiteral)
import SystemVerilog.AST.General.Identifiers (LibraryIdentifier)
import SystemVerilog.AST.Lib (Locate)
import SystemVerilog.AST.SourceText.ConfigurationSourceText (ConfigDeclaration)
import SystemVerilog.AST.SpecialNodes (Keyword, Splits, Symbol, WhiteSpace)
import Util.Lit (deriveLit)

data LibraryText
  = LibraryText
      [WhiteSpace]
      [LibraryDescription]
  deriving (Eq, Show)

data LibraryDescription
  = MkLibraryDeclaration LibraryDeclaration
  | MkIncludeStatement IncludeStatement
  | MkConfigDeclaration ConfigDeclaration
  | Null Symbol
  deriving (Eq, Show)

data LibraryDeclaration
  = LibraryDeclaration
      Keyword
      LibraryIdentifier
      (Splits Symbol FilePathSpec)
      (Maybe (Keyword, Splits Symbol FilePathSpec))
      Symbol
  deriving (Eq, Show)

data IncludeStatement
  = IncludeStatement
      Keyword
      FilePathSpec
      Symbol
  deriving (Eq, Show)

data FilePathSpec
  = MkStringLiteral StringLiteral
  | MkFilePathSpecNonLiteral FilePathSpecNonLiteral
  deriving (Eq, Show)

data FilePathSpecNonLiteral
  = FilePathSpecNonLiteral
      Locate
      [WhiteSpace]
  deriving (Eq, Show)

deriveLit ''FilePathSpecNonLiteral
deriveLit ''FilePathSpec
deriveLit ''LibraryDeclaration
deriveLit ''IncludeStatement
deriveLit ''LibraryDescription
deriveLit ''LibraryText