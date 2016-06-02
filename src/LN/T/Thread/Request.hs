{-# LANGUAGE DeriveGeneric #-}

module LN.T.Thread.Request (
  ThreadRequest (..),
  defaultThreadRequest,
) where



import           LN.T.Prelude



data ThreadRequest = ThreadRequest {
  threadRequestName        :: Text,
  threadRequestDescription :: Maybe Text,
  threadRequestSticky      :: Bool,
  threadRequestLocked      :: Bool,
  threadRequestPoll        :: Maybe Text,
  threadRequestIcon        :: Maybe Text,
  threadRequestTags        :: [Text]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultThreadRequest :: ThreadRequest
defaultThreadRequest = ThreadRequest {
  threadRequestName        = "",
  threadRequestDescription = Nothing,
  threadRequestSticky      = False,
  threadRequestLocked      = False,
  threadRequestPoll        = Nothing,
  threadRequestIcon        = Nothing,
  threadRequestTags        = []
}
