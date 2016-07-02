{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.PmIn (
  PmInPackResponse (..),
  PmInPackResponses (..),
) where



import           LN.T.PmIn.Response
import           LN.T.Prelude
import           LN.T.User.Sanitized.Response



data PmInPackResponse = PmInPackResponse {
  pmInPackResponsePmIn   :: PmInResponse,
  pmInPackResponsePmInId :: Int64,
  pmInPackResponseUser   :: UserSanitizedResponse,
  pmInPackResponseUserId :: Int64
} deriving (Generic, Typeable)



data PmInPackResponses = PmInPackResponses {
  pmInPackResponses :: [PmInPackResponse]
} deriving (Generic, Typeable)
