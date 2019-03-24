{-# LANGUAGE DeriveGeneric  #-}

module LN.T.Board (
  BoardType (..),
  TyBoardType (..)
) where



import           LN.T.Prelude



data BoardType
  = FixMe
  deriving (Generic, Typeable)



data TyBoardType
  = TyFixMe
  deriving (Generic, Typeable)
