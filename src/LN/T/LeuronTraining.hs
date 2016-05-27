{-# LANGUAGE DeriveGeneric  #-}

module LN.T.LeuronTraining (
  LeuronTrainingSummary(..)
) where



import           LN.T.Prelude



data LeuronTrainingSummary
  = LTS_View
  | LTS_Skip
  | LTS_Know
  | LTS_DontKnow
  | LTS_DontUnderstand
  | LTS_DontCare
  | LTS_Protest
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
