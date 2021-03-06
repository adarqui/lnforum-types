{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.Test (
  TestRequest (..),
  TestResponse (..),
  TestResponses (..),
  defaultTestRequest
) where



import           LN.T.Prelude



data TestRequest = TestRequest {
  testRequestMsg :: Text
} deriving (Generic, Typeable)



defaultTestRequest :: TestRequest
defaultTestRequest = TestRequest {
  testRequestMsg = "test"
}



data TestResponse = TestResponse {
  testResponseId         :: Int64,
  testResponseUserId     :: Int64,
  testResponseMsg        :: Text,
  testResponseCreatedAt  :: Maybe UTCTime,
  testResponseModifiedAt :: Maybe UTCTime
} deriving (Generic, Typeable)



data TestResponses = TestResponses {
  testResponses :: [TestResponse]
} deriving (Generic, Typeable)
