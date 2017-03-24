{-# LANGUAGE DeriveGeneric #-}

module LN.T.Templates (
  Templates (..),
) where



import           LN.T.Resource.Request
import           LN.T.Leuron.Request
import           LN.T.LeuronTraining.Request
import           LN.T.Bucket.Request



data Templates = Templates {
  resourceRequest       :: ResourceRequest,
  leuronRequest         :: LeuronRequest,
  leuronTrainingRequest :: LeuronTrainingRequest,
  bucketRequest         :: BucketRequest
}
