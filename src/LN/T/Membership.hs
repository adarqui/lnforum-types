{-# LANGUAGE DeriveGeneric  #-}

module LN.T.Membership (
  Membership (..)
) where



import           LN.T.Prelude



data Membership
  = Membership_InviteOnly
  | Membership_RequestInvite
  | Membership_Join
  | Membership_Locked
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
