{-# LANGUAGE DeriveGeneric #-}

module LN.T.Count.Response (
  CountResponse (..),
  CountResponses (..),
) where



import           LN.T.Prelude



data CountResponse = CountResponse {
  countResponseId :: Int64,
  countResponseN  :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data CountResponses = CountResponses {
  countResponses :: [CountResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
