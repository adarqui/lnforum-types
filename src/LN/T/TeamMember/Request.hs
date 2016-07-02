{-# LANGUAGE DeriveGeneric #-}

module LN.T.TeamMember.Request (
  TeamMemberRequest (..),
  defaultTeamMemberRequest,
) where



import           LN.T.Prelude



data TeamMemberRequest = TeamMemberRequest {
  teamMemberRequestGuard :: Int
} deriving (Generic, Typeable)



defaultTeamMemberRequest :: TeamMemberRequest
defaultTeamMemberRequest = TeamMemberRequest {
  teamMemberRequestGuard = 0
}
