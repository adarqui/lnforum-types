{-# LANGUAGE DeriveGeneric #-}

module LN.T.Team.Stat (
  TeamStatResponse (..),
  TeamStatResponses (..),
) where



import           LN.T.Prelude



data TeamStatResponse = TeamStatResponse {
  teamStatResponseMembers :: Int64
} deriving (Generic, Typeable)



data TeamStatResponses = TeamStatResponses {
  teamStatResponses :: [TeamStatResponse]
} deriving (Generic, Typeable)
