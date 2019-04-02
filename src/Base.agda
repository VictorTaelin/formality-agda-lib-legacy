module Base where

-- Use agda-prelude instead of agda-stdlib?

open import JS public
open import Unit public
open import Nat public
open import List public
open import Bool public
open import String public
open import IO public
open import Float public
open import Int public

Lazy : ∀ (A : Set) → Set
Lazy A = Unit → A

then:_ : ∀ {A : Set} → A → Lazy A
then: a = λ x → a

else:_ : ∀ {A : Set} → A → Lazy A
else: a = λ x → a

if : ∀ {A : Set} → Bool → Lazy A → Lazy A → A
if true  t f = t unit
if false t f = f unit

{-# COMPILE JS if = A => c => t => f => (c ? t() : f()) #-}

init-to : ∀ {A : Set} → Nat → A → (Nat → A → A) → A
init-to zero    x fn = x
init-to (suc i) x fn = init-to i (fn zero x) (λ i → fn (suc i))

{-# COMPILE JS init-to = A => n => x => fn => { for (var i = 0, l = n.toJSValue(); i < l; ++i) x = fn(agdaRTS.primIntegerFromString(String(i)))(x); return x; } #-}

{-# TERMINATING #-}
init-to-f : ∀ {A : Set} → Float → A → (Float → A → A) → A
init-to-f 0.0  x fn = x 
init-to-f i    x fn = init-to-f (primFloatMinus i 1.0) (fn 0.0 x) (λ i → fn (primFloatPlus i 1.0))

foo : Nat
foo = init-to-f 10.3 0 (λ f i → suc i)

syntax init-to m x (λ i → b) = init x for i to m do: b

init-from-to : ∀ {A : Set} → Nat → A → Nat → (Nat → A → A) → A
init-from-to n x m f = init-to (m - n) x (λ i x → f (n + i) x)

syntax init-from-to n x m (λ i → b) = init x for i from n to m do: b

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

_f+_ : Float → Float → Float
_f+_ = primFloatPlus
