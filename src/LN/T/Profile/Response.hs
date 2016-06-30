{-# LANGUAGE DeriveGeneric #-}

module LN.T.Profile.Response (
  ProfileResponse (..),
  ProfileResponses (..),
) where



import           LN.T.Ent
import           LN.T.Prelude
import           LN.T.Profile



data ProfileResponse = ProfileResponse {
  profileResponseId         :: Int64,
  profileResponseEnt        :: Ent,
  profileResponseEntId      :: Int64,
  profileResponseGender     :: ProfileGender,
  profileResponseBirthdate  :: UTCTime,
  profileResponseWebsite    :: Maybe Text,
  profileResponseLocation   :: Maybe Text,
  profileResponseSignature  :: Maybe Text,
  profileResponseDebug      :: Bool,
  profileResponseKarmaGood  :: Int,
  profileResponseKarmaBad   :: Int,
  profileResponseGuard      :: Int,
  profileResponseCreatedAt  :: Maybe UTCTime,
  profileResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data ProfileResponses = ProfileResponses {
  profileResponses :: [ProfileResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
