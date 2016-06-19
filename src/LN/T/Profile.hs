{-# LANGUAGE DeriveGeneric #-}

module LN.T.Profile (
  ProfileX (..),
  ProfileGender (..),
  defaultProfileGender,
) where



import           LN.T.Prelude
import           LN.T.Time



data ProfileX = ProfileX {
  profileName  :: Text,
  profileEmail :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data ProfileGender
  = GenderMale
  | GenderFemale
  | GenderUnknown
  deriving (Eq, Ord, Show, Read, Generic, Typeable)



defaultProfileGender :: ProfileGender
defaultProfileGender = GenderUnknown
