{-# LANGUAGE DeriveGeneric #-}

module LN.T.Star.Response (
  StarResponse (..),
  StarResponses (..),
) where



import           LN.T.Entity
import           LN.T.Prelude
import           LN.T.User



data StarResponse = StarResponse {
  starResponseId         :: Int64,
  starResponseEntity     :: Ent,
  starResponseUserId     :: Int64,
  starResponseReason     :: Maybe Text,
  starResponseActive     :: Bool,
  starResponseGuard      :: Int,
  starResponseCreatedAt  :: Maybe UTCTime,
  starResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data StarResponses = StarResponses {
  starResponses :: [StarResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
