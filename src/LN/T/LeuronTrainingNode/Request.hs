{-# LANGUAGE DeriveGeneric #-}

module LN.T.LeuronTrainingNode.Request (
  LeuronTrainingNodeRequest (..)
) where



import           LN.T.Prelude



data LeuronTrainingNodeRequest = LeuronTrainingNodeRequest {
  leuronTrainingNodeRequestRequestGuard :: Int
} deriving (Generic, Typeable)
