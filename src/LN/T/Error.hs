{-# LANGUAGE DeriveGeneric #-}

module LN.T.Error (
  ApplicationError
) where



import           LN.T.Prelude
import           LN.T.User



data ApplicationError
  = ErrorEmpty
  | ErrorUser UserError
  deriving (Eq, Ord, Show, Read, Generic, Typeable)
