{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketRound.Request (
  BucketRoundRequest (..)
) where



import           LN.T.Prelude



data BucketRoundRequest = BucketRoundRequest {
  bucketRoundRequestStyles       :: [Text],
  bucketRoundRequestThreshold    :: Int64,
  bucketRoundRequestTimeLimit    :: Int64,
  bucketRoundRequestRequestGuard :: Int
} deriving (Generic, Typeable)
