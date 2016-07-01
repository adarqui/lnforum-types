{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.Bucket.Request (
  BucketRequest (..),
  defaultBucketRequest,
  testBucketRequest
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



defaultBucketRequest :: BucketRequest
defaultBucketRequest = BucketRequest {
  bucketRequestDisplayName  = "",
  bucketRequestDescription  = Nothing,
  bucketRequestScoreLo      = -1000,
  bucketRequestScoreHi      = 3,
  bucketRequestLeurons      = [],
  bucketRequestResources    = [],
  bucketRequestCategories   = [],
  bucketRequestFilters      = [],
  bucketRequestGuard        = 0
}



testBucketRequest :: BucketRequest
testBucketRequest = defaultBucketRequest {
  bucketRequestDisplayName  = "test",
  bucketRequestDescription  = Just "test"
}
