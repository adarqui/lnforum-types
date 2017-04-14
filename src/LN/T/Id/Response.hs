{-# LANGUAGE DeriveGeneric  #-}

module LN.T.Id.Response (
  IdResponse (..),
  IdResponses (..),
) where



import           LN.T.Prelude



data IdResponse = IdResponse {
  idResponseId          :: Int64,
  idResponseUserId      :: Int64,
  idResponseTargetId    :: Int64,
  idResponseGuard       :: Int64,
  idResponseCreatedAt   :: Maybe UTCTime,
  idResponseModifiedAt  :: Maybe UTCTime,
  idResponseActivityAt  :: Maybe UTCTime
} deriving (Generic, Typeable)



data IdResponses = IdResponses {
  idResponses :: [IdResponse]
} deriving (Generic, Typeable)
