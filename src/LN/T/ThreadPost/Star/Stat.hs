module LN.T.ThreadPost.Star.Stat (
  ThreadPostStarStatResponse (..),
  ThreadPostStarStatResponses (..)
) where



import           LN.T.Prelude



data ThreadPostStarStatResponse = ThreadPostStarStatResponse {
  threadPostStarStatResponseId      :: Int64,
  threadPostStarStatResponseStars   :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadPostStarStatResponses = ThreadPostStarStatResponses {
  threadPostStarStatResponses :: [ThreadPostStarStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
