{-# LANGUAGE DeriveGeneric #-}

module LN.T.ThreadPost.Request (
  ThreadPostRequest (..)
) where



import           LN.T.Prelude
import           LN.T.ThreadPost



data ThreadPostRequest = ThreadPostRequest {
  threadPostRequestTitle           :: Maybe Text,
  threadPostRequestBody            :: PostData,
  threadPostRequestTags            :: [Text],
  threadPostRequestPrivateTags     :: [Text],
  threadPostRequestGuard           :: Int,
  -- State
  threadPostRequestStateTag        :: Maybe Text,
  threadPostRequestStatePrivateTag :: Maybe Text
} deriving (Generic, Typeable)
