{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Board (
  BoardPackResponse (..),
  BoardPackResponses (..),
) where



import           LN.T.Board.Response
import           LN.T.Board.Stat
import           LN.T.Like.Response
import           LN.T.Permission
import           LN.T.Prelude
import           LN.T.Thread.Response
import           LN.T.ThreadPost.Response
import           LN.T.User.Sanitized.Response



data BoardPackResponse = BoardPackResponse {
  boardPackResponseBoard                :: BoardResponse,
  boardPackResponseBoardId              :: Int64,
  boardPackResponseUser                 :: Maybe UserSanitizedResponse,
  boardPackResponseUserId               :: Maybe Int64,
  boardPackResponseStat                 :: BoardStatResponse,
  boardPackResponseLike                 :: Maybe LikeResponse,
  boardPackResponsePermissions          :: Permissions,
  boardPackResponseLatestThread         :: Maybe ThreadResponse,
  boardPackResponseLatestThreadPost     :: Maybe ThreadPostResponse,
  boardPackResponseLatestThreadPostUser :: Maybe UserSanitizedResponse
} deriving (Generic, Typeable)



data BoardPackResponses = BoardPackResponses {
  boardPackResponses :: [BoardPackResponse]
} deriving (Generic, Typeable)
