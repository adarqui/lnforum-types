{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Forum (
  ForumPackResponse (..)
) where



import           LN.T.Forum.Response
import           LN.T.Forum.Stat
import           LN.T.Prelude



data ForumPackResponse = ForumPackResponse {
  forumPackResponseForum            :: ForumResponse,
  forumPackResponseStat             :: ForumStatResponse
} deriving (Generic, Typeable)
