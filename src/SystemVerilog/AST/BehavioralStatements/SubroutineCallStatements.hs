{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.BehavioralStatements.SubroutineCallStatements where

import SystemVerilog.AST.Expressions.SubroutineCalls (FunctionSubroutineCall, SubroutineCall)
import SystemVerilog.AST.SpecialNodes (Keyword, Paren, Symbol)
import Util.Lit (deriveLit)

data SubroutineCallStatement
  = MkSubroutineCall SubroutineCall Symbol
  | MkSubroutineCallStatementFunction SubroutineCallStatementFunction
  deriving (Eq, Show)

data SubroutineCallStatementFunction
  = SubroutineCallStatementFunction
      Keyword
      Symbol
      (Paren FunctionSubroutineCall)
      Symbol
  deriving (Eq, Show)

deriveLit ''SubroutineCallStatementFunction
deriveLit ''SubroutineCallStatement