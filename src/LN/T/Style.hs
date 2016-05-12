{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Style (
  StyleResponse (..),
  StyleResponses (..),
  styleName,
  stylesName
) where



import           LN.T.Prelude



styleName :: IsString a => a
styleName = "style"



stylesName :: IsString a => a
stylesName = "styles"



data StyleResponse = StyleResponse {
  styleResponseId   :: Int64,
  styleResponseIcon :: Maybe Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data StyleResponses = StyleResponses {
  styleResponses :: [StyleResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
