module String where

open import Bool
open import List renaming ( length to llength )
open import Char
open import Nat

postulate String : Set
{-# BUILTIN STRING String #-}

primitive
  primStringToList   : String → List Char
  primStringFromList : List Char → String
  primStringAppend   : String → String → String
  primStringEquality : String → String → Bool
  primShowChar       : Char → String
  primShowString     : String → String

{-# COMPILE JS primStringToList = function(x) { return x.split(""); } #-}
{-# COMPILE JS primStringFromList = function(x) { return x.join(""); } #-}
{-# COMPILE JS primStringAppend = function(x) { return function(y) { return x+y; }; } #-}
{-# COMPILE JS primStringEquality = function(x) { return function(y) { return x===y; }; } #-}
{-# COMPILE JS primShowChar = function(x) { return JSON.stringify(x); } #-}
{-# COMPILE JS primShowString = function(x) { return JSON.stringify(x); } #-}
