module Queue.PQueue where

open import Nat
open import Bool
open import Maybe

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

record QElement (A : Set) : Set where
  field item     : A -- polimorfic type
        priority : Nat

data PQueue (A : Set) : Set where
  end : PQueue A
  _,_ : (q : QElement A) (qs : PQueue A) → PQueue A

mk-qelement : (item : Nat) → (priority : Nat) → QElement Nat
mk-qelement item priority = record{ item = item; priority = priority }

get-item : QElement Nat -> Nat
get-item = QElement.item

get-priority : QElement Nat -> Nat
get-priority = QElement.priority

t-queue : PQueue Nat
t-queue = (mk-qelement 100 1) , (mk-qelement 100 1) , (mk-qelement 100 4) , (mk-qelement 100 8) , (mk-qelement 100 10) , end

{-  Inserts an item with given priority.
    If the element have the highest priority, it is added at the end of the queue -}
enqueue : (element : QElement Nat) → PQueue Nat → PQueue Nat
enqueue element end      = end
enqueue element (qele , qs) with (get-priority qele) < (get-priority element)
... | true  = qele , (enqueue element qs)
... | false = element , qele , qs

dequeue : PQueue Nat → PQueue Nat
dequeue end      = end
dequeue (q , qs) with qs
... | end      = end
... | (e , ls) = q , (dequeue qs)

front-aux : (last : QElement Nat) → PQueue Nat → QElement Nat
front-aux last end           = last
front-aux last (ele , queue) = front-aux ele queue

-- Returns the front element of the Priority queue
front : PQueue Nat → Maybe (QElement Nat)
front end      = nothing
front (q , qs) = just (front-aux q qs)





-- Returns the highest priority item
-- getHighestPriority()

-- Removes the highest priority item
-- deleteHighestPriority()

test : PQueue Nat
test = enqueue (mk-qelement 105 5) t-queue

test2 : Maybe (QElement Nat)
test2 = front t-queue

test3 : PQueue Nat
test3 = dequeue t-queue
