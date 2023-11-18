{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}

module SystemVerilog.AST.General.CompilerDirectives where

import qualified Data.Text as T
import SystemVerilog.AST.Expressions.Numbers (Number, UnsignedNumber)
import {-# SOURCE #-} SystemVerilog.AST.Expressions.Primaries (TimeUnit)
import SystemVerilog.AST.Expressions.Strings (StringLiteral)
import SystemVerilog.AST.General.Comments (Comment)
import {-# SOURCE #-} SystemVerilog.AST.General.Identifiers (EscapedIdentifier, Identifier, SimpleIdentifier)
import SystemVerilog.AST.Lib (Locate)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Splits, Symbol, WhiteSpace)
import Util.Lit (Lit(..))

data CompilerDirective
  = MkResetallCompilerDirective ResetallCompilerDirective
  | MkIncludeCompilerDirective IncludeCompilerDirective
  | MkTextMacroDefinition TextMacroDefinition
  | MkTextMacroUsage TextMacroUsage
  | MkUndefineCompilerDirective UndefineCompilerDirective
  | MkUndefineallCompilerDirective UndefineallCompilerDirective
  | MkConditionalCompilerDirective ConditionalCompilerDirective
  | MkTimescaleCompilerDirective TimescaleCompilerDirective
  | MkDefaultNettypeCompilerDirective DefaultNettypeCompilerDirective
  | MkUnconnectedDriveCompilerDirective UnconnectedDriveCompilerDirective
  | MkNounconnectedDriveCompilerDirective NounconnectedDriveCompilerDirective
  | MkCelldefineDriveCompilerDirective CelldefineDriveCompilerDirective
  | MkEndcelldefineDriveCompilerDirective EndcelldefineDriveCompilerDirective
  | MkPragma Pragma
  | MkLineCompilerDirective LineCompilerDirective
  | MkPositionCompilerDirective PositionCompilerDirective
  | MkKeywordsDirective KeywordsDirective
  | MkEndkeywordsDirective EndkeywordsDirective
  deriving (Eq, Show)

instance Lit CompilerDirective where
  lit (MkResetallCompilerDirective rcd) = lit rcd
  lit (MkIncludeCompilerDirective icd) = lit icd
  lit (MkTextMacroDefinition tmd) = lit tmd
  lit (MkTextMacroUsage tmu) = lit tmu
  lit (MkUndefineCompilerDirective ucd) = lit ucd
  lit (MkUndefineallCompilerDirective ucd) = lit ucd
  lit (MkConditionalCompilerDirective ccd) = lit ccd
  lit (MkTimescaleCompilerDirective tcd) = lit tcd
  lit (MkDefaultNettypeCompilerDirective x) = lit x
  lit (MkUnconnectedDriveCompilerDirective x) = lit x
  lit (MkNounconnectedDriveCompilerDirective x) = lit x
  lit (MkCelldefineDriveCompilerDirective x) = lit x
  lit (MkEndcelldefineDriveCompilerDirective x) = lit x
  lit (MkPragma x) = lit x
  lit (MkLineCompilerDirective x) = lit x
  lit (MkPositionCompilerDirective x) = lit x
  lit (MkKeywordsDirective x) = lit x
  lit (MkEndkeywordsDirective x) = lit x

data ResetallCompilerDirective
  = ResetallCompilerDirective
      Symbol
      Keyword
  deriving (Eq, Show)

instance Lit ResetallCompilerDirective where
  lit (ResetallCompilerDirective s k) = lit s `T.append` lit k

data IncludeCompilerDirective
  = MkIncludeCompilerDirectiveDoubleQuote IncludeCompilerDirectiveDoubleQuote
  | MkIncludeCompilerDirectiveAngleBracket IncludeCompilerDirectiveAngleBracket
  | MkIncludeCompilerDirectiveTextMacroUsage IncludeCompilerDirectiveTextMacroUsage
  deriving (Eq, Show)

instance Lit IncludeCompilerDirective where
  lit (MkIncludeCompilerDirectiveDoubleQuote x) = lit x
  lit (MkIncludeCompilerDirectiveAngleBracket x) = lit x
  lit (MkIncludeCompilerDirectiveTextMacroUsage x) = lit x

data IncludeCompilerDirectiveDoubleQuote
  = IncludeCompilerDirectiveDoubleQuote
      Symbol
      Keyword
      StringLiteral
  deriving (Eq, Show)

instance Lit IncludeCompilerDirectiveDoubleQuote where
  lit (IncludeCompilerDirectiveDoubleQuote s k sl) = T.concat [lit s, lit k, lit sl]

data IncludeCompilerDirectiveAngleBracket
  = IncludeCompilerDirectiveAngleBracket
      Symbol
      Keyword
      AngleBracketLiteral
  deriving (Eq, Show)

instance Lit IncludeCompilerDirectiveAngleBracket where
  lit (IncludeCompilerDirectiveAngleBracket s k abl) = T.concat [lit s, lit k, lit abl]

data IncludeCompilerDirectiveTextMacroUsage
  = IncludeCompilerDirectiveTextMacroUsage
      Symbol
      Keyword
      TextMacroUsage
  deriving (Eq, Show)

instance Lit IncludeCompilerDirectiveTextMacroUsage where
  lit (IncludeCompilerDirectiveTextMacroUsage s k tmu) = T.concat [lit s, lit k, lit tmu]

data AngleBracketLiteral
  = AngleBracketLiteral
      T.Text
      (Maybe Locate)
      [WhiteSpace]
  deriving (Eq, Show)

instance Lit AngleBracketLiteral where
  lit (AngleBracketLiteral t _ l) = t `T.append` lit l

data TextMacroDefinition
  = TextMacroDefinition
      Symbol
      Keyword
      TextMacroName
      (Maybe MacroText)
  deriving (Eq, Show)

instance Lit TextMacroDefinition where
  lit (TextMacroDefinition s k tmn m) = T.concat [lit s, lit k, lit tmn, lit m]

data TextMacroName
  = TextMacroName
      TextMacroIdentifier
      (Maybe (Paren ListOfFormalArguments))
  deriving (Eq, Show)

instance Lit TextMacroName where
  lit (TextMacroName tmi m) = lit tmi `T.append` lit m

data ListOfFormalArguments
  = ListOfFormalArguments
      (Splits Symbol FormalArgument)
  deriving (Eq, Show)

instance Lit ListOfFormalArguments where
  lit (ListOfFormalArguments x) = lit x

data FormalArgument
  = FormalArgument
      SimpleIdentifier
      (Maybe (Symbol, DefaultText))
  deriving (Eq, Show)

instance Lit FormalArgument where
  lit (FormalArgument s x) = lit s `T.append` lit x

data TextMacroIdentifier
  = TextMacroIdentifier
      Identifier
  deriving (Eq, Show)

instance Lit TextMacroIdentifier where
  lit (TextMacroIdentifier i) = lit i

data MacroText
  = MacroText
      T.Text
      (Maybe Locate)
  deriving (Eq, Show)

instance Lit MacroText where
  lit (MacroText t _) = t

data DefaultText
  = DefaultText
      T.Text
      (Maybe Locate)
  deriving (Eq, Show)

instance Lit DefaultText where
  lit (DefaultText t _) = t

data TextMacroUsage
  = TextMacroUsage
      Symbol
      TextMacroIdentifier
      (Maybe (Paren ListOfActualArguments))
  deriving (Eq, Show)

instance Lit TextMacroUsage where
  lit (TextMacroUsage s tmi x) = T.concat [lit s, lit tmi, lit x]

data ListOfActualArguments
  = ListOfActualArguments
      (Splits Symbol (Maybe ActualArgument))
  deriving (Eq, Show)

instance Lit ListOfActualArguments where
  lit (ListOfActualArguments x) = lit x

data ActualArgument 
  = ActualArgument 
      T.Text
      (Maybe Locate) 
      deriving (Eq, Show)

instance Lit ActualArgument where
  lit (ActualArgument t _) = t

data UndefineCompilerDirective
  = UndefineCompilerDirective
      Symbol
      Keyword
      TextMacroIdentifier
  deriving (Eq, Show)

instance Lit UndefineCompilerDirective where
  lit (UndefineCompilerDirective s k tmi) = T.concat [lit s, lit k, lit tmi]

data UndefineallCompilerDirective
  = UndefineallCompilerDirective
      Symbol
      Keyword
  deriving (Eq, Show)

instance Lit UndefineallCompilerDirective where
  lit (UndefineallCompilerDirective s k) = lit s `T.append` lit k

data ConditionalCompilerDirective
  = MkIfdefDirective IfdefDirective
  | MkIfndefDirective IfndefDirective
  deriving (Eq, Show)

instance Lit ConditionalCompilerDirective where
  lit (MkIfdefDirective x) = lit x
  lit (MkIfndefDirective x) = lit x

data IfdefDirective
  = IfdefDirective
      Symbol
      Keyword
      TextMacroIdentifier
      IfdefGroupOfLines
      [(Symbol, Keyword, TextMacroIdentifier, ElsifGroupOfLines)]
      (Maybe (Symbol, Keyword, ElseGroupOfLines))
      Symbol
      Keyword
  deriving (Eq, Show)

instance Lit IfdefDirective where
  lit (IfdefDirective a b c d e f g h) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g, lit h]

data IfndefDirective
  = IfndefDirective
      Symbol
      Keyword
      TextMacroIdentifier
      IfndefGroupOfLines
      [(Symbol, Keyword, TextMacroIdentifier, ElsifGroupOfLines)]
      (Maybe (Symbol, Keyword, ElseGroupOfLines))
      Symbol
      Keyword
  deriving (Eq, Show)

instance Lit IfndefDirective where
  lit (IfndefDirective a b c d e f g h) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g, lit h]

data IfdefGroupOfLines
  = IfdefGroupOfLines
      [SourceDescription]
  deriving (Eq, Show)

instance Lit IfdefGroupOfLines where
  lit (IfdefGroupOfLines l) = lit l

data IfndefGroupOfLines
  = IfndefGroupOfLines
      [SourceDescription]
  deriving (Eq, Show)

instance Lit IfndefGroupOfLines where
  lit (IfndefGroupOfLines l) = lit l

data ElsifGroupOfLines
  = ElsifGroupOfLines
      [SourceDescription]
  deriving (Eq, Show)

instance Lit ElsifGroupOfLines where
  lit (ElsifGroupOfLines l) = lit l

data ElseGroupOfLines
  = ElseGroupOfLines
      [SourceDescription]
  deriving (Eq, Show)

instance Lit ElseGroupOfLines where
  lit (ElseGroupOfLines l) = lit l

data SourceDescription
  = MkComment Comment
  | MkStringLiteral StringLiteral
  | MkSourceDescriptionNotDirective SourceDescriptionNotDirective
  | MkCompilerDirective CompilerDirective
  | MkEscapedIdentifier EscapedIdentifier
  deriving (Eq, Show)

instance Lit SourceDescription where
  lit (MkComment x) = lit x
  lit (MkStringLiteral x) = lit x
  lit (MkSourceDescriptionNotDirective x) = lit x
  lit (MkCompilerDirective x) = lit x
  lit (MkEscapedIdentifier x) = lit x

data SourceDescriptionNotDirective
  = SourceDescriptionNotDirective
      T.Text
      (Maybe Locate)
  deriving (Eq, Show)

instance Lit SourceDescriptionNotDirective where
  lit (SourceDescriptionNotDirective t _) = t

data TimescaleCompilerDirective
  = TimescaleCompilerDirective
      Symbol
      Keyword
      UnsignedNumber
      TimeUnit
      Symbol
      UnsignedNumber
      TimeUnit
  deriving (Eq, Show)

instance Lit TimescaleCompilerDirective where
  lit (TimescaleCompilerDirective a b c d e f g) = T.concat [lit a, lit b, lit c, lit d, lit e, lit f, lit g]

data DefaultNettypeCompilerDirective
  = DefaultNettypeCompilerDirective
      Symbol
      Keyword
      DefaultNettypeValue
  deriving (Eq, Show)

instance Lit DefaultNettypeCompilerDirective where
  lit (DefaultNettypeCompilerDirective s k dnv) = T.concat [lit s, lit k, lit dnv]

data DefaultNettypeValue
  = DefaultNettypeValue
      Keyword
  deriving (Eq, Show)

instance Lit DefaultNettypeValue where
  lit (DefaultNettypeValue k) = lit k

data UnconnectedDriveCompilerDirective
  = UnconnectedDriveCompilerDirective
      Symbol
      Keyword
      Keyword
  deriving (Eq, Show)

instance Lit UnconnectedDriveCompilerDirective where
  lit (UnconnectedDriveCompilerDirective s k1 k2) = T.concat [lit s, lit k1, lit k2]

data NounconnectedDriveCompilerDirective
  = NounconnectedDriveCompilerDirective
      Symbol
      Keyword
  deriving (Eq, Show)

instance Lit NounconnectedDriveCompilerDirective where
  lit (NounconnectedDriveCompilerDirective s k) = lit s `T.append` lit k

data CelldefineDriveCompilerDirective
  = CelldefineDriveCompilerDirective
      Symbol
      Keyword
  deriving (Eq, Show)

instance Lit CelldefineDriveCompilerDirective where
  lit (CelldefineDriveCompilerDirective s k) = lit s `T.append` lit k

data EndcelldefineDriveCompilerDirective
  = EndcelldefineDriveCompilerDirective
      Symbol
      Keyword
  deriving (Eq, Show)

instance Lit EndcelldefineDriveCompilerDirective where
  lit (EndcelldefineDriveCompilerDirective s k) = lit s `T.append` lit k

data Pragma
  = Pragma
      Symbol
      Keyword
      PragmaName
      (Maybe (Splits Symbol PragmaExpression))
  deriving (Eq, Show)

instance Lit Pragma where
  lit (Pragma a b c d) = T.concat [lit a, lit b, lit c, lit d]

data PragmaName = PragmaName SimpleIdentifier deriving (Eq, Show)

instance Lit PragmaName where
  lit (PragmaName si) = lit si

data PragmaExpression
  = MkPragmaKeyword PragmaKeyword
  | MkPragmaExpressionAssignment PragmaExpressionAssignment
  | MkPragmaValue PragmaValue
  deriving (Eq, Show)

instance Lit PragmaExpression where
  lit (MkPragmaKeyword x) = lit x
  lit (MkPragmaExpressionAssignment a) = lit a
  lit (MkPragmaValue v) = lit v 

data PragmaExpressionAssignment
  = PragmaExpressionAssignment
      PragmaKeyword
      Symbol
      PragmaValue
  deriving (Eq, Show)

instance Lit PragmaExpressionAssignment where
  lit (PragmaExpressionAssignment pk s pv) = T.concat [lit pk, lit s, lit pv]

data PragmaValue
  = MkPragmaValueParen PragmaValueParen
  | MkNumber Number
  | MkPragmaValueStringLiteral StringLiteral
  | MkIdentifier Identifier
  deriving (Eq, Show)

instance Lit PragmaValue where
  lit (MkPragmaValueParen pvp) = lit pvp
  lit (MkNumber n) = lit n
  lit (MkPragmaValueStringLiteral sl) = lit sl
  lit (MkIdentifier i) = lit i

data PragmaValueParen
  = PragmaValueParen
      (Paren (Splits Symbol PragmaExpression))
  deriving (Eq, Show)

instance Lit PragmaValueParen where
  lit (PragmaValueParen pvp) = lit pvp

data PragmaKeyword = PragmaKeyword SimpleIdentifier deriving (Eq, Show)

instance Lit PragmaKeyword where
  lit (PragmaKeyword i) = lit i

data LineCompilerDirective
  = LineCompilerDirective
      Symbol
      Keyword
      Number
      StringLiteral
      Level
  deriving (Eq, Show)

instance Lit LineCompilerDirective where
  lit (LineCompilerDirective a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data PositionCompilerDirective
  = PositionCompilerDirective
      Symbol
      Keyword
  deriving (Eq, Show)

instance Lit PositionCompilerDirective where
  lit (PositionCompilerDirective s k) = lit s `T.append` lit k

data Level = Level Symbol deriving (Eq, Show)

instance Lit Level where
  lit (Level s) = lit s

data KeywordsDirective
  = KeywordsDirective
      Symbol
      Keyword
      Symbol
      VersionSpecifier
      Symbol
  deriving (Eq, Show)

instance Lit KeywordsDirective where
  lit (KeywordsDirective a b c d e) = T.concat [lit a, lit b, lit c, lit d, lit e]

data VersionSpecifier = VersionSpecifier Keyword deriving (Eq, Show)

instance Lit VersionSpecifier where
  lit (VersionSpecifier k) = lit k

data EndkeywordsDirective
  = EndkeywordsDirective
      Symbol
      Keyword
  deriving (Eq, Show)

instance Lit EndkeywordsDirective where
  lit (EndkeywordsDirective s k) = lit s `T.append` lit k