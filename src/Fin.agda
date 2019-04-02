module Fin where

open import Nat

data Fin : Nat -> Set where
  zero : ∀ {n} → Fin (suc n)
  suc  : ∀ {n} → Fin n → Fin (suc n)
