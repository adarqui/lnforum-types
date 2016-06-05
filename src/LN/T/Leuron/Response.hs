{-# LANGUAGE DeriveGeneric #-}

module LN.T.Leuron.Response (
  module A,
  LeuronResponse (..),
  LeuronResponses (..),
) where



import           LN.T.DepList       as A
import           LN.T.Prelude
import           LN.T.Splits        as A
import           LN.T.Substitutions as A
import           LN.T.Leuron



data LeuronResponse = LeuronResponse {
  leuronResponseId            :: Int64,
  leuronResponseUserId        :: Int64,
  leuronResponseResourceId    :: Int64,
  leuronResponseData          :: LeuronData,
  leuronResponseTitle         :: Maybe Text,
  leuronResponseDescription   :: Maybe Text,
  leuronResponseSection       :: Maybe Text,
  leuronResponsePage          :: Maybe Text,
  leuronResponseExamples      :: Maybe [Text],
  leuronResponseStrengths     :: Maybe [Text],
  leuronResponseCategories    :: DepList Text,
  leuronResponseSplits        :: Maybe [Splits],
  leuronResponseSubstitutions :: Maybe [Substitutions],
  leuronResponseTags          :: [Text],
  leuronResponseStyle         :: Maybe [Text],
  leuronResponseActive        :: Bool,
  leuronResponseGuard         :: Int,
  leuronResponseCreatedAt     :: Maybe UTCTime,
  leuronResponseModifiedAt    :: Maybe UTCTime,
  leuronResponseActivityAt    :: Maybe UTCTime
--  leuronResponseSpecificTo    :: Maybe Text,
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data LeuronResponses = LeuronResponses {
  leuronResponses :: [LeuronResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
