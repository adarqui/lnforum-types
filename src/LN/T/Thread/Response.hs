{-# LANGUAGE DeriveGeneric #-}

module LN.T.Thread.Response (
  ThreadResponse (..),
  ThreadResponses (..),
) where



import           LN.T.Prelude



data ThreadResponse = ThreadResponse {
  threadResponseId          :: Int64,
  threadResponseUserId      :: Int64,
  threadResponseBoardId     :: Int64,
  threadResponseName        :: Text,
  threadResponseDescription :: Maybe Text,
  threadResponseSticky      :: Bool,
  threadResponseLocked      :: Bool,
  threadResponsePoll        :: Maybe Text,
  threadResponseIcon        :: Maybe Text,
  threadResponseTags        :: [Text],
  threadResponseCreatedAt   :: Maybe UTCTime,
  threadResponseModifiedBy  :: Maybe Int64,
  threadResponseModifiedAt  :: Maybe UTCTime,
  threadResponseActivityAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadResponses = ThreadResponses {
  threadResponses :: [ThreadResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
