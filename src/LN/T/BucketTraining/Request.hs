{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketTraining.Request (
  BucketTrainingRequest (..)
) where



import           LN.T.Prelude



data BucketTrainingRequest = BucketTrainingRequest {
  bucketTrainingRequestRounds       :: Int64,
  bucketTrainingRequestMaxRounds    :: Int64,
  bucketTrainingRequestStyles       :: [Text],
  bucketTrainingRequestThreshold    :: Int64,
  bucketTrainingRequestTimeLimit    :: Int64,
  bucketTrainingRequestRequestGuard :: Int
} deriving (Generic, Typeable)
