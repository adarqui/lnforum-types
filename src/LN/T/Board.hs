{-# LANGUAGE DeriveGeneric  #-}

module LN.T.Board (
  BoardType (..),
  TyBoardType (..)
) where



import           LN.T.Prelude



data BoardType
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



data TyBoardType
  = TyISBN13
  | TyISBN10
  | TyISBN
  | TyURL
  | TySourceNone
  deriving (Generic, Typeable)
