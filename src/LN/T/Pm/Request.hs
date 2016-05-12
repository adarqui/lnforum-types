{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Pm.Request (
  PmRequest (..),
  defaultPmRequest,
) where



import           LN.T.Prelude
import           LN.T.Pm



data PmRequest = PmRequest {
  pmRequestSubject :: Text,
  pmRequestBody    :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultPmRequest :: PmRequest
defaultPmRequest = PmRequest {
  pmRequestSubject = "No Subject",
  pmRequestBody    = "No Body"
}
