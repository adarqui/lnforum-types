{-# LANGUAGE DeriveGeneric #-}

module LN.T.Board.Request (
  BoardRequest (..),
  defaultBoardRequest,
) where



import           LN.T.Prelude



data BoardRequest = BoardRequest {
  boardRequestName        :: Text,
  boardRequestDescription :: Maybe Text,
  boardRequestIcon        :: Maybe Text,
  boardRequestTags        :: [Text]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultBoardRequest :: BoardRequest
defaultBoardRequest = BoardRequest {
  boardRequestName        = "",
  boardRequestDescription = Nothing,
  boardRequestIcon        = Nothing,
  boardRequestTags        = []
}
