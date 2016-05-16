{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Team (
  TeamPackResponse (..),
  TeamPackResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Team
import           LN.T.Team.Response
import           LN.T.Team.Stat
import           LN.T.User.Sanitized.Response



data TeamPackResponse = TeamPackResponse {
--  teamPackResponseOrganization ?
  teamPackResponseUser     :: UserSanitizedResponse,
  teamPackResponseTeam     :: TeamResponse,
  teamPackResponseTeamStat :: TeamStatResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data TeamPackResponses = TeamPackResponses {
  teamPackResponses :: [TeamPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
