{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Eta reduce" #-}

module Synthesis.Blocks where

import qualified Data.List.NonEmpty as NE
import Data.Text (pack)
import qualified Data.Text as T
import SystemVerilog.AST.BehavioralStatements.ConditionalStatements (CondPredicate (..), ExpressionOrCondPattern (MkExpression), ConditionalStatement (ConditionalStatement))
import SystemVerilog.AST.BehavioralStatements.ProceduralBlocksAndAssignments (AlwaysConstruct (AlwaysConstruct), AlwaysKeyword (Always))
import SystemVerilog.AST.BehavioralStatements.Statements (Statement (..), StatementItem (MkSubroutineCallStatement, MkSeqBlock, MkConditionalStatement, MkLoopStatement, MkParBlock), StatementOrNull (MkStatement))
import SystemVerilog.AST.BehavioralStatements.SubroutineCallStatements
  ( SubroutineCallStatement (MkSubroutineCall),
  )
import SystemVerilog.AST.Declarations.DeclarationAssignments (VariableDeclAssignment (..), VariableDeclAssignmentVariable (VariableDeclAssignmentVariable))
import SystemVerilog.AST.Declarations.DeclarationLists (ListOfVariableDeclAssignments (..))
import SystemVerilog.AST.Declarations.DeclarationRanges (PackedDimension (..), PackedDimensionRange (PackedDimensionRange))
import SystemVerilog.AST.Declarations.NetAndVariableTypes (DataType (MkDataTypeVector), DataTypeOrImplicit (MkDataType), DataTypeVector (DataTypeVector), IntegerVectorType (Logic))
import SystemVerilog.AST.Declarations.TypeDeclarations (DataDeclaration (MkDataDeclarationVariable), DataDeclarationVariable (DataDeclarationVariable))
import SystemVerilog.AST.Expressions.Expressions (ConstantExpression (MkConstantPrimary), ConstantRange (ConstantRange), Expression (MkExpressionBinary, Primary), ExpressionBinary (..))
import SystemVerilog.AST.Expressions.Numbers (DecimalNumber (MKUnsignedNumber), IntegralNumber (MkDecimalNumber), Number (..), UnsignedNumber (UnsignedNumber))
import SystemVerilog.AST.Expressions.Operators (BinaryOperator (BinaryOperator))
import SystemVerilog.AST.Expressions.Primaries (BitSelect (BitSelect), ConstantBitSelect (..), ConstantPrimary (MkConstantPrimaryPrimaryLiteral), Primary (MkPrimaryHierarchical, MkPrimaryLiteral), PrimaryHierarchical (PrimaryHierarchical), PrimaryLiteral (MkPrimaryLiteralNumber), Select (Select))
import SystemVerilog.AST.Expressions.Strings (StringLiteral (..))
import SystemVerilog.AST.Expressions.SubroutineCalls
  ( ListOfArguments (..),
    ListOfArgumentsOrdered (ListOfArgumentsOrdered),
    SubroutineCall (MkTfCall),
    TfCall (..)
  )
import SystemVerilog.AST.General.CompilerDirectives
  ( CompilerDirective (MkIncludeCompilerDirective),
    IncludeCompilerDirective (..),
    IncludeCompilerDirectiveDoubleQuote (..),
  )
import SystemVerilog.AST.General.Identifiers (HierarchicalIdentifier (..), HierarchicalTfIdentifier (HierarchicalTfIdentifier), Identifier (MkSimpleIdentifier), InstanceIdentifier (InstanceIdentifier), ModuleIdentifier (..), PortIdentifier (PortIdentifier), PsOrHierarchicalTfIdentifier (MkHierarchicalTfIdentifier), SimpleIdentifier (..), VariableIdentifier (VariableIdentifier))
import SystemVerilog.AST.Instantiations.ModuleInstantiation (HierarchicalInstance (..), ListOfPortConnections (MkListOfPortConnectionsOrdered), ListOfPortConnectionsOrdered (ListOfPortConnectionsOrdered), ModuleInstantiation (ModuleInstantiation), NameOfInstance (NameOfInstance), OrderedPortConnection (..))
import SystemVerilog.AST.SourceText.ModuleItems
  ( ModuleCommonItem
      ( MkAlwaysConstruct,
        MkModuleOrGenerateItemDeclaration
      ),
    ModuleOrGenerateItem
      ( MkModuleOrGenerateItemModule,
        MkModuleOrGenerateItemModuleItem
      ),
    ModuleOrGenerateItemDeclaration (..),
    ModuleOrGenerateItemModule (..),
    ModuleOrGenerateItemModuleItem (ModuleOrGenerateItemModuleItem),
    NonPortModuleItem (MkModuleOrGenerateItem),
  )
import SystemVerilog.AST.SourceText.ModuleParametersAndPorts (AnsiPortDeclaration (MkAnsiPortDeclarationNet), AnsiPortDeclarationNet (AnsiPortDeclarationNet), InterfacePortHeader (MkInterfacePortHeaderInterface), InterfacePortHeaderInterface (InterfacePortHeaderInterface), ListOfPortDeclarations (..), NetPortHeaderOrInterfacePortHeader (MkInterfacePortHeader))
import SystemVerilog.AST.SourceText.PackageItems (PackageOrGenerateItemDeclaration (..))
import SystemVerilog.AST.SourceText.SystemVerilogSourceText (Description (MkModuleDeclaration), ModuleAnsiHeader (..), ModuleDeclaration (MkModuleDeclarationAnsi), ModuleDeclarationAnsi (ModuleDeclarationAnsi), ModuleKeyword (Module), SourceText (SourceText))
import SystemVerilog.AST.SpecialNodes (Bracket (Bracket), Keyword (..), Paren (..), Splits (Splits), Symbol (..), WhiteSpace (..))
import SystemVerilog.AST.BehavioralStatements.ParallelAndSequentialBlocks (SeqBlock (SeqBlock), JoinKeyword (Join), ParBlock (ParBlock))
import SystemVerilog.AST.BehavioralStatements.LoopingStatements (LoopStatementWhile(..), LoopStatement (MkLoopStatementWhile))

mkSourceText :: [WhiteSpace] -> [Description] -> SourceText
mkSourceText ws l = SourceText ws Nothing l

mkIncludeChannel :: WhiteSpace
mkIncludeChannel = CompilerDirective . MkIncludeCompilerDirective . mkInclude . stringLiteralDoubleLine $ "Channel.sv"

mkInclude :: StringLiteral -> IncludeCompilerDirective
mkInclude s =
  MkIncludeCompilerDirectiveDoubleQuote
    ( IncludeCompilerDirectiveDoubleQuote
        (symbol "`")
        includeKeyword
        s
    )

mkModule :: ModuleAnsiHeader -> [NonPortModuleItem] -> Description
mkModule h l =
  MkModuleDeclaration . MkModuleDeclarationAnsi $
    ModuleDeclarationAnsi
      h
      Nothing
      l
      endmoduleKeyword
      Nothing

mkSeqBlock :: [Statement] -> Statement
mkSeqBlock l =
  Statement Nothing []
  . MkSeqBlock
  $ SeqBlock
    beginKeyword
    Nothing
    []
    (MkStatement <$> l)
    endKeyword
    Nothing

mkWhileBlock ::
  Expression ->
  Statement ->
  Statement
mkWhileBlock c t =
  Statement Nothing []
  . MkLoopStatement
  . MkLoopStatementWhile
  $ LoopStatementWhile
  whileKeyword
  (paren c)
  (MkStatement t)

mkParBlock ::[Statement] -> Statement
mkParBlock c = 
  Statement Nothing []
  . MkParBlock
  $ ParBlock
     forkKeyword
     Nothing
     []
     (MkStatement <$> c)
     joinKeyword
     Nothing

mkConditionalBlock ::
  CondPredicate ->
  Statement ->
  Statement ->
  Statement
mkConditionalBlock c t e =
  Statement Nothing []
  . MkConditionalStatement
  $ ConditionalStatement
    Nothing
    ifKeyword
    (paren c)
    (Splits (MkStatement t) [])
    (Just (elseKeyword, MkStatement e))

mkAlwaysBlock :: [Statement] -> NonPortModuleItem
mkAlwaysBlock l =
  MkModuleOrGenerateItem . MkModuleOrGenerateItemModuleItem $
    ModuleOrGenerateItemModuleItem
      []
      ( MkAlwaysConstruct $
          AlwaysConstruct
            alwaysKeyword
            (mkSeqBlock l)
      )

mkTopModuleHeader :: Identifier -> ModuleAnsiHeader
mkTopModuleHeader i =
  ModuleAnsiHeader
    []
    moduleKeyword
    Nothing
    (ModuleIdentifier i)
    []
    Nothing
    Nothing
    semicolon

mkModuleHeader :: Identifier -> ListOfPortDeclarations -> ModuleAnsiHeader
mkModuleHeader i l =
  ModuleAnsiHeader
    []
    moduleKeyword
    Nothing
    (ModuleIdentifier i)
    []
    Nothing
    (Just l)
    semicolon

mkModuleParameters :: [Identifier] -> ListOfPortDeclarations
mkModuleParameters = mkModulePorts . map mkChannelPort

mkChannelPort :: Identifier -> AnsiPortDeclaration
mkChannelPort i =
  MkAnsiPortDeclarationNet $
    AnsiPortDeclarationNet
      (Just mkInterfacePortHeader)
      (PortIdentifier i)
      []
      Nothing

mkInterfacePortHeader :: NetPortHeaderOrInterfacePortHeader
mkInterfacePortHeader =
  MkInterfacePortHeader . MkInterfacePortHeaderInterface $
    InterfacePortHeaderInterface
      interfaceKeyword
      Nothing

mkModulePorts :: [AnsiPortDeclaration] -> ListOfPortDeclarations
mkModulePorts [] = ListOfPortDeclarations . paren $ Nothing
mkModulePorts (x : xs) =
  ListOfPortDeclarations . paren . Just $
    Splits
      ([], x)
      (map (\y -> (commaNewline, ([], y))) xs)

mkChannelInstantiation :: Identifier -> NonPortModuleItem
mkChannelInstantiation i =
  MkModuleOrGenerateItem . MkModuleOrGenerateItemModule . ModuleOrGenerateItemModule [] $
    mkModuleInstantiation
      mkChannel
      ( HierarchicalInstance
          (NameOfInstance (InstanceIdentifier i) [])
          (paren Nothing)
      )

mkCustomModuleInstantiation :: Identifier -> Identifier -> NE.NonEmpty Identifier -> NonPortModuleItem
mkCustomModuleInstantiation a b args =
  MkModuleOrGenerateItem . MkModuleOrGenerateItemModule . ModuleOrGenerateItemModule [] $
    mkModuleInstantiation
      (ModuleIdentifier a)
      ( HierarchicalInstance
          (NameOfInstance (InstanceIdentifier b) [])
          (paren . Just . mkListOfPortConnections $ args)
      )

mkListOfPortConnections :: NE.NonEmpty Identifier -> ListOfPortConnections
mkListOfPortConnections l =
  MkListOfPortConnectionsOrdered . ListOfPortConnectionsOrdered $
    Splits
      (mkOrderedPortConnection . NE.head $ l)
      ((\x -> (comma, mkOrderedPortConnection x)) <$> NE.tail l)

mkOrderedPortConnection :: Identifier -> OrderedPortConnection
mkOrderedPortConnection s =
  OrderedPortConnection [] (Just . mkExpressionFromIdentifier $ s)

mkModuleInstantiation :: ModuleIdentifier -> HierarchicalInstance -> ModuleInstantiation
mkModuleInstantiation i hi =
  ModuleInstantiation
    i
    Nothing
    (Splits hi [])
    semicolon

mkCondPredict :: ExpressionBinary -> CondPredicate
mkCondPredict e =
  CondPredicate $
    Splits
      (MkExpression . MkExpressionBinary $ e)
      []

mkExpressionBinary :: Expression -> BinaryOperator -> Expression -> ExpressionBinary
mkExpressionBinary e1 o e2 = ExpressionBinary e1 o [] e2

mkLogicVariableDeclaration :: Identifier -> NonPortModuleItem
mkLogicVariableDeclaration i =
  MkModuleOrGenerateItem
    . MkModuleOrGenerateItemModuleItem
    . ModuleOrGenerateItemModuleItem []
    . MkModuleOrGenerateItemDeclaration
    . MkPackageOrGenerateItemDeclaration
    . MkDataDeclaration
    $ mkLogicVariableDeclaration' i Nothing

mkLogicVariableDeclarationAssign :: Identifier -> Expression -> DataDeclaration
mkLogicVariableDeclarationAssign i e = mkLogicVariableDeclaration' i (Just e)

mkLogicVariableDeclaration' :: Identifier -> Maybe Expression -> DataDeclaration
mkLogicVariableDeclaration' i e =
  MkDataDeclarationVariable $
    DataDeclarationVariable
      Nothing
      Nothing
      Nothing
      mkEightBitLogicType
      ( ListOfVariableDeclAssignments $
          Splits
            ( MkVariableDeclAssignmentVariable $
                VariableDeclAssignmentVariable
                  (VariableIdentifier i)
                  []
                  (((,) equal)  <$> e)
            )
            []
      )
      semicolon

mkEightBitLogicType :: DataTypeOrImplicit
mkEightBitLogicType =
  MkDataType . MkDataTypeVector $
    DataTypeVector
      (Logic logicKeyword)
      Nothing
      [eightBitDimension]
  where
    eightBitDimension =
      MkPackedDimensionRange . PackedDimensionRange . bracket $
        ConstantRange
          (MkConstantPrimary . MkConstantPrimaryPrimaryLiteral $ mkNumberLiteral' 7 Nothing)
          colon
          (MkConstantPrimary . MkConstantPrimaryPrimaryLiteral $ mkNumberLiteral' 0 Nothing)

mkSendStatementConstant :: Identifier -> Int -> Statement
mkSendStatementConstant id1 i = mkSimpleTaskCallStatement id1 sendTaskId [mkNumberExpression i]

mkSendStatementVariable :: Identifier -> Identifier -> Statement
mkSendStatementVariable id1 v = mkSimpleTaskCallStatement id1 sendTaskId [mkExpressionFromIdentifier v]

mkReceiveStatement :: Identifier -> Identifier -> Statement
mkReceiveStatement id1 v = mkSimpleTaskCallStatement id1 receiveTaskId [mkExpressionFromIdentifier v]

mkSimpleTaskCallStatement :: Identifier -> Identifier -> [Expression] -> Statement
mkSimpleTaskCallStatement id1 id2 l =
  Statement
    Nothing
    []
    ( MkSubroutineCallStatement
        ( MkSubroutineCall
            ( MkTfCall
                ( mkTfCall
                    (MkHierarchicalTfIdentifier . HierarchicalTfIdentifier $ mkSimpleHierarchicalIdentifier id1 id2)
                    (argumentsToListOfArguments l)
                )
            )
            semicolon
        )
    )

argumentsToListOfArguments :: [Expression] -> ListOfArguments
argumentsToListOfArguments [] = MkListOfArgumentsOrdered (ListOfArgumentsOrdered (Splits Nothing []) [])
argumentsToListOfArguments (x : xs) =
  MkListOfArgumentsOrdered
    ( ListOfArgumentsOrdered
        (Splits (Just x) (map (\y -> (comma, Just y)) xs))
        []
    )

mkTfCall :: PsOrHierarchicalTfIdentifier -> ListOfArguments -> TfCall
mkTfCall i l = TfCall i [] (Just (Paren leftParen l rightParen))

mkSimpleHierarchicalIdentifier :: Identifier -> Identifier -> HierarchicalIdentifier
mkSimpleHierarchicalIdentifier id1 id2 =
  HierarchicalIdentifier
    Nothing
    [(id1, ConstantBitSelect [], dot)]
    id2

mkIdentifierExpression :: String -> Expression
mkIdentifierExpression s =
  Primary . MkPrimaryHierarchical $
    PrimaryHierarchical
      Nothing
      (HierarchicalIdentifier Nothing [] (identifier s))
      mkEmptySelect

mkChannel :: ModuleIdentifier
mkChannel = ModuleIdentifier . identifierOneSpace $ "Channel"

mkEmptySelect :: Select
mkEmptySelect =
  Select
    Nothing
    (BitSelect [])
    Nothing

mkExpressionFromIdentifier :: Identifier -> Expression
mkExpressionFromIdentifier i =
  Primary . MkPrimaryHierarchical $
    PrimaryHierarchical
      Nothing
      (HierarchicalIdentifier Nothing [] i)
      mkEmptySelect

mkNumberExpression :: Int -> Expression
mkNumberExpression i = Primary . MkPrimaryLiteral $ mkNumberLiteral' i Nothing

mkNumberExpressionOneSpace :: Int -> Expression
mkNumberExpressionOneSpace i = Primary . MkPrimaryLiteral $ mkNumberLiteral' i (Just singleSpace)

mkNumberLiteral' :: Int -> Maybe WhiteSpace -> PrimaryLiteral
mkNumberLiteral' i s =
  MkPrimaryLiteralNumber . MkIntegralNumber . MkDecimalNumber . MKUnsignedNumber $
    UnsignedNumber
      (pack . show $ i)
      Nothing
      (renderSpace s)
  where
    renderSpace Nothing = []
    renderSpace (Just ws) = [ws]

------------------
-- basic blocks --
------------------

symbol :: String -> Symbol
symbol s = Symbol (pack s) Nothing []

mkKeyword :: String -> Keyword
mkKeyword s = Keyword (pack s) Nothing []

symbolOneSpace :: String -> Symbol
symbolOneSpace s = Symbol (pack s) Nothing [singleSpace]

keywordOneSpace :: String -> Keyword
keywordOneSpace s = Keyword (pack s) Nothing [singleSpace]

symbolNewline :: String -> Symbol
symbolNewline s = Symbol (pack s) Nothing [singeNewline]

keywordNewline :: String -> Keyword
keywordNewline s = Keyword (pack s) Nothing [singeNewline]

keywordDoubleLine :: String -> Keyword
keywordDoubleLine s = Keyword (pack s) Nothing [singeNewline, singeNewline]

stringLiteral :: String -> StringLiteral
stringLiteral s = StringLiteral (pack ("\"" ++ s ++ "\"")) Nothing []

stringLiteralOneSpace :: String -> StringLiteral
stringLiteralOneSpace s = StringLiteral (pack ("\"" ++ s ++ "\"")) Nothing [singleSpace]

stringLiteralNewline :: String -> StringLiteral
stringLiteralNewline s = StringLiteral (pack ("\"" ++ s ++ "\"")) Nothing [singeNewline]

stringLiteralDoubleLine :: String -> StringLiteral
stringLiteralDoubleLine s = StringLiteral (pack ("\"" ++ s ++ "\"")) Nothing [singeNewline, singeNewline]

identifier :: String -> Identifier
identifier s = MkSimpleIdentifier $ SimpleIdentifier (pack s) Nothing []

identifierOneSpace :: String -> Identifier
identifierOneSpace s = MkSimpleIdentifier $ SimpleIdentifier (pack s) Nothing [singleSpace]

sendTaskId :: Identifier
sendTaskId = identifier "Send"

receiveTaskId :: Identifier
receiveTaskId = identifier "Receive"

singleSpace :: WhiteSpace
singleSpace = Space (T.pack " ") Nothing

singeNewline :: WhiteSpace
singeNewline = Newline (T.pack "\n") Nothing

semicolon :: Symbol
semicolon = Symbol (T.pack ";") Nothing [singeNewline]

paren :: a -> Paren a
paren x = Paren leftParen x rightParen

bracket :: a -> Bracket a
bracket x = Bracket leftBracket x rightBracket

leftParen :: Symbol
leftParen = symbol "("

rightParen :: Symbol
rightParen = symbolOneSpace ")"

leftBracket :: Symbol
leftBracket = symbol "["

rightBracket :: Symbol
rightBracket = symbolOneSpace "]"

dot :: Symbol
dot = symbol "."

colon :: Symbol
colon = symbol ":"

equal :: Symbol
equal = symbol "="

comma :: Symbol
comma = symbolOneSpace ","

commaNewline :: Symbol
commaNewline = symbolNewline ","

add :: BinaryOperator
add = BinaryOperator . symbol $ "+"

minus :: BinaryOperator
minus = BinaryOperator . symbol $ "-"

gt :: BinaryOperator
gt = BinaryOperator . symbol $ ">"

ge :: BinaryOperator
ge = BinaryOperator . symbol $ ">="

lt :: BinaryOperator
lt = BinaryOperator . symbol $ "<"

le :: BinaryOperator
le = BinaryOperator . symbol $ "<="

doubleEqual :: BinaryOperator
doubleEqual = BinaryOperator . symbol $ "=="

notEqual :: BinaryOperator
notEqual = BinaryOperator . symbol $ "!="

interfaceKeyword :: Keyword
interfaceKeyword = keywordOneSpace "interface"

moduleKeyword :: ModuleKeyword
moduleKeyword = Module . keywordOneSpace $ "module"

endmoduleKeyword :: Keyword
endmoduleKeyword = keywordDoubleLine "endmodule"

logicKeyword :: Keyword
logicKeyword = keywordOneSpace "logic"

alwaysKeyword :: AlwaysKeyword
alwaysKeyword = Always . keywordOneSpace $ "always"

whileKeyword :: Keyword
whileKeyword = keywordOneSpace "while"

ifKeyword :: Keyword
ifKeyword = keywordOneSpace "if"

elseKeyword :: Keyword
elseKeyword = keywordOneSpace "else"

beginKeyword :: Keyword
beginKeyword = keywordNewline "begin"

endKeyword :: Keyword
endKeyword = keywordNewline "end"

forkKeyword :: Keyword
forkKeyword = keywordNewline "fork"

joinKeyword :: JoinKeyword
joinKeyword = Join . keywordNewline $ "join"

includeKeyword :: Keyword
includeKeyword = keywordOneSpace "include"