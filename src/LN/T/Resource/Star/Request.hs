module LN.T.Resource.Star.Request (
  ResourceStarRequest (..),
  defaultResourceStarRequest,
) where



import           LN.T.Prelude



data ResourceStarRequest = ResourceStarRequest {
  resourceStarRequestReason :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultResourceStarRequest :: ResourceStarRequest
defaultResourceStarRequest = ResourceStarRequest {
  resourceStarRequestReason = Nothing
}
