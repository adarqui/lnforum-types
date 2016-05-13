{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Board.Response (
  BoardResponse (..),
  BoardResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Board



data BoardResponse = BoardResponse {
  boardResponseId          :: Int64,
  boardResponseUserId      :: Int64,
  boardResponseForumId     :: Int64,
  boardResponseParentId    :: Maybe Int64,
  boardResponseName        :: Text,
  boardResponseDescription :: Maybe Text,
  boardResponseCreatedAt   :: Maybe UTCTime,
  boardResponseModifiedBy  :: Maybe Int64,
  boardResponseModifiedAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data BoardResponses = BoardResponses {
  boardResponses :: [BoardResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)