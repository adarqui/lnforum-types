{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

-- WARNING: Assumes Sanitized

module LN.T.Pack.Sanitized.User (
  UserSanitizedPackResponse (..),
  UserSanitizedPackResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Profile.Response
import           LN.T.User.Sanitized.Response
import           LN.T.User.Sanitized.Stat



data UserSanitizedPackResponse = UserSanitizedPackResponse {
  userSanitizedPackResponseUser        :: UserSanitizedResponse,
  userSanitizedPackResponseUserStat    :: UserSanitizedStatResponse,
  userSanitizedPackResponseUserProfile :: ProfileResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data UserSanitizedPackResponses = UserSanitizedPackResponses {
  userSanitizedPackResponses :: [UserSanitizedPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
