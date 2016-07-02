{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Resource (
  ResourcePackResponse (..),
  ResourcePackResponses (..),
) where



import           LN.T.Like.Response
import           LN.T.Permission
import           LN.T.Prelude
import           LN.T.Resource.Response
import           LN.T.Resource.Stat
import           LN.T.Star.Response
import           LN.T.User.Sanitized.Response



data ResourcePackResponse = ResourcePackResponse {
  resourcePackResponseResource    :: ResourceResponse,
  resourcePackResponseResourceId  :: Int64,
  resourcePackResponseUser        :: UserSanitizedResponse,
  resourcePackResponseUserId      :: Int64,
  resourcePackResponseStat        :: ResourceStatResponse,
  resourcePackResponseLike        :: Maybe LikeResponse,
  resourcePackResponseStar        :: Maybe StarResponse,
  resourcePackResponsePermissions :: Permissions
} deriving (Generic, Typeable)



data ResourcePackResponses = ResourcePackResponses {
  resourcePackResponses :: [ResourcePackResponse]
} deriving (Generic, Typeable)
