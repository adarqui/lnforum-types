{-# LANGUAGE DeriveGeneric #-}

module LN.T.Ent (
  Ent (..)
) where



import           LN.T.Prelude



data Ent
  = Ent_User
  | Ent_UserSanitized
  | Ent_Forum
  | Ent_Board
  | Ent_Thread
  | Ent_ThreadPost
  | Ent_Api
  | Ent_Like
  | Ent_None
  deriving (Generic, Typeable)
