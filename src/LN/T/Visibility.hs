{-# LANGUAGE DeriveGeneric #-}

module LN.T.Visibility (
  Visibility (..)
) where



import           LN.T.Prelude



data Visibility =
    Public
  | Private
  deriving (Generic, Typeable)
