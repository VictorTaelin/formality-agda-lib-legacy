module Example where

open import Human

main : Program
main _ = do

  print "Hello, world!"

  for i from 0 to 10 do:
    print ("i: " ++ show i)

  if true
    (then: print "foo")
    (else: print "bar")

  print (update "" for i to 3 with: λ x → "na" ++ x)

  print (primShowFloat (update 0.0 for i to 1000000 with: (primFloatPlus 2.0)))
