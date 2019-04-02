module STLC where

open import Nat
open import Fin

data Term : Nat → Set where
  one : ∀ {n} → Term n
  var : ∀ {n} → Fin n → Term n
  app : ∀ {n} → Term n → Term n → Term n
  lam : ∀ {n} → Term (suc n) → Term n

data Type : Set where
  uni : Type 
  arr : Type → Type → Type

Γ : Nat → Set
Γ n = ∀ (i : Fin n) → Type

_,_ : ∀ {n} → Γ n → Type → Γ (suc n)
_,_ Γ t = λ { zero → t; (suc n) → Γ n }

data _⊢_∷_ : {n : Nat} → Γ n → Term n → Type → Set where
  one-T : ∀ {n} (Γ : Γ n) → Γ ⊢ one ∷ uni
  lam-T : ∀ {n} a A B (Γ : Γ n) → (Γ , A) ⊢ a ∷ B → Γ ⊢ lam a ∷ arr A B
  app-T : ∀ {n} f x A B (Γ : Γ n) → Γ ⊢ f ∷ arr A B → Γ ⊢ x ∷ A → Γ ⊢ app f x ∷ B
  var-T : ∀ {n} i (Γ : Γ n) → Γ ⊢ var i ∷ Γ i

Subst : Nat → Set
Subst n = ∀ (i : Fin n) → Term n

subst : ∀ {n} → Subst n → Term n → Term n
subst s one       = one
subst s (var i)   = s i
subst s (app f x) = app (subst s f) (subst s x)
subst s (lam t)   = lam (subst (λ { zero → var zero; (suc m) → ? }) t)

-- data _~>_ : {n : Nat} → Term n → Term n → Set where
  
