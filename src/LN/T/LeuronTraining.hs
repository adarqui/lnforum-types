{-# LANGUAGE DeriveGeneric  #-}

module LN.T.LeuronTraining (
  LeuronTrainingSummary(..)
) where



import           LN.T.Prelude



data LeuronTrainingSummary
  = LTS_View
  | LTS_Know
  | LTS_DontKnow
  | LTS_DontCare
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
