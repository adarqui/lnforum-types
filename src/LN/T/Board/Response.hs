{-# LANGUAGE DeriveGeneric #-}

module LN.T.Board.Response (
  BoardResponse (..),
  BoardResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Board
import           LN.T.Visibility



data BoardResponse = BoardResponse {
  boardResponseId            :: Int64,
  boardResponseUserId        :: Int64,
  boardResponseName          :: Text,
  boardResponseDisplayName   :: Text,
  boardResponseDescription   :: Text,
  boardResponseSource        :: BoardType,
  boardResponseAuthor        :: Maybe [Text],
  boardResponsePrerequisites :: [Text],
  boardResponseCategories    :: [Text],
  boardResponseVisibility    :: Visibility,
  boardResponseCounter       :: Int,
  boardResponseVersion       :: Maybe Text,
  boardResponseUrls          :: Maybe [Text],
  boardResponseIcon          :: Maybe Text,
  boardResponseTags          :: [Text],
  boardResponseActive        :: Bool,
  boardResponseGuard         :: Int,
  boardResponseCreatedAt     :: Maybe UTCTime,
  boardResponseModifiedAt    :: Maybe UTCTime,
  boardResponseActivityAt    :: Maybe UTCTime
} deriving (Generic, Typeable)



data BoardResponses = BoardResponses {
  boardResponses :: [BoardResponse]
} deriving (Generic, Typeable)
