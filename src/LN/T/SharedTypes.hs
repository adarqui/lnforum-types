module LN.T.SharedTypes (
  Tuple,
  tuple
) where



type Tuple a b = (a, b)



tuple :: a -> b -> (a, b)
tuple = (,)
