{-# LANGUAGE DeriveGeneric #-}

module LN.T.Star.Request (
  StarRequest (..)
) where



import           LN.T.Prelude



data StarRequest = StarRequest {
  starRequestReason :: Maybe Text,
  starRequestGuard  :: Int
} deriving (Generic, Typeable)
