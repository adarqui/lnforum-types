{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Pack.User (
  UserPackResponse (..),
  UserPackResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Profile.Response
import           LN.T.User.Response
import           LN.T.User.Sanitized.Stat



data UserPackResponse = UserPackResponse {
  userPackResponseUser        :: UserResponse,
  userPackResponseUserStat    :: UserSanitizedStatResponse,
  userPackResponseUserProfile :: ProfileResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data UserPackResponses = UserPackResponses {
  userPackResponses :: [UserPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
