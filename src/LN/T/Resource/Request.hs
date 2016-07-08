{-# LANGUAGE DeriveGeneric     #-}

module LN.T.Resource.Request (
  ResourceRequest (..)
) where



import           LN.T.DepList
import           LN.T.Prelude
import           LN.T.Resource
import           LN.T.Visibility



data ResourceRequest = ResourceRequest {
  resourceRequestDisplayName   :: Text,
  resourceRequestDescription   :: Text,
  resourceRequestSource        :: ResourceType,
  resourceRequestAuthor        :: Maybe [Text],
  resourceRequestPrerequisites :: DepList Text,
  resourceRequestCategories    :: DepList Text,
  resourceRequestVisibility    :: Visibility,
  resourceRequestCounter       :: Int,
  resourceRequestVersion       :: Maybe Text,
  resourceRequestUrls          :: Maybe [Text],
  resourceRequestIcon          :: Maybe Text,
  resourceRequestTags          :: [Text],
  resourceRequestGuard         :: Int
 } deriving (Generic, Typeable)
