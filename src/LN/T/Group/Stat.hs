{-# LANGUAGE DeriveGeneric #-}

module LN.T.Group.Stat (
  GroupStatResponse (..),
  GroupStatResponses (..),
) where



import           LN.T.Prelude



data GroupStatResponse = GroupStatResponse {
  groupStatResponseMembers :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data GroupStatResponses = GroupStatResponses {
  groupStatResponses :: [GroupStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
