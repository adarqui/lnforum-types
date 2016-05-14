{-# LANGUAGE DeriveAnyClass #-}

module LN.T.Pack.Leuron (
  LeuronPackResponse (..),
  LeuronPackResponses (..),
) where



import           LN.T.Leuron.Response
import           LN.T.Leuron.Stat
import           LN.T.Leuron.Like.Response
import           LN.T.Leuron.Star.Response
import           LN.T.Prelude
import           LN.T.User.Sanitized.Response



data LeuronPackResponse = LeuronPackResponse {
  leuronPackResponseLeuron :: LeuronResponse,
  leuronPackResponseUser   :: UserSanitizedResponse,
  leuronPackResponseStat   :: LeuronStatResponse,
  leuronPackResponseLike   :: Maybe LeuronLikeResponse,
  leuronPackResponseStar   :: Maybe LeuronStarResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data LeuronPackResponses = LeuronPackResponses {
  leuronPackResponses :: [LeuronPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
