{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Pack.Thread (
  ThreadPackResponse (..),
  ThreadPackResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Thread.Response
import           LN.T.Thread.Stat
import           LN.T.ThreadPost.Response
import           LN.T.User.Sanitized.Response



data ThreadPackResponse = ThreadPackResponse {
  threadPackResponseThread               :: ThreadResponse,
  threadPackResponseThreadUser           :: UserSanitizedResponse,
  threadPackResponseThreadStat           :: ThreadStatResponse,
  threadPackResponseLatestThreadPost     :: Maybe ThreadPostResponse,
  threadPackResponseLatestThreadPostUser :: Maybe UserSanitizedResponse
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ThreadPackResponses = ThreadPackResponses {
  threadPackResponses :: [ThreadPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
