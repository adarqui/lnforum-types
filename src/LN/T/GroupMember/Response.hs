{-# LANGUAGE DeriveGeneric #-}

module LN.T.GroupMember.Response (
  GroupMemberResponse (..),
  GroupMemberResponses (..),
) where



import           LN.T.Prelude



data GroupMemberResponse = GroupMemberResponse {
  groupMemberResponseId            :: Int64,
  groupMemberResponseUserId        :: Int64,
  groupMemberResponseGlobalGroupId :: Int64,
  groupMemberResponseCreatedAt     :: Maybe UTCTime,
  groupMemberResponseModifiedBy    :: Maybe Int64,
  groupMemberResponseModifiedAt    :: Maybe UTCTime,
  groupMemberResponseActivityAt    :: Maybe UTCTime
} deriving (Generic, Typeable)



data GroupMemberResponses = GroupMemberResponses {
  groupMemberResponses :: [GroupMemberResponse]
} deriving (Generic, Typeable)
