{-# LANGUAGE DeriveGeneric #-}

module LN.T.Group.Response (
  GroupResponse (..),
  GroupResponses (..),
) where



import           LN.T.Prelude



data GroupResponse = GroupResponse {
  groupResponseId             :: Int64,
  groupResponseUserId         :: Int64,
  groupResponseGlobalGroupId  :: Int64,
  groupResponseOrganizationId :: Int64,
  groupResponseActive         :: Bool,
  groupResponseGuard          :: Int,
  groupResponseCreatedAt      :: Maybe UTCTime,
  groupResponseModifiedBy     :: Maybe Int64,
  groupResponseModifiedAt     :: Maybe UTCTime,
  groupResponseActivityAt     :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data GroupResponses = GroupResponses {
  groupResponses :: [GroupResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
