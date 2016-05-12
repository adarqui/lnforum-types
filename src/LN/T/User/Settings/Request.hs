{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module LN.T.User.Settings.Request (
  UserSettingsRequest (..),
) where



import           LN.T.Prelude
import           LN.T.User.Settings



data UserSettingsRequest = UserSettingsRequest {
  userSettingsRequestShowEmail     :: Bool,
  userSettingsRequestShowOnline    :: Bool,
  userSettingsRequestPMEmailNotify :: Bool
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
