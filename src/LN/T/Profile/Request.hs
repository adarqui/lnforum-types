{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.Profile.Request (
  ProfileRequest (..),
  defaultProfileRequest,
) where



import           LN.T.Prelude
import           LN.T.Profile
import           LN.T.Time




data ProfileRequest = ProfileRequest {
  profileRequestGender    :: ProfileGender,
  profileRequestBirthdate :: UTCTime,
  profileRequestWebsite   :: Maybe Text,
  profileRequestLocation  :: Maybe Text,
  profileRequestSignature :: Maybe Text,
  profileRequestDebug     :: Bool,
  profileRequestGuard     :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultProfileRequest :: ProfileRequest
defaultProfileRequest = ProfileRequest {
  profileRequestGender    = defaultProfileGender,
  profileRequestBirthdate = defaultUTCTime,
  profileRequestWebsite   = Nothing,
  profileRequestLocation  = Nothing,
  profileRequestSignature = Nothing,
  profileRequestDebug     = False,
  profileRequestGuard     = 0
}



testProfileRequest :: ProfileRequest
testProfileRequest = defaultProfileRequest {
  profileRequestWebsite   = Just "https://www.adarq.org",
  profileRequestLocation  = Just "FL",
  profileRequestSignature = Just "go get it."
}
