{-# LANGUAGE DeriveGeneric #-}

module LN.T.Profile.Response (
  ProfileResponse (..),
  ProfileResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Profile
import           LN.T.Time



data ProfileResponse = ProfileResponse {
  profileResponseId         :: Int64,
  profileResponseEntityId   :: Int64,
  profileResponseGender     :: ProfileGender,
  profileResponseBirthdate  :: UTCTime,
  profileResponseWebsite    :: Maybe Text,
  profileResponseLocation   :: Maybe Text,
  profileResponseSignature  :: Maybe Text,
  profileResponseKarmaGood  :: Int,
  profileResponseKarmaBad   :: Int,
  profileResponseGuard      :: Int,
  profileResponseCreatedAt  :: Maybe UTCTime,
  profileResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ProfileResponses = ProfileResponses {
  profileResponses :: [ProfileResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
