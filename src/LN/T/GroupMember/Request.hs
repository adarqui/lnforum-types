{-# LANGUAGE DeriveGeneric #-}

module LN.T.GroupMember.Request (
  GroupMemberRequest (..),
  defaultGroupMemberRequest,
) where



import           LN.T.Membership
import           LN.T.Prelude
import           LN.T.Visibility



data GroupMemberRequest = GroupMemberRequest {
  groupMemberRequestGuard :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultGroupMemberRequest :: GroupMemberRequest
defaultGroupMemberRequest = GroupMemberRequest {
  groupMemberRequestGuard = 0
}
