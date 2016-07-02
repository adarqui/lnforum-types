{-# LANGUAGE DeriveGeneric #-}

module LN.T.Like.Request (
  LikeRequest (..),
  defaultLikeRequest,
) where



import           LN.T.Like
import           LN.T.Prelude



data LikeRequest = LikeRequest {
  likeRequestOpt    :: LikeOpt,
  likeRequestReason :: Maybe Text,
  likeRequestGuard  :: Int
} deriving (Generic, Typeable)



defaultLikeRequest :: LikeRequest
defaultLikeRequest = LikeRequest {
  likeRequestOpt    = Like,
  likeRequestReason = Nothing,
  likeRequestGuard  = 0
}
