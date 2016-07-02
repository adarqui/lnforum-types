module LN.T.Star.Request (
  StarRequest (..),
  defaultStarRequest,
) where



import           LN.T.Prelude



data StarRequest = StarRequest {
  starRequestReason :: Maybe Text,
  starRequestGuard  :: Int
} deriving (Generic, Typeable)



defaultStarRequest :: StarRequest
defaultStarRequest = StarRequest {
  starRequestReason = Nothing,
  starRequestGuard  = 0
}
