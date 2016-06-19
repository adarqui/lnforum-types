{-# LANGUAGE DeriveGeneric #-}

module LN.T.Visibility (
  Visibility (..)
) where



import           LN.T.Prelude



data Visibility =
    Public
  | Private
  deriving (Eq, Ord, Show, Read, Generic, Typeable)
