module SystemVerilog.AST.SourceText.ModuleItems where
    
import Util.Lit (Lit)

data ElaborationSystemTask

instance Eq ElaborationSystemTask

instance Show ElaborationSystemTask

instance Lit ElaborationSystemTask

data ElaborationSystemTaskFatal

instance Eq ElaborationSystemTaskFatal

instance Show ElaborationSystemTaskFatal

instance Lit ElaborationSystemTaskFatal

data ElaborationSystemTaskError

instance Eq ElaborationSystemTaskError

instance Show ElaborationSystemTaskError

instance Lit ElaborationSystemTaskError

data ElaborationSystemTaskWarning

instance Eq ElaborationSystemTaskWarning

instance Show ElaborationSystemTaskWarning

instance Lit ElaborationSystemTaskWarning

data ElaborationSystemTaskInfo

instance Eq ElaborationSystemTaskInfo

instance Show ElaborationSystemTaskInfo

instance Lit ElaborationSystemTaskInfo

data FinishNumber

instance Eq FinishNumber

instance Show FinishNumber

instance Lit FinishNumber

data ModuleCommonItem

instance Eq ModuleCommonItem

instance Show ModuleCommonItem

instance Lit ModuleCommonItem

data ModuleItem

instance Eq ModuleItem

instance Show ModuleItem

instance Lit ModuleItem

data ModuleOrGenerateItem

instance Eq ModuleOrGenerateItem

instance Show ModuleOrGenerateItem

instance Lit ModuleOrGenerateItem

data ModuleOrGenerateItemParameter

instance Eq ModuleOrGenerateItemParameter

instance Show ModuleOrGenerateItemParameter

instance Lit ModuleOrGenerateItemParameter

data ModuleOrGenerateItemGate

instance Eq ModuleOrGenerateItemGate

instance Show ModuleOrGenerateItemGate

instance Lit ModuleOrGenerateItemGate

data ModuleOrGenerateItemUdp

instance Eq ModuleOrGenerateItemUdp

instance Show ModuleOrGenerateItemUdp

instance Lit ModuleOrGenerateItemUdp

data ModuleOrGenerateItemModule

instance Eq ModuleOrGenerateItemModule

instance Show ModuleOrGenerateItemModule

instance Lit ModuleOrGenerateItemModule

data ModuleOrGenerateItemModuleItem

instance Eq ModuleOrGenerateItemModuleItem

instance Show ModuleOrGenerateItemModuleItem

instance Lit ModuleOrGenerateItemModuleItem

data ModuleOrGenerateItemDeclaration

instance Eq ModuleOrGenerateItemDeclaration

instance Show ModuleOrGenerateItemDeclaration

instance Lit ModuleOrGenerateItemDeclaration

data ModuleOrGenerateItemDeclarationClocking

instance Eq ModuleOrGenerateItemDeclarationClocking

instance Show ModuleOrGenerateItemDeclarationClocking

instance Lit ModuleOrGenerateItemDeclarationClocking

data ModuleOrGenerateItemDeclarationDisable

instance Eq ModuleOrGenerateItemDeclarationDisable

instance Show ModuleOrGenerateItemDeclarationDisable

instance Lit ModuleOrGenerateItemDeclarationDisable

data NonPortModuleItem

instance Eq NonPortModuleItem

instance Show NonPortModuleItem

instance Lit NonPortModuleItem

data NonPortModuleItemSpecparam

instance Eq NonPortModuleItemSpecparam

instance Show NonPortModuleItemSpecparam

instance Lit NonPortModuleItemSpecparam

data ParameterOverride

instance Eq ParameterOverride

instance Show ParameterOverride

instance Lit ParameterOverride

data BindDirective

instance Eq BindDirective

instance Show BindDirective

instance Lit BindDirective

data BindDirectiveScope

instance Eq BindDirectiveScope

instance Show BindDirectiveScope

instance Lit BindDirectiveScope

data BindDirectiveInstance

instance Eq BindDirectiveInstance

instance Show BindDirectiveInstance

instance Lit BindDirectiveInstance

data BindTargetScope

instance Eq BindTargetScope

instance Show BindTargetScope

instance Lit BindTargetScope

data BindTargetInstance

instance Eq BindTargetInstance

instance Show BindTargetInstance

instance Lit BindTargetInstance

data BindTargetInstanceList

instance Eq BindTargetInstanceList

instance Show BindTargetInstanceList

instance Lit BindTargetInstanceList

data BindInstantiation

instance Eq BindInstantiation

instance Show BindInstantiation

instance Lit BindInstantiation
