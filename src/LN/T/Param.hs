{-# LANGUAGE OverloadedStrings #-}

module LN.T.Param (
  Param (..),
  ParamTag (..),
  SortOrderBy (..),
  OrderBy (..),
) where



import qualified Data.Text           as T
import           Haskell.Api.Helpers
import           LN.T.Prelude
import           LN.T.SharedTypes



default (Text)



data Param
  = Limit                  Int
  | Offset                 Int
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
  | ByUserNick             Text
  | ByUsersNicks           [Text]
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
  deriving (Eq, Ord, Show, Read, Generic, Typeable)



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
  | ParamTag_ByUserNick
  | ParamTag_ByUsersNicks
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
  | ParamTag_WithResource
  deriving (Eq, Ord, Generic, Typeable)



instance QueryParam Param where
  qp (Limit limit)                       = tuple "limit" (T.pack $ show limit)
  qp (Offset offset)                     = tuple "offset" (T.pack $ show offset)
  qp (SortOrder sort_order_by)           = tuple "sort_order" (T.pack $ show sort_order_by)
  qp (Order order_by)                    = tuple "order" (T.pack $ show order_by)
  qp (ByOrganizationId org_id)           = tuple "organization_id" (T.pack $ show org_id)
  qp (ByOrganizationsIds orgs_ids)       = tuple "organizations_ids" (T.pack $ show orgs_ids)
  qp (ByOrganizationName org_name)       = tuple "organization_name" org_name
  qp (ByTeamId team_id)                  = tuple "team_id" (T.pack $ show team_id)
  qp (ByTeamsIds teams_ids)              = tuple "teams_ids" (T.pack $ show teams_ids)
  qp (ByTeamName team_name)              = tuple "team_name" team_name
  qp (ByUserId user_id)                  = tuple "user_id" (T.pack $ show user_id)
  qp (ByUsersIds users_ids)              = tuple "users_ids" (T.pack $ show users_ids)
  qp (ByUserNick nick)                   = tuple "user_nick" (T.pack $ show nick)
  qp (ByUsersNicks nicks)                = tuple "users_nicks" (T.pack $ show nicks)
  qp (ByForumId forum_id)                = tuple "forum_id" (T.pack $ show forum_id)
  qp (ByForumsIds forums_ids)            = tuple "forums_ids" (T.pack $ show forums_ids)
  qp (ByForumName forum_name)            = tuple "forum_name" forum_name
  qp (ByBoardId board_id)                = tuple "board_id" (T.pack $ show board_id)
  qp (ByBoardsIds boards_ids)            = tuple "boards_ids" (T.pack $ show boards_ids)
  qp (ByBoardName board_name)            = tuple "board_name" board_name
  qp (ByThreadId thread_id)              = tuple "thread_id" (T.pack $ show thread_id)
  qp (ByThreadsIds threads_ids)          = tuple "threads_ids" (T.pack $ show threads_ids)
  qp (ByThreadName thread_name)          = tuple "thread_name" thread_name
  qp (ByThreadPostId thread_post_id)     = tuple "thread_post_id" (T.pack $ show thread_post_id)
  qp (ByThreadPostsIds thread_posts_ids) = tuple "thread_posts_ids" (T.pack $ show thread_posts_ids)
  qp (ByThreadPostName thread_post_name) = tuple "thread_post_name" thread_post_name
  qp (ByThreadPostLikeId like_id)        = tuple "thread_post_like_id" (T.pack $ show like_id)
  qp (ByThreadPostLikesIds likes_ids)    = tuple "thread_post_likes_ids" (T.pack $ show likes_ids)
  qp (ByThreadPostStarId star_id)        = tuple "thread_post_star_id" (T.pack $ show star_id)
  qp (ByThreadPostStarsIds stars_ids)    = tuple "thread_post_stars_ids" (T.pack $ show stars_ids)
  qp (ByBucketId bucket_id)              = tuple "bucket_id" (T.pack $ show bucket_id)
  qp (ByResourceId resource_id)          = tuple "resource_id" (T.pack $ show resource_id)
  qp (ByResourcesIds resources_ids)      = tuple "resources_ids" (T.pack $ show resources_ids)
  qp (ByResourceName resource_name)      = tuple "resource_name" resource_name
  qp (ByLeuronId leuron_id)              = tuple "leuron_id" (T.pack $ show leuron_id)
  qp (ByLeuronsIds leurons_ids)          = tuple "leurons_ids" (T.pack $ show leurons_ids)
  qp (ByPmId pm_id)                      = tuple "pm_id" (T.pack $ show pm_id)
  qp (ByPmsIds pms_ids)                  = tuple "pms_ids" (T.pack $ show pms_ids)
  qp (ByReminderId reminder_id)          = tuple "reminder_id" (T.pack $ show reminder_id)
  qp (ByReminderFolderId reminder_folder)= tuple "reminder_folder_id" (T.pack $ show reminder_folder)
  qp (ByParentId parent_id)              = tuple "parent_id" (T.pack $ show parent_id)
  qp (ByParentsIds parents_ids)          = tuple "parents_ids" (T.pack $ show parents_ids)
  qp (ByParentName parent_name)          = tuple "parent_name" parent_name
  qp (BySelf b)                          = tuple "self" (T.pack $ show b)
  qp (Timestamp ts)                      = tuple "ts" (T.pack $ show ts)
  qp (UnixTimestamp unix_ts)             = tuple "unix_ts" (T.pack $ show unix_ts)
  qp (CreatedAtTimestamp created_at)     = tuple "created_at_ts" (T.pack $ show created_at)
  qp (CreatedAtUnixTimestamp created_at) = tuple "created_at_unix_ts" (T.pack $ show created_at)
  qp (RealIP real_ip)                    = tuple "real_ip" real_ip
  qp (IP ip)                             = tuple "ip" ip
  qp (WithOrganization b)                = tuple "with_organization" (T.pack $ show b)
  qp (WithForum b)                       = tuple "with_forum" (T.pack $ show b)
  qp (WithBoard b)                       = tuple "with_board" (T.pack $ show b)
  qp (WithThread b)                      = tuple "with_thread" (T.pack $ show b)
  qp (WithResource b)                    = tuple "with_resource" (T.pack $ show b)



data SortOrderBy
  = SortOrderBy_Asc
  | SortOrderBy_Dsc
  | SortOrderBy_Rnd
  | SortOrderBy_None
  deriving (Eq, Ord, Generic, Typeable)



instance Show SortOrderBy where
  show SortOrderBy_Asc  = "asc"
  show SortOrderBy_Dsc  = "dsc"
  show SortOrderBy_Rnd  = "rnd"
  show SortOrderBy_None = "none"



instance Read SortOrderBy where
  readsPrec _ "asc" = [(SortOrderBy_Asc, "")]
  readsPrec _ "dsc" = [(SortOrderBy_Dsc, "")]
  readsPrec _ "rnd" = [(SortOrderBy_Rnd, "")]
  readsPrec _ _     = [(SortOrderBy_None, "")]



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
  deriving (Eq, Ord, Generic, Typeable)



instance Show OrderBy where
  show OrderBy_UserId     = "user_id"
  show OrderBy_CreatedAt  = "created_at"
  show OrderBy_ModifiedAt = "modified_at"
  show OrderBy_ModifiedBy = "modified_by"
  show OrderBy_ActivityAt = "activity_at"
  show OrderBy_OrganizationId = "org_id"
  show OrderBy_TeamId     = "team_id"
  show OrderBy_ForumId    = "forum_id"
  show OrderBy_BoardId    = "board_id"
  show OrderBy_ThreadId   = "thread_id"
  show OrderBy_Id         = "id"
  show OrderBy_None       = "none"



instance Read OrderBy where
  readsPrec _ "user_id"     = [(OrderBy_UserId, "")]
  readsPrec _ "created_at"  = [(OrderBy_CreatedAt, "")]
  readsPrec _ "modified_at" = [(OrderBy_ModifiedAt, "")]
  readsPrec _ "modified_by" = [(OrderBy_ModifiedBy, "")]
  readsPrec _ "activity_at" = [(OrderBy_ActivityAt, "")]
  readsPrec _ "org_id"      = [(OrderBy_OrganizationId, "")]
  readsPrec _ "team_id"     = [(OrderBy_TeamId, "")]
  readsPrec _ "forum_id"    = [(OrderBy_ForumId, "")]
  readsPrec _ "board_id"    = [(OrderBy_BoardId, "")]
  readsPrec _ "thread_id"   = [(OrderBy_ThreadId, "")]
  readsPrec _ "id"          = [(OrderBy_Id, "")]
  readsPrec _ _             = [(OrderBy_None, "")]



instance Show ParamTag where
  show ParamTag_Limit                  = "limit"
  show ParamTag_Offset                 = "offset"
  show ParamTag_SortOrder              = "sort_order"
  show ParamTag_Order                  = "order"
  show ParamTag_ByOrganizationId       = "organization_id"
  show ParamTag_ByOrganizationsIds     = "organizations_ids"
  show ParamTag_ByOrganizationName     = "organization_name"
  show ParamTag_ByTeamId               = "team_id"
  show ParamTag_ByTeamsIds             = "teams_ids"
  show ParamTag_ByTeamName             = "team_name"
  show ParamTag_ByUserId               = "user_id"
  show ParamTag_ByUsersIds             = "users_ids"
  show ParamTag_ByUserNick             = "user_nick"
  show ParamTag_ByUsersNicks           = "users_nicks"
  show ParamTag_ByForumId              = "forum_id"
  show ParamTag_ByForumsIds            = "forums_ids"
  show ParamTag_ByForumName            = "forum_name"
  show ParamTag_ByBoardId              = "board_id"
  show ParamTag_ByBoardsIds            = "boards_ids"
  show ParamTag_ByBoardName            = "board_name"
  show ParamTag_ByThreadId             = "thread_id"
  show ParamTag_ByThreadsIds           = "threads_ids"
  show ParamTag_ByThreadName           = "thread_name"
  show ParamTag_ByThreadPostId         = "thread_post_id"
  show ParamTag_ByThreadPostsIds       = "thread_posts_ids"
  show ParamTag_ByThreadPostName       = "thread_post_name"
  show ParamTag_ByThreadPostLikeId     = "thread_post_like_id"
  show ParamTag_ByThreadPostLikesIds   = "thread_post_likes_ids"
  show ParamTag_ByThreadPostStarId     = "thread_post_star_id"
  show ParamTag_ByThreadPostStarsIds   = "thread_post_stars_ids"
  show ParamTag_ByBucketId             = "bucket_id"
  show ParamTag_ByResourceId           = "resource_id"
  show ParamTag_ByResourcesIds         = "resources_ids"
  show ParamTag_ByResourceName         = "resource_name"
  show ParamTag_ByLeuronId             = "leuron_id"
  show ParamTag_ByLeuronsIds           = "leurons_ids"
  show ParamTag_ByPmId                 = "pm_id"
  show ParamTag_ByPmsIds               = "pms_ids"
  show ParamTag_ByReminderId           = "reminder_id"
  show ParamTag_ByReminderFolderId     = "reminder_folder_id"
  show ParamTag_ByParentId             = "parent_id"
  show ParamTag_ByParentsIds           = "parents_ids"
  show ParamTag_ByParentName           = "parent_name"
  show ParamTag_BySelf                 = "self"
  show ParamTag_Timestamp              = "ts"
  show ParamTag_UnixTimestamp          = "unix_ts"
  show ParamTag_CreatedAtTimestamp     = "created_at_ts"
  show ParamTag_CreatedAtUnixTimestamp = "created_at_unix_ts"
  show ParamTag_RealIP                 = "real_ip"
  show ParamTag_IP                     = "ip"
  show ParamTag_WithOrganization       = "with_organization"
  show ParamTag_WithForum              = "with_forum"
  show ParamTag_WithBoard              = "with_board"
  show ParamTag_WithThread             = "with_thread"
  show ParamTag_WithResource           = "with_resource"
