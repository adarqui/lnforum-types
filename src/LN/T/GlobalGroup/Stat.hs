{-# LANGUAGE DeriveGeneric #-}

module LN.T.GlobalGroup.Stat (
  GlobalGroupStatResponse (..),
  GlobalGroupStatResponses (..),
) where



import           LN.T.Prelude



data GlobalGroupStatResponse = GlobalGroupStatResponse {
  globalGroupStatResponseGroups :: Int64
} deriving (Generic, Typeable)



data GlobalGroupStatResponses = GlobalGroupStatResponses {
  globalGroupStatResponses :: [GlobalGroupStatResponse]
} deriving (Generic, Typeable)
