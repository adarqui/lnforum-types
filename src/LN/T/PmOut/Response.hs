{-# LANGUAGE DeriveGeneric #-}

module LN.T.PmOut.Response (
  PmOutResponse (..),
  PmOutResponses (..),
) where



import           LN.T.Prelude



data PmOutResponse = PmOutResponse {
  pmOutResponseId         :: Int64,
  pmOutResponsePmId       :: Int64,
  pmOutResponseUserId     :: Int64,
  pmOutResponseLabel      :: Maybe Text,
  pmOutResponseIsSaved    :: Bool,
  pmOutResponseActive     :: Bool,
  pmOutResponseGuard      :: Int,
  pmOutResponseCreatedAt  :: Maybe UTCTime,
  pmOutResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data PmOutResponses = PmOutResponses {
  pmOutResponses :: [PmOutResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
