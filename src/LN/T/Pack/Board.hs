{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Board (
  BoardPackResponse (..),
  BoardPackResponses (..),
) where



import           LN.T.Like.Response
import           LN.T.Permission
import           LN.T.Prelude
import           LN.T.Board.Response
import           LN.T.Board.Stat
import           LN.T.User.Sanitized.Response



data BoardPackResponse = BoardPackResponse {
  boardPackResponseBoard    :: BoardResponse,
  boardPackResponseBoardId  :: Int64,
  boardPackResponseUser        :: UserSanitizedResponse,
  boardPackResponseUserId      :: Int64,
  boardPackResponseStat        :: BoardStatResponse,
  boardPackResponseLike        :: Maybe LikeResponse,
  boardPackResponsePermissions :: Permissions
} deriving (Generic, Typeable)



data BoardPackResponses = BoardPackResponses {
  boardPackResponses :: [BoardPackResponse]
} deriving (Generic, Typeable)
