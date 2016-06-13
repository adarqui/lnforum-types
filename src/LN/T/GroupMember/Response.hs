{-# LANGUAGE DeriveGeneric #-}

module LN.T.GroupMember.Response (
  GroupMemberResponse (..),
  GroupMemberResponses (..),
) where



import           LN.T.Membership
import           LN.T.Prelude
import           LN.T.Visibility



data GroupMemberResponse = GroupMemberResponse {
  groupMemberResponseId            :: Int64,
  groupMemberResponseUserId        :: Int64,
  groupMemberResponseGlobalGroupId :: Int64,
  groupMemberResponseCreatedAt     :: Maybe UTCTime,
  groupMemberResponseModifiedBy    :: Maybe Int64,
  groupMemberResponseModifiedAt    :: Maybe UTCTime,
  groupMemberResponseActivityAt    :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data GroupMemberResponses = GroupMemberResponses {
  groupMemberResponses :: [GroupMemberResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
