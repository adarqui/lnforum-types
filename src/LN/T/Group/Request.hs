{-# LANGUAGE DeriveGeneric #-}

module LN.T.Group.Request (
  GroupRequest (..),
  defaultGroupRequest,
) where



import           LN.T.Prelude



data GroupRequest = GroupRequest {
  groupRequestGuard :: Int
} deriving (Generic, Typeable)



defaultGroupRequest :: GroupRequest
defaultGroupRequest = GroupRequest {
  groupRequestGuard = 0
}
