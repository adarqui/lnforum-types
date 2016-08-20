{-# LANGUAGE DeriveGeneric #-}

module LN.T.User.Request (
  UserRequest(..)
) where



import           LN.T.Prelude



data UserRequest = UserRequest {
  userRequestDisplayName :: Text,
  userRequestFullName    :: Text,
  userRequestEmail       :: Text,
  userRequestPlugin      :: Text,
  userRequestAcceptTOS   :: Maybe UTCTime
} deriving (Generic, Typeable)
