{-# LANGUAGE DeriveAnyClass #-}

module LN.T.Resource.Star.Response (
  ResourceStarResponse (..),
  ResourceStarResponses (..),
) where



import           LN.T.Prelude
import           LN.T.User



data ResourceStarResponse = ResourceStarResponse {
  resourceStarResponseId         :: Int64,
  resourceStarResponseResourceId :: Int64,
  resourceStarResponseUserId     :: Int64,
  resourceStarResponseReason     :: Maybe Text,
  resourceStarResponseCreatedAt  :: Maybe UTCTime,
  resourceStarResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ResourceStarResponses = ResourceStarResponses {
  resourceStarResponses :: [ResourceStarResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
