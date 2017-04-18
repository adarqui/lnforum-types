{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketTrainingNode.Request (
  BucketTrainingNodeRequest (..)
) where



import           LN.T.Prelude



data BucketTrainingNodeRequest = BucketTrainingNodeRequest {
  bucketTrainingNodeRequestRequestGuard :: Int
} deriving (Generic, Typeable)
