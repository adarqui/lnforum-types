{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.Resource.Request (
  ResourceRequest (..),
  defaultResourceRequest,
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
 } deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultResourceRequest :: ResourceRequest
defaultResourceRequest = ResourceRequest {
  resourceRequestDisplayName   = "",
  resourceRequestDescription   = "",
  resourceRequestSource        = URL "not found",
  resourceRequestAuthor        = Nothing,
  resourceRequestPrerequisites = [],
  resourceRequestCategories    = [],
  resourceRequestVisibility    = Public,
  resourceRequestCounter       = 0,
  resourceRequestVersion       = Nothing,
  resourceRequestUrls          = Nothing,
  resourceRequestIcon          = Nothing,
  resourceRequestTags          = [],
  resourceRequestGuard         = 0
}
