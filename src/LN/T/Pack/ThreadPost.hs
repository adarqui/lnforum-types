{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.ThreadPost (
  ThreadPostPackResponse (..),
  ThreadPostPackResponses (..),
) where



import           LN.T.Board.Response
import           LN.T.Forum.Response
import           LN.T.Like.Response
import           LN.T.Organization.Response
import           LN.T.Permission
import           LN.T.Prelude
import           LN.T.Star.Response
import           LN.T.Thread.Response
import           LN.T.ThreadPost.Response
import           LN.T.ThreadPost.Stat
import           LN.T.User.Sanitized.Response



data ThreadPostPackResponse = ThreadPostPackResponse {
  threadPostPackResponseThreadPost       :: ThreadPostResponse,
  threadPostPackResponseThreadPostId     :: Int64,
  threadPostPackResponseUser             :: UserSanitizedResponse,
  threadPostPackResponseUserId           :: Int64,
  threadPostPackResponseStat             :: ThreadPostStatResponse,
  threadPostPackResponseLike             :: Maybe LikeResponse,
  threadPostPackResponseStar             :: Maybe StarResponse,
  threadPostPackResponseWithOrganization :: Maybe OrganizationResponse,
  threadPostPackResponseWithForum        :: Maybe ForumResponse,
  threadPostPackResponseWithBoard        :: Maybe BoardResponse,
  threadPostPackResponseWithThread       :: Maybe ThreadResponse,
  threadPostPackResponsePermissions      :: Permissions
} deriving (Generic, Typeable)



data ThreadPostPackResponses = ThreadPostPackResponses {
  threadPostPackResponses :: [ThreadPostPackResponse]
} deriving (Generic, Typeable)
