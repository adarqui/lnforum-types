module LN.T.Resource.Star.Stat (
  ResourceStarStatResponse (..),
  ResourceStarStatResponses (..)
) where



import           LN.T.Prelude



data ResourceStarStatResponse = ResourceStarStatResponse {
  resourceStarStatResponseId    :: Int64,
  resourceStarStatResponseStars :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ResourceStarStatResponses = ResourceStarStatResponses {
  resourceStarStatResponses :: [ResourceStarStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
