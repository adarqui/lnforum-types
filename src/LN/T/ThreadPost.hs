{-# LANGUAGE DeriveGeneric #-}

module LN.T.ThreadPost (
  PostData (..),
  TyPostData (..)
) where



import           LN.T.Prelude



data PostData
  = PostDataRaw      Text
  | PostDataMarkdown Text
  | PostDataBBCode   Text
  | PostDataCode     Text Text
  | PostDataOther    Text Text
  | PostDataEmpty
  deriving (Eq, Ord, Show, Read, Generic, Typeable)



data TyPostData
  = TyPostDataRaw
  | TyPostDataMarkdown
  | TyPostDataBBCode
  | TyPostDataCode
  | TyPostDataOther
  | TyPostDataEmpty
  deriving (Eq, Ord, Show, Read, Generic, Typeable)
