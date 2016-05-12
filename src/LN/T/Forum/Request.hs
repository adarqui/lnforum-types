{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Forum.Request (
  ForumRequest (..),
  defaultForumRequest,
) where



import           LN.T.Prelude
import           LN.T.Forum



data ForumRequest = ForumRequest {
  forumRequestName        :: Text,
  forumRequestDescription :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultForumRequest :: ForumRequest
defaultForumRequest = ForumRequest {
  forumRequestName = "",
  forumRequestDescription = Nothing
}
