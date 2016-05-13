{-# LANGUAGE DeriveAnyClass    #-}

module LN.T.ThreadPost.Star.Response (
  ThreadPostStarResponse (..),
  ThreadPostStarResponses (..),
) where



import           LN.T.Prelude
import           LN.T.User



data ThreadPostStarResponse = ThreadPostStarResponse {
  threadPostStarResponseId           :: Int64,
  threadPostStarResponseThreadPostId :: Int64,
  threadPostStarResponseUserId       :: Int64,
  threadPostStarResponseReason       :: Maybe Text,
  threadPostStarResponseCreatedAt    :: Maybe UTCTime,
  threadPostStarResponseModifiedAt   :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadPostStarResponses = ThreadPostStarResponses {
  threadPostStarResponses :: [ThreadPostStarResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
