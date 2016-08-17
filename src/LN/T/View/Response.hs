{-# LANGUAGE DeriveGeneric #-}

module LN.T.View.Response (
  ViewResponse (..),
  ViewResponses (..),
) where



import           LN.T.Ent
import           LN.T.View
import           LN.T.Prelude



data ViewResponse = ViewResponse {
  viewResponseId         :: Int64,
  viewResponseEnt        :: Ent,
  viewResponseEntId      :: Int64,
  viewResponseCount      :: Int64,
  viewResponseCreatedAt  :: Maybe UTCTime,
  viewResponseModifiedAt :: Maybe UTCTime
} deriving (Generic, Typeable)



data ViewResponses = ViewResponses {
  viewResponses :: [ViewResponse]
} deriving (Generic, Typeable)
