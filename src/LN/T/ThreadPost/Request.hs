{-# LANGUAGE DeriveGeneric #-}

module LN.T.ThreadPost.Request (
  ThreadPostRequest (..),
  defaultThreadPostRequest,
) where



import           LN.T.Prelude
import           LN.T.ThreadPost



data ThreadPostRequest = ThreadPostRequest {
  threadPostRequestTitle       :: Maybe Text,
  threadPostRequestBody        :: PostData,
  threadPostRequestTags        :: [Text],
  threadPostRequestPrivateTags :: [Text],
  threadPostRequestGuard       :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultThreadPostRequest :: ThreadPostRequest
defaultThreadPostRequest = ThreadPostRequest {
  threadPostRequestTitle       = Nothing,
  threadPostRequestBody        = PostDataEmpty,
  threadPostRequestTags        = [],
  threadPostRequestPrivateTags = [],
  threadPostRequestGuard       = 0
}
