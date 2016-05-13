module LN.T.ThreadPost.Star.Request (
  ThreadPostStarRequest (..),
  defaultThreadPostStarRequest,
) where



import           LN.T.Prelude



data ThreadPostStarRequest = ThreadPostStarRequest {
  threadPostStarRequestReason :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultThreadPostStarRequest :: ThreadPostStarRequest
defaultThreadPostStarRequest = ThreadPostStarRequest {
  threadPostStarRequestReason = Nothing
}
