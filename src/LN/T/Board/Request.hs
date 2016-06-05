{-# LANGUAGE DeriveGeneric #-}

module LN.T.Board.Request (
  BoardRequest (..),
  defaultBoardRequest,
) where



import           LN.T.Prelude



data BoardRequest = BoardRequest {
  boardRequestDisplayName :: Text,
  boardRequestDescription :: Maybe Text,
  boardRequestIcon        :: Maybe Text,
  boardRequestTags        :: [Text],
  boardRequestGuard       :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultBoardRequest :: BoardRequest
defaultBoardRequest = BoardRequest {
  boardRequestDisplayName = "",
  boardRequestDescription = Nothing,
  boardRequestIcon        = Nothing,
  boardRequestTags        = [],
  boardRequestGuard       = 0
}
