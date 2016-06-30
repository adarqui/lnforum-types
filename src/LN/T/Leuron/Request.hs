{-# LANGUAGE DeriveGeneric #-}

module LN.T.Leuron.Request (
  LeuronRequest (..),
  defaultLeuronRequest,
  dle,
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
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultLeuronRequest :: LeuronRequest
defaultLeuronRequest = LeuronRequest {
  leuronRequestData          = LnEmpty,
  leuronRequestTitle         = Nothing,
  leuronRequestDescription   = Nothing,
-- leuronRequestGrammar      = Nothing,
  leuronRequestSection       = Nothing,
  leuronRequestPage          = Nothing,
-- leuronRequestOptions = Nothing,
  leuronRequestExamples      = Nothing,
  leuronRequestStrengths     = Nothing,
  leuronRequestCategories    = [],
  leuronRequestSplits        = Nothing,
  leuronRequestSubstitutions = Nothing,
  leuronRequestTags          = [],
  leuronRequestStyle         = Nothing,
  leuronRequestGuard         = 0
-- leuronRequestSpecificTo   = Nothing,
-- leuronRequestChildren     = Nothing
}



dle :: LeuronRequest
dle = defaultLeuronRequest
