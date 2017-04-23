{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketNode.Response (
  BucketNodeResponse (..),
  BucketNodeResponses (..),
) where



import           LN.T.Prelude



data BucketNodeResponse = BucketNodeResponse {
  bucketNodeResponseId                :: Int64,
  bucketNodeResponseUserId            :: Int64,
  bucketNodeResponseBucketId          :: Int64,
  bucketNodeResponseLeuronId          :: Int64,
  bucketNodeResponseTimeLimit         :: Int64,
  bucketNodeResponseTimeLimitExceeded :: Int64,
  bucketNodeResponseStyle             :: Text,
  -- bucketNodeResponseQuiz
  -- bucketNodeResponseQuizResult
  -- bucketNodeResponseCorrect
  --
  bucketNodeResponseActive            :: Bool,
  bucketNodeResponseGuard             :: Int,
  bucketNodeResponseCreatedAt         :: Maybe UTCTime,
  bucketNodeResponseModifiedAt        :: Maybe UTCTime
} deriving (Generic, Typeable)



data BucketNodeResponses = BucketNodeResponses {
  bucketNodeResponses :: [BucketNodeResponse]
} deriving (Generic, Typeable)
