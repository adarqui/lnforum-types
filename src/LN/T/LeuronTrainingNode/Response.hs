{-# LANGUAGE DeriveGeneric #-}

module LN.T.LeuronTrainingNode.Response (
  LeuronTrainingNodeResponse (..),
  LeuronTrainingNodeResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Training



data LeuronTrainingNodeResponse = LeuronTrainingNodeResponse {
  leuronTrainingNodeResponseId         :: Int64,
  leuronTrainingNodeResponseUserId     :: Int64,
  leuronTrainingNodeResponseLeuronId   :: Int64,
  leuronTrainingNodeResponseNode       :: TrainingNode,
  leuronTrainingNodeResponseActive     :: Bool,
  leuronTrainingNodeResponseGuard      :: Int,
  leuronTrainingNodeResponseCreatedAt  :: Maybe UTCTime,
  leuronTrainingNodeResponseModifiedAt :: Maybe UTCTime
} deriving (Generic, Typeable)



data LeuronTrainingNodeResponses = LeuronTrainingNodeResponses {
  leuronTrainingNodeResponses :: [LeuronTrainingNodeResponse]
} deriving (Generic, Typeable)
