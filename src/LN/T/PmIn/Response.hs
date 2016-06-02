{-# LANGUAGE DeriveGeneric #-}

module LN.T.PmIn.Response (
  PmInResponse (..),
  PmInResponses (..),
) where



import           LN.T.Prelude
import           LN.T.PmIn



data PmInResponse = PmInResponse {
  pmInResponseId         :: Int64,
  pmInResponsePmId       :: Int64,
  pmInResponseUserId     :: Int64,
  pmInResponseLabel      :: Maybe Text,
  pmInResponseIsRead     :: Bool,
  pmInResponseIsStarred  :: Bool,
  pmInResponseIsNew      :: Bool,
  pmInResponseIsSaved    :: Bool,
  pmInResponseCreatedAt  :: Maybe UTCTime,
  pmInResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data PmInResponses = PmInResponses {
  pmInResponses :: [PmInResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
