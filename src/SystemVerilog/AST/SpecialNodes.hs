module SystemVerilog.AST.SpecialNodes where

import qualified Data.Text as T
import SystemVerilog.AST.General.Comments (Comment)
import {-# SOURCE #-} SystemVerilog.AST.General.CompilerDirectives (CompilerDirective)
import SystemVerilog.AST.Lib (Locate)
import Util.Lit (Lit (..))

data Symbol = Symbol T.Text (Maybe Locate) [WhiteSpace] deriving (Eq, Show)

instance Lit Symbol where
  lit (Symbol t _ l) = T.append t (lit l)

data Keyword = Keyword T.Text (Maybe Locate) [WhiteSpace] deriving (Eq, Show)

instance Lit Keyword where
  lit (Keyword t _ l) = T.append t (lit l)

data Null = Null deriving (Eq, Show)

instance Lit Null where
  lit Null = T.empty

data WhiteSpace
  = Newline T.Text (Maybe Locate)
  | Space T.Text (Maybe Locate)
  | Comment Comment
  | CompilerDirective CompilerDirective
  deriving (Eq, Show)

instance Lit WhiteSpace where
  lit (Newline t _) = t
  lit (Space t _) = t
  lit (Comment c) = lit c
  lit (CompilerDirective cd) = lit cd

data Paren a = Paren Symbol a Symbol

instance (Eq a) => Eq (Paren a) where
  (==) (Paren _ x _) (Paren _ y _) = x == y

instance (Show a) => Show (Paren a) where
  show (Paren _ x _) = "(" ++ show x ++ ")"

instance (Lit a) => Lit (Paren a) where
  lit (Paren _ x _) = T.concat [T.pack "(", lit x, T.pack ")"]

data Brace a = Brace Symbol a Symbol

instance (Eq a) => Eq (Brace a) where
  (==) (Brace _ x _) (Brace _ y _) = x == y

instance (Show a) => Show (Brace a) where
  show (Brace _ x _) = "{" ++ show x ++ "}"

instance (Lit a) => Lit (Brace a) where
  lit (Brace _ x _) = T.concat [T.pack "{", lit x, T.pack "}"]

data Bracket a = Bracket Symbol a Symbol

instance (Eq a) => Eq (Bracket a) where
  (==) (Bracket _ x _) (Bracket _ y _) = x == y

instance (Show a) => Show (Bracket a) where
  show (Bracket _ x _) = "[" ++ show x ++ "]"

instance (Lit a) => Lit (Bracket a) where
  lit (Bracket _ x _) = T.concat [T.pack "[", lit x, T.pack "]"]

data ApostropheBrace a = ApostropheBrace Symbol a Symbol

instance (Eq a) => Eq (ApostropheBrace a) where
  (==) (ApostropheBrace _ x _) (ApostropheBrace _ y _) = x == y

instance (Show a) => Show (ApostropheBrace a) where
  show (ApostropheBrace _ x _) = "`{" ++ show x ++ "}"

instance (Lit a) => Lit (ApostropheBrace a) where
  lit (ApostropheBrace _ x _) = T.concat [T.pack "`{", lit x, T.pack "}"]

data Splits s i = Splits i [(s, i)]

splitContents :: Splits s i -> [i]
splitContents (Splits first list) =
  let rest = map snd list
   in first : rest

instance (Eq s, Eq i) => Eq (Splits s i) where
  (==) (Splits i1 l1) (Splits i2 l2) =
    (i1 == i2) && (l1 == l2)

instance (Show s, Show i) => Show (Splits s i) where
  show (Splits i l) = show i ++ foldMap (\(sep, item) -> show sep ++ " " ++ show item) l

instance (Lit s, Lit i) => Lit (Splits s i) where
  lit (Splits i l) = T.append (lit i) (foldMap (\(sep, item) -> T.concat [lit sep, T.pack " ", lit item]) l)