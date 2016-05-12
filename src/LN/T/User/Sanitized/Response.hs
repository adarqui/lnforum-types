{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module LN.T.User.Sanitized.Response (
  UserSanitizedResponse (..),
  UserSanitizedResponses (..),
) where



import           LN.T.Prelude
import           LN.T.User.Sanitized



data UserSanitizedResponse = UserSanitizedResponse {
  userSanitizedResponseId          :: Int64,
  userSanitizedResponseNick        :: Text,
  userSanitizedResponseDisplayNick :: Text,
  userSanitizedResponseEmailMD5    :: Text,
  userSanitizedResponseActive      :: Bool,
  userSanitizedResponseCreatedAt   :: Maybe UTCTime
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data UserSanitizedResponses = UserSanitizedResponses {
  userSanitizedResponses :: [UserSanitizedResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
