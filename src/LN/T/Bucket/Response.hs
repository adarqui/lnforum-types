{-# LANGUAGE DeriveGeneric  #-}

module LN.T.Bucket.Response (
  BucketResponse (..),
  BucketResponses (..),
) where



import           LN.T.Prelude



data BucketResponse = BucketResponse {
  bucketResponseId          :: Int64,
  bucketResponseUserId      :: Int64,
  bucketResponseName        :: Text,
  bucketResponseDisplayName :: Text,
  bucketResponseDescription :: Maybe Text,
  bucketResponseScoreLo     :: Int,
  bucketResponseScoreHi     :: Int,
  bucketResponseLeurons     :: [Int64],
  bucketResponseResources   :: [Int64],
  bucketResponseCategories  :: [Text],
  bucketResponseFilters     :: [Int64],
  bucketResponseActive      :: Bool,
  bucketResponseGuard       :: Int,
  bucketResponseCreatedAt   :: Maybe UTCTime,
  bucketResponseModifiedAt  :: Maybe UTCTime,
  bucketResponseActivityAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data BucketResponses = BucketResponses {
  bucketResponses :: [BucketResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
