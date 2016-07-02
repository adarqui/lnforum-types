{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Forum (
  ForumPackResponse (..),
  ForumPackResponses (..),
) where



import           LN.T.Forum.Response
import           LN.T.Forum.Stat
import           LN.T.Like.Response
import           LN.T.Organization.Response
import           LN.T.Permission
import           LN.T.Prelude
import           LN.T.Star.Response



data ForumPackResponse = ForumPackResponse {
  forumPackResponseForum            :: ForumResponse,
  forumPackResponseForumId          :: Int64,
  forumPackResponseStat             :: ForumStatResponse,
  forumPackResponseLike             :: Maybe LikeResponse,
  forumPackResponseStar             :: Maybe StarResponse,
  forumPackResponseWithOrganization :: Maybe OrganizationResponse,
  forumPackResponsePermissions      :: Permissions
} deriving (Generic, Typeable)



data ForumPackResponses = ForumPackResponses {
  forumPackResponses :: [ForumPackResponse]
} deriving (Generic, Typeable)
