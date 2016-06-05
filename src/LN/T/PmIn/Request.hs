{-# LANGUAGE DeriveGeneric #-}

module LN.T.PmIn.Request (
  PmInRequest (..),
  defaultPmInRequest,
) where



import           LN.T.Prelude
import           LN.T.PmIn



data PmInRequest = PmInRequest {
  pmInRequestLabel     :: Maybe Text,
  pmInRequestIsRead    :: Bool,
  pmInRequestIsStarred :: Bool,
  pmInRequestGuard     :: Int
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultPmInRequest :: PmInRequest
defaultPmInRequest = PmInRequest {
  pmInRequestLabel     = Nothing,
  pmInRequestIsRead    = False,
  pmInRequestIsStarred = False,
  pmInRequestGuard     = 0
}
