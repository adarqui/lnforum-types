{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Forum (
  ForumPackResponse (..),
  ForumPackResponses (..),
) where



import           LN.T.Forum.Response
import           LN.T.Forum.Stat
import           LN.T.Like.Response
import           LN.T.Prelude
import           LN.T.Star.Response



data ForumPackResponse = ForumPackResponse {
  -- forumPackResponseOrganizations :: OrganizationResponse ??
  forumPackResponseForum   :: ForumResponse,
  forumPackResponseForumId :: Int64,
  forumPackResponseStat    :: ForumStatResponse,
  forumPackResponseLike    :: Maybe LikeResponse,
  forumPackResponseStar    :: Maybe StarResponse,
  forumPackResponseIsOwner :: Bool
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ForumPackResponses = ForumPackResponses {
  forumPackResponses :: [ForumPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
