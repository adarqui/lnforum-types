{-# LANGUAGE PatternSynonyms #-}

module LN.T.PatternSynonyms where



import Prelude



pattern N   = Nothing
pattern J a = Just a
pattern L a = Left a
pattern R a = Right a
