module SystemVerilog.AST.BehavioralStatements.ClockingBlock where

import Util.Lit (Lit)

data ClockingDeclaration

instance Eq ClockingDeclaration

instance Show ClockingDeclaration

instance Lit ClockingDeclaration

data ClockingDeclarationLocal

instance Eq ClockingDeclarationLocal

instance Show ClockingDeclarationLocal

instance Lit ClockingDeclarationLocal

data Default

instance Eq Default

instance Show Default

instance Lit Default

data ClockingDeclarationGlobal 

instance Eq ClockingDeclarationGlobal

instance Show ClockingDeclarationGlobal

instance Lit ClockingDeclarationGlobal

data ClockingEvent

instance Eq ClockingEvent

instance Show ClockingEvent

instance Lit ClockingEvent

data ClockingEventIdentifier

instance Eq ClockingEventIdentifier

instance Show ClockingEventIdentifier

instance Lit ClockingEventIdentifier

data ClockingEventExpression

instance Eq ClockingEventExpression

instance Show ClockingEventExpression

instance Lit ClockingEventExpression

data ClockingItem

instance Eq ClockingItem

instance Show ClockingItem

instance Lit ClockingItem

data ClockingItemDefault

instance Eq ClockingItemDefault

instance Show ClockingItemDefault

instance Lit ClockingItemDefault

data ClockingItemDirection

instance Eq ClockingItemDirection

instance Show ClockingItemDirection

instance Lit ClockingItemDirection

data ClockingItemAssertion

instance Eq ClockingItemAssertion

instance Show ClockingItemAssertion

instance Lit ClockingItemAssertion

data DefaultSkew

instance Eq DefaultSkew

instance Show DefaultSkew

instance Lit DefaultSkew

data DefaultSkewInput

instance Eq DefaultSkewInput

instance Show DefaultSkewInput

instance Lit DefaultSkewInput

data DefaultSkewOutput

instance Eq DefaultSkewOutput

instance Show DefaultSkewOutput

instance Lit DefaultSkewOutput

data DefaultSkewInputOutput

instance Eq DefaultSkewInputOutput

instance Show DefaultSkewInputOutput

instance Lit DefaultSkewInputOutput

data ClockingDirection

instance Eq ClockingDirection

instance Show ClockingDirection

instance Lit ClockingDirection

data ClockingDirectionInput

instance Eq ClockingDirectionInput

instance Show ClockingDirectionInput

instance Lit ClockingDirectionInput

data ClockingDirectionOutput

instance Eq ClockingDirectionOutput

instance Show ClockingDirectionOutput

instance Lit ClockingDirectionOutput

data ClockingDirectionInputOutput

instance Eq ClockingDirectionInputOutput

instance Show ClockingDirectionInputOutput

instance Lit ClockingDirectionInputOutput

data ListOfClockingDeclAssign

instance Eq ListOfClockingDeclAssign

instance Show ListOfClockingDeclAssign

instance Lit ListOfClockingDeclAssign
    
data ClockingDeclAssign

instance Eq ClockingDeclAssign

instance Show ClockingDeclAssign

instance Lit ClockingDeclAssign

data ClockingSkew

instance Eq ClockingSkew

instance Show ClockingSkew

instance Lit ClockingSkew

data ClockingSkewEdge

instance Eq ClockingSkewEdge

instance Show ClockingSkewEdge

instance Lit ClockingSkewEdge

data ClockingDrive

instance Eq ClockingDrive

instance Show ClockingDrive

instance Lit ClockingDrive

data CycleDelay

instance Eq CycleDelay

instance Show CycleDelay

instance Lit CycleDelay

data CycleDelayIntegral 

instance Eq CycleDelayIntegral

instance Show CycleDelayIntegral

instance Lit CycleDelayIntegral

data CycleDelayIdentifier

instance Eq CycleDelayIdentifier

instance Show CycleDelayIdentifier

instance Lit CycleDelayIdentifier

data CycleDelayExpression

instance Eq CycleDelayExpression

instance Show CycleDelayExpression

instance Lit CycleDelayExpression

data Clockvar

instance Eq Clockvar

instance Show Clockvar

instance Lit Clockvar

data ClockvarExpression

instance Eq ClockvarExpression

instance Show ClockvarExpression

instance Lit ClockvarExpression
