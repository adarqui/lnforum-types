{-# LANGUAGE DeriveGeneric #-}

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
  pmResponseActive     :: Bool,
  pmResponseGuard      :: Int,
  pmResponseCreatedAt  :: Maybe UTCTime,
  pmResponseModifiedAt :: Maybe UTCTime,
  pmResponseActivityAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data PmResponses = PmResponses {
  pmResponses :: [PmResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
