{-# LANGUAGE DeriveGeneric #-}

module LN.T.Bucket.Request (
  BucketRequest (..),
  defaultBucketRequest,
) where



import           LN.T.Prelude



data BucketRequest = BucketRequest {
  bucketRequestName        :: Text,
  bucketRequestDescription :: Maybe Text,
  bucketRequestScoreLo     :: Int,
  bucketRequestScoreHi     :: Int,
  bucketRequestLeurons     :: [Int64],
  bucketRequestResources   :: [Int64],
  bucketRequestCategories  :: [Text],
  bucketRequestFilters     :: [Int64]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultBucketRequest :: Text -> BucketRequest
defaultBucketRequest name = BucketRequest {
  bucketRequestName        = name,
  bucketRequestDescription = Nothing,
  bucketRequestScoreLo     = -1000,
  bucketRequestScoreHi     = 3,
  bucketRequestLeurons     = [],
  bucketRequestResources   = [],
  bucketRequestCategories  = [],
  bucketRequestFilters     = []
}
