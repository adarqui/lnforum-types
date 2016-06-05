{-# LANGUAGE DeriveGeneric #-}

module LN.T.Forum.Request (
  ForumRequest (..),
  defaultForumRequest,
) where



import           LN.T.Prelude
import           LN.T.Visibility



data ForumRequest = ForumRequest {
  forumRequestDisplayName :: Text,
  forumRequestDescription :: Maybe Text,
  forumRequestIcon        :: Maybe Text,
  forumRequestTags        :: [Text],
  forumRequestVisibility  :: Visibility,
  forumRequestGuard       :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultForumRequest :: ForumRequest
defaultForumRequest = ForumRequest {
  forumRequestDisplayName = "",
  forumRequestDescription = Nothing,
  forumRequestIcon        = Nothing,
  forumRequestTags        = [],
  forumRequestVisibility  = Public,
  forumRequestGuard       = 0
}
