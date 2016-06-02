{-# LANGUAGE DeriveGeneric #-}

module LN.T.Like (
  LikeOpt (..),
  likeOptToScore,
  likeOptToScore64,
) where



import           LN.T.Prelude



data LikeOpt
  = Like
  | Neutral
  | Dislike
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



likeOptToScore :: LikeOpt -> Int
likeOptToScore Like = 1
likeOptToScore Neutral = 0
likeOptToScore Dislike = (-1)



likeOptToScore64 :: LikeOpt -> Int64
likeOptToScore64 Like = 1
likeOptToScore64 Neutral = 0
likeOptToScore64 Dislike = (-1)
