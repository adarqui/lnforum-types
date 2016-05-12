{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Team.Response (
  TeamResponse (..),
  TeamResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Team



data TeamResponse = TeamResponse {
  teamResponseId          :: Int64,
  teamResponseUserId      :: Int64,
  teamResponseOrgId       :: Int64,
  teamResponseName        :: Text,
  teamResponseDescription :: Maybe Text,
  teamResponseCreatedAt   :: Maybe UTCTime,
  teamResponseModifiedBy  :: Maybe Int64,
  teamResponseModifiedAt  :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data TeamResponses = TeamResponses {
  teamResponses :: [TeamResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
