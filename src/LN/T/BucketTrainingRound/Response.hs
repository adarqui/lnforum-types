{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketTrainingRound.Response (
  BucketTrainingRoundResponse (..),
  BucketTrainingRoundResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Training



data BucketTrainingRoundResponse = BucketTrainingRoundResponse {
  bucketTrainingRoundResponseId         :: Int64,
  bucketTrainingRoundResponseUserId     :: Int64,
  bucketTrainingRoundResponseBucketId   :: Int64,
  bucketTrainingRoundResponseBucketTrainingId   :: Int64,
  bucketTrainingRoundResponseStyles     :: [Text],
  bucketTrainingRoundResponseThreshold  :: Int64,
  bucketTrainingRoundResponseTimeLimit  :: Int64,
  bucketTrainingRoundResponseNode       :: TrainingNode,
  bucketTrainingRoundResponseActive     :: Bool,
  bucketTrainingRoundResponseGuard      :: Int,
  bucketTrainingRoundResponseCreatedAt  :: Maybe UTCTime,
  bucketTrainingRoundResponseModifiedAt :: Maybe UTCTime,
  bucketTrainingRoundResponseActivityAt :: Maybe UTCTime
} deriving (Generic, Typeable)



data BucketTrainingRoundResponses = BucketTrainingRoundResponses {
  bucketTrainingRoundResponses :: [BucketTrainingRoundResponse]
} deriving (Generic, Typeable)
