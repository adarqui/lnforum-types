{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketRound.Request (
  BucketRoundRequest (..)
) where



import           LN.T.Prelude
import           LN.T.Training



data BucketRoundRequest = BucketRoundRequest {
  bucketRoundRequestTrainingStyles :: [TrainingStyle],
  bucketRoundRequestThreshold      :: Int64,
  bucketRoundRequestTimeLimit      :: Int64,
  bucketRoundRequestGuard          :: Int
} deriving (Generic, Typeable)
