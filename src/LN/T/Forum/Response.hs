{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Forum.Response (
  ForumResponse (..),
  ForumResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Forum



data ForumResponse = ForumResponse {
  forumResponseId          :: Int64,
  forumResponseUserId      :: Int64,
  forumResponseOrgId       :: Int64,
  forumResponseName        :: Text,
  forumResponseDescription :: Maybe Text,
  forumResponseCreatedAt   :: Maybe UTCTime,
  forumResponseModifiedBy  :: Maybe Int64,
  forumResponseModifiedAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ForumResponses = ForumResponses {
  forumResponses :: [ForumResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
