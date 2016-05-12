{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Pm.Response (
  PmResponse (..),
  PmResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Pm




data PmResponse = PmResponse {
  pmResponseId         :: Int64,
  pmResponseUserId     :: Int64,
  pmResponseToUserId   :: Int64,
  pmResponseSubject    :: Text,
  pmResponseBody       :: Text,
  pmResponseCreatedAt  :: Maybe UTCTime,
  pmResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data PmResponses = PmResponses {
  pmResponses :: [PmResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
