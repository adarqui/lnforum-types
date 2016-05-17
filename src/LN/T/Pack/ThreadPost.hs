{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.ThreadPost (
  ThreadPostPackResponse (..),
  ThreadPostPackResponses (..),
) where



import           LN.T.Like.Response
import           LN.T.Prelude
import           LN.T.Star.Response
import           LN.T.ThreadPost.Response
import           LN.T.ThreadPost.Stat
import           LN.T.User.Sanitized.Response



data ThreadPostPackResponse = ThreadPostPackResponse {
  threadPostPackResponseThreadPost   :: ThreadPostResponse,
  threadPostPackResponseThreadPostId :: Int64,
  threadPostPackResponseUser         :: UserSanitizedResponse,
  threadPostPackResponseUserId       :: Int64,
  threadPostPackResponseStat         :: ThreadPostStatResponse,
  threadPostPackResponseLike         :: Maybe LikeResponse,
  threadPostPackResponseStar         :: Maybe StarResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadPostPackResponses = ThreadPostPackResponses {
  threadPostPackResponses :: [ThreadPostPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
