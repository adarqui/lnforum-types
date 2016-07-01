{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.Board.Request (
  BoardRequest (..),
  defaultBoardRequest,
  testBoardRequest
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
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultBoardRequest :: BoardRequest
defaultBoardRequest = BoardRequest {
  boardRequestDisplayName        = "",
  boardRequestDescription        = Nothing,
  boardRequestIsAnonymous        = False,
  boardRequestCanCreateSubBoards = True,
  boardRequestCanCreateThreads   = True,
  boardRequestSuggestedTags      = [],
  boardRequestIcon               = Nothing,
  boardRequestTags               = [],
  boardRequestGuard              = 0
}



testBoardRequest :: BoardRequest
testBoardRequest = testBoardRequest {
  boardRequestDisplayName = "test",
  boardRequestDescription = Just "test"
}
