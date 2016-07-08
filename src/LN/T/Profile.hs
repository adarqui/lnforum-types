{-# LANGUAGE DeriveGeneric #-}

module LN.T.Profile (
  ProfileX (..),
  ProfileGender (..)
) where



import           LN.T.Prelude



data ProfileX = ProfileX {
  profileLogin :: Text,
  profileName  :: Text,
  profileEmail :: Text
} deriving (Generic, Typeable)



data ProfileGender
  = GenderMale
  | GenderFemale
  | GenderUnknown
  deriving (Generic, Typeable)
