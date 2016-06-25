{-# LANGUAGE DeriveGeneric #-}

module LN.T.Forum.Request (
  ForumRequest (..),
  defaultForumRequest,
) where



import           LN.T.Prelude
import           LN.T.Visibility



data ForumRequest = ForumRequest {
  forumRequestDisplayName          :: Text,
  forumRequestDescription          :: Maybe Text,
  forumRequestThreadsPerBoard      :: Int,
  forumRequestThreadPostsPerThread :: Int,
  forumRequestRecentThreadsLimit   :: Int,
  forumRequestRecentPostsLimit     :: Int,
  forumRequestMOTWLimit            :: Int,
  forumRequestIcon                 :: Maybe Text,
  forumRequestTags                 :: [Text],
  forumRequestVisibility           :: Visibility,
  forumRequestGuard                :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultForumRequest :: ForumRequest
defaultForumRequest = ForumRequest {
  forumRequestDisplayName          = "",
  forumRequestDescription          = Nothing,
  forumRequestThreadsPerBoard      = 20,
  forumRequestThreadPostsPerThread = 20,
  forumRequestRecentThreadsLimit   = 10,
  forumRequestRecentPostsLimit     = 10,
  forumRequestMOTWLimit            = 10,
  forumRequestIcon                 = Nothing,
  forumRequestTags                 = [],
  forumRequestVisibility           = Public,
  forumRequestGuard                = 0
}
