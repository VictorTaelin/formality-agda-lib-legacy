module Human where

-- Use agda-prelude instead of agda-stdlib?

open import JS public
open import Unit public
open import Nat public
open import List public
open import Bool public
open import String public
open import IO public

App : Set
App = Unit → IO Unit

Lazy : ∀ (A : Set) → Set
Lazy A = Unit → A

then:_ : ∀ {A : Set} → A → Lazy A
then: a = λ x → a

else:_ : ∀ {A : Set} → A → Lazy A
else: a = λ x → a

if : ∀ {A : Set} → Bool → Lazy A → Lazy A → A
if true  t f = t unit
if false t f = f unit

update-to : ∀ {A : Set} → Nat → A → (Nat → A → A) → A
update-to zero    x fn = x
update-to (suc i) x fn = update-to i (fn zero x) (λ i → fn (suc i))

syntax update-to m x (λ i → b) = update x for i to m with: b

update-from-to : ∀ {A : Set} → Nat → A → Nat → (Nat → A → A) → A
update-from-to n x m f = update-to (m - n) x (λ i x → f (n + i) x)

syntax update-from-to n x m (λ i → b) = update x for i from n to m with: b

for-to : Nat → (Nat → IO Unit) → IO Unit
for-to zero    act = return unit
for-to (suc n) act = act zero >> for-to n (λ i → act (suc i))

syntax for-from-to n m (λ i → b) = for i from n to m do: b

for-from-to : Nat → Nat → (Nat → IO Unit) → IO Unit
for-from-to n m f = for-to (m - n) (λ i → f (n + i))

syntax for-to m (λ i → b) = for i to m do: b

_++_ : String → String → String
_++_ = primStringAppend

show : Nat → String
show zero    = "Z"
show (suc n) = "S" ++ show n

Program : Set
Program = Lazy (IO Unit)
