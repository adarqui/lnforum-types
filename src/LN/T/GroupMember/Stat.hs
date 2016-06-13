{-# LANGUAGE DeriveGeneric #-}

module LN.T.GroupMember.Stat (
  GroupMemberStatResponse (..),
  GroupMemberStatResponses (..),
) where



import           LN.T.Prelude



data GroupMemberStatResponse = GroupMemberStatResponse {
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data GroupMemberStatResponses = GroupMemberStatResponses {
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
