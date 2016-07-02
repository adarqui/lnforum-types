{-# LANGUAGE DeriveGeneric #-}

module LN.T.LeuronTraining.Request (
  LeuronTrainingRequest (..),
  defaultLeuronTrainingRequest,
) where



import           LN.T.LeuronTraining
import           LN.T.Prelude



data LeuronTrainingRequest = LeuronTrainingRequest {
  leuronTrainingRequestSummary :: LeuronTrainingSummary,
  leuronTrainingRequestGuard   :: Int
} deriving (Generic, Typeable)



defaultLeuronTrainingRequest :: LeuronTrainingRequest
defaultLeuronTrainingRequest = LeuronTrainingRequest LTS_View 0
