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
  deriving (Generic, Typeable)



data TySubstitutions
  = TySubsExpr
  | TySubsOneOf
  | TySubsAllOf
  | TySubsBoth
  deriving (Generic, Typeable)
