{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Expressions.Operators where
    
import SystemVerilog.AST.SpecialNodes (Symbol)
import Util.Lit (deriveLit)

newtype UnaryOperator = UnaryOperator Symbol deriving (Eq, Show)

newtype BinaryOperator = BinaryOperator Symbol deriving (Eq, Show)

newtype IncOrDecOperator = IncOrDecOperator Symbol deriving (Eq, Show)

newtype UnaryModulePathOperator = UnaryModulePathOperator Symbol deriving (Eq, Show)

newtype BinaryModulePathOperator = BinaryModulePathOperator Symbol deriving (Eq, Show)

deriveLit ''UnaryOperator
deriveLit ''BinaryOperator
deriveLit ''IncOrDecOperator
deriveLit ''UnaryModulePathOperator
deriveLit ''BinaryModulePathOperator