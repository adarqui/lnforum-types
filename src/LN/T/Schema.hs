{-# LANGUAGE OverloadedStrings #-}

module LN.T.Schema (
  schema,
  schemaRequest,
  schemaResponse,
  schemaResponses
) where



import           Data.Aeson
import           Data.Aeson.Types
import           Data.String
import           Prelude

import           LN.T.Version



schema :: (IsString a, Monoid a, ToJSON a) => a -> a -> [Pair]
schema k v = ["schema" .= (k <> v), "v" .= lnVersion]



schemaRequest :: (IsString a, Monoid a, ToJSON a) => a -> [Pair]
schemaRequest k = schema k "_request"



schemaResponse :: (IsString a, Monoid a, ToJSON a) => a -> [Pair]
schemaResponse k = schema k "_response"



schemaResponses :: (IsString a, Monoid a, ToJSON a) => a -> [Pair]
schemaResponses k = schema k "_responses"
