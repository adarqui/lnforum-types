{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.User.Request (
  UserRequest(..),
  defaultUserRequest,
  testUserRequest
) where



import           LN.T.Prelude



data UserRequest = UserRequest {
  userRequestDisplayName :: Text,
  userRequestFullName    :: Text,
  userRequestEmail       :: Text,
  userRequestPlugin      :: Text,
  userRequestIdent       :: Text,
  userRequestAcceptTOS   :: Maybe UTCTime
} deriving (Generic, Typeable)



defaultUserRequest :: UserRequest
defaultUserRequest = UserRequest {
  userRequestDisplayName = "",
  userRequestFullName    = "",
  userRequestEmail       = "",
  userRequestPlugin      = "",
  userRequestIdent       = "",
  userRequestAcceptTOS   = Nothing
}



testUserRequest :: UserRequest
testUserRequest = defaultUserRequest {
  userRequestDisplayName = "test",
  userRequestFullName    = "test",
  userRequestEmail       = "test@test.com",
  userRequestPlugin      = "test",
  userRequestIdent       = "test"
}
