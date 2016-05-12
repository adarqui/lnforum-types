{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Resource (
  ResourceType (..),
) where



import           LN.T.Prelude



data ResourceType =
    ISBN13 Text
  | ISBN10 Text
  | ISBN Text
  | URL Text
  | SourceNone
  {-
  | Album Text Text
  | Song Text Text
  | Paper Text
  -}
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
