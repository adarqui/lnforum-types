{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Pack.Organization (
  OrganizationPackResponse (..),
  OrganizationPackResponses (..),
) where



import           LN.T.Organization
import           LN.T.Organization.Response
import           LN.T.Organization.Stat
import           LN.T.Prelude



data OrganizationPackResponse = OrganizationPackResponse {
  organizationPackResponseOrganization     :: OrganizationResponse,
  organizationPackResponseOrganizationStat :: OrganizationStatResponse
--  organizationPackResponseOrganizationProfile :: ProfileResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data OrganizationPackResponses = OrganizationPackResponses {
  organizationPackResponses :: [OrganizationPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
