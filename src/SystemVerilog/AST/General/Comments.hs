module SystemVerilog.AST.General.Comments where

import Data.Text (Text)
import SystemVerilog.AST.Lib (Locate)
import Util.Lit (Lit(..))

data Comment
  = Comment
      Text
      (Maybe Locate)
  deriving (Eq, Show)

instance Lit Comment where
  lit (Comment t _) = t  