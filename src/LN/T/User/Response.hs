{-# LANGUAGE DeriveGeneric #-}

module LN.T.User.Response (
  UserResponse (..),
  UserResponses (..),
) where



import           LN.T.Prelude



data UserResponse = UserResponse {
  userResponseId            :: Int64,
  userResponseNick          :: Text,
  userResponseDisplayNick   :: Text,
  userResponseName          :: Text,
  userResponseEmail         :: Text,
  userResponseEmailMD5      :: Text,
  userResponsePlugin        :: Text,
  userResponseIdent         :: Text,
  userResponseAcceptTOS     :: Maybe UTCTime,
  userResponseActive        :: Bool,
  userResponseGuard         :: Int,
  userResponseCreatedAt     :: Maybe UTCTime,
  userResponseModifiedAt    :: Maybe UTCTime,
  userResponseDeactivatedAt :: Maybe UTCTime,
  userResponseActivityAt    :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data UserResponses = UserResponses {
  userResponses :: [UserResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
