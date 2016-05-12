{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module LN.T.Profile.Request (
  ProfileRequest (..),
  defaultProfileRequest,
) where



import           LN.T.Prelude
import           LN.T.Time
import           LN.T.Profile




data ProfileRequest = ProfileRequest {
  profileRequestGender    :: ProfileGender,
  profileRequestBirthdate :: UTCTime,
  profileRequestWebsite   :: Maybe Text,
  profileRequestLocation  :: Maybe Text,
  profileRequestSignature :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultProfileRequest :: ProfileRequest
defaultProfileRequest = ProfileRequest {
  profileRequestGender = defaultProfileGender,
  profileRequestBirthdate = defaultUTCTime,
  profileRequestWebsite = Nothing,
  profileRequestLocation = Nothing,
  profileRequestSignature = Nothing
}
