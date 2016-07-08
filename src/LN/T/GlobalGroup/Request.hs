{-# LANGUAGE DeriveGeneric #-}

module LN.T.GlobalGroup.Request (
  GlobalGroupRequest (..)
) where



import           LN.T.Membership
import           LN.T.Prelude
import           LN.T.Visibility



data GlobalGroupRequest = GlobalGroupRequest {
  globalGroupRequestDisplayName :: Text,
  globalGroupRequestDescription :: Maybe Text,
  globalGroupRequestMembership  :: Membership,
  globalGroupRequestIcon        :: Maybe Text,
  globalGroupRequestTags        :: [Text],
  globalGroupRequestVisibility  :: Visibility,
  globalGroupRequestGuard       :: Int
} deriving (Generic, Typeable)
