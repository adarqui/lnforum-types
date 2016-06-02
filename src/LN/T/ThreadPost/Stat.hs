{-# LANGUAGE DeriveGeneric #-}

module LN.T.ThreadPost.Stat (
  ThreadPostStatResponse (..),
  ThreadPostStatResponses (..),
) where



import           LN.T.Prelude



data ThreadPostStatResponse = ThreadPostStatResponse {
  threadPostStatResponseThreadPostId :: Int64,
  threadPostStatResponseLikes        :: Int64,
  threadPostStatResponseNeutral      :: Int64,
  threadPostStatResponseDislikes     :: Int64,
  threadPostStatResponseStars        :: Int64,
  threadPostStatResponseViews        :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadPostStatResponses = ThreadPostStatResponses {
  threadPostStatResponses :: [ThreadPostStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
