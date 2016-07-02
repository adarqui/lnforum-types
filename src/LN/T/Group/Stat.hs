{-# LANGUAGE DeriveGeneric #-}

module LN.T.Group.Stat (
  GroupStatResponse (..),
  GroupStatResponses (..),
) where



import           LN.T.Prelude



data GroupStatResponse = GroupStatResponse {
  groupStatResponseMembers :: Int64
} deriving (Generic, Typeable)



data GroupStatResponses = GroupStatResponses {
  groupStatResponses :: [GroupStatResponse]
} deriving (Generic, Typeable)
