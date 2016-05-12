
{-# LANGUAGE RecordWildCards #-}

module LN.T.Splits (
  Splits (..),
  splitAtSpQ
) where



import           LN.T.Prelude



data Splits
  = SplitAt Char Text Text
  | SplitNone
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



-- | splitAtSpQ
--
-- split at the specified string, at a space, followed by ...?
--
splitAtSpQ :: Text -> Splits
splitAtSpQ s = SplitAt ' ' s "...?"
