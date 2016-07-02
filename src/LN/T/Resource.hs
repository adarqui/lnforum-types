{-# LANGUAGE DeriveGeneric  #-}

module LN.T.Resource (
  ResourceType (..),
  TyResourceType (..)
) where



import           LN.T.Prelude



data ResourceType
  = ISBN13 Text
  | ISBN10 Text
  | ISBN Text
  | URL Text
  | SourceNone
  {-
  | Album Text Text
  | Song Text Text
  | Paper Text
  -}
  deriving (Generic, Typeable)



data TyResourceType
  = TyISBN13
  | TyISBN10
  | TyISBN
  | TyURL
  | TySourceNone
  deriving (Generic, Typeable)
