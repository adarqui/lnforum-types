{-# LANGUAGE DeriveGeneric #-}

module LN.T.Group.Request (
  GroupRequest (..),
  defaultGroupRequest,
) where



import           LN.T.Membership
import           LN.T.Prelude
import           LN.T.Visibility



data GroupRequest = GroupRequest {
  groupRequestGuard :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultGroupRequest :: GroupRequest
defaultGroupRequest = GroupRequest {
  groupRequestGuard = 0
}
