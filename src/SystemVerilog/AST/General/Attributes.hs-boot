module SystemVerilog.AST.General.Attributes where
    
import Util.Lit (Lit)

data AttributeInstance

instance Eq AttributeInstance

instance Show AttributeInstance

instance Lit AttributeInstance

data AttrSpec

instance Eq AttrSpec

instance Show AttrSpec

instance Lit AttrSpec