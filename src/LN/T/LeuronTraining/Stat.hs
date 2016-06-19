{-# LANGUAGE DeriveGeneric #-}

module LN.T.LeuronTraining.Stat (
  LeuronTrainingStatResponse (..),
  LeuronTrainingStatResponses (..)
) where



import           LN.T.Prelude



data LeuronTrainingStatResponse = LeuronTrainingStatResponse {
  leuronTrainingStatResponseLeuronTrainingId :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data LeuronTrainingStatResponses = LeuronTrainingStatResponses {
  leuronTrainingStatResponses :: [LeuronTrainingStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
