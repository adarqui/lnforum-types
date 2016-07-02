{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.Pm.Request (
  PmRequest (..),
  defaultPmRequest,
) where



import           LN.T.Prelude



data PmRequest = PmRequest {
  pmRequestSubject :: Text,
  pmRequestBody    :: Text,
  pmRequestGuard   :: Int
} deriving (Generic, Typeable)



defaultPmRequest :: PmRequest
defaultPmRequest = PmRequest {
  pmRequestSubject = "No Subject",
  pmRequestBody    = "No Body",
  pmRequestGuard   = 0
}
