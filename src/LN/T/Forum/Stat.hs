{-# LANGUAGE DeriveGeneric #-}

module LN.T.Forum.Stat (
  ForumStatResponse (..)
) where



import           LN.T.Prelude



data ForumStatResponse = ForumStatResponse {
  forumStatResponseBoards      :: Int64,
  forumStatResponseThreads     :: Int64,
  forumStatResponseThreadPosts :: Int64,
  forumStatResponseViews       :: Int64
} deriving (Generic, Typeable)
