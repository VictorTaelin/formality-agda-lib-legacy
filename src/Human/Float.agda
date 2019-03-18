module Human.Float where

open import Human.Bool
open import Human.Nat
open import Human.Int
open import Human.String

postulate Float : Set
{-# BUILTIN FLOAT Float #-}

primitive
  primFloatEquality          : Float → Float → Bool
  primFloatLess              : Float → Float → Bool
  primFloatNumericalEquality : Float → Float → Bool
  primFloatNumericalLess     : Float → Float → Bool
  primNatToFloat             : Nat → Float
  primFloatPlus              : Float → Float → Float
  primFloatMinus             : Float → Float → Float
  primFloatTimes             : Float → Float → Float
  primFloatNegate            : Float → Float
  primFloatDiv               : Float → Float → Float
  primFloatSqrt              : Float → Float
  primRound                  : Float → Int
  primFloor                  : Float → Int
  primCeiling                : Float → Int
  primExp                    : Float → Float
  primLog                    : Float → Float
  primSin                    : Float → Float
  primCos                    : Float → Float
  primTan                    : Float → Float
  primASin                   : Float → Float
  primACos                   : Float → Float
  primATan                   : Float → Float
  primATan2                  : Float → Float → Float
  primShowFloat              : Float → String
