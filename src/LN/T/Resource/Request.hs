{-# LANGUAGE DeriveGeneric #-}

module LN.T.Resource.Request (
  ResourceRequest (..),
  defaultResourceRequest,
) where



import           LN.T.Prelude
import           LN.T.Resource
import           LN.T.DepList
import           LN.T.Prelude
import           LN.T.Visibility



data ResourceRequest = ResourceRequest {
  resourceRequestTitle         :: Text,
  resourceRequestDescription   :: Text,
  resourceRequestSource        :: ResourceType,
  resourceRequestAuthor        :: Maybe [Text],
  resourceRequestPrerequisites :: DepList Text,
  resourceRequestCategories    :: DepList Text,
  resourceRequestVisibility    :: Visibility,
  resourceRequestCounter       :: Int,
  resourceRequestVersion       :: Maybe Text,
  resourceRequestUrls          :: Maybe [Text]
 } deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultResourceRequest :: ResourceRequest
defaultResourceRequest = ResourceRequest {
  resourceRequestTitle         = "",
  resourceRequestDescription   = "",
  resourceRequestSource        = URL "not found",
  resourceRequestAuthor        = Nothing,
  resourceRequestPrerequisites = [],
  resourceRequestCategories    = [],
  resourceRequestVisibility    = Public,
  resourceRequestCounter       = 0,
  resourceRequestVersion       = Nothing,
  resourceRequestUrls          = Nothing
}
