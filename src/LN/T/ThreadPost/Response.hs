{-# LANGUAGE DeriveGeneric #-}

module LN.T.ThreadPost.Response (
  ThreadPostResponse (..),
  ThreadPostResponses (..),
) where



import           LN.T.Prelude
import           LN.T.ThreadPost



data ThreadPostResponse = ThreadPostResponse {
  threadPostResponseId          :: Int64,
  threadPostResponseUserId      :: Int64,
  threadPostResponseOrgId       :: Int64,
  threadPostResponseForumId     :: Int64,
  threadPostResponseBoardId     :: Int64,
  threadPostResponseThreadId    :: Int64,
  threadPostResponseParentId    :: Maybe Int64,
  threadPostResponseTitle       :: Maybe Text,
  threadPostResponseBody        :: PostData,
  threadPostResponseTags        :: [Text],
  threadPostResponsePrivateTags :: [Text],
  threadPostResponseActive      :: Bool,
  threadPostResponseGuard       :: Int,
  threadPostResponseCreatedAt   :: Maybe UTCTime,
  threadPostResponseModifiedBy  :: Maybe Int64,
  threadPostResponseModifiedAt  :: Maybe UTCTime,
  threadPostResponseActivityAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data ThreadPostResponses = ThreadPostResponses {
  threadPostResponses :: [ThreadPostResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
