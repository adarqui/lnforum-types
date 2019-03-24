{-# LANGUAGE OverloadedStrings #-}

module LN.T.Param (
  Param (..),
  ParamTag (..),
  SortOrderBy (..),
  OrderBy (..),
) where



import           LN.T.Prelude



default (Text)



data Param
  = Limit                  Int64
  | Offset                 Int64
  | SortOrder              SortOrderBy
  | Order                  OrderBy
  | ByUserId               Int64
  | ByUsersIds             [Int64]
  | ByUserName             Text
  | ByUsersNames           [Text]
  | ByForumId              Int64
  | ByBoardId              Int64
  | ByBoardsIds            [Int64]
  | ByBoardName            Text
  | ByThreadId             Int64
  | ByThreadsIds           [Int64]
  | ByThreadName           Text
  | ByThreadPostId         Int64
  | ByThreadPostsIds       [Int64]
  | ByThreadPostName       Text
  | ByThreadPostLikeId     Int64
  | ByThreadPostLikesIds   [Int64]
  | ByPmId                 Int64
  | ByPmsIds               [Int64]
  | ByReminderId           Int64
  | ByReminderFolderId     Int64
  | ByParentId             Int64
  | ByParentsIds           [Int64]
  | ByParentName           Text
  | ByEmail                Text
  | BySelf                 Bool
  | View                   Bool
  | Timestamp              UTCTime
  | UnixTimestamp          Int64
  | CreatedAtTimestamp     UTCTime
  | CreatedAtUnixTimestamp Int64
  | RealIP                 Text
  | IP                     Text
  | WithBoard              Bool
  | WithThread             Bool
  | WithThreadPosts        Bool
  deriving (Generic, Typeable)



data ParamTag
  = ParamTag_Limit
  | ParamTag_Offset
  | ParamTag_SortOrder
  | ParamTag_Order
  | ParamTag_ByUserId
  | ParamTag_ByUsersIds
  | ParamTag_ByUserName
  | ParamTag_ByUsersNames
  | ParamTag_ByBoardId
  | ParamTag_ByBoardsIds
  | ParamTag_ByBoardName
  | ParamTag_ByThreadId
  | ParamTag_ByThreadsIds
  | ParamTag_ByThreadName
  | ParamTag_ByThreadPostId
  | ParamTag_ByThreadPostsIds
  | ParamTag_ByThreadPostName
  | ParamTag_ByThreadPostLikeId
  | ParamTag_ByThreadPostLikesIds
  | ParamTag_ByPmId
  | ParamTag_ByPmsIds
  | ParamTag_ByReminderId
  | ParamTag_ByReminderFolderId
  | ParamTag_ByParentId
  | ParamTag_ByParentsIds
  | ParamTag_ByParentName
  | ParamTag_ByEmail
  | ParamTag_BySelf
  | ParamTag_View
  | ParamTag_Timestamp
  | ParamTag_UnixTimestamp
  | ParamTag_CreatedAtTimestamp
  | ParamTag_CreatedAtUnixTimestamp
  | ParamTag_RealIP
  | ParamTag_IP
  | ParamTag_WithBoard
  | ParamTag_WithThread
  | ParamTag_WithThreadPosts
  deriving (Generic, Typeable)



data SortOrderBy
  = SortOrderBy_Asc
  | SortOrderBy_Dsc
  | SortOrderBy_Rnd
  | SortOrderBy_None
  deriving (Generic, Typeable)



data OrderBy
  = OrderBy_UserId
  | OrderBy_CreatedAt
  | OrderBy_ModifiedAt
  | OrderBy_ModifiedBy
  | OrderBy_ActivityAt
  | OrderBy_BoardId
  | OrderBy_ThreadId
  | OrderBy_Id
  | OrderBy_None
  deriving (Generic, Typeable)
