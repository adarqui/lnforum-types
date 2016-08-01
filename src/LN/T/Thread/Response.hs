{-# LANGUAGE DeriveGeneric #-}

module LN.T.Thread.Response (
  ThreadResponse (..),
  ThreadResponses (..),
) where



import           LN.T.Prelude



data ThreadResponse = ThreadResponse {
  threadResponseId          :: Int64,
  threadResponseUserId      :: Int64,
  threadResponseOrgId       :: Int64,
  threadResponseForumId     :: Int64,
  threadResponseBoardId     :: Int64,
  threadResponseName        :: Text,
  threadResponseDisplayName :: Text,
  threadResponseDescription :: Maybe Text,
  threadResponseSticky      :: Bool,
  threadResponseLocked      :: Bool,
  threadResponsePoll        :: Maybe Text,
  -- Shared
  threadResponseIcon        :: Maybe Text,
  threadResponseTags        :: [Text],
  -- Shared
  threadResponseActive      :: Bool,
  threadResponseGuard       :: Int,
  threadResponseCreatedAt   :: Maybe UTCTime,
  threadResponseModifiedBy  :: Maybe Int64,
  threadResponseModifiedAt  :: Maybe UTCTime,
  threadResponseActivityAt  :: Maybe UTCTime
} deriving (Generic, Typeable)



data ThreadResponses = ThreadResponses {
  threadResponses :: [ThreadResponse]
} deriving (Generic, Typeable)
