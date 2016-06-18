{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Thread (
  ThreadPackResponse (..),
  ThreadPackResponses (..),
) where



import           LN.T.Like.Response
import           LN.T.Prelude
import           LN.T.Star.Response
import           LN.T.Thread.Response
import           LN.T.Thread.Stat
import           LN.T.ThreadPost.Response
import           LN.T.User.Sanitized.Response



data ThreadPackResponse = ThreadPackResponse {
  threadPackResponseThread               :: ThreadResponse,
  threadPackResponseThreadId             :: Int64,
  threadPackResponseUser                 :: UserSanitizedResponse,
  threadPackResponseUserId               :: Int64,
  threadPackResponseStat                 :: ThreadStatResponse,
  threadPackResponseLike                 :: Maybe LikeResponse,
  threadPackResponseStar                 :: Maybe StarResponse,
  threadPackResponseLatestThreadPost     :: Maybe ThreadPostResponse,
  threadPackResponseLatestThreadPostUser :: Maybe UserSanitizedResponse,
  threadPackResponseIsOwner              :: Bool
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadPackResponses = ThreadPackResponses {
  threadPackResponses :: [ThreadPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
