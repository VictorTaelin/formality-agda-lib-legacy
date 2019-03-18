module Human.Humanity where

-- Use agda-prelude instead of agda-stdlib?

open import Human.JS public
open import Human.Unit public
open import Human.Nat public
open import Human.List public
open import Human.Bool public
open import Human.String public
open import Human.IO public
open import Human.Float public
open import Human.Int public

Lazy : ∀ (A : Set) → Set
Lazy A = Unit → A

then:_ : ∀ {A : Set} → A → Lazy A
then: a = λ x → a

else:_ : ∀ {A : Set} → A → Lazy A
else: a = λ x → a

if : ∀ {A : Set} → Bool → Lazy A → Lazy A → A
if true  t f = t unit
if false t f = f unit

init-to : ∀ {A : Set} → Nat → A → (Nat → A → A) → A
init-to zero    x fn = x
init-to (suc i) x fn = init-to i (fn zero x) (λ i → fn (suc i))

{-# COMPILE JS init-to = A => n => x => fn => { for (var i = 0, l = n.toJSValue(); i < l; ++i) x = fn(agdaRTS.primIntegerFromString(String(i)))(x); return x; } #-}

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
