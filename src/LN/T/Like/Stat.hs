module LN.T.Like.Stat (
  LikeStatResponse (..),
  LikeStatResponses (..)
) where



import           LN.T.Entity
import           LN.T.Prelude



data LikeStatResponse = LikeStatResponse {
  likeStatResponseId      :: Int64,
  likeStatResponseEntity  :: Entity,
  likeStatResponseScore   :: Int64,
  likeStatResponseLike    :: Int64,
  likeStatResponseDislike :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data LikeStatResponses = LikeStatResponses {
  likeStatResponses :: [LikeStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
