{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Bucket.Response (
  BucketResponse (..),
  BucketResponses (..),
) where



import           LN.T.Bucket
import           LN.T.Prelude



data BucketResponse = BucketResponse {
  bucketResponseId          :: Int64,
  bucketResponseUserId      :: Int64,
  bucketResponseName        :: Text,
  bucketResponseDescription :: Maybe Text,
  bucketResponseScoreLo     :: Int,
  bucketResponseScoreHi     :: Int,
  bucketResponseLeurons     :: [Int64],
  bucketResponseResources   :: [Int64],
  bucketResponseCategories  :: [Text],
  bucketResponseFilters     :: [Int64],
  bucketResponseCreatedAt   :: Maybe UTCTime,
  bucketResponseModifiedAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data BucketResponses = BucketResponses {
  bucketResponses :: [BucketResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
