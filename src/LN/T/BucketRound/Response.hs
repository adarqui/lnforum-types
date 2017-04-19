{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketRound.Response (
  BucketRoundResponse (..),
  BucketRoundResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Training



data BucketRoundResponse = BucketRoundResponse {
  bucketRoundResponseId         :: Int64,
  bucketRoundResponseUserId     :: Int64,
  bucketRoundResponseBucketId   :: Int64,
  bucketRoundResponseBucketTrainingId   :: Int64,
  bucketRoundResponseStyles     :: [Text],
  bucketRoundResponseThreshold  :: Int64,
  bucketRoundResponseTimeLimit  :: Int64,
  bucketRoundResponseNode       :: TrainingNode,
  bucketRoundResponseActive     :: Bool,
  bucketRoundResponseGuard      :: Int,
  bucketRoundResponseCreatedAt  :: Maybe UTCTime,
  bucketRoundResponseModifiedAt :: Maybe UTCTime,
  bucketRoundResponseActivityAt :: Maybe UTCTime
} deriving (Generic, Typeable)



data BucketRoundResponses = BucketRoundResponses {
  bucketRoundResponses :: [BucketRoundResponse]
} deriving (Generic, Typeable)
