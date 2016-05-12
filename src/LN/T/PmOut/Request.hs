{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.PmOut.Request (
  PmOutRequest (..),
  defaultPmOutRequest,
) where



import           LN.T.Prelude
import           LN.T.PmOut



data PmOutRequest = PmOutRequest {
  pmOutRequestLabel :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultPmOutRequest :: PmOutRequest
defaultPmOutRequest = PmOutRequest {
  pmOutRequestLabel = Nothing
}
