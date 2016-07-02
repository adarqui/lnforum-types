module LN.T.Size (
  Size (..)
) where



import LN.T.Prelude



data Size
  = XSmall
  | Small
  | Medium
  | Large
  | XLarge
  deriving (Generic, Typeable)
