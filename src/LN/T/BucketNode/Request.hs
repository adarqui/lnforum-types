{-# LANGUAGE DeriveGeneric #-}

module LN.T.BucketNode.Request (
  BucketNodeRequest (..)
) where



import           LN.T.Prelude



data BucketNodeRequest = BucketNodeRequest {
  bucketNodeRequestRequestGuard :: Int
} deriving (Generic, Typeable)
