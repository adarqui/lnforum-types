{-# LANGUAGE DeriveGeneric #-}

module LN.T.Leuron.Request (
  LeuronRequest (..)
) where



import           LN.T.DepList       as A
import           LN.T.Leuron        as A
import           LN.T.Prelude
import           LN.T.Splits        as A ()
import           LN.T.Substitutions as A ()



data LeuronRequest = LeuronRequest {
  leuronRequestData          :: LeuronData,
  leuronRequestTitle         :: Maybe Text,
  leuronRequestDescription   :: Maybe Text,
  leuronRequestSection       :: Maybe Text,
  leuronRequestPage          :: Maybe Text,
  leuronRequestExamples      :: Maybe [Text],
  leuronRequestStrengths     :: Maybe [Text],
  leuronRequestCategories    :: DepList Text,
  leuronRequestSplits        :: Maybe [Splits],
  leuronRequestSubstitutions :: Maybe [Substitutions],
  leuronRequestTags          :: [Text],
  leuronRequestStyle         :: Maybe [Text],
  leuronRequestGuard         :: Int
--  leuronRequestSpecificTo    :: Maybe Text,
} deriving (Generic, Typeable)
