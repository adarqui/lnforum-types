{-# LANGUAGE DeriveGeneric #-}

module LN.T.LeuronTraining.Response (
  LeuronTrainingResponse (..),
  LeuronTrainingResponses (..),
) where



import           LN.T.LeuronTraining
import           LN.T.Prelude



data LeuronTrainingResponse = LeuronTrainingResponse {
  leuronTrainingResponseId         :: Int64,
  leuronTrainingResponseUserId     :: Int64,
  leuronTrainingResponseLeuronId   :: Int64,
  leuronTrainingResponseSummary    :: LeuronTrainingSummary,
  leuronTrainingResponseGuard      :: Int,
  leuronTrainingResponseCreatedAt  :: Maybe UTCTime,
  leuronTrainingResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data LeuronTrainingResponses = LeuronTrainingResponses {
  leuronTrainingResponses :: [LeuronTrainingResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
