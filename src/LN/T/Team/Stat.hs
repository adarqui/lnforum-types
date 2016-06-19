{-# LANGUAGE DeriveGeneric #-}

module LN.T.Team.Stat (
  TeamStatResponse (..),
  TeamStatResponses (..),
) where



import           LN.T.Prelude



data TeamStatResponse = TeamStatResponse {
  teamStatResponseMembers :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data TeamStatResponses = TeamStatResponses {
  teamStatResponses :: [TeamStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
