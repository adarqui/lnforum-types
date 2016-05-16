module LN.T.Star.Request (
  StarRequest (..),
  defaultStarRequest,
) where



import           LN.T.Prelude



data StarRequest = StarRequest {
  starRequestReason :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultStarRequest :: StarRequest
defaultStarRequest = StarRequest {
  starRequestReason = Nothing
}
