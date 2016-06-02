{-# LANGUAGE DeriveGeneric #-}

module LN.T.Test (
  TestRequest (..),
  TestResponse (..),
  TestResponses (..),
  defaultTestRequest
) where



import           LN.T.Prelude



data TestRequest = TestRequest {
  testRequestMsg :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



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
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data TestResponses = TestResponses {
  testResponses :: [TestResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
