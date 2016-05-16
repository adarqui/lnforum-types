{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Forum (
  ForumPackResponse (..),
  ForumPackResponses (..),
) where



import           LN.T.Forum.Response
import           LN.T.Forum.Stat
import           LN.T.Prelude



data ForumPackResponse = ForumPackResponse {
  -- forumPackResponseOrganizations :: OrganizationResponse ??
  forumPackResponseForum :: ForumResponse,
  forumPackResponseStat  :: ForumStatResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ForumPackResponses = ForumPackResponses {
  forumPackResponses :: [ForumPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
