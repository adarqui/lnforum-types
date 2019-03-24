{-# LANGUAGE DeriveGeneric #-}

module LN.T.Forum.Request (
  ForumRequest (..)
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
  forumRequestMotwLimit            :: Int,
  forumRequestIcon                 :: Maybe Text,
  forumRequestTags                 :: [Text],
  forumRequestVisibility           :: Visibility,
  forumRequestGuard                :: Int,
  -- State
  forumRequestStateTag             :: Maybe Text
} deriving (Generic, Typeable)
