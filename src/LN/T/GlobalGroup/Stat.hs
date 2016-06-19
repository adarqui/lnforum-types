{-# LANGUAGE DeriveGeneric #-}

module LN.T.GlobalGroup.Stat (
  GlobalGroupStatResponse (..),
  GlobalGroupStatResponses (..),
) where



import           LN.T.Prelude



data GlobalGroupStatResponse = GlobalGroupStatResponse {
  globalGroupStatResponseGroups :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data GlobalGroupStatResponses = GlobalGroupStatResponses {
  globalGroupStatResponses :: [GlobalGroupStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
