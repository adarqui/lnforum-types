module LN.T.Star.Request (
  StarRequest (..),
  defaultStarRequest,
) where



import           LN.T.Prelude



data StarRequest = StarRequest {
  starRequestReason :: Maybe Text,
  starRequestGuard  :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultStarRequest :: StarRequest
defaultStarRequest = StarRequest {
  starRequestReason = Nothing,
  starRequestGuard  = 0
}
