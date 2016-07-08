{-# LANGUAGE DeriveGeneric #-}

module LN.T.Group.Request (
  GroupRequest (..)
) where



import           LN.T.Prelude



data GroupRequest = GroupRequest {
  groupRequestGuard :: Int
} deriving (Generic, Typeable)
