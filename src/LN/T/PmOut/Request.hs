{-# LANGUAGE DeriveGeneric  #-}

module LN.T.PmOut.Request (
  PmOutRequest (..)
) where



import           LN.T.Prelude



data PmOutRequest = PmOutRequest {
  pmOutRequestLabel :: Maybe Text,
  pmOutRequestGuard :: Int
} deriving (Generic, Typeable)
