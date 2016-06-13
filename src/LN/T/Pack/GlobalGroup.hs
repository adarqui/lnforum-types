{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.GlobalGroup (
  GlobalGroupPackResponse (..),
  GlobalGroupPackResponses (..),
) where



import           LN.T.GlobalGroup
import           LN.T.GlobalGroup.Response
import           LN.T.GlobalGroup.Stat
import           LN.T.Like.Response
import           LN.T.Prelude
import           LN.T.Star.Response
import           LN.T.User.Sanitized.Response



data GlobalGroupPackResponse = GlobalGroupPackResponse {
  globalGroupPackResponseUser          :: UserSanitizedResponse,
  globalGroupPackResponseUserId        :: Int64,
  globalGroupPackResponseGlobalGroup   :: GlobalGroupResponse,
  globalGroupPackResponseGlobalGroupId :: Int64,
  globalGroupPackResponseStat          :: GlobalGroupStatResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data GlobalGroupPackResponses = GlobalGroupPackResponses {
  globalGroupPackResponses :: [GlobalGroupPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
