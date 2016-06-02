{-# LANGUAGE DeriveGeneric #-}

module LN.T.Forum.Request (
  ForumRequest (..),
  defaultForumRequest,
) where



import           LN.T.Prelude
import           LN.T.Visibility



data ForumRequest = ForumRequest {
  forumRequestName        :: Text,
  forumRequestDescription :: Maybe Text,
  forumRequestIcon        :: Maybe Text,
  forumRequestTags        :: [Text],
  forumRequestVisibility  :: Visibility
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultForumRequest :: ForumRequest
defaultForumRequest = ForumRequest {
  forumRequestName        = "",
  forumRequestDescription = Nothing,
  forumRequestIcon        = Nothing,
  forumRequestTags        = [],
  forumRequestVisibility  = Public
}
