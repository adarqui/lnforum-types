{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Thread (
  ThreadPackResponse (..),
  ThreadPackResponses (..),
) where



import           LN.T.Board.Response
import           LN.T.Forum.Response
import           LN.T.Like.Response
import           LN.T.Organization.Response
import           LN.T.Permission
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
  threadPackResponseWithOrganization     :: Maybe OrganizationResponse,
  threadPackResponseWithForum            :: Maybe ForumResponse,
  threadPackResponseWithBoard            :: Maybe BoardResponse,
  threadPackResponsePermissions          :: Permissions
} deriving (Generic, Typeable)



data ThreadPackResponses = ThreadPackResponses {
  threadPackResponses :: [ThreadPackResponse]
} deriving (Generic, Typeable)
