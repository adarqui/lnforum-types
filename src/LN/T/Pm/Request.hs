{-# LANGUAGE DeriveGeneric     #-}

module LN.T.Pm.Request (
  PmRequest (..)
) where



import           LN.T.Prelude



data PmRequest = PmRequest {
  pmRequestSubject :: Text,
  pmRequestBody    :: Text,
  pmRequestGuard   :: Int
} deriving (Generic, Typeable)
