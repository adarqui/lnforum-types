{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.PmOut (
  PmOutPackResponse (..),
  PmOutPackResponses (..),
) where



import           LN.T.PmOut.Response
import           LN.T.Prelude
import           LN.T.User.Sanitized.Response



data PmOutPackResponse = PmOutPackResponse {
  pmOutPackResponsePmOut   :: PmOutResponse,
  pmOutPackResponsePmOutId :: Int64,
  pmOutPackResponseUser    :: UserSanitizedResponse,
  pmOutPackResponseUserId  :: Int64
} deriving (Generic, Typeable)



data PmOutPackResponses = PmOutPackResponses {
  pmOutPackResponses :: [PmOutPackResponse]
} deriving (Generic, Typeable)
