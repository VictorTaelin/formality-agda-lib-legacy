module Vector where

open import Nat

data Vector (A : Set) : (n : Nat) → Set where
  _,_ : ∀ n → (x : A) (xs : Vector A n) → Vector A (suc n)
  end : Vector A zero
