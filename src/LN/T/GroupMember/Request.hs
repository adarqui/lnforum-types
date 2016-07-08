{-# LANGUAGE DeriveGeneric #-}

module LN.T.GroupMember.Request (
  GroupMemberRequest (..)
) where



import           LN.T.Prelude



data GroupMemberRequest = GroupMemberRequest {
  groupMemberRequestGuard :: Int
} deriving (Generic, Typeable)
