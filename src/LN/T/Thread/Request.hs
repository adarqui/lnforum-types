{-# LANGUAGE DeriveGeneric #-}

module LN.T.Thread.Request (
  ThreadRequest (..),
  defaultThreadRequest,
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
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultThreadRequest :: ThreadRequest
defaultThreadRequest = ThreadRequest {
  threadRequestDisplayName = "",
  threadRequestDescription = Nothing,
  threadRequestSticky      = False,
  threadRequestLocked      = False,
  threadRequestPoll        = Nothing,
  threadRequestIcon        = Nothing,
  threadRequestTags        = [],
  threadRequestGuard       = 0
}
