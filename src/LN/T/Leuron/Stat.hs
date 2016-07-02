{-# LANGUAGE DeriveGeneric #-}

module LN.T.Leuron.Stat (
  LeuronStatResponse (..),
  LeuronStatResponses (..)
) where



import           LN.T.Prelude



data LeuronStatResponse = LeuronStatResponse {
  leuronStatResponseLeuronId :: Int64,
  leuronStatResponseLikes    :: Int64,
  leuronStatResponseNeutral  :: Int64,
  leuronStatResponseDislikes :: Int64,
  leuronStatResponseStars    :: Int64,
  leuronStatResponseViews    :: Int64
} deriving (Generic, Typeable)



data LeuronStatResponses = LeuronStatResponses {
  leuronStatResponses :: [LeuronStatResponse]
} deriving (Generic, Typeable)
