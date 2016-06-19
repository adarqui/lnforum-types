{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Group (
  GroupPackResponse (..),
  GroupPackResponses (..),
) where



import           LN.T.GlobalGroup.Response
import           LN.T.Group
import           LN.T.Group.Response
import           LN.T.Group.Stat
import           LN.T.Like.Response
import           LN.T.Organization.Response
import           LN.T.Prelude
import           LN.T.Star.Response
import           LN.T.User.Sanitized.Response



data GroupPackResponse = GroupPackResponse {
  groupPackResponseUser           :: UserSanitizedResponse,
  groupPackResponseUserId         :: Int64,
  groupPackResponseGroup          :: GroupResponse,
  groupPackResponseGroupId        :: Int64,
  groupPackResponseOrganization   :: OrganizationResponse,
  groupPackResponseOrganizationId :: Int64,
  groupPackResponseStat           :: GroupStatResponse,
  groupPackResponseIsOwner        :: Bool
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data GroupPackResponses = GroupPackResponses {
  groupPackResponses :: [GroupPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
