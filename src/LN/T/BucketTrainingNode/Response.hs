{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketTrainingNode.Response (
  BucketTrainingNodeResponse (..),
  BucketTrainingNodeResponses (..),
) where



import           LN.T.Prelude



data BucketTrainingNodeResponse = BucketTrainingNodeResponse {
  bucketTrainingNodeResponseId                :: Int64,
  bucketTrainingNodeResponseUserId            :: Int64,
  bucketTrainingNodeResponseBucketId          :: Int64,
  bucketTrainingNodeResponseBucketTrainingId  :: Int64,
  bucketTrainingNodeResponseLeuronId          :: Int64,
  bucketTrainingNodeResponseTimeLimit         :: Int64,
  bucketTrainingNodeResponseTimeLimitExceeded :: Int64,
  bucketTrainingNodeResponseStyle             :: Text,
  -- bucketTrainingNodeResponseQuiz
  -- bucketTrainingNodeResponseQuizResult
  -- bucketTrainingNodeResponseCorrect
  --
  bucketTrainingNodeResponseActive            :: Bool,
  bucketTrainingNodeResponseGuard             :: Int,
  bucketTrainingNodeResponseCreatedAt         :: Maybe UTCTime,
  bucketTrainingNodeResponseModifiedAt        :: Maybe UTCTime
} deriving (Generic, Typeable)



data BucketTrainingNodeResponses = BucketTrainingNodeResponses {
  bucketTrainingNodeResponses :: [BucketTrainingNodeResponse]
} deriving (Generic, Typeable)
