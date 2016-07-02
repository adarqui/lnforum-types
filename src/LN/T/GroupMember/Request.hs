{-# LANGUAGE DeriveGeneric #-}

module LN.T.GroupMember.Request (
  GroupMemberRequest (..),
  defaultGroupMemberRequest,
) where



import           LN.T.Prelude



data GroupMemberRequest = GroupMemberRequest {
  groupMemberRequestGuard :: Int
} deriving (Generic, Typeable)



defaultGroupMemberRequest :: GroupMemberRequest
defaultGroupMemberRequest = GroupMemberRequest {
  groupMemberRequestGuard = 0
}
