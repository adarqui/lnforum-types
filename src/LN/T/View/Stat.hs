module LN.T.Like.Stat (
  LikeStatResponse (..),
  LikeStatResponses (..)
) where



import           LN.T.Ent
import           LN.T.Prelude



data LikeStatResponse = LikeStatResponse {
  likeStatResponseEnt     :: Ent,
  likeStatResponseEntId   :: Int64,
  likeStatResponseScore   :: Int64,
  likeStatResponseLike    :: Int64,
  likeStatResponseNeutral :: Int64,
  likeStatResponseDislike :: Int64
} deriving (Generic, Typeable)



data LikeStatResponses = LikeStatResponses {
  likeStatResponses :: [LikeStatResponse]
} deriving (Generic, Typeable)
