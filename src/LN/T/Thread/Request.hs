{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Thread.Request (
  ThreadRequest (..),
  defaultThreadRequest,
) where



import           LN.T.Prelude
import           LN.T.Thread



data ThreadRequest = ThreadRequest {
  threadRequestName        :: Text,
  threadRequestDescription :: Maybe Text,
  threadRequestSticky      :: Bool,
  threadRequestLocked      :: Bool,
  threadRequestPoll        :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultThreadRequest :: ThreadRequest
defaultThreadRequest = ThreadRequest {
  threadRequestName = "",
  threadRequestDescription = Nothing,
  threadRequestSticky = False,
  threadRequestLocked = False,
  threadRequestPoll = Nothing
}
