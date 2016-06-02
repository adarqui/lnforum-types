{-# LANGUAGE DeriveGeneric #-}

module LN.T.Team.Request (
  TeamRequest (..),
  defaultTeamRequest,
) where



import           LN.T.Prelude
import           LN.T.Team
import           LN.T.Visibility



data TeamRequest = TeamRequest {
  teamRequestName        :: Text,
  teamRequestDescription :: Maybe Text,
  teamMembership         :: TeamMembership,
  teamVisibility         :: Visibility,
  teamTags               :: [Text],
  teamIcon               :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultTeamRequest :: TeamRequest
defaultTeamRequest = TeamRequest {
  teamRequestName        = "",
  teamRequestDescription = Nothing,
  teamMembership         = TeamMembership_Join,
  teamVisibility         = Public,
  teamTags               = [],
  teamIcon               = Nothing
}
