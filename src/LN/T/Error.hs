{-# LANGUAGE DeriveGeneric #-}

module LN.T.Error (
  ApplicationError (..),
  ValidationError (..)
) where



import           LN.T.Prelude
import           Data.Default (Default, def)



data ApplicationError
  = Error_Unknown
  | Error_NotFound
  | Error_PermissionDenied
  | Error_AlreadyExists
  | Error_Visibility
  | Error_Membership
  | Error_Validation ValidationError (Maybe Text)
  | Error_NotImplemented
  | Error_InvalidArguments Text
  | Error_Unexpected
  deriving (Generic, Typeable)



instance Default ApplicationError where
  def = Error_Unknown



data ValidationError
  = Validate_Unknown
  | Validate_InvalidCharacters
  | Validate_InvalidEmail
  | Validate_InvalidDate
  | Validate_CannotBeEmpty
  | Validate_TooLong
  | Validate_TooShort
  | Validate_GreaterThanMaximum
  | Validate_SmallerThanMinimum
  deriving (Generic, Typeable)



instance Default ValidationError where
  def = Validate_Unknown
