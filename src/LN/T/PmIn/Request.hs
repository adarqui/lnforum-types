{-# LANGUAGE DeriveGeneric #-}

module LN.T.PmIn.Request (
  PmInRequest (..)
) where



import           LN.T.Prelude



data PmInRequest = PmInRequest {
  pmInRequestLabel     :: Maybe Text,
  pmInRequestIsRead    :: Bool,
  pmInRequestIsStarred :: Bool,
  pmInRequestGuard     :: Int
} deriving (Generic, Typeable)
