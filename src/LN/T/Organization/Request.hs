{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Organization.Request (
  OrganizationRequest (..),
  defaultOrganizationRequest,
) where



import           LN.T.Prelude
import           LN.T.Membership
import           LN.T.Visibility



data OrganizationRequest = OrganizationRequest {
  organizationRequestName        :: Text,
  organizationRequestDescription :: Maybe Text,
  organizationRequestCompany     :: Text,
  organizationRequestLocation    :: Text,
  organizationRequestEmail       :: Text,
  organizationRequestMembership  :: Membership,
  organizationRequestTags        :: [Text],
  organizationRequestIcon        :: Maybe Text,
  organizationRequestVisibility  :: Visibility
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultOrganizationRequest :: OrganizationRequest
defaultOrganizationRequest = OrganizationRequest {
  organizationRequestName        = "",
  organizationRequestDescription = Nothing,
  organizationRequestCompany     = "",
  organizationRequestLocation    = "",
  organizationRequestEmail       = "",
  organizationRequestMembership  = Membership_Join,
  organizationRequestIcon        = Nothing,
  organizationRequestTags        = [],
  organizationRequestVisibility  = Public
}
