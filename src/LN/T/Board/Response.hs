{-# LANGUAGE DeriveGeneric #-}

module LN.T.Board.Response (
  BoardResponse (..),
  BoardResponses (..),
) where



import           LN.T.Prelude



data BoardResponse = BoardResponse {
  boardResponseId          :: Int64,
  boardResponseUserId      :: Int64,
  boardResponseForumId     :: Int64,
  boardResponseParentId    :: Maybe Int64,
  boardResponseName        :: Text,
  boardResponseDescription :: Maybe Text,
  boardResponseIcon        :: Maybe Text,
  boardResponseTags        :: [Text],
  boardResponseCreatedAt   :: Maybe UTCTime,
  boardResponseModifiedBy  :: Maybe Int64,
  boardResponseModifiedAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data BoardResponses = BoardResponses {
  boardResponses :: [BoardResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
