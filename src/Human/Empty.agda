module Human.Empty where

data Empty : Set where

void : ∀ {P : Set} → Empty → P
void ()
