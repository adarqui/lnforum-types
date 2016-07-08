{-# LANGUAGE DeriveGeneric #-}

module LN.T.Bucket.Request (
  BucketRequest (..)
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
} deriving (Generic, Typeable)
