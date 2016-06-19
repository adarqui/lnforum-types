module LN.T.Like.Stat (
  LikeStatResponse (..),
  LikeStatResponses (..)
) where



import           LN.T.Ent
import           LN.T.Prelude



data LikeStatResponse = LikeStatResponse {
  likeStatResponseId      :: Int64,
  likeStatResponseEnt     :: Ent,
  likeStatResponseEntId   :: Int64,
  likeStatResponseScore   :: Int64,
  likeStatResponseLike    :: Int64,
  likeStatResponseNeutral :: Int64,
  likeStatResponseDislike :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data LikeStatResponses = LikeStatResponses {
  likeStatResponses :: [LikeStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
