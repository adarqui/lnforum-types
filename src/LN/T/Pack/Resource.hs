{-# LANGUAGE DeriveAnyClass #-}

module LN.T.Pack.Resource (
  ResourcePackResponse (..),
  ResourcePackResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Resource.Response
import           LN.T.Resource.Stat
import           LN.T.Resource.Like.Response
import           LN.T.Resource.Star.Response
import           LN.T.User.Sanitized.Response



data ResourcePackResponse = ResourcePackResonse {
  resourcePackResponseResource :: ResourceResponse,
  resourcePackResponseUser     :: UserSanitizedResponse,
  resourcePackResponseStat     :: ResourceStatResponse,
  resourcePackResponseLike     :: Maybe ResourceLikeResponse,
  resourcePackResponseStar     :: Maybe ResourceStarResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ResourcePackResponses = ResourcePackResponses {
  resourcePackResponses :: [ResourcePackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
