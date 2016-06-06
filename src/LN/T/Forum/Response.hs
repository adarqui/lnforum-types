{-# LANGUAGE DeriveGeneric #-}

module LN.T.Forum.Response (
  ForumResponse (..),
  ForumResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Visibility



data ForumResponse = ForumResponse {
  forumResponseId          :: Int64,
  forumResponseUserId      :: Int64,
  forumResponseOrgId       :: Int64,
  forumResponseName        :: Text,
  forumResponseDisplayName :: Text,
  forumResponseDescription :: Maybe Text,
  forumResponseIcon        :: Maybe Text,
  forumResponseTags        :: [Text],
  forumResponseVisibility  :: Visibility,
  forumResponseActive      :: Bool,
  forumResponseGuard       :: Int,
  forumResponseCreatedAt   :: Maybe UTCTime,
  forumResponseModifiedBy  :: Maybe Int64,
  forumResponseModifiedAt  :: Maybe UTCTime,
  forumResponseActivityAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ForumResponses = ForumResponses {
  forumResponses :: [ForumResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
