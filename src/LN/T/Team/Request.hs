{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Team.Request (
  TeamRequest (..),
  defaultTeamRequest,
) where



import           LN.T.Prelude
import           LN.T.Team



data TeamRequest = TeamRequest {
  teamRequestName        :: Text,
  teamRequestDescription :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultTeamRequest :: TeamRequest
defaultTeamRequest = TeamRequest {
  teamRequestName = "",
  teamRequestDescription = Nothing
}
