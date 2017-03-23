{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RankNTypes      #-}

module LN.T.PatternSynonyms where



import Prelude



pattern N :: forall t. Maybe t
pattern N   = Nothing



pattern J :: forall t. t -> Maybe t
pattern J a = Just a



pattern L :: forall t u. u -> Either u t
pattern L a = Left a



pattern R :: forall t u. u -> Either t u
pattern R a = Right a
