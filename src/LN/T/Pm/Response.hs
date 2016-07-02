{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pm.Response (
  PmResponse (..),
  PmResponses (..),
) where



import           LN.T.Prelude




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
} deriving (Generic, Typeable)



data PmResponses = PmResponses {
  pmResponses :: [PmResponse]
} deriving (Generic, Typeable)
