{-# LANGUAGE DeriveGeneric #-}

module LN.T.Profile.Request (
  ProfileRequest (..)
) where



import           LN.T.Prelude
import           LN.T.Profile



data ProfileRequest = ProfileRequest {
  profileRequestGender        :: ProfileGender,
  profileRequestBirthdate     :: UTCTime,
  profileRequestWebsite       :: Maybe Text,
  profileRequestWebsites      :: [Text],
  profileRequestLocation      :: Maybe Text,
  profileRequestSignature     :: Maybe Text,
  profileRequestDebug         :: Bool,
  profileRequestGuard         :: Int,
  -- State
  profileRequestStateWebsites :: Maybe Text
} deriving (Generic, Typeable)
