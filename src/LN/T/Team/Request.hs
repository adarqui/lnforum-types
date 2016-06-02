{-# LANGUAGE DeriveGeneric #-}

module LN.T.Team.Request (
  TeamRequest (..),
  defaultTeamRequest,
) where



import           LN.T.Prelude
import           LN.T.Membership
import           LN.T.Visibility



data TeamRequest = TeamRequest {
  teamRequestName        :: Text,
  teamRequestDescription :: Maybe Text,
  teamMembership         :: Membership,
  teamIcon               :: Maybe Text,
  teamTags               :: [Text],
  teamVisibility         :: Visibility
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultTeamRequest :: TeamRequest
defaultTeamRequest = TeamRequest {
  teamRequestName        = "",
  teamRequestDescription = Nothing,
  teamMembership         = Membership_Join,
  teamIcon               = Nothing,
  teamTags               = [],
  teamVisibility         = Public
}
