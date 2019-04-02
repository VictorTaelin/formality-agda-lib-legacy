module Test where

open import Base

sum : Nat → Nat
sum i =
  init 0
  for i from 0 to i do:
    λ result → result + i
