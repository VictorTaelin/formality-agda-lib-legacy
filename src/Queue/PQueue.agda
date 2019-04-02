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

record QElement : Set where
  field item     : Nat -- polimorfic type
        priority : Nat

data PQueue : Set where
  end : PQueue
  _,_ : (q : QElement ) (qs : PQueue) → PQueue

mk-qelement : (item priority : Nat) → QElement
mk-qelement item priority = record{ item = item; priority = priority }

get-item : QElement -> Nat
get-item = QElement.item

get-priority : QElement -> Nat
get-priority = QElement.priority

t-queue : PQueue
t-queue = (mk-qelement 100 1) , (mk-qelement 100 1) , (mk-qelement 100 4) , (mk-qelement 100 8) , (mk-qelement 100 10) , end

{-  Inserts an item with given priority.
    If the element have the highest priority, it is added at the end of the queue -}
enqueue : (element : QElement) → PQueue → PQueue
enqueue element end      = end
enqueue element (qele , qs) with (get-priority qele) < (get-priority element)
... | true  = qele , (enqueue element qs)
... | false = element , qele , qs

dequeue : PQueue → PQueue
dequeue end      = end
dequeue (q , qs) with qs
... | end      = end
... | (e , ls) = q , (dequeue qs)

front-aux : (last : QElement) → PQueue → QElement
front-aux last end           = last
front-aux last (ele , queue) = front-aux ele queue

-- Returns the front element of the Priority queue
front : PQueue → Maybe QElement
front end      = nothing
front (q , qs) = just (front-aux q qs)





-- Returns the highest priority item
-- getHighestPriority()

-- Removes the highest priority item
-- deleteHighestPriority()

test : PQueue
test = enqueue (mk-qelement 105 5) t-queue

test2 : Maybe QElement
test2 = front t-queue

test3 : PQueue
test3 = dequeue t-queue
