{-# LANGUAGE DeriveGeneric  #-}

module LN.T.Team (
  TeamMembership (..)
) where



import           LN.T.Prelude



data TeamMembership
  = TeamMembership_InviteOnly
  | TeamMembership_RequestInvite
  | TeamMembership_Join
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
