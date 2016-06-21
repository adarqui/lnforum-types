{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.TeamMember (
  TeamMemberPackResponse (..),
  TeamMemberPackResponses (..),
) where



import           LN.T.Like.Response
import           LN.T.Permission
import           LN.T.Prelude
import           LN.T.Star.Response
import           LN.T.TeamMember
import           LN.T.TeamMember.Response
import           LN.T.TeamMember.Stat
import           LN.T.User.Sanitized.Response



data TeamMemberPackResponse = TeamMemberPackResponse {
  teamMemberPackResponseUser         :: UserSanitizedResponse,
  teamMemberPackResponseUserId       :: Int64,
  teamMemberPackResponseTeamMember   :: TeamMemberResponse,
  teamMemberPackResponseTeamMemberId :: Int64,
  teamMemberPackResponsePermissions  :: Permissions
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data TeamMemberPackResponses = TeamMemberPackResponses {
  teamMemberPackResponses :: [TeamMemberPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
