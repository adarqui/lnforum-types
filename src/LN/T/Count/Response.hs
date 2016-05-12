{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Count.Response (
  CountResponse (..),
  CountResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Count



data CountResponse = CountResponse {
  countResponseId :: Int64,
  countResponseN  :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data CountResponses = CountResponses {
  countResponses :: [CountResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
