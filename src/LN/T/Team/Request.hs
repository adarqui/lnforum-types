{-# LANGUAGE DeriveGeneric #-}

module LN.T.Team.Request (
  TeamRequest (..)
) where



import           LN.T.Prelude
import           LN.T.Membership
import           LN.T.Visibility



data TeamRequest = TeamRequest {
  teamRequestMembership  :: Membership,
  teamRequestIcon        :: Maybe Text,
  teamRequestVisibility  :: Visibility,
  teamRequestGuard       :: Int
} deriving (Generic, Typeable)
