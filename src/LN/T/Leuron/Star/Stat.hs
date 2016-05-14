module LN.T.Leuron.Star.Stat (
  LeuronStarStatResponse (..),
  LeuronStarStatResponses (..)
) where



import           LN.T.Prelude



data LeuronStarStatResponse = LeuronStarStatResponse {
  leuronStarStatResponseId    :: Int64,
  leuronStarStatResponseStars :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data LeuronStarStatResponses = LeuronStarStatResponses {
  leuronStarStatResponses :: [LeuronStarStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
