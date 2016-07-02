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
  apiResponseGuard      :: Int,
  apiResponseCreatedAt  :: Maybe UTCTime,
  apiResponseModifiedAt :: Maybe UTCTime
} deriving (Generic, Typeable)



data ApiResponses = ApiResponses {
  apiResponses :: [ApiResponse]
} deriving (Generic, Typeable)
