{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Empty (
  EmptyRequest (..),
  EmptyResponse (..),
  EmptyResponses (..),
  defaultEmptyRequest,
) where



import           LN.T.Prelude



data EmptyRequest = EmptyRequest {
  emptyRequestValue :: Bool
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultEmptyRequest :: EmptyRequest
defaultEmptyRequest = EmptyRequest {
  emptyRequestValue = False
}



data EmptyResponse = EmptyResponse {
  emptyResponseId         :: Int64,
  emptyResponseUserId     :: Int64,
  emptyResponseValue      :: Bool,
  emptyResponseCreatedAt  :: Maybe UTCTime,
  emptyResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data EmptyResponses = EmptyResponses {
  emptyResponses :: [EmptyResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
