{-# LANGUAGE DeriveGeneric #-}

module LN.T.Like.Response (
  LikeResponse (..),
  LikeResponses (..),
) where



import           LN.T.Ent
import           LN.T.Like
import           LN.T.Prelude
import           LN.T.User



data LikeResponse = LikeResponse {
  likeResponseId         :: Int64,
  likeResponseEnt        :: Ent,
  likeResponseEntId      :: Int64,
  likeResponseUserId     :: Int64,
  likeResponseOpt        :: LikeOpt,
  likeResponseScore      :: Int,
  likeResponseReason     :: Maybe Text,
  likeResponseActive     :: Bool,
  likeResponseGuard      :: Int,
  likeResponseCreatedAt  :: Maybe UTCTime,
  likeResponseModifiedAt :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data LikeResponses = LikeResponses {
  likeResponses :: [LikeResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
