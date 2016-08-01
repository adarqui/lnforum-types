{-# LANGUAGE DeriveGeneric #-}

module LN.T.Team.Response (
  TeamResponse (..),
  TeamResponses (..),
) where



import           LN.T.Membership
import           LN.T.Prelude
import           LN.T.Visibility
import           LN.T.Team



data TeamResponse = TeamResponse {
  teamResponseId           :: Int64,
  teamResponseUserId       :: Int64,
  teamResponseOrgId        :: Int64,
  teamResponseSystem       :: SystemTeam,
  teamResponseMembership   :: Membership,
  teamResponseIcon         :: Maybe Text,
  teamResponseVisibility   :: Visibility,
  teamResponseActive       :: Bool,
  teamResponseGuard        :: Int,
  teamResponseCreatedAt    :: Maybe UTCTime,
  teamResponseModifiedBy   :: Maybe Int64,
  teamResponseModifiedAt   :: Maybe UTCTime,
  teamResponseActivityAt   :: Maybe UTCTime
} deriving (Generic, Typeable)



data TeamResponses = TeamResponses {
  teamResponses :: [TeamResponse]
} deriving (Generic, Typeable)
