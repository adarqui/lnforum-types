{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Leuron (
  LeuronPackResponse (..),
  LeuronPackResponses (..),
) where



import           LN.T.Leuron.Response
import           LN.T.Leuron.Stat
import           LN.T.Like.Response
import           LN.T.Prelude
import           LN.T.Star.Response
import           LN.T.User.Sanitized.Response



data LeuronPackResponse = LeuronPackResponse {
  leuronPackResponseLeuron   :: LeuronResponse,
  leuronPackResponseLeuronId :: Int64,
  leuronPackResponseUser     :: UserSanitizedResponse,
  leuronPackResponseUserId   :: Int64,
  leuronPackResponseStat     :: LeuronStatResponse,
  leuronPackResponseLike     :: Maybe LikeResponse,
  leuronPackResponseStar     :: Maybe StarResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data LeuronPackResponses = LeuronPackResponses {
  leuronPackResponses :: [LeuronPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
