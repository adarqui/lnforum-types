{-# LANGUAGE DeriveGeneric #-}

module LN.T.User.Sanitized.Response (
  UserSanitizedResponse (..),
  UserSanitizedResponses (..),
) where



import           LN.T.Prelude



data UserSanitizedResponse = UserSanitizedResponse {
  userSanitizedResponseId          :: Int64,
  userSanitizedResponseName        :: Text,
  userSanitizedResponseDisplayName :: Text,
  userSanitizedResponseEmailMD5    :: Text,
  userSanitizedResponseActive      :: Bool,
  userSanitizedResponseGuard       :: Int,
  userSanitizedResponseCreatedAt   :: Maybe UTCTime,
  userSanitizedResponseActivityAt  :: Maybe UTCTime
} deriving (Generic, Typeable)



data UserSanitizedResponses = UserSanitizedResponses {
  userSanitizedResponses :: [UserSanitizedResponse]
} deriving (Generic, Typeable)
