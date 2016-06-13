{-# LANGUAGE DeriveGeneric #-}

module LN.T.GlobalGroup.Response (
  GlobalGroupResponse (..),
  GlobalGroupResponses (..),
) where



import           LN.T.Membership
import           LN.T.Prelude
import           LN.T.Visibility



data GlobalGroupResponse = GlobalGroupResponse {
  globalGroupResponseId          :: Int64,
  globalGroupResponseUserId      :: Int64,
  globalGroupResponseName        :: Text,
  globalGroupResponseDisplayName :: Text,
  globalGroupResponseDescription :: Maybe Text,
  globalGroupResponseMembership  :: Membership,
  globalGroupResponseIcon        :: Maybe Text,
  globalGroupResponseTags        :: [Text],
  globalGroupResponseVisibility  :: Visibility,
  globalGroupResponseActive      :: Bool,
  globalGroupResponseGuard       :: Int,
  globalGroupResponseCreatedAt   :: Maybe UTCTime,
  globalGroupResponseModifiedBy  :: Maybe Int64,
  globalGroupResponseModifiedAt  :: Maybe UTCTime,
  globalGroupResponseActivityAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data GlobalGroupResponses = GlobalGroupResponses {
  globalGroupResponses :: [GlobalGroupResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
