{-# LANGUAGE DeriveGeneric #-}

module LN.T.PmIn.Response (
  PmInResponse (..),
  PmInResponses (..),
) where



import           LN.T.Prelude



data PmInResponse = PmInResponse {
  pmInResponseId         :: Int64,
  pmInResponsePmId       :: Int64,
  pmInResponseUserId     :: Int64,
  pmInResponseLabel      :: Maybe Text,
  pmInResponseIsRead     :: Bool,
  pmInResponseIsStarred  :: Bool,
  pmInResponseIsNew      :: Bool,
  pmInResponseIsSaved    :: Bool,
  pmInResponseActive     :: Bool,
  pmInResponseGuard      :: Int,
  pmInResponseCreatedAt  :: Maybe UTCTime,
  pmInResponseModifiedAt :: Maybe UTCTime
} deriving (Generic, Typeable)



data PmInResponses = PmInResponses {
  pmInResponses :: [PmInResponse]
} deriving (Generic, Typeable)
