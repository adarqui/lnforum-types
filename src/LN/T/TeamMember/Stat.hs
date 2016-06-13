{-# LANGUAGE DeriveGeneric #-}

module LN.T.TeamMember.Stat (
  TeamMemberStatResponse (..),
  TeamMemberStatResponses (..),
) where



import           LN.T.Prelude



data TeamMemberStatResponse = TeamMemberStatResponse {
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data TeamMemberStatResponses = TeamMemberStatResponses {
  teamMemberStatResponses :: [TeamMemberStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
