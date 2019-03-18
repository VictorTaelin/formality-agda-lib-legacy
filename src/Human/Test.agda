module Human.Test where

open import Human.Humanity

-- sum 7
-- 0 + 1 + 2 + 3 + 4 + 5 + 6

-- function sum(x) {
  -- var result = 0;
  -- for (var i = 0; i < 10; ++i) {
    -- result = result + i;
  -- }
  -- return result;
-- }


sum : Nat → Nat
sum i =
  init 0
  for i from 0 to 10 do:
    λ result → result + 1
