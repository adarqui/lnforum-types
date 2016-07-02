{-# LANGUAGE DeriveGeneric #-}

module LN.T.User (
  UserError (..),
) where



import           LN.T.Prelude



data UserError
  = DoesntExist Int64
  | AlreadyExists Int64
  deriving (Generic, Typeable)
