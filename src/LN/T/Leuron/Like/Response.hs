{-# LANGUAGE DeriveAnyClass    #-}

module LN.T.Leuron.Like.Response (
  LeuronLikeResponse (..),
  LeuronLikeResponses (..),
) where



import           LN.T.Like
import           LN.T.Prelude
import           LN.T.User



data LeuronLikeResponse = LeuronLikeResponse {
  leuronLikeResponseId         :: Int64,
  leuronLikeResponseLeuronId :: Int64,
  leuronLikeResponseUserId     :: Int64,
  leuronLikeResponseOpt        :: LikeOpt,
  leuronLikeResponseScore      :: Int,
  leuronLikeResponseReason     :: Maybe Text,
  leuronLikeResponseCreatedAt  :: Maybe UTCTime,
  leuronLikeResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data LeuronLikeResponses = LeuronLikeResponses {
  leuronLikeResponses :: [LeuronLikeResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
