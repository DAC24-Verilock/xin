module SystemVerilog.AST.SourceText.ProgramItems where
    
import Util.Lit (Lit)

data ProgramItem

instance Eq ProgramItem

instance Show ProgramItem

instance Lit ProgramItem

data NonPortProgramItem

instance Eq NonPortProgramItem

instance Show NonPortProgramItem

instance Lit NonPortProgramItem

data NonPortProgramItemAssign

instance Eq NonPortProgramItemAssign

instance Show NonPortProgramItemAssign

instance Lit NonPortProgramItemAssign

data NonPortProgramItemModule

instance Eq NonPortProgramItemModule

instance Show NonPortProgramItemModule

instance Lit NonPortProgramItemModule

data NonPortProgramItemInitial

instance Eq NonPortProgramItemInitial

instance Show NonPortProgramItemInitial

instance Lit NonPortProgramItemInitial

data NonPortProgramItemFinal

instance Eq NonPortProgramItemFinal

instance Show NonPortProgramItemFinal

instance Lit NonPortProgramItemFinal

data NonPortProgramItemAssertion

instance Eq NonPortProgramItemAssertion

instance Show NonPortProgramItemAssertion

instance Lit NonPortProgramItemAssertion

data ProgramGenerateItem

instance Eq ProgramGenerateItem

instance Show ProgramGenerateItem

instance Lit ProgramGenerateItem
