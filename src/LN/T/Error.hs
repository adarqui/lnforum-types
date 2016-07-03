{-# LANGUAGE DeriveGeneric #-}

module LN.T.Error (
  ApplicationError (..),
  ValidationError (..),
  ValidationErrorCode (..)
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
  | Error_Validation ValidationError
  | Error_NotImplemented
  | Error_InvalidArguments Text
  | Error_Unexpected
  deriving (Generic, Typeable)



instance Default ApplicationError where
  def = Error_Unknown



data ValidationError
  = Validate ValidationErrorCode (Maybe Text)
  deriving (Generic, Typeable)



instance Default ValidationError where
  def = Validate Validate_Unknown Nothing



data ValidationErrorCode
  = Validate_Unknown
  | Validate_InvalidCharacters
  | Validate_InvalidEmail
  | Validate_InvalidDate
  | Validate_CannotBeEmpty
  | Validate_TooLong
  | Validate_TooShort
  | Validate_GreaterThanMaximum
  | Validate_SmallerThanMinimum
  | Validate_Reason Text
  deriving (Generic, Typeable)



instance Default ValidationErrorCode where
  def = Validate_Unknown
