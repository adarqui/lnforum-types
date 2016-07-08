{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.Organization.Request (
  OrganizationRequest (..)
) where



import           LN.T.Membership
import           LN.T.Prelude
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
} deriving (Generic, Typeable)
