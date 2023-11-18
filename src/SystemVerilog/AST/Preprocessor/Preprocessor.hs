{-# LANGUAGE TemplateHaskell #-}

module SystemVerilog.AST.Preprocessor.Preprocessor where

import SystemVerilog.AST.General.CompilerDirectives (SourceDescription)
import Util.Lit (deriveLit)

newtype PreprocessorText
  = PreprocessorText
      [SourceDescription]
  deriving (Eq, Show)

deriveLit ''PreprocessorText