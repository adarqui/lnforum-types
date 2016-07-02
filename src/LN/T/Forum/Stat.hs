{-# LANGUAGE DeriveGeneric #-}

module LN.T.Forum.Stat (
  ForumStatResponse (..),
  ForumStatResponses (..),
) where



import           LN.T.Prelude



data ForumStatResponse = ForumStatResponse {
  forumStatResponseForumId     :: Int64,
  forumStatResponseBoards      :: Int64,
  forumStatResponseThreads     :: Int64,
  forumStatResponseThreadPosts :: Int64,
  forumStatResponseViews       :: Int64
} deriving (Generic, Typeable)



data ForumStatResponses = ForumStatResponses {
  forumStatResponses :: [ForumStatResponse]
} deriving (Generic, Typeable)
