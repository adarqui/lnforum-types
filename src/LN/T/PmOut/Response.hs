{-# LANGUAGE DeriveGeneric #-}

module LN.T.PmOut.Response (
  PmOutResponse (..),
  PmOutResponses (..),
) where



import           LN.T.Prelude
import           LN.T.PmOut



data PmOutResponse = PmOutResponse {
  pmOutResponseId         :: Int64,
  pmOutResponsePmId       :: Int64,
  pmOutResponseUserId     :: Int64,
  pmOutResponseLabel      :: Maybe Text,
  pmOutResponseIsSaved    :: Bool,
  pmOutResponseCreatedAt  :: Maybe UTCTime,
  pmOutResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data PmOutResponses = PmOutResponses {
  pmOutResponses :: [PmOutResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
