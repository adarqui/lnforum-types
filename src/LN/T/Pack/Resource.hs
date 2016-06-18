{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Resource (
  ResourcePackResponse (..),
  ResourcePackResponses (..),
) where



import           LN.T.Like.Response
import           LN.T.Prelude
import           LN.T.Resource.Response
import           LN.T.Resource.Stat
import           LN.T.Star.Response
import           LN.T.User.Sanitized.Response



data ResourcePackResponse = ResourcePackResponse {
  resourcePackResponseResource   :: ResourceResponse,
  resourcePackResponseResourceId :: Int64,
  resourcePackResponseUser       :: UserSanitizedResponse,
  resourcePackResponseUserId     :: Int64,
  resourcePackResponseStat       :: ResourceStatResponse,
  resourcePackResponseLike       :: Maybe LikeResponse,
  resourcePackResponseStar       :: Maybe StarResponse,
  resourcePackResponseIsOwner    :: Bool
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ResourcePackResponses = ResourcePackResponses {
  resourcePackResponses :: [ResourcePackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
