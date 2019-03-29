{-# LANGUAGE DeriveGeneric #-}

module LN.T.Board.Stat (
  BoardStatResponse (..),
  BoardStatResponses (..),
) where



import           LN.T.Prelude



data BoardStatResponse = BoardStatResponse {
  boardStatResponseBoardId     :: Int64,
  boardStatResponseThreads     :: Int64,
  boardStatResponseThreadPosts :: Int64,
  boardStatResponseViews       :: Int64
} deriving (Generic, Typeable)



data BoardStatResponses = BoardStatResponses {
  boardStatResponses :: [BoardStatResponse]
} deriving (Generic, Typeable)
