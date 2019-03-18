module Human.Char where

open import Human.Nat
open import Human.Bool

postulate Char : Set
{-# BUILTIN CHAR Char #-}

primitive
  primIsLower             : Char → Bool
  primIsDigit             : Char → Bool
  primIsAlpha             : Char → Bool
  primIsSpace             : Char → Bool
  primIsAscii             : Char → Bool
  primIsLatin1            : Char → Bool
  primIsPrint             : Char → Bool
  primIsHexDigit          : Char → Bool
  primToUpper primToLower : Char → Char
  primCharToNat           : Char → Nat
  primNatToChar           : Nat → Char
  primCharEquality        : Char → Char → Bool
