{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Organization (
  OrganizationPackResponse (..),
  OrganizationPackResponses (..),
) where



import           LN.T.Like.Response
import           LN.T.Organization
import           LN.T.Organization.Response
import           LN.T.Organization.Stat
import           LN.T.Prelude
import           LN.T.Star.Response
import           LN.T.User.Sanitized.Response



data OrganizationPackResponse = OrganizationPackResponse {
  organizationPackResponseUser           :: UserSanitizedResponse,
  organizationPackResponseUserId         :: Int64,
  organizationPackResponseOrganization   :: OrganizationResponse,
  organizationPackResponseOrganizationId :: Int64,
  organizationPackResponseStat           :: OrganizationStatResponse,
  organizationPackResponseLike           :: Maybe LikeResponse,
  organizationPackResponseStar           :: Maybe StarResponse,
  organizationPackResponseIsOwner        :: Bool,
  organizationPackResponseIsMember       :: Bool
--  organizationPackResponseOrganizationProfile :: ProfileResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data OrganizationPackResponses = OrganizationPackResponses {
  organizationPackResponses :: [OrganizationPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
