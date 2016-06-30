{-# LANGUAGE DeriveGeneric  #-}

module LN.T.PmOut.Request (
  PmOutRequest (..),
  defaultPmOutRequest,
) where



import           LN.T.Prelude



data PmOutRequest = PmOutRequest {
  pmOutRequestLabel :: Maybe Text,
  pmOutRequestGuard :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultPmOutRequest :: PmOutRequest
defaultPmOutRequest = PmOutRequest {
  pmOutRequestLabel = Nothing,
  pmOutRequestGuard = 0
}
