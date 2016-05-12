module LN.T.ThreadPost.Like.Stat (
  ThreadPostLikeStatResponse (..),
  ThreadPostLikeStatResponses (..)
) where



import           LN.T.Prelude



data ThreadPostLikeStatResponse = ThreadPostLikeStatResponse {
  threadPostLikeStatResponseId      :: Int64,
  threadPostLikeStatResponseScore   :: Int64,
  threadPostLikeStatResponseLike    :: Int64,
  threadPostLikeStatResponseDislike :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadPostLikeStatResponses = ThreadPostLikeStatResponses {
  threadPostLikeStatResponses :: [ThreadPostLikeStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
