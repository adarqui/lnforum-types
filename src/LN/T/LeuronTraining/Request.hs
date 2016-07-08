{-# LANGUAGE DeriveGeneric #-}

module LN.T.LeuronTraining.Request (
  LeuronTrainingRequest (..)
) where



import           LN.T.LeuronTraining
import           LN.T.Prelude



data LeuronTrainingRequest = LeuronTrainingRequest {
  leuronTrainingRequestSummary :: LeuronTrainingSummary,
  leuronTrainingRequestGuard   :: Int
} deriving (Generic, Typeable)
