module LN.T.Resource.Like.Stat (
  ResourceLikeStatResponse (..),
  ResourceLikeStatResponses (..)
) where



import           LN.T.Prelude



data ResourceLikeStatResponse = ResourceLikeStatResponse {
  resourceLikeStatResponseId      :: Int64,
  resourceLikeStatResponseScore   :: Int64,
  resourceLikeStatResponseLike    :: Int64,
  resourceLikeStatResponseDislike :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ResourceLikeStatResponses = ResourceLikeStatResponses {
  resourceLikeStatResponses :: [ResourceLikeStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
