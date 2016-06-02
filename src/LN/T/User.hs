{-# LANGUAGE DeriveGeneric #-}

module LN.T.User (
  UserError (..),
) where



import           LN.T.Prelude



data UserError
  = DoesntExist Int64
  | AlreadyExists Int64
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
