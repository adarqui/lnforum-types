{-# LANGUAGE DeriveAnyClass #-}

module LN.T.Like.Request (
  LikeRequest (..),
  defaultLikeRequest,
) where



import           LN.T.Like
import           LN.T.Prelude



data LikeRequest = LikeRequest {
  likeRequestOpt    :: LikeOpt,
  likeRequestReason :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultLikeRequest :: LikeRequest
defaultLikeRequest = LikeRequest {
  likeRequestOpt = Like,
  likeRequestReason = Nothing
}
