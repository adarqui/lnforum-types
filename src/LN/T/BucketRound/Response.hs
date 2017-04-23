{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketRound.Response (
  BucketRoundResponse (..),
  BucketRoundResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Training



data BucketRoundResponse = BucketRoundResponse {
  bucketRoundResponseId               :: Int64,
  bucketRoundResponseUserId           :: Int64,
  bucketRoundResponseBucketId         :: Int64,
  bucketRoundResponseTrainingStyles   :: [TrainingStyle],
  bucketRoundResponseThreshold        :: Int64,
  bucketRoundResponseTimeLimit        :: Int64,
  bucketRoundResponseTrainingNode     :: TrainingNode,
  bucketRoundResponseActive           :: Bool,
  bucketRoundResponseGuard            :: Int,
  bucketRoundResponseCreatedAt        :: Maybe UTCTime,
  bucketRoundResponseModifiedAt       :: Maybe UTCTime,
  bucketRoundResponseActivityAt       :: Maybe UTCTime
} deriving (Generic, Typeable)



data BucketRoundResponses = BucketRoundResponses {
  bucketRoundResponses :: [BucketRoundResponse]
} deriving (Generic, Typeable)
