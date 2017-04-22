{-# LANGUAGE DeriveGeneric #-}

module LN.T.Training (
  TrainingStyle (..),
  TrainingNode (..)
) where



import           LN.T.Prelude



data TrainingStyle
  = TS_Simple
  | TS_Boolean
  | TS_Matching
  | TS_Subs
  | TS_Splits
  deriving (Generic, Typeable)



data TrainingNode = TrainingNode {

  numTotal          :: Int64,
  numKnow           :: Int64,
  numDontKnow       :: Int64,
  numDontCare       :: Int64,
  numProtest        :: Int64,

  honorKnow         :: Int64,
  honorDontKnow     :: Int64,
  honorDontCare     :: Int64,
  honorProtest      :: Int64,
  honorKnowAt       :: Maybe UTCTime,
  honorDontKnowAt   :: Maybe UTCTime,
  honorDontCareAt   :: Maybe UTCTime,
  honorProtestAt    :: Maybe UTCTime,

  booleanKnow       :: Int64,
  booleanDontKnow   :: Int64,
  booleanDontCare   :: Int64,
  booleanProtest    :: Int64,
  booleanKnowAt     :: Maybe UTCTime,
  booleanDontKnowAt :: Maybe UTCTime,
  booleanDontCareAt :: Maybe UTCTime,
  booleanProtestAt  :: Maybe UTCTime,

  matchKnow         :: Int64,
  matchDontKnow     :: Int64,
  matchDontCare     :: Int64,
  matchProtest      :: Int64,
  matchKnowAt       :: Maybe UTCTime,
  matchDontKnowAt   :: Maybe UTCTime,
  matchDontCareAt   :: Maybe UTCTime,
  matchProtestAt    :: Maybe UTCTime,

  subsKnow          :: Int64,
  subsDontKnow      :: Int64,
  subsDontCare      :: Int64,
  subsProtest       :: Int64,
  subsKnowAt        :: Maybe UTCTime,
  subsDontKnowAt    :: Maybe UTCTime,
  subsDontCareAt    :: Maybe UTCTime,
  subsProtestAt     :: Maybe UTCTime,

  splitsKnow        :: Int64,
  splitsDontKnow    :: Int64,
  splitsDontCare    :: Int64,
  splitsProtest     :: Int64,
  splitsKnowAt      :: Maybe UTCTime,
  splitsDontKnowAt  :: Maybe UTCTime,
  splitsDontCareAt  :: Maybe UTCTime,
  splitsProtestAt   :: Maybe UTCTime

} deriving (Generic, Typeable)
