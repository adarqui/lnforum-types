{-# LANGUAGE DeriveAnyClass    #-}

module LN.T.Resource.Like.Response (
  ResourceLikeResponse (..),
  ResourceLikeResponses (..),
) where



import           LN.T.Like
import           LN.T.Prelude
import           LN.T.User



data ResourceLikeResponse = ResourceLikeResponse {
  resourceLikeResponseId         :: Int64,
  resourceLikeResponseResourceId :: Int64,
  resourceLikeResponseUserId     :: Int64,
  resourceLikeResponseOpt        :: LikeOpt,
  resourceLikeResponseScore      :: Int,
  resourceLikeResponseReason     :: Maybe Text,
  resourceLikeResponseCreatedAt  :: Maybe UTCTime,
  resourceLikeResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ResourceLikeResponses = ResourceLikeResponses {
  resourceLikeResponses :: [ResourceLikeResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
