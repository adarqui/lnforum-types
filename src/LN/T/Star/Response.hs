{-# LANGUAGE DeriveGeneric #-}

module LN.T.Star.Response (
  StarResponse (..),
  StarResponses (..),
) where



import           LN.T.Ent
import           LN.T.Prelude
import           LN.T.User



data StarResponse = StarResponse {
  starResponseId         :: Int64,
  starResponseEnt        :: Ent,
  starResponseEntId      :: Int64,
  starResponseUserId     :: Int64,
  starResponseReason     :: Maybe Text,
  starResponseActive     :: Bool,
  starResponseGuard      :: Int,
  starResponseCreatedAt  :: Maybe UTCTime,
  starResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data StarResponses = StarResponses {
  starResponses :: [StarResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
