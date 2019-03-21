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
  threadPostStatResponseViews        :: Int64
} deriving (Generic, Typeable)



data ThreadPostStatResponses = ThreadPostStatResponses {
  threadPostStatResponses :: [ThreadPostStatResponse]
} deriving (Generic, Typeable)
