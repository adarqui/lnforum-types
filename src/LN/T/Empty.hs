{-# LANGUAGE DeriveGeneric #-}

module LN.T.Empty (
  EmptyRequest (..),
  EmptyResponse (..),
  EmptyResponses (..),
  defaultEmptyRequest,
) where



import           LN.T.Prelude



data EmptyRequest = EmptyRequest {
  emptyRequestValue :: Bool
} deriving (Generic, Typeable)



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
} deriving (Generic, Typeable)



data EmptyResponses = EmptyResponses {
  emptyResponses :: [EmptyResponse]
} deriving (Generic, Typeable)
