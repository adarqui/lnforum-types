{-# LANGUAGE DeriveGeneric #-}

module LN.T.Board.Request (
  BoardRequest (..)
) where



import           LN.T.Prelude



data BoardRequest = BoardRequest {
  boardRequestDisplayName        :: Text,
  boardRequestDescription        :: Maybe Text,
  boardRequestIsAnonymous        :: Bool,
  boardRequestCanCreateSubBoards :: Bool,
  boardRequestCanCreateThreads   :: Bool,
  boardRequestSuggestedTags      :: [Text],
  boardRequestIcon               :: Maybe Text,
  boardRequestTags               :: [Text],
  boardRequestGuard              :: Int
} deriving (Generic, Typeable)
