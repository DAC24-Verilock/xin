module SystemVerilog.AST.General.CompilerDirectives where
    
import Util.Lit (Lit)

data CompilerDirective

instance Eq CompilerDirective

instance Show CompilerDirective

instance Lit CompilerDirective

data ResetallCompilerDirective

instance Eq ResetallCompilerDirective

instance Show ResetallCompilerDirective

instance Lit ResetallCompilerDirective

data IncludeCompilerDirective

instance Eq IncludeCompilerDirective

instance Show IncludeCompilerDirective

instance Lit IncludeCompilerDirective

data IncludeCompilerDirectiveDoubleQuote

instance Eq IncludeCompilerDirectiveDoubleQuote

instance Show IncludeCompilerDirectiveDoubleQuote

instance Lit IncludeCompilerDirectiveDoubleQuote

data IncludeCompilerDirectiveAngleBracket

instance Eq IncludeCompilerDirectiveAngleBracket

instance Show IncludeCompilerDirectiveAngleBracket

instance Lit IncludeCompilerDirectiveAngleBracket

data IncludeCompilerDirectiveTextMacroUsage

instance Eq IncludeCompilerDirectiveTextMacroUsage

instance Show IncludeCompilerDirectiveTextMacroUsage

instance Lit IncludeCompilerDirectiveTextMacroUsage

data AngleBracketLiteral

instance Eq AngleBracketLiteral

instance Show AngleBracketLiteral

instance Lit AngleBracketLiteral

data TextMacroDefinition

instance Eq TextMacroDefinition

instance Show TextMacroDefinition

instance Lit TextMacroDefinition

data TextMacroName

instance Eq TextMacroName

instance Show TextMacroName

instance Lit TextMacroName

data ListOfFormalArguments

instance Eq ListOfFormalArguments

instance Show ListOfFormalArguments

instance Lit ListOfFormalArguments

data FormalArgument

instance Eq FormalArgument

instance Show FormalArgument

instance Lit FormalArgument

data TextMacroIdentifier

instance Eq TextMacroIdentifier

instance Show TextMacroIdentifier

instance Lit TextMacroIdentifier

data MacroText

instance Eq MacroText

instance Show MacroText

instance Lit MacroText

data DefaultText

instance Eq DefaultText

instance Show DefaultText

instance Lit DefaultText

data TextMacroUsage

instance Eq TextMacroUsage

instance Show TextMacroUsage

instance Lit TextMacroUsage

data ListOfActualArguments

instance Eq ListOfActualArguments

instance Show ListOfActualArguments

instance Lit ListOfActualArguments

data ActualArgument

instance Eq ActualArgument

instance Show ActualArgument

instance Lit ActualArgument

data UndefineCompilerDirective

instance Eq UndefineCompilerDirective

instance Show UndefineCompilerDirective

instance Lit UndefineCompilerDirective

data UndefineallCompilerDirective

instance Eq UndefineallCompilerDirective

instance Show UndefineallCompilerDirective

instance Lit UndefineallCompilerDirective

data ConditionalCompilerDirective

instance Eq ConditionalCompilerDirective

instance Show ConditionalCompilerDirective

instance Lit ConditionalCompilerDirective

data IfdefDirective

instance Eq IfdefDirective

instance Show IfdefDirective

instance Lit IfdefDirective

data IfndefDirective

instance Eq IfndefDirective

instance Show IfndefDirective

instance Lit IfndefDirective

data IfdefGroupOfLines

instance Eq IfdefGroupOfLines

instance Show IfdefGroupOfLines

instance Lit IfdefGroupOfLines

data IfndefGroupOfLines

instance Eq IfndefGroupOfLines

instance Show IfndefGroupOfLines

instance Lit IfndefGroupOfLines

data ElsifGroupOfLines

instance Eq ElsifGroupOfLines

instance Show ElsifGroupOfLines

instance Lit ElsifGroupOfLines

data ElseGroupOfLines

instance Eq ElseGroupOfLines

instance Show ElseGroupOfLines

instance Lit ElseGroupOfLines

data SourceDescription

instance Eq SourceDescription

instance Show SourceDescription

instance Lit SourceDescription

data SourceDescriptionNotDirective

instance Eq SourceDescriptionNotDirective

instance Show SourceDescriptionNotDirective

instance Lit SourceDescriptionNotDirective

data TimescaleCompilerDirective

instance Eq TimescaleCompilerDirective

instance Show TimescaleCompilerDirective

instance Lit TimescaleCompilerDirective

data DefaultNettypeCompilerDirective

instance Eq DefaultNettypeCompilerDirective

instance Show DefaultNettypeCompilerDirective

instance Lit DefaultNettypeCompilerDirective

data DefaultNettypeValue

instance Eq DefaultNettypeValue

instance Show DefaultNettypeValue

instance Lit DefaultNettypeValue

data UnconnectedDriveCompilerDirective

instance Eq UnconnectedDriveCompilerDirective

instance Show UnconnectedDriveCompilerDirective

instance Lit UnconnectedDriveCompilerDirective

data NounconnectedDriveCompilerDirective

instance Eq NounconnectedDriveCompilerDirective

instance Show NounconnectedDriveCompilerDirective

instance Lit NounconnectedDriveCompilerDirective

data CelldefineDriveCompilerDirective

instance Eq CelldefineDriveCompilerDirective

instance Show CelldefineDriveCompilerDirective

instance Lit CelldefineDriveCompilerDirective

data EndcelldefineDriveCompilerDirective

instance Eq EndcelldefineDriveCompilerDirective

instance Show EndcelldefineDriveCompilerDirective

instance Lit EndcelldefineDriveCompilerDirective

data Pragma

instance Eq Pragma

instance Show Pragma

instance Lit Pragma

data PragmaName

instance Eq PragmaName

instance Show PragmaName

instance Lit PragmaName

data PragmaExpression

instance Eq PragmaExpression

instance Show PragmaExpression

instance Lit PragmaExpression

data PragmaExpressionAssignment

instance Eq PragmaExpressionAssignment

instance Show PragmaExpressionAssignment

instance Lit PragmaExpressionAssignment

data PragmaValue

instance Eq PragmaValue

instance Show PragmaValue

instance Lit PragmaValue

data PragmaValueParen

instance Eq PragmaValueParen

instance Show PragmaValueParen

instance Lit PragmaValueParen

data PragmaKeyword

instance Eq PragmaKeyword

instance Show PragmaKeyword

instance Lit PragmaKeyword

data LineCompilerDirective

instance Eq LineCompilerDirective

instance Show LineCompilerDirective

instance Lit LineCompilerDirective

data PositionCompilerDirective

instance Eq PositionCompilerDirective

instance Show PositionCompilerDirective

instance Lit PositionCompilerDirective

data Level

instance Eq Level

instance Show Level

instance Lit Level

data KeywordsDirective

instance Eq KeywordsDirective

instance Show KeywordsDirective

instance Lit KeywordsDirective

data VersionSpecifier

instance Eq VersionSpecifier

instance Show VersionSpecifier

instance Lit VersionSpecifier

data EndkeywordsDirective

instance Eq EndkeywordsDirective

instance Show EndkeywordsDirective

instance Lit EndkeywordsDirective