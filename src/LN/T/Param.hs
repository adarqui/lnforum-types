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
  | ByOrganizationId       Int64
  | ByOrganizationsIds     [Int64]
  | ByOrganizationName     Text
  | ByTeamId               Int64
  | ByTeamsIds             [Int64]
  | ByTeamName             Text
  | ByTeamMemberId         Int64
  | ByTeamMembersIds       [Int64]
  | ByUserId               Int64
  | ByUsersIds             [Int64]
  | ByUserName             Text
  | ByUsersNames           [Text]
  | ByGlobalGroupId        Int64
  | ByGlobalGroupsIds      [Int64]
  | ByGroupId              Int64
  | ByGroupsIds            [Int64]
  | ByGroupMemberId        Int64
  | ByGroupMembersIds      [Int64]
  | ByForumId              Int64
  | ByForumsIds            [Int64]
  | ByForumName            Text
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
  | ByThreadPostStarId     Int64
  | ByThreadPostStarsIds   [Int64]
  | ByBucketId             Int64
  | ByResourceId           Int64
  | ByResourcesIds         [Int64]
  | ByResourceName         Text
  | ByLeuronId             Int64
  | ByLeuronsIds           [Int64]
  | ByPmId                 Int64
  | ByPmsIds               [Int64]
  | ByReminderId           Int64
  | ByReminderFolderId     Int64
  | ByParentId             Int64
  | ByParentsIds           [Int64]
  | ByParentName           Text
  | BySelf                 Bool
  | Timestamp              UTCTime
  | UnixTimestamp          Int64
  | CreatedAtTimestamp     UTCTime
  | CreatedAtUnixTimestamp Int64
  | RealIP                 Text
  | IP                     Text
  | WithOrganization       Bool
  | WithForum              Bool
  | WithBoard              Bool
  | WithThread             Bool
  | WithResource           Bool
  deriving (Generic, Typeable)



data ParamTag
  = ParamTag_Limit
  | ParamTag_Offset
  | ParamTag_SortOrder
  | ParamTag_Order
  | ParamTag_ByOrganizationId
  | ParamTag_ByOrganizationsIds
  | ParamTag_ByOrganizationName
  | ParamTag_ByTeamId
  | ParamTag_ByTeamsIds
  | ParamTag_ByTeamName
  | ParamTag_ByTeamMemberId
  | ParamTag_ByTeamMembersIds
  | ParamTag_ByUserId
  | ParamTag_ByUsersIds
  | ParamTag_ByUserName
  | ParamTag_ByUsersNames
  | ParamTag_ByGlobalGroupId
  | ParamTag_ByGlobalGroupsIds
  | ParamTag_ByGroupId
  | ParamTag_ByGroupsIds
  | ParamTag_ByGroupMemberId
  | ParamTag_ByGroupMembersIds
  | ParamTag_ByForumId
  | ParamTag_ByForumsIds
  | ParamTag_ByForumName
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
  | ParamTag_ByThreadPostStarId
  | ParamTag_ByThreadPostStarsIds
  | ParamTag_ByBucketId
  | ParamTag_ByResourceId
  | ParamTag_ByResourcesIds
  | ParamTag_ByResourceName
  | ParamTag_ByLeuronId
  | ParamTag_ByLeuronsIds
  | ParamTag_ByPmId
  | ParamTag_ByPmsIds
  | ParamTag_ByReminderId
  | ParamTag_ByReminderFolderId
  | ParamTag_ByParentId
  | ParamTag_ByParentsIds
  | ParamTag_ByParentName
  | ParamTag_BySelf
  | ParamTag_Timestamp
  | ParamTag_UnixTimestamp
  | ParamTag_CreatedAtTimestamp
  | ParamTag_CreatedAtUnixTimestamp
  | ParamTag_RealIP
  | ParamTag_IP
  | ParamTag_WithOrganization
  | ParamTag_WithForum
  | ParamTag_WithBoard
  | ParamTag_WithThread
  | ParamTag_WithThreadPosts
  | ParamTag_WithResource
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
  | OrderBy_OrganizationId
  | OrderBy_TeamId
  | OrderBy_ForumId
  | OrderBy_BoardId
  | OrderBy_ThreadId
  | OrderBy_Id
  | OrderBy_None
  deriving (Generic, Typeable)
