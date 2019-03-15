module Example where

open import Humanity

main : Program
main _ = do

  print "Hello, world!"

  for i from 0 to 10 do:
    print ("i: " ++ show i)

  if true
    (then: print "foo")
    (else: print "bar")

  let num =
        init 0.0
        for i from 0 to 1000000 do:
          λ result → result f+ 1.0

  print (primShowFloat num)

  -- print (primShowFloat (update 0.0 for i to 1000000 with: (primFloatPlus 2.0)))
