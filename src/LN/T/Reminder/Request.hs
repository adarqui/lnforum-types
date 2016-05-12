{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Reminder.Request (
  ReminderRequest (..),
  ReminderFolderRequest (..),
  defaultReminderRequest,
  defaultReminderFolderRequest,
) where



import           LN.T.Prelude
import           LN.T.Visibility
import           LN.T.Reminder



data ReminderRequest = ReminderRequest {
  reminderRequestData :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultReminderRequest :: ReminderRequest
defaultReminderRequest = ReminderRequest {
  reminderRequestData = "Nothing to remind, apparently."
}



data ReminderFolderRequest = ReminderFolderRequest {
  reminderFolderRequestName        :: Text,
  reminderFolderRequestDescription :: Maybe Text,
  reminderFolderRequestVisibility  :: Visibility
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultReminderFolderRequest :: ReminderFolderRequest
defaultReminderFolderRequest = ReminderFolderRequest {
  reminderFolderRequestName        = "NoName",
  reminderFolderRequestDescription = Nothing,
  reminderFolderRequestVisibility  = Public
}
