{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module LN.T.ThreadPost.Like.Response (
  ThreadPostLikeResponse (..),
  ThreadPostLikeResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Like
import           LN.T.User



data ThreadPostLikeResponse = ThreadPostLikeResponse {
  threadPostLikeResponseId           :: Int64,
  threadPostLikeResponseThreadPostId :: Int64,
  threadPostLikeResponseUserId       :: Int64,
  threadPostLikeResponseOpt          :: LikeOpt,
  threadPostLikeResponseScore        :: Int,
  threadPostLikeResponseReason       :: Maybe Text,
  threadPostLikeResponseCreatedAt    :: Maybe UTCTime,
  threadPostLikeResponseModifiedAt   :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadPostLikeResponses = ThreadPostLikeResponses {
  threadPostLikeResponses :: [ThreadPostLikeResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
