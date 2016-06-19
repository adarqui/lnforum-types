{-# LANGUAGE DeriveGeneric #-}

module LN.T.Api.Request (
  ApiRequest (..),
  defaultApiRequest,
) where



import           LN.T.Prelude



data ApiRequest = ApiRequest {
  apiRequestComment :: Maybe Text,
  apiRequestGuard   :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultApiRequest :: ApiRequest
defaultApiRequest = ApiRequest Nothing 0
