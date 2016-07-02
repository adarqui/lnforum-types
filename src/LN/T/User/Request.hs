{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.User.Request (
  UserRequest(..),
  defaultUserRequest,
  testUserRequest
) where



import           LN.T.Prelude



data UserRequest = UserRequest {
  userRequestDisplayNick :: Text,
  userRequestName        :: Text,
  userRequestEmail       :: Text,
  userRequestPlugin      :: Text,
  userRequestIdent       :: Text,
  userRequestAcceptTOS   :: Maybe UTCTime
} deriving (Generic, Typeable)



defaultUserRequest :: UserRequest
defaultUserRequest = UserRequest {
  userRequestDisplayNick = "",
  userRequestName        = "",
  userRequestEmail       = "",
  userRequestPlugin      = "",
  userRequestIdent       = "",
  userRequestAcceptTOS   = Nothing
}



testUserRequest :: UserRequest
testUserRequest = defaultUserRequest {
  userRequestDisplayNick = "test",
  userRequestName        = "test",
  userRequestEmail       = "test@test.com",
  userRequestPlugin      = "test",
  userRequestIdent       = "test"
}
