{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Bucket (
  BucketPackResponse (..),
  BucketPackResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Bucket.Response
import           LN.T.User.Sanitized.Response



data BucketPackResponse = BucketPackResponse {
  bucketPackResponseBucket    :: BucketResponse,
  bucketPackResponseBucketId  :: Int64,
  bucketPackResponseUser      :: UserSanitizedResponse,
  bucketPackResponseUserId    :: Int64
} deriving (Generic, Typeable)



data BucketPackResponses = BucketPackResponses {
  bucketPackResponses :: [BucketPackResponse]
} deriving (Generic, Typeable)
