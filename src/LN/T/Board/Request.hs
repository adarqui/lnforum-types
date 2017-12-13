{-# LANGUAGE DeriveGeneric     #-}

module LN.T.Board.Request (
  BoardRequest (..)
) where



import           LN.T.Prelude
import           LN.T.Board
import           LN.T.Visibility



data BoardRequest = BoardRequest {
  boardRequestDisplayName   :: Text,
  boardRequestDescription   :: Text,
  boardRequestSource        :: BoardType,
  boardRequestAuthor        :: Maybe [Text],
  boardRequestPrerequisites :: [Text],
  boardRequestCategories    :: [Text],
  boardRequestVisibility    :: Visibility,
  boardRequestCounter       :: Int,
  boardRequestVersion       :: Maybe Text,
  boardRequestUrls          :: Maybe [Text],
  boardRequestIcon          :: Maybe Text,
  boardRequestTags          :: [Text],
  boardRequestGuard         :: Int
 } deriving (Generic, Typeable)
