{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Boot (
  BootPackResponse (..)
) where



import           LN.T.Pack.User
import           LN.T.Pack.Forum
import           LN.T.Pack.Board
import           LN.T.Pack.ThreadPost
import           LN.T.Prelude



data BootPackResponse = BootPackResponse {
  bootPackResponseForumPack      :: ForumPackResponse,
  bootPackResponseBoardPacks     :: [BoardPackResponse],
  bootPackResponseRecentPosts    :: [ThreadPostPackResponse],
  bootPackResponsePostsOfTheWeek :: [ThreadPostPackResponse],
  bootPackResponseUsersOnline    :: [UserPackResponse]
} deriving (Generic, Typeable)
