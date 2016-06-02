{-# LANGUAGE DeriveGeneric #-}

module LN.T.Organization.Stat (
  OrganizationStatResponse (..),
  OrganizationStatResponses (..),
) where



import           LN.T.Prelude



data OrganizationStatResponse = OrganizationStatResponse {
  organizationStatResponseOrganizationId :: Int64,
  organizationStatResponseTeams          :: Int64,
  organizationStatResponseMembers        :: Int64,
  organizationStatResponseForums         :: Int64,
  organizationStatResponseBoards         :: Int64,
  organizationStatResponseThreads        :: Int64,
  organizationStatResponseThreadPosts    :: Int64,
  organizationStatResponseViews          :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data OrganizationStatResponses = OrganizationStatResponses {
  organizationStatResponses :: [OrganizationStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
