module SystemVerilog.AST.Lib(
    Locate
) where

import qualified Data.Text as T
import Util.Lit (Lit(..))

data Locate = Locate {
    offset :: Int,
    line :: Int,
    len :: Int
} deriving (Eq, Show)

instance Lit Locate where  
    lit _ = T.empty