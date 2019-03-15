module Example where

open import Human

main : Unit → IO Unit
main _ = do

  print "Hello, world!"

  for 0 to 10 do: λ i →
    print (primStringAppend "num: " (str i))

  -- TODO avoid parens?
  (if true
    (then (print "foo"))
    (else (print "bar")))
