{-# LANGUAGE DeriveGeneric #-}

module LN.T.LeuronTraining.Request (
  LeuronTrainingRequest (..),
  defaultLeuronTrainingRequest,
) where



import           LN.T.LeuronTraining
import           LN.T.Prelude



data LeuronTrainingRequest = LeuronTrainingRequest {
  leuronTrainingRequestStyle :: LeuronTrainingSummary
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultLeuronTrainingRequest :: LeuronTrainingRequest
defaultLeuronTrainingRequest = LeuronTrainingRequest LTS_View



dle :: LeuronTrainingRequest
dle = defaultLeuronTrainingRequest
