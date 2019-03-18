module Human.JS where

open import Human.Unit
open import Human.String
open import Human.IO

infixl 1 _>>=_

postulate
  return : ∀ {a} {A : Set a} → A → IO A
  _>>=_  : ∀ {a b} {A : Set a} {B : Set b} → IO A → (A → IO B) → IO B
  _>>_   : ∀ {a b} {A : Set a} {B : Set b} → IO A → IO B → IO B
  print  : String → IO Unit

{-# COMPILE JS return = a => b => c => c #-}
{-# COMPILE JS _>>=_  = a => b => c => d => f => x => f(x) #-}
{-# COMPILE JS _>>_   = a => b => c => d => f => x => x #-}
{-# COMPILE JS print  = s => console.log(s) #-}
