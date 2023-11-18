module SystemVerilog.AST.Expressions.Strings where
    
import SystemVerilog.AST.Lib (Locate)
import SystemVerilog.AST.SpecialNodes (WhiteSpace)
import Data.Text (Text, append)
import Util.Lit (Lit(..))

data StringLiteral
    = StringLiteral
    Text
    (Maybe Locate)
    [WhiteSpace]
    deriving (Eq, Show)

instance Lit StringLiteral where
    lit (StringLiteral t _ l) = t `append` lit l