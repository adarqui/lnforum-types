{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.PmIn.Request (
  PmInRequest (..),
  defaultPmInRequest,
) where



import           LN.T.Prelude
import           LN.T.PmIn



data PmInRequest = PmInRequest {
  pmInRequestLabel     :: Maybe Text,
  pmInRequestIsRead    :: Bool,
  pmInRequestIsStarred :: Bool
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultPmInRequest :: PmInRequest
defaultPmInRequest = PmInRequest {
  pmInRequestLabel = Nothing,
  pmInRequestIsRead = False,
  pmInRequestIsStarred = False
}
