{-# LANGUAGE DeriveGeneric #-}

module LN.T.Organization.Request (
  OrganizationRequest (..),
  defaultOrganizationRequest,
) where



import           LN.T.Prelude
import           LN.T.Membership
import           LN.T.Visibility



data OrganizationRequest = OrganizationRequest {
  organizationRequestDisplayName :: Text,
  organizationRequestDescription :: Maybe Text,
  organizationRequestCompany     :: Text,
  organizationRequestLocation    :: Text,
  organizationRequestEmail       :: Text,
  organizationRequestMembership  :: Membership,
  organizationRequestTags        :: [Text],
  organizationRequestIcon        :: Maybe Text,
  organizationRequestVisibility  :: Visibility,
  organizationRequestGuard       :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultOrganizationRequest :: OrganizationRequest
defaultOrganizationRequest = OrganizationRequest {
  organizationRequestDisplayName = "",
  organizationRequestDescription = Nothing,
  organizationRequestCompany     = "",
  organizationRequestLocation    = "",
  organizationRequestEmail       = "",
  organizationRequestMembership  = Membership_Join,
  organizationRequestIcon        = Nothing,
  organizationRequestTags        = [],
  organizationRequestVisibility  = Public,
  organizationRequestGuard       = 0
}
