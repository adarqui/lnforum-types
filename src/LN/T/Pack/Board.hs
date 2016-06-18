{-# LANGUAGE DeriveGeneric #-}

module LN.T.Pack.Board (
  BoardPackResponse (..),
  BoardPackResponses (..),
) where



import           LN.T.Board.Response
import           LN.T.Board.Stat
import           LN.T.Like.Response
import           LN.T.Prelude
import           LN.T.Star.Response
import           LN.T.Thread.Response
import           LN.T.Thread.Stat
import           LN.T.ThreadPost.Response
import           LN.T.User.Sanitized.Response



data BoardPackResponse = BoardPackResponse {
  boardPackResponseBoard                :: BoardResponse,
  boardPackResponseBoardId              :: Int64,
  boardPackResponseStat                 :: BoardStatResponse,
  boardPackResponseLike                 :: Maybe LikeResponse,
  boardPackResponseStar                 :: Maybe StarResponse,
  boardPackResponseLatestThread         :: Maybe ThreadResponse,
  boardPackResponseLatestThreadPost     :: Maybe ThreadPostResponse,
  boardPackResponseLatestThreadPostUser :: Maybe UserSanitizedResponse,
  boardPackResponseIsOwner              :: Bool
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data BoardPackResponses = BoardPackResponses {
  boardPackResponses :: [BoardPackResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
