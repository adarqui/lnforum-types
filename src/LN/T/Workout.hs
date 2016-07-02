{-# LANGUAGE DeriveGeneric #-}

module LN.T.Workout (
  Workout (..),
  WorkoutData (..),
  WorkoutRest (..),
  ExerciseType (..),
  ExerciseMeasurement (..),
  ExerciseInfo (..),
  TemplateInfo (..)
) where



import           LN.T.Prelude



data WorkoutRest
  = WorkoutRestBetweenSets Double
  deriving (Generic, Typeable)



data Workout
  = WorkoutXSet [Workout] WorkoutRest
  | WorkoutExercise String
  | WorkoutEmpty2
  deriving (Generic, Typeable)



data WorkoutData
  = WorkoutEmpty
  deriving (Generic, Typeable)



type Duration = Double -- microseconds
type Distance = Double -- meters for example

data ExerciseType
  = ET_Resistance
  | ET_Movement
  | ET_Drill
  | ET_Travel
  deriving (Generic, Typeable)



data ExerciseMeasurement
  = EM_RepetitionsMax Double
  | EM_RepetitionsMaxByTimeout Double Duration
  | EM_RepetitionsAndTime Double Duration
  | EM_RepetitionsPassFail Integer Integer
  | EM_RepetitionsPassFailByTimeout Integer Integer Duration
  | EM_RepetitionsPassFailAndTime Integer Integer Duration
  | EM_DistanceByTimeout Distance Duration
  | EM_DistanceAndTime Distance Duration
  deriving (Generic, Typeable)



data ExerciseInfo = ExerciseInfo {
  exerciseInfoName        :: Text,
  exerciseInfoDescription :: Text,
  exerciseInfoType        :: ExerciseType,
  exerciseInfoMeasurement :: ExerciseMeasurement
} deriving (Generic, Typeable)



data TemplateInfo = TemplateInfo {
  templateInfoName        :: Text,
  templateInfoDescription :: Text
} deriving (Generic, Typeable)

{-
data SessionInfo = SessionInfo {
  sessionInfoName :: Text,

} deriving (Generic, Typeable)
-}
