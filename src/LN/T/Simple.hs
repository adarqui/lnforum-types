{-# LANGUAGE DeriveGeneric #-}

module LN.T.Simple (
  SimpleIntRequest (..),
  SimpleIntsRequest (..),
  SimpleIntResponse (..),
  SimpleIntsResponse (..),
  SimpleStringRequest (..),
  SimpleStringsRequest (..),
  SimpleStringResponse (..),
  SimpleStringsResponse (..),
) where



import           LN.T.Prelude



data SimpleIntRequest = SimpleIntRequest {
  simpleIntRequest :: Int64
} deriving (Generic, Typeable)



data SimpleIntsRequest = SimpleIntsRequest {
  simpleIntsRequest :: [Int64]
} deriving (Generic, Typeable)



data SimpleIntResponse = SimpleIntResponse {
  simpleIntResponse :: Int64
} deriving (Generic, Typeable)



data SimpleIntsResponse = SimpleIntsResponse {
  simpleIntsResponse :: [Int64]
} deriving (Generic, Typeable)



data SimpleStringRequest = SimpleStringRequest {
  simpleStringRequest :: Text
} deriving (Generic, Typeable)



data SimpleStringsRequest = SimpleStringsRequest {
  simpleStringsRequest :: [Text]
} deriving (Generic, Typeable)



data SimpleStringResponse = SimpleStringResponse {
  simpleStringResponse :: Text
} deriving (Generic, Typeable)



data SimpleStringsResponse = SimpleStringsResponse {
  simpleStringsResponse :: [Text]
} deriving (Generic, Typeable)
