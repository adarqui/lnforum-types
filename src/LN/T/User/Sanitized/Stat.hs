{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module LN.T.User.Sanitized.Stat (
  UserSanitizedStatResponse (..),
  UserSanitizedStatResponses (..),
) where



import           LN.T.Prelude




data UserSanitizedStatResponse = UserSanitizedStatResponse {
  userSanitizedStatResponseUserId      :: Int64,
  userSanitizedStatResponseThreads     :: Int64,
  userSanitizedStatResponseThreadPosts :: Int64,
  userSanitizedStatResponseRespect     :: Int64,
  userSanitizedStatResponseResources   :: Int64,
  userSanitizedStatResponseLeurons     :: Int64,
  userSanitizedStatResponseWorkouts    :: Int64
-- userSanitizedStatResponseLikes :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data UserSanitizedStatResponses = UserSanitizedStatResponses {
  userSanitizedStatResponses :: [UserSanitizedStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
