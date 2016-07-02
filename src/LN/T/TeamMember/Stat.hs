{-# LANGUAGE DeriveGeneric #-}

module LN.T.TeamMember.Stat (
  TeamMemberStatResponse (..),
  TeamMemberStatResponses (..),
) where



import           LN.T.Prelude



data TeamMemberStatResponse = TeamMemberStatResponse {
} deriving (Generic, Typeable)



data TeamMemberStatResponses = TeamMemberStatResponses {
  teamMemberStatResponses :: [TeamMemberStatResponse]
} deriving (Generic, Typeable)
