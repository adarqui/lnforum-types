{-# LANGUAGE DeriveGeneric #-}

module LN.T.Error (
  ApplicationError (..)
) where



import           LN.T.Prelude



data ApplicationError
  = Error_Empty
  | Error_NotFound
  | Error_PermissionDenied
  | Error_Visibility
  | Error_Membership
  | Error_Validation
  | Error_NotImplemented
  | Error_Unexpected
  deriving (Eq, Ord, Show, Read, Generic, Typeable)
