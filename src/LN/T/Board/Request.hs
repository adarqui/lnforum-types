{-# LANGUAGE DeriveGeneric #-}

module LN.T.Board.Request (
  BoardRequest (..)
) where



import           LN.T.Board
import           LN.T.Prelude
import           LN.T.Visibility



data BoardRequest = BoardRequest {
  boardRequestDisplayName      :: Text,
  boardRequestDescription      :: Maybe Text,
  boardRequestBoardType        :: BoardType,
  boardRequestActive           :: Bool,
  boardRequestIsAnonymous      :: Bool,
  boardRequestCanCreateBoards  :: Bool,
  boardRequestCanCreateThreads :: Bool,
  boardRequestVisibility       :: Visibility,
  boardRequestIcon             :: Maybe Text,
  boardRequestTags             :: [Text],
  boardRequestGuard            :: Int
 } deriving (Generic, Typeable)
