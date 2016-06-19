{-# LANGUAGE DeriveGeneric #-}

module LN.T.TeamMember.Request (
  TeamMemberRequest (..),
  defaultTeamMemberRequest,
) where



import           LN.T.Membership
import           LN.T.Prelude
import           LN.T.Visibility



data TeamMemberRequest = TeamMemberRequest {
  teamMemberRequestGuard :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultTeamMemberRequest :: TeamMemberRequest
defaultTeamMemberRequest = TeamMemberRequest {
  teamMemberRequestGuard = 0
}
