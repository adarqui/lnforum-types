{-# LANGUAGE DeriveAnyClass #-}

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
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data LeuronStatResponses = LeuronStatResponses {
  leuronStatResponses :: [LeuronStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
