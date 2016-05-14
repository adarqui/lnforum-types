module LN.T.Leuron.Star.Request (
  LeuronStarRequest (..),
  defaultLeuronStarRequest,
) where



import           LN.T.Prelude



data LeuronStarRequest = LeuronStarRequest {
  leuronStarRequestReason :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultLeuronStarRequest :: LeuronStarRequest
defaultLeuronStarRequest = LeuronStarRequest {
  leuronStarRequestReason = Nothing
}
