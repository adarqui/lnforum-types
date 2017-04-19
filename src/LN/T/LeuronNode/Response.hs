{-# LANGUAGE DeriveGeneric #-}

module LN.T.LeuronNode.Response (
  LeuronNodeResponse (..),
  LeuronNodeResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Training



data LeuronNodeResponse = LeuronNodeResponse {
  leuronNodeResponseId           :: Int64,
  leuronNodeResponseUserId       :: Int64,
  leuronNodeResponseLeuronId     :: Int64,
  leuronNodeResponseTrainingNode :: TrainingNode,
  leuronNodeResponseActive       :: Bool,
  leuronNodeResponseGuard        :: Int,
  leuronNodeResponseCreatedAt    :: Maybe UTCTime,
  leuronNodeResponseModifiedAt   :: Maybe UTCTime
} deriving (Generic, Typeable)



data LeuronNodeResponses = LeuronNodeResponses {
  leuronNodeResponses :: [LeuronNodeResponse]
} deriving (Generic, Typeable)
