{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Board.Request (
  BoardRequest (..),
  defaultBoardRequest,
) where



import           LN.T.Prelude
import           LN.T.Board



data BoardRequest = BoardRequest {
  boardRequestName        :: Text,
  boardRequestDescription :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultBoardRequest :: BoardRequest
defaultBoardRequest = BoardRequest {
  boardRequestName = "",
  boardRequestDescription = Nothing
}
