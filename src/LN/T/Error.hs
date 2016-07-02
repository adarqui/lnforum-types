{-# LANGUAGE DeriveGeneric #-}

module LN.T.Error (
  ApplicationError (..)
) where



import           LN.T.Prelude
import           Data.Default (Default, def)



data ApplicationError
  = Error_Empty
  | Error_NotFound
  | Error_PermissionDenied
  | Error_Visibility
  | Error_Membership
  | Error_Validation Text
  | Error_NotImplemented
  | Error_InvalidArguments Text
  | Error_Unexpected
  | Error_Unknown
  deriving (Generic, Typeable)



instance Default ApplicationError where
  def = Error_Unknown
