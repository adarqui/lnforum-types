{-# LANGUAGE DeriveAnyClass    #-}

module LN.T.Resource.Like.Request (
  ResourceLikeRequest (..),
  defaultResourceLikeRequest,
) where



import           LN.T.Like
import           LN.T.Prelude



data ResourceLikeRequest = ResourceLikeRequest {
  resourceLikeRequestOpt    :: LikeOpt,
  resourceLikeRequestReason :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultResourceLikeRequest :: ResourceLikeRequest
defaultResourceLikeRequest = ResourceLikeRequest {
  resourceLikeRequestOpt = Like,
  resourceLikeRequestReason = Nothing
}
