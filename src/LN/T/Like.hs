{-# LANGUAGE DeriveGeneric #-}

module LN.T.Like (
  LikeOpt (..)
) where



import           LN.T.Prelude



data LikeOpt
  = Like
  | Neutral
  | Dislike
  deriving (Generic, Typeable)
