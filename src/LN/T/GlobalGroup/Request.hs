{-# LANGUAGE DeriveGeneric #-}

module LN.T.GlobalGroup.Request (
  GlobalGroupRequest (..),
  defaultGlobalGroupRequest,
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
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultGlobalGroupRequest :: GlobalGroupRequest
defaultGlobalGroupRequest = GlobalGroupRequest {
  globalGroupRequestDisplayName = "",
  globalGroupRequestDescription = Nothing,
  globalGroupRequestMembership  = Membership_Join,
  globalGroupRequestIcon        = Nothing,
  globalGroupRequestTags        = [],
  globalGroupRequestVisibility  = Public,
  globalGroupRequestGuard       = 0
}
