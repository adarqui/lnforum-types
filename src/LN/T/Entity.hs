{-# LANGUAGE DeriveGeneric #-}

module LN.T.Entity (
  Ent (..)
) where



import           LN.T.Prelude



data Ent
  = Ent_Organization
  | Ent_Team
  | Ent_User
  | Ent_UserSanitized
  | Ent_Forum
  | Ent_Board
  | Ent_Thread
  | Ent_ThreadPost
  | Ent_Blog
  | Ent_BlogPost
  | Ent_BlogComment
  | Ent_Resource
  | Ent_Leuron
  | Ent_Comment
  | Ent_Api
  | Ent_Like
  | Ent_Star
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
