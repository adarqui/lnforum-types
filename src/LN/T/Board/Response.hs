{-# LANGUAGE DeriveGeneric #-}

module LN.T.Board.Response (
  BoardResponse (..),
  BoardResponses (..),
) where



import           LN.T.Board
import           LN.T.Prelude
import           LN.T.Visibility



data BoardResponse = BoardResponse {
  boardResponseId               :: Int64,
  boardResponseUserId           :: Int64,
  boardResponseName             :: Text,
  boardResponseDisplayName      :: Text,
  boardResponseDescription      :: Maybe Text,
  boardResponseBoardType        :: BoardType,
  boardResponseActive           :: Bool,
  boardResponseIsAnonymous      :: Bool,
  boardResponseCanCreateBoards  :: Bool,
  boardResponseCanCreateThreads :: Bool,
  boardResponseVisibility       :: Visibility,
  boardResponseIcon             :: Maybe Text,
  boardResponseTags             :: [Text],
  boardResponseGuard            :: Int,
  boardResponseCreatedAt        :: Maybe UTCTime,
  boardResponseModifiedAt       :: Maybe UTCTime,
  boardResponseModifiedBy       :: Maybe Int64,
  boardResponseActivityAt       :: Maybe UTCTime
} deriving (Generic, Typeable)



data BoardResponses = BoardResponses {
  boardResponses :: [BoardResponse]
} deriving (Generic, Typeable)
