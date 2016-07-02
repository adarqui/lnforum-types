{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.Reminder.Request (
  ReminderRequest (..),
  ReminderFolderRequest (..),
  defaultReminderRequest,
  defaultReminderFolderRequest,
) where



import           LN.T.Prelude
import           LN.T.Visibility



data ReminderRequest = ReminderRequest {
  reminderRequestData  :: Text,
  reminderRequestGuard :: Int
} deriving (Generic, Typeable)



defaultReminderRequest :: ReminderRequest
defaultReminderRequest = ReminderRequest {
  reminderRequestData  = "Nothing to remind, apparently.",
  reminderRequestGuard = 0
}



data ReminderFolderRequest = ReminderFolderRequest {
  reminderFolderRequestDisplayName :: Text,
  reminderFolderRequestDescription :: Maybe Text,
  reminderFolderRequestVisibility  :: Visibility,
  reminderFolderRequestGuard       :: Int
} deriving (Generic, Typeable)



defaultReminderFolderRequest :: ReminderFolderRequest
defaultReminderFolderRequest = ReminderFolderRequest {
  reminderFolderRequestDisplayName = "NoName",
  reminderFolderRequestDescription = Nothing,
  reminderFolderRequestVisibility  = Public,
  reminderFolderRequestGuard       = 0
}
