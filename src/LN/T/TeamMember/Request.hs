{-# LANGUAGE DeriveGeneric #-}

module LN.T.TeamMember.Request (
  TeamMemberRequest (..)
) where



import           LN.T.Prelude



data TeamMemberRequest = TeamMemberRequest {
  teamMemberRequestGuard :: Int
} deriving (Generic, Typeable)
