{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Substitutions (
  Substitutions (..)
) where



import           LN.T.Prelude



data Substitutions
  = SubsExpr Substitutions Substitutions
  | SubsOneOf [Text]
  | SubsAllOf [Text]
  | SubsBoth Substitutions Substitutions
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
