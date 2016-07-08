{-# LANGUAGE DeriveGeneric #-}

module LN.T.Api.Request (
  ApiRequest (..)
) where



import           LN.T.Prelude



data ApiRequest = ApiRequest {
  apiRequestComment :: Maybe Text,
  apiRequestGuard   :: Int
} deriving (Generic, Typeable)
