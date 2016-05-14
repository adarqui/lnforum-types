{-# LANGUAGE DeriveAnyClass    #-}

module LN.T.Leuron.Like.Request (
  LeuronLikeRequest (..),
  defaultLeuronLikeRequest,
) where



import           LN.T.Like
import           LN.T.Prelude



data LeuronLikeRequest = LeuronLikeRequest {
  leuronLikeRequestOpt    :: LikeOpt,
  leuronLikeRequestReason :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultLeuronLikeRequest :: LeuronLikeRequest
defaultLeuronLikeRequest = LeuronLikeRequest {
  leuronLikeRequestOpt = Like,
  leuronLikeRequestReason = Nothing
}
