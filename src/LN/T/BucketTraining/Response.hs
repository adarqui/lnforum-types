{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketTraining.Response (
  BucketTrainingResponse (..),
  BucketTrainingResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Training



data BucketTrainingResponse = BucketTrainingResponse {
  bucketTrainingResponseId         :: Int64,
  bucketTrainingResponseUserId     :: Int64,
  bucketTrainingResponseBucketId   :: Int64,
  bucketTrainingResponseRounds     :: Int64,
  bucketTrainingResponseMaxRounds  :: Int64,
  bucketTrainingResponseStyles     :: [Text],
  bucketTrainingResponseThreshold  :: Int64,
  bucketTrainingResponseTimeLimit  :: Int64,
  bucketTrainingResponseNode       :: TrainingNode,
  bucketTrainingResponseActive     :: Bool,
  bucketTrainingResponseGuard      :: Int,
  bucketTrainingResponseCreatedAt  :: Maybe UTCTime,
  bucketTrainingResponseModifiedAt :: Maybe UTCTime,
  bucketTrainingResponseActivityAt :: Maybe UTCTime
} deriving (Generic, Typeable)



data BucketTrainingResponses = BucketTrainingResponses {
  bucketTrainingResponses :: [BucketTrainingResponse]
} deriving (Generic, Typeable)
