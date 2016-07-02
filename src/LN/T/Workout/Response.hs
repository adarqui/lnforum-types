{-# LANGUAGE DeriveGeneric #-}

module LN.T.Workout.Response (
  WorkoutResponse (..),
  WorkoutResponses (..),
) where



import           LN.T.Prelude
import           LN.T.Workout



data WorkoutResponse = WorkoutResponse {
  workoutResponseId          :: Int64,
  workoutResponseUserId      :: Int64,
  workoutResponseData        :: WorkoutData,
  workoutResponseTitle       :: Maybe Text,
  workoutResponseDescription :: Maybe Text,
  workoutResponseCreatedAt   :: Maybe UTCTime,
  workoutResponseModifiedAt  :: Maybe UTCTime
} deriving (Generic, Typeable)



data WorkoutResponses = WorkoutResponses {
  workoutResponses :: [WorkoutResponse]
} deriving (Generic, Typeable)
