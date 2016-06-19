{-# LANGUAGE DeriveGeneric #-}

module LN.T.Bucket.Request (
  BucketRequest (..),
  defaultBucketRequest,
) where



import           LN.T.Prelude



data BucketRequest = BucketRequest {
  bucketRequestDisplayName :: Text,
  bucketRequestDescription :: Maybe Text,
  bucketRequestScoreLo     :: Int,
  bucketRequestScoreHi     :: Int,
  bucketRequestLeurons     :: [Int64],
  bucketRequestResources   :: [Int64],
  bucketRequestCategories  :: [Text],
  bucketRequestFilters     :: [Int64],
  bucketRequestGuard       :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultBucketRequest :: Text -> BucketRequest
defaultBucketRequest name = BucketRequest {
  bucketRequestDisplayName  = name,
  bucketRequestDescription = Nothing,
  bucketRequestScoreLo     = -1000,
  bucketRequestScoreHi     = 3,
  bucketRequestLeurons     = [],
  bucketRequestResources   = [],
  bucketRequestCategories  = [],
  bucketRequestFilters     = [],
  bucketRequestGuard       = 0
}
