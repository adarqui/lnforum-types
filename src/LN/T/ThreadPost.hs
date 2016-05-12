{-# LANGUAGE DeriveAnyClass      #-}
{-# LANGUAGE RecordWildCards     #-}
{-# LANGUAGE ScopedTypeVariables #-}

module LN.T.ThreadPost (
  PostData (..),
) where



import           LN.T.Prelude



data PostData
  = PostDataRaw      Text
  | PostDataMarkdown Text
  | PostDataBBCode   Text
  | PostDataCode     Text Text
  | PostDataOther    Text Text
  | PostDataEmpty
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
