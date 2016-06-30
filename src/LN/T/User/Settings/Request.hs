{-# LANGUAGE DeriveGeneric #-}

module LN.T.User.Settings.Request (
  UserSettingsRequest (..),
) where



import           LN.T.Prelude



data UserSettingsRequest = UserSettingsRequest {
  userSettingsRequestShowEmail     :: Bool,
  userSettingsRequestShowOnline    :: Bool,
  userSettingsRequestPMEmailNotify :: Bool
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
