{-# LANGUAGE DeriveGeneric #-}

module LN.T.Like.Response (
  LikeResponse (..),
  LikeResponses (..),
) where



import           LN.T.Entity
import           LN.T.Like
import           LN.T.Prelude
import           LN.T.User



data LikeResponse = LikeResponse {
  likeResponseId         :: Int64,
  likeResponseEntity     :: Ent,
  likeResponseUserId     :: Int64,
  likeResponseOpt        :: LikeOpt,
  likeResponseScore      :: Int,
  likeResponseReason     :: Maybe Text,
  likeResponseCreatedAt  :: Maybe UTCTime,
  likeResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data LikeResponses = LikeResponses {
  likeResponses :: [LikeResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
