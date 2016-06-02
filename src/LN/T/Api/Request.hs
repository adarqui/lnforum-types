{-# LANGUAGE DeriveGeneric #-}

module LN.T.Api.Request (
  ApiRequest (..),
  defaultApiRequest,
) where



import           LN.T.Prelude



data ApiRequest = ApiRequest {
  apiRequestComment :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultApiRequest :: ApiRequest
defaultApiRequest = ApiRequest Nothing
