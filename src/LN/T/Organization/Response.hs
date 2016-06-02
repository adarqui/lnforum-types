{-# LANGUAGE DeriveGeneric #-}

module LN.T.Organization.Response (
  OrganizationResponse (..),
  OrganizationResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Membership
import           LN.T.Visibility



data OrganizationResponse = OrganizationResponse {
  organizationResponseId          :: Int64,
  organizationResponseUserId      :: Int64,
  organizationResponseName        :: Text,
  organizationResponseDescription :: Maybe Text,
  organizationResponseCompany     :: Text,
  organizationResponseLocation    :: Text,
  organizationResponseEmail       :: Text,
  organizationResponseEmailMD5    :: Text,
  organizationResponseMembership  :: Membership,
  organizationResponseIcon        :: Maybe Text,
  organizationResponseTags        :: [Text],
  organizationResponseVisibility  :: Visibility,
  organizationResponseCreatedAt   :: Maybe UTCTime,
  organizationResponseModifiedBy  :: Maybe Int64,
  organizationResponseModifiedAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data OrganizationResponses = OrganizationResponses {
  organizationResponses :: [OrganizationResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
