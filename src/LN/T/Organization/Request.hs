{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Organization.Request (
  OrganizationRequest (..),
  defaultOrganizationRequest,
) where



import           LN.T.Prelude
import           LN.T.Organization



data OrganizationRequest = OrganizationRequest {
  organizationRequestName        :: Text,
  organizationRequestDescription :: Maybe Text,
  organizationRequestCompany     :: Text,
  organizationRequestLocation    :: Text,
  organizationRequestEmail       :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultOrganizationRequest :: OrganizationRequest
defaultOrganizationRequest = OrganizationRequest {
  organizationRequestName = "",
  organizationRequestDescription = Nothing,
  organizationRequestCompany = "",
  organizationRequestLocation = "",
  organizationRequestEmail = ""
}
