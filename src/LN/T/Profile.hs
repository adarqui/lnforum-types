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
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ProfileGender
  = GenderMale
  | GenderFemale
  | GenderUnknown
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



defaultProfileGender :: ProfileGender
defaultProfileGender = GenderUnknown
