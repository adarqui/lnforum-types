{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Sanitized.User (
  UserSanitizedPackResponse (..),
  UserSanitizedPackResponses (..),
) where



import           LN.T.Like.Response
import           LN.T.Prelude
import           LN.T.Profile.Response
import           LN.T.Star.Response
import           LN.T.User.Sanitized.Response
import           LN.T.User.Sanitized.Stat



data UserSanitizedPackResponse = UserSanitizedPackResponse {
  userSanitizedPackResponseUser      :: UserSanitizedResponse,
  userSanitizedPackResponseUserId    :: Int64,
  userSanitizedPackResponseProfile   :: ProfileResponse,
  userSanitizedPackResponseProfileId :: Int64,
  userSanitizedPackResponseStat      :: UserSanitizedStatResponse,
  userSanitizedPackResponseLike      :: Maybe LikeResponse,
  userSanitizedPackResponseStar      :: Maybe StarResponse
} deriving (Generic, Typeable)



data UserSanitizedPackResponses = UserSanitizedPackResponses {
  userSanitizedPackResponses :: [UserSanitizedPackResponse]
} deriving (Generic, Typeable)
