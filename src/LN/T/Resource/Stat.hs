{-# LANGUAGE DeriveGeneric #-}

module LN.T.Resource.Stat (
  ResourceStatResponse (..),
  ResourceStatResponses (..),
) where



import           LN.T.Prelude



data ResourceStatResponse = ResourceStatResponse {
  resourceStatResponseResourceId :: Int64,
  resourceStatResponseLeurons    :: Int64,
  resourceStatResponseLikes      :: Int64,
  resourceStatResponseNeutral    :: Int64,
  resourceStatResponseDislikes   :: Int64,
  resourceStatResponseStars      :: Int64,
  resourceStatResponseViews      :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data ResourceStatResponses = ResourceStatResponses {
  resourceStatResponses :: [ResourceStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
