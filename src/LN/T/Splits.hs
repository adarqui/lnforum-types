
{-# LANGUAGE RecordWildCards #-}

module LN.T.Splits (
  Splits (..),
  TySplits (..),
  splitAtSpQ
) where



import           LN.T.Prelude



data Splits
  = SplitAt Char Text Text
  | SplitNone
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data TySplits
  = TySplitA
  | TySplitNone
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



-- | splitAtSpQ
--
-- split at the specified string, at a space, followed by ...?
--
splitAtSpQ :: Text -> Splits
splitAtSpQ s = SplitAt ' ' s "...?"
