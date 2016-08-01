{-# LANGUAGE DeriveGeneric #-}

module LN.T.Forum.Response (
  ForumResponse (..),
  ForumResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Visibility



data ForumResponse = ForumResponse {
  forumResponseId                   :: Int64,
  forumResponseUserId               :: Int64,
  forumResponseOrgId                :: Int64,
  forumResponseName                 :: Text,
  forumResponseDisplayName          :: Text,
  forumResponseDescription          :: Maybe Text,
  forumResponseThreadsPerBoard      :: Int,
  forumResponseThreadPostsPerThread :: Int,
  forumResponseRecentThreadsLimit   :: Int,
  forumResponseRecentPostsLimit     :: Int,
  forumResponseMotwLimit            :: Int,
  forumResponseIcon                 :: Maybe Text,
  forumResponseTags                 :: [Text],
  forumResponseVisibility           :: Visibility,
  -- Shared
  forumResponseActive               :: Bool,
  forumResponseGuard                :: Int,
  forumResponseCreatedAt            :: Maybe UTCTime,
  forumResponseModifiedBy           :: Maybe Int64,
  forumResponseModifiedAt           :: Maybe UTCTime,
  forumResponseActivityAt           :: Maybe UTCTime
} deriving (Generic, Typeable)



data ForumResponses = ForumResponses {
  forumResponses :: [ForumResponse]
} deriving (Generic, Typeable)
