{-# LANGUAGE DeriveGeneric #-}

module LN.T.User.Settings.Response (
  UserSettingsResponse (..),
) where



import           LN.T.Prelude



data UserSettingsResponse = UserSettingsResponse {
  userSettingsResponseId            :: Int64,
  userSettingsResponseShowEmail     :: Bool,
  userSettingsResponseShowOnline    :: Bool,
  userSettingsResponsePMEmailNotify :: Bool
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
