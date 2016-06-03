{-# LANGUAGE DeriveGeneric #-}

module LN.T.Resource.Response (
  ResourceResponse (..),
  ResourceResponses (..),
) where



import           LN.T.DepList
import           LN.T.Prelude
import           LN.T.Prelude
import           LN.T.Resource
import           LN.T.Visibility



data ResourceResponse = ResourceResponse {
  resourceResponseId            :: Int64,
  resourceResponseUserId        :: Int64,
  resourceResponseTitle         :: Text,
  resourceResponseDescription   :: Text,
  resourceResponseSource        :: ResourceType,
  resourceResponseAuthor        :: Maybe [Text],
  resourceResponsePrerequisites :: DepList Text,
  resourceResponseCategories    :: DepList Text,
  resourceResponseVisibility    :: Visibility,
  resourceResponseCounter       :: Int,
  resourceResponseVersion       :: Maybe Text,
  resourceResponseUrls          :: Maybe [Text],
  resourceResponseIcon          :: Maybe Text,
  resourceResponseTags          :: [Text],
  resourceResponseCreatedAt     :: Maybe UTCTime,
  resourceResponseModifiedAt    :: Maybe UTCTime
  -- resourceResponseActivityAt :: Maybe UTCTime -- TODO
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ResourceResponses = ResourceResponses {
  resourceResponses :: [ResourceResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
