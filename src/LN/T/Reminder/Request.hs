{-# LANGUAGE DeriveGeneric #-}

module LN.T.Reminder.Request (
  ReminderRequest (..),
  ReminderFolderRequest (..)
) where



import           LN.T.Prelude
import           LN.T.Visibility



data ReminderRequest = ReminderRequest {
  reminderRequestData  :: Text,
  reminderRequestGuard :: Int
} deriving (Generic, Typeable)



data ReminderFolderRequest = ReminderFolderRequest {
  reminderFolderRequestDisplayName :: Text,
  reminderFolderRequestDescription :: Maybe Text,
  reminderFolderRequestVisibility  :: Visibility,
  reminderFolderRequestGuard       :: Int
} deriving (Generic, Typeable)
