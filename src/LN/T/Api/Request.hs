{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.Api.Request (
  ApiRequest (..),
  defaultApiRequest,
  testApiRequest
) where



import           LN.T.Prelude



data ApiRequest = ApiRequest {
  apiRequestComment :: Maybe Text,
  apiRequestGuard   :: Int
} deriving (Generic, Typeable)



defaultApiRequest :: ApiRequest
defaultApiRequest = ApiRequest {
  apiRequestComment = Nothing,
  apiRequestGuard   = 0
}



testApiRequest :: ApiRequest
testApiRequest = defaultApiRequest {
  apiRequestComment = Just "test"
}
