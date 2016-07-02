{-# LANGUAGE DeriveGeneric #-}

module LN.T.Team.Request (
  TeamRequest (..),
  defaultTeamRequest,
) where



import           LN.T.Prelude
import           LN.T.Membership
import           LN.T.Visibility



data TeamRequest = TeamRequest {
  teamRequestMembership  :: Membership,
  teamRequestIcon        :: Maybe Text,
  teamRequestTags        :: [Text],
  teamRequestVisibility  :: Visibility,
  teamRequestGuard       :: Int
} deriving (Generic, Typeable)



defaultTeamRequest :: TeamRequest
defaultTeamRequest = TeamRequest {
  teamRequestMembership  = Membership_Join,
  teamRequestIcon        = Nothing,
  teamRequestTags        = [],
  teamRequestVisibility  = Public,
  teamRequestGuard       = 0
}
