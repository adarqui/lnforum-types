{-# LANGUAGE DeriveGeneric #-}

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
  userSanitizedStatResponseWorkouts    :: Int64
-- userSanitizedStatResponseLikes :: Int64
} deriving (Generic, Typeable)



data UserSanitizedStatResponses = UserSanitizedStatResponses {
  userSanitizedStatResponses :: [UserSanitizedStatResponse]
} deriving (Generic, Typeable)
