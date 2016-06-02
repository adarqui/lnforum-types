{-# LANGUAGE DeriveGeneric #-}

module LN.T.Thread.Stat (
  ThreadStatResponse (..),
  ThreadStatResponses (..),
) where



import           LN.T.Prelude



data ThreadStatResponse = ThreadStatResponse {
  threadStatResponseThreadId    :: Int64,
  threadStatResponseThreadPosts :: Int64,
  threadStatResponseViews       :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadStatResponses = ThreadStatResponses {
  threadStatResponses :: [ThreadStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
