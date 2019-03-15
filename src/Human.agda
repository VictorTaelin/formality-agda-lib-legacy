module Human where

-- Use agda-prelude instead of agda-stdlib?

open import JS public
open import Unit public
open import Nat public
open import List public
open import Bool public
open import String public
open import IO public

if : ∀ {A : Set} → Bool → (Unit → A) → (Unit → A) → A
if true  t f = t unit
if false t f = f unit

then : ∀ {A : Set} → A → Unit → A
then a x = a

else : ∀ {A : Set} → A → Unit → A
else a x = a

iter-to : ∀ {A : Set} → Nat → A → (Nat → A → A) → A
iter-to zero    x fn = x
iter-to (suc i) x fn = iter-to i (fn zero x) (λ i → fn (suc i))

iter_to_doing_ : ∀ {A : Set} → A → Nat → (A → Nat → A) → A
iter x to n doing f = iter-to n x (λ i x → f x i)

iter_from_to_as_ : ∀ {A : Set} → A → Nat → Nat → (A → Nat → A) → A
iter x from n to m as f = iter-to (m - n) x (λ i x → f x (n + i))

for-to : Nat → (Nat → IO Unit) → IO Unit
for-to zero    act = return unit
for-to (suc n) act = act zero >> for-to n (λ i → act (suc i))

for_to_do:_ : Nat → Nat → (Nat → IO Unit) → IO Unit
for n to m do: f = for-to (m - n) (λ i → f (n + i))

str : Nat → String
str zero    = "Z"
str (suc n) = primStringAppend "S" (str n)
