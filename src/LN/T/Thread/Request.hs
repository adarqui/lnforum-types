{-# LANGUAGE DeriveGeneric     #-}

module LN.T.Thread.Request (
  ThreadRequest (..)
) where



import           LN.T.Prelude



data ThreadRequest = ThreadRequest {
  threadRequestDisplayName :: Text,
  threadRequestDescription :: Maybe Text,
  threadRequestSticky      :: Bool,
  threadRequestLocked      :: Bool,
  threadRequestPoll        :: Maybe Text,
  threadRequestIcon        :: Maybe Text,
  threadRequestTags        :: [Text],
  threadRequestGuard       :: Int
} deriving (Generic, Typeable)
