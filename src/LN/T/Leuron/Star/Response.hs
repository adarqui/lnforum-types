{-# LANGUAGE DeriveAnyClass #-}

module LN.T.Leuron.Star.Response (
  LeuronStarResponse (..),
  LeuronStarResponses (..),
) where



import           LN.T.Prelude
import           LN.T.User



data LeuronStarResponse = LeuronStarResponse {
  leuronStarResponseId         :: Int64,
  leuronStarResponseLeuronId :: Int64,
  leuronStarResponseUserId     :: Int64,
  leuronStarResponseReason     :: Maybe Text,
  leuronStarResponseCreatedAt  :: Maybe UTCTime,
  leuronStarResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data LeuronStarResponses = LeuronStarResponses {
  leuronStarResponses :: [LeuronStarResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
