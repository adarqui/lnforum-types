{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module LN.T.ThreadPost.Like.Request (
  ThreadPostLikeRequest (..),
  defaultThreadPostLikeRequest,
) where



import           LN.T.Prelude
import           LN.T.Like



data ThreadPostLikeRequest = ThreadPostLikeRequest {
  threadPostLikeRequestOpt    :: LikeOpt,
  threadPostLikeRequestReason :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultThreadPostLikeRequest :: ThreadPostLikeRequest
defaultThreadPostLikeRequest = ThreadPostLikeRequest {
  threadPostLikeRequestOpt = Like,
  threadPostLikeRequestReason = Nothing
}
