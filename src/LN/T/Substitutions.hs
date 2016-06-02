{-# LANGUAGE DeriveGeneric #-}

module LN.T.Substitutions (
  Substitutions (..),
  TySubstitutions (..)
) where



import           LN.T.Prelude



data Substitutions
  = SubsExpr Substitutions Substitutions
  | SubsOneOf [Text]
  | SubsAllOf [Text]
  | SubsBoth Substitutions Substitutions
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data TySubstitutions
  = TySubsExpr
  | TySubsOneOf
  | TySubsAllOf
  | TySubsBoth
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
