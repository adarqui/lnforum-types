module LN.T.Leuron.Like.Stat (
  LeuronLikeStatResponse (..),
  LeuronLikeStatResponses (..)
) where



import           LN.T.Prelude



data LeuronLikeStatResponse = LeuronLikeStatResponse {
  leuronLikeStatResponseId      :: Int64,
  leuronLikeStatResponseScore   :: Int64,
  leuronLikeStatResponseLike    :: Int64,
  leuronLikeStatResponseDislike :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data LeuronLikeStatResponses = LeuronLikeStatResponses {
  leuronLikeStatResponses :: [LeuronLikeStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
