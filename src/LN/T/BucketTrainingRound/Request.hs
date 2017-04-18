{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketTrainingRound.Request (
  BucketTrainingRoundRequest (..)
) where



import           LN.T.Prelude



data BucketTrainingRoundRequest = BucketTrainingRoundRequest {
  bucketTrainingRoundRequestStyles       :: [Text],
  bucketTrainingRoundRequestThreshold    :: Int64,
  bucketTrainingRoundRequestTimeLimit    :: Int64,
  bucketTrainingRoundRequestRequestGuard :: Int
} deriving (Generic, Typeable)
