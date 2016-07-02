{-# LANGUAGE DeriveGeneric #-}

module LN.T.Count.Response (
  CountResponse (..),
  CountResponses (..),
) where



import           LN.T.Prelude



data CountResponse = CountResponse {
  countResponseId :: Int64,
  countResponseN  :: Int64
} deriving (Generic, Typeable)



data CountResponses = CountResponses {
  countResponses :: [CountResponse]
} deriving (Generic, Typeable)
