{-# LANGUAGE DeriveGeneric #-}

module LN.T.Reminder.Response (
  ReminderResponse (..),
  ReminderResponses (..),
  ReminderFolderResponse (..),
  ReminderFolderResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Visibility
import           LN.T.Reminder



data ReminderResponse = ReminderResponse {
  reminderResponseId             :: Int64,
  reminderResponseUserId         :: Int64,
  reminderResponseParentFolderId :: Int64,
  reminderResponseData           :: Text,
  reminderResponseActive         :: Bool,
  reminderResponseGuard          :: Int,
  reminderResponseCreatedAt      :: Maybe UTCTime,
  reminderResponseModifiedAt     :: Maybe UTCTime,
  reminderResponseActivityAt     :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ReminderResponses = ReminderResponses {
  reminderResponses :: [ReminderResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ReminderFolderResponse = ReminderFolderResponse {
  reminderFolderResponseId             :: Int64,
  reminderFolderResponseUserId         :: Int64,
  reminderFolderResponseParentFolderId :: Maybe Int64,
  reminderFolderResponseName           :: Text,
  reminderFolderResponseDisplayName    :: Text,
  reminderFolderResponseVisibility     :: Visibility,
  reminderFolderResponseDescription    :: Maybe Text,
  reminderFolderResponseActive         :: Bool,
  reminderFolderResponseGuard          :: Int,
  reminderFolderResponseCreatedAt      :: Maybe UTCTime,
  reminderFolderResponseModifiedAt     :: Maybe UTCTime,
  reminderFolderResponseActivityAt     :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ReminderFolderResponses = ReminderFolderResponses {
  reminderFolderResponses :: [ReminderFolderResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
