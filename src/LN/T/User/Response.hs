{-# LANGUAGE DeriveGeneric #-}

module LN.T.User.Response (
  UserResponse (..),
  UserResponses (..),
) where



import           LN.T.Prelude
import           LN.T.User



data UserResponse = UserResponse {
  userResponseId            :: Int64,
  userResponseNick          :: Text,
  userResponseDisplayNick   :: Text,
  userResponseName          :: Text,
  userResponseEmail         :: Text,
  userResponseEmailMD5      :: Text,
  userResponsePlugin        :: Text,
  userResponseIdent         :: Text,
  userResponseActive        :: Bool,
  userResponseCreatedAt     :: Maybe UTCTime,
  userResponseModifiedAt    :: Maybe UTCTime,
  userResponseDeactivatedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data UserResponses = UserResponses {
  userResponses :: [UserResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
