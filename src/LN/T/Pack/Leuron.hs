{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Leuron (
  LeuronPackResponse (..),
  LeuronPackResponses (..),
) where



import           LN.T.Leuron.Response
import           LN.T.Leuron.Stat
import           LN.T.LeuronTraining.Response
import           LN.T.Like.Response
import           LN.T.Permission
import           LN.T.Prelude
import           LN.T.Star.Response
import           LN.T.User.Sanitized.Response



data LeuronPackResponse = LeuronPackResponse {
  leuronPackResponseLeuron      :: LeuronResponse,
  leuronPackResponseLeuronId    :: Int64,
  leuronPackResponseUser        :: UserSanitizedResponse,
  leuronPackResponseUserId      :: Int64,
  leuronPackResponseTraining    :: LeuronTrainingResponse,
  leuronPackResponseStat        :: LeuronStatResponse,
  leuronPackResponseLike        :: Maybe LikeResponse,
  leuronPackResponseStar        :: Maybe StarResponse,
  leuronPackResponsePermissions :: Permissions
} deriving (Generic, Typeable)



data LeuronPackResponses = LeuronPackResponses {
  leuronPackResponses :: [LeuronPackResponse]
} deriving (Generic, Typeable)
