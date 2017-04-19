{-# LANGUAGE DeriveGeneric #-}

module LN.T.LeuronNode.Request (
  LeuronNodeRequest (..)
) where



import           LN.T.Prelude



data LeuronNodeRequest = LeuronNodeRequest {
  leuronNodeRequestRequestGuard :: Int
} deriving (Generic, Typeable)
