{-# LANGUAGE DeriveGeneric #-}

module LN.T.View.Request (
  ViewRequest (..)
) where



import           LN.T.View
import           LN.T.Prelude



data ViewRequest = ViewRequest {
  viewRequestCount :: Int64
} deriving (Generic, Typeable)
