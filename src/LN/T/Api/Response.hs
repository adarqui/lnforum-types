{-# LANGUAGE DeriveGeneric #-}

module LN.T.Api.Response (
  ApiResponse (..),
  ApiResponses (..),
) where



import           LN.T.Prelude



data ApiResponse = ApiResponse {
  apiResponseId         :: Int64,
  apiResponseUserId     :: Int64,
  apiResponseKey        :: Text,
  apiResponseComment    :: Maybe Text,
  apiResponseCreatedAt  :: Maybe UTCTime,
  apiResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ApiResponses = ApiResponses {
  apiResponses :: [ApiResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
