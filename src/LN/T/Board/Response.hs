{-# LANGUAGE DeriveGeneric #-}

module LN.T.Board.Response (
  BoardResponse (..),
  BoardResponses (..),
) where



import           LN.T.Prelude



data BoardResponse = BoardResponse {
  boardResponseId                 :: Int64,
  boardResponseUserId             :: Int64,
  boardResponseOrgId              :: Int64,
  boardResponseForumId            :: Int64,
  boardResponseParentId           :: Maybe Int64,
  boardResponseName               :: Text,
  boardResponseDisplayName        :: Text,
  boardResponseDescription        :: Maybe Text,
  boardResponseIsAnonymous        :: Bool,
  boardResponseCanCreateSubBoards :: Bool,
  boardResponseCanCreateThreads   :: Bool,
  boardResponseSuggestedTags      :: [Text],
  -- Shared
  boardResponseIcon               :: Maybe Text,
  boardResponseTags               :: [Text],
  -- Shared
  boardResponseActive             :: Bool,
  boardResponseGuard              :: Int,
  boardResponseCreatedAt          :: Maybe UTCTime,
  boardResponseModifiedBy         :: Maybe Int64,
  boardResponseModifiedAt         :: Maybe UTCTime,
  boardResponseActivityAt         :: Maybe UTCTime
} deriving (Generic, Typeable)



data BoardResponses = BoardResponses {
  boardResponses :: [BoardResponse]
} deriving (Generic, Typeable)
