{-# LANGUAGE DeriveAnyClass  #-}

module LN.T.Pack.ThreadPost (
  ThreadPostPackResponse (..),
  ThreadPostPackResponses (..),
) where



import           LN.T.Prelude
import           LN.T.ThreadPost.Response
import           LN.T.ThreadPost.Stat
import           LN.T.ThreadPost.Like.Response
import           LN.T.ThreadPost.Star.Response
import           LN.T.User.Sanitized.Response



data ThreadPostPackResponse = ThreadPostPackResponse {
  threadPostPackResponseThreadPost :: ThreadPostResponse,
  threadPostPackResponseUser       :: UserSanitizedResponse,
  threadPostPackResponseStat       :: ThreadPostStatResponse,
  threadPostPackResponseLike       :: Maybe ThreadPostLikeResponse,
  threadPostPackResponseStar       :: Maybe ThreadPostStarResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadPostPackResponses = ThreadPostPackResponses {
  threadPostPackResponses :: [ThreadPostPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
