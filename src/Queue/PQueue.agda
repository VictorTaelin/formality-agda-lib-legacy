module Queue.PQueue where

open import Nat
open import Bool

{-
  1. Every item has a priority associated with it.
  2. An element with high priority is dequeued before an element with low priority.
  3. If two elements have the same priority, they are served according to their order in the queue
-}

-- data Priority : Set where
--   min : Priority
--   med : Priority
--   max : Priority

infixr 5 _,_

record QElement : Set where
  field item     : Nat -- polimorfic type
        priority : Nat

data PQueue : Set where
  end : PQueue
  _,_ : (q : QElement) (qs : PQueue) → PQueue

mk-qelement : (item priority : Nat) → QElement
mk-qelement item priority = record{ item = item; priority = priority }

get-item : QElement -> Nat
get-item = QElement.item

get-priority : QElement -> Nat
get-priority = QElement.priority

t-queue : PQueue
t-queue = (mk-qelement 100 1) , (mk-qelement 100 1) , (mk-qelement 100 4) , (mk-qelement 100 8) , (mk-qelement 100 10) , end

{- If the element have the highest priority, it is added at the end of the queue -}
enqueue : (item pri : Nat) → PQueue → PQueue
enqueue item pri end      = end
enqueue item pri (qele , qs) with (get-priority qele) < pri
... | true  = qele , (enqueue item pri qs)
... | false = (mk-qelement item pri) , qele , qs


test : PQueue
test = enqueue 105 5 t-queue
