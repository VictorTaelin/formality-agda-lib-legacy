module Human.IO where

postulate IO : ∀ {a} → Set a → Set a
{-# BUILTIN IO IO #-}
