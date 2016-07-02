{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.GroupMember (
  GroupMemberPackResponse (..),
  GroupMemberPackResponses (..),
) where



import           LN.T.GroupMember.Response
import           LN.T.Prelude
import           LN.T.User.Sanitized.Response



data GroupMemberPackResponse = GroupMemberPackResponse {
  groupMemberPackResponseUser          :: UserSanitizedResponse,
  groupMemberPackResponseUserId        :: Int64,
  groupMemberPackResponseGroupMember   :: GroupMemberResponse,
  groupMemberPackResponseGroupMemberId :: Int64,
  groupMemberPackResponseIsOwner       :: Bool
} deriving (Generic, Typeable)



data GroupMemberPackResponses = GroupMemberPackResponses {
  groupMemberPackResponses :: [GroupMemberPackResponse]
} deriving (Generic, Typeable)
