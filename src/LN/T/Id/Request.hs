{-# LANGUAGE DeriveGeneric #-}

module LN.T.Id.Request (
  IdRequest (..)
) where



import           LN.T.Prelude



data IdRequest = IdRequest {
  idRequestTargetId :: Int64,
  idRequestGuard    :: Int
} deriving (Generic, Typeable)
