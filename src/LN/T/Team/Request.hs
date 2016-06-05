{-# LANGUAGE DeriveGeneric #-}

module LN.T.Team.Request (
  TeamRequest (..),
  defaultTeamRequest,
) where



import           LN.T.Prelude
import           LN.T.Membership
import           LN.T.Visibility



data TeamRequest = TeamRequest {
  teamRequestDisplayName :: Text,
  teamRequestDescription :: Maybe Text,
  teamRequestMembership  :: Membership,
  teamRequestIcon        :: Maybe Text,
  teamRequestTags        :: [Text],
  teamRequestVisibility  :: Visibility,
  teamRequestGuard       :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultTeamRequest :: TeamRequest
defaultTeamRequest = TeamRequest {
  teamRequestDisplayName = "",
  teamRequestDescription = Nothing,
  teamRequestMembership  = Membership_Join,
  teamRequestIcon        = Nothing,
  teamRequestTags        = [],
  teamRequestVisibility  = Public,
  teamRequestGuard       = 0
}
