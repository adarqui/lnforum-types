{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.User (
  UserPackResponse (..),
  UserPackResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Profile.Response
import           LN.T.User.Response
import           LN.T.User.Sanitized.Stat



data UserPackResponse = UserPackResponse {
  userPackResponseUser      :: UserResponse,
  userPackResponseUserId    :: Int64,
  userPackResponseStat      :: UserSanitizedStatResponse,
  userPackResponseProfile   :: ProfileResponse,
  userPackResponseProfileId :: Int64
} deriving (Generic, Typeable)



data UserPackResponses = UserPackResponses {
  userPackResponses :: [UserPackResponse]
} deriving (Generic, Typeable)
