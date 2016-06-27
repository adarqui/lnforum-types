{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}

module LN.T.Internal.JSON where




import Data.Aeson
import Data.Text   (Text)

import LN.T.Internal.Types
import Data.Int

instance ToJSON ACL where
  toJSON (ACL_Grant x0) = object $
    [ "tag" .= "ACL_Grant"
    , "contents" .= toJSON x0
    ]
  toJSON (ACL_Deny ) = object $
    [ "tag" .= "ACL_Deny"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON ACL where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "ACL_Grant" -> do
        x0 <- o .: "contents"
        ACL_Grant <$> parseJSON x0

      "ACL_Deny" -> do
        return ACL_Deny

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ApiRequest where
  toJSON ApiRequest{..} = object $
    [ "tag" .= "ApiRequest"
    , "comment" .= apiRequestComment
    , "guard" .= apiRequestGuard
    ]


instance FromJSON ApiRequest where
  parseJSON (Object o) = do
    apiRequestComment <- o .: "comment"
    apiRequestGuard <- o .: "guard"
    return $ ApiRequest {
      apiRequestComment = apiRequestComment,
      apiRequestGuard = apiRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ApiResponse where
  toJSON ApiResponse{..} = object $
    [ "tag" .= "ApiResponse"
    , "id" .= apiResponseId
    , "user_id" .= apiResponseUserId
    , "key" .= apiResponseKey
    , "comment" .= apiResponseComment
    , "guard" .= apiResponseGuard
    , "created_at" .= apiResponseCreatedAt
    , "modified_at" .= apiResponseModifiedAt
    ]


instance FromJSON ApiResponse where
  parseJSON (Object o) = do
    apiResponseId <- o .: "id"
    apiResponseUserId <- o .: "user_id"
    apiResponseKey <- o .: "key"
    apiResponseComment <- o .: "comment"
    apiResponseGuard <- o .: "guard"
    apiResponseCreatedAt <- o .: "created_at"
    apiResponseModifiedAt <- o .: "modified_at"
    return $ ApiResponse {
      apiResponseId = apiResponseId,
      apiResponseUserId = apiResponseUserId,
      apiResponseKey = apiResponseKey,
      apiResponseComment = apiResponseComment,
      apiResponseGuard = apiResponseGuard,
      apiResponseCreatedAt = apiResponseCreatedAt,
      apiResponseModifiedAt = apiResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ApiResponses where
  toJSON ApiResponses{..} = object $
    [ "tag" .= "ApiResponses"
    , "api_responses" .= apiResponses
    ]


instance FromJSON ApiResponses where
  parseJSON (Object o) = do
    apiResponses <- o .: "api_responses"
    return $ ApiResponses {
      apiResponses = apiResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BoardRequest where
  toJSON BoardRequest{..} = object $
    [ "tag" .= "BoardRequest"
    , "display_name" .= boardRequestDisplayName
    , "description" .= boardRequestDescription
    , "is_anonymous" .= boardRequestIsAnonymous
    , "can_create_sub_boards" .= boardRequestCanCreateSubBoards
    , "can_create_threads" .= boardRequestCanCreateThreads
    , "suggested_tags" .= boardRequestSuggestedTags
    , "icon" .= boardRequestIcon
    , "tags" .= boardRequestTags
    , "guard" .= boardRequestGuard
    ]


instance FromJSON BoardRequest where
  parseJSON (Object o) = do
    boardRequestDisplayName <- o .: "display_name"
    boardRequestDescription <- o .: "description"
    boardRequestIsAnonymous <- o .: "is_anonymous"
    boardRequestCanCreateSubBoards <- o .: "can_create_sub_boards"
    boardRequestCanCreateThreads <- o .: "can_create_threads"
    boardRequestSuggestedTags <- o .: "suggested_tags"
    boardRequestIcon <- o .: "icon"
    boardRequestTags <- o .: "tags"
    boardRequestGuard <- o .: "guard"
    return $ BoardRequest {
      boardRequestDisplayName = boardRequestDisplayName,
      boardRequestDescription = boardRequestDescription,
      boardRequestIsAnonymous = boardRequestIsAnonymous,
      boardRequestCanCreateSubBoards = boardRequestCanCreateSubBoards,
      boardRequestCanCreateThreads = boardRequestCanCreateThreads,
      boardRequestSuggestedTags = boardRequestSuggestedTags,
      boardRequestIcon = boardRequestIcon,
      boardRequestTags = boardRequestTags,
      boardRequestGuard = boardRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BoardResponse where
  toJSON BoardResponse{..} = object $
    [ "tag" .= "BoardResponse"
    , "id" .= boardResponseId
    , "user_id" .= boardResponseUserId
    , "org_id" .= boardResponseOrgId
    , "forum_id" .= boardResponseForumId
    , "parent_id" .= boardResponseParentId
    , "name" .= boardResponseName
    , "display_name" .= boardResponseDisplayName
    , "description" .= boardResponseDescription
    , "is_anonymous" .= boardResponseIsAnonymous
    , "can_create_sub_boards" .= boardResponseCanCreateSubBoards
    , "can_create_threads" .= boardResponseCanCreateThreads
    , "suggested_tags" .= boardResponseSuggestedTags
    , "icon" .= boardResponseIcon
    , "tags" .= boardResponseTags
    , "active" .= boardResponseActive
    , "guard" .= boardResponseGuard
    , "created_at" .= boardResponseCreatedAt
    , "modified_by" .= boardResponseModifiedBy
    , "modified_at" .= boardResponseModifiedAt
    , "activity_at" .= boardResponseActivityAt
    ]


instance FromJSON BoardResponse where
  parseJSON (Object o) = do
    boardResponseId <- o .: "id"
    boardResponseUserId <- o .: "user_id"
    boardResponseOrgId <- o .: "org_id"
    boardResponseForumId <- o .: "forum_id"
    boardResponseParentId <- o .: "parent_id"
    boardResponseName <- o .: "name"
    boardResponseDisplayName <- o .: "display_name"
    boardResponseDescription <- o .: "description"
    boardResponseIsAnonymous <- o .: "is_anonymous"
    boardResponseCanCreateSubBoards <- o .: "can_create_sub_boards"
    boardResponseCanCreateThreads <- o .: "can_create_threads"
    boardResponseSuggestedTags <- o .: "suggested_tags"
    boardResponseIcon <- o .: "icon"
    boardResponseTags <- o .: "tags"
    boardResponseActive <- o .: "active"
    boardResponseGuard <- o .: "guard"
    boardResponseCreatedAt <- o .: "created_at"
    boardResponseModifiedBy <- o .: "modified_by"
    boardResponseModifiedAt <- o .: "modified_at"
    boardResponseActivityAt <- o .: "activity_at"
    return $ BoardResponse {
      boardResponseId = boardResponseId,
      boardResponseUserId = boardResponseUserId,
      boardResponseOrgId = boardResponseOrgId,
      boardResponseForumId = boardResponseForumId,
      boardResponseParentId = boardResponseParentId,
      boardResponseName = boardResponseName,
      boardResponseDisplayName = boardResponseDisplayName,
      boardResponseDescription = boardResponseDescription,
      boardResponseIsAnonymous = boardResponseIsAnonymous,
      boardResponseCanCreateSubBoards = boardResponseCanCreateSubBoards,
      boardResponseCanCreateThreads = boardResponseCanCreateThreads,
      boardResponseSuggestedTags = boardResponseSuggestedTags,
      boardResponseIcon = boardResponseIcon,
      boardResponseTags = boardResponseTags,
      boardResponseActive = boardResponseActive,
      boardResponseGuard = boardResponseGuard,
      boardResponseCreatedAt = boardResponseCreatedAt,
      boardResponseModifiedBy = boardResponseModifiedBy,
      boardResponseModifiedAt = boardResponseModifiedAt,
      boardResponseActivityAt = boardResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BoardResponses where
  toJSON BoardResponses{..} = object $
    [ "tag" .= "BoardResponses"
    , "board_responses" .= boardResponses
    ]


instance FromJSON BoardResponses where
  parseJSON (Object o) = do
    boardResponses <- o .: "board_responses"
    return $ BoardResponses {
      boardResponses = boardResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BoardStatResponse where
  toJSON BoardStatResponse{..} = object $
    [ "tag" .= "BoardStatResponse"
    , "board_id" .= boardStatResponseBoardId
    , "threads" .= boardStatResponseThreads
    , "thread_posts" .= boardStatResponseThreadPosts
    , "views" .= boardStatResponseViews
    ]


instance FromJSON BoardStatResponse where
  parseJSON (Object o) = do
    boardStatResponseBoardId <- o .: "board_id"
    boardStatResponseThreads <- o .: "threads"
    boardStatResponseThreadPosts <- o .: "thread_posts"
    boardStatResponseViews <- o .: "views"
    return $ BoardStatResponse {
      boardStatResponseBoardId = boardStatResponseBoardId,
      boardStatResponseThreads = boardStatResponseThreads,
      boardStatResponseThreadPosts = boardStatResponseThreadPosts,
      boardStatResponseViews = boardStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BoardStatResponses where
  toJSON BoardStatResponses{..} = object $
    [ "tag" .= "BoardStatResponses"
    , "board_stat_responses" .= boardStatResponses
    ]


instance FromJSON BoardStatResponses where
  parseJSON (Object o) = do
    boardStatResponses <- o .: "board_stat_responses"
    return $ BoardStatResponses {
      boardStatResponses = boardStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BucketRequest where
  toJSON BucketRequest{..} = object $
    [ "tag" .= "BucketRequest"
    , "display_name" .= bucketRequestDisplayName
    , "description" .= bucketRequestDescription
    , "score_lo" .= bucketRequestScoreLo
    , "score_hi" .= bucketRequestScoreHi
    , "leurons" .= bucketRequestLeurons
    , "resources" .= bucketRequestResources
    , "categories" .= bucketRequestCategories
    , "filters" .= bucketRequestFilters
    , "guard" .= bucketRequestGuard
    ]


instance FromJSON BucketRequest where
  parseJSON (Object o) = do
    bucketRequestDisplayName <- o .: "display_name"
    bucketRequestDescription <- o .: "description"
    bucketRequestScoreLo <- o .: "score_lo"
    bucketRequestScoreHi <- o .: "score_hi"
    bucketRequestLeurons <- o .: "leurons"
    bucketRequestResources <- o .: "resources"
    bucketRequestCategories <- o .: "categories"
    bucketRequestFilters <- o .: "filters"
    bucketRequestGuard <- o .: "guard"
    return $ BucketRequest {
      bucketRequestDisplayName = bucketRequestDisplayName,
      bucketRequestDescription = bucketRequestDescription,
      bucketRequestScoreLo = bucketRequestScoreLo,
      bucketRequestScoreHi = bucketRequestScoreHi,
      bucketRequestLeurons = bucketRequestLeurons,
      bucketRequestResources = bucketRequestResources,
      bucketRequestCategories = bucketRequestCategories,
      bucketRequestFilters = bucketRequestFilters,
      bucketRequestGuard = bucketRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BucketResponse where
  toJSON BucketResponse{..} = object $
    [ "tag" .= "BucketResponse"
    , "id" .= bucketResponseId
    , "user_id" .= bucketResponseUserId
    , "name" .= bucketResponseName
    , "display_name" .= bucketResponseDisplayName
    , "description" .= bucketResponseDescription
    , "score_lo" .= bucketResponseScoreLo
    , "score_hi" .= bucketResponseScoreHi
    , "leurons" .= bucketResponseLeurons
    , "resources" .= bucketResponseResources
    , "categories" .= bucketResponseCategories
    , "filters" .= bucketResponseFilters
    , "active" .= bucketResponseActive
    , "guard" .= bucketResponseGuard
    , "created_at" .= bucketResponseCreatedAt
    , "modified_at" .= bucketResponseModifiedAt
    , "activity_at" .= bucketResponseActivityAt
    ]


instance FromJSON BucketResponse where
  parseJSON (Object o) = do
    bucketResponseId <- o .: "id"
    bucketResponseUserId <- o .: "user_id"
    bucketResponseName <- o .: "name"
    bucketResponseDisplayName <- o .: "display_name"
    bucketResponseDescription <- o .: "description"
    bucketResponseScoreLo <- o .: "score_lo"
    bucketResponseScoreHi <- o .: "score_hi"
    bucketResponseLeurons <- o .: "leurons"
    bucketResponseResources <- o .: "resources"
    bucketResponseCategories <- o .: "categories"
    bucketResponseFilters <- o .: "filters"
    bucketResponseActive <- o .: "active"
    bucketResponseGuard <- o .: "guard"
    bucketResponseCreatedAt <- o .: "created_at"
    bucketResponseModifiedAt <- o .: "modified_at"
    bucketResponseActivityAt <- o .: "activity_at"
    return $ BucketResponse {
      bucketResponseId = bucketResponseId,
      bucketResponseUserId = bucketResponseUserId,
      bucketResponseName = bucketResponseName,
      bucketResponseDisplayName = bucketResponseDisplayName,
      bucketResponseDescription = bucketResponseDescription,
      bucketResponseScoreLo = bucketResponseScoreLo,
      bucketResponseScoreHi = bucketResponseScoreHi,
      bucketResponseLeurons = bucketResponseLeurons,
      bucketResponseResources = bucketResponseResources,
      bucketResponseCategories = bucketResponseCategories,
      bucketResponseFilters = bucketResponseFilters,
      bucketResponseActive = bucketResponseActive,
      bucketResponseGuard = bucketResponseGuard,
      bucketResponseCreatedAt = bucketResponseCreatedAt,
      bucketResponseModifiedAt = bucketResponseModifiedAt,
      bucketResponseActivityAt = bucketResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BucketResponses where
  toJSON BucketResponses{..} = object $
    [ "tag" .= "BucketResponses"
    , "bucket_responses" .= bucketResponses
    ]


instance FromJSON BucketResponses where
  parseJSON (Object o) = do
    bucketResponses <- o .: "bucket_responses"
    return $ BucketResponses {
      bucketResponses = bucketResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON CountResponse where
  toJSON CountResponse{..} = object $
    [ "tag" .= "CountResponse"
    , "id" .= countResponseId
    , "n" .= countResponseN
    ]


instance FromJSON CountResponse where
  parseJSON (Object o) = do
    countResponseId <- o .: "id"
    countResponseN <- o .: "n"
    return $ CountResponse {
      countResponseId = countResponseId,
      countResponseN = countResponseN
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON CountResponses where
  toJSON CountResponses{..} = object $
    [ "tag" .= "CountResponses"
    , "count_responses" .= countResponses
    ]


instance FromJSON CountResponses where
  parseJSON (Object o) = do
    countResponses <- o .: "count_responses"
    return $ CountResponses {
      countResponses = countResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON EmptyRequest where
  toJSON EmptyRequest{..} = object $
    [ "tag" .= "EmptyRequest"
    , "value" .= emptyRequestValue
    ]


instance FromJSON EmptyRequest where
  parseJSON (Object o) = do
    emptyRequestValue <- o .: "value"
    return $ EmptyRequest {
      emptyRequestValue = emptyRequestValue
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON EmptyResponse where
  toJSON EmptyResponse{..} = object $
    [ "tag" .= "EmptyResponse"
    , "id" .= emptyResponseId
    , "user_id" .= emptyResponseUserId
    , "value" .= emptyResponseValue
    , "created_at" .= emptyResponseCreatedAt
    , "modified_at" .= emptyResponseModifiedAt
    ]


instance FromJSON EmptyResponse where
  parseJSON (Object o) = do
    emptyResponseId <- o .: "id"
    emptyResponseUserId <- o .: "user_id"
    emptyResponseValue <- o .: "value"
    emptyResponseCreatedAt <- o .: "created_at"
    emptyResponseModifiedAt <- o .: "modified_at"
    return $ EmptyResponse {
      emptyResponseId = emptyResponseId,
      emptyResponseUserId = emptyResponseUserId,
      emptyResponseValue = emptyResponseValue,
      emptyResponseCreatedAt = emptyResponseCreatedAt,
      emptyResponseModifiedAt = emptyResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON EmptyResponses where
  toJSON EmptyResponses{..} = object $
    [ "tag" .= "EmptyResponses"
    , "empty_responses" .= emptyResponses
    ]


instance FromJSON EmptyResponses where
  parseJSON (Object o) = do
    emptyResponses <- o .: "empty_responses"
    return $ EmptyResponses {
      emptyResponses = emptyResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Ent where
  toJSON (Ent_Organization ) = object $
    [ "tag" .= "Ent_Organization"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Team ) = object $
    [ "tag" .= "Ent_Team"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_TeamMember ) = object $
    [ "tag" .= "Ent_TeamMember"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_GlobalGroup ) = object $
    [ "tag" .= "Ent_GlobalGroup"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Group ) = object $
    [ "tag" .= "Ent_Group"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_GroupMember ) = object $
    [ "tag" .= "Ent_GroupMember"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_User ) = object $
    [ "tag" .= "Ent_User"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_UserSanitized ) = object $
    [ "tag" .= "Ent_UserSanitized"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Forum ) = object $
    [ "tag" .= "Ent_Forum"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Board ) = object $
    [ "tag" .= "Ent_Board"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Thread ) = object $
    [ "tag" .= "Ent_Thread"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_ThreadPost ) = object $
    [ "tag" .= "Ent_ThreadPost"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Blog ) = object $
    [ "tag" .= "Ent_Blog"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_BlogPost ) = object $
    [ "tag" .= "Ent_BlogPost"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_BlogComment ) = object $
    [ "tag" .= "Ent_BlogComment"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Resource ) = object $
    [ "tag" .= "Ent_Resource"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Leuron ) = object $
    [ "tag" .= "Ent_Leuron"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Comment ) = object $
    [ "tag" .= "Ent_Comment"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Api ) = object $
    [ "tag" .= "Ent_Api"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Like ) = object $
    [ "tag" .= "Ent_Like"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Star ) = object $
    [ "tag" .= "Ent_Star"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_None ) = object $
    [ "tag" .= "Ent_None"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON Ent where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "Ent_Organization" -> do
        return Ent_Organization

      "Ent_Team" -> do
        return Ent_Team

      "Ent_TeamMember" -> do
        return Ent_TeamMember

      "Ent_GlobalGroup" -> do
        return Ent_GlobalGroup

      "Ent_Group" -> do
        return Ent_Group

      "Ent_GroupMember" -> do
        return Ent_GroupMember

      "Ent_User" -> do
        return Ent_User

      "Ent_UserSanitized" -> do
        return Ent_UserSanitized

      "Ent_Forum" -> do
        return Ent_Forum

      "Ent_Board" -> do
        return Ent_Board

      "Ent_Thread" -> do
        return Ent_Thread

      "Ent_ThreadPost" -> do
        return Ent_ThreadPost

      "Ent_Blog" -> do
        return Ent_Blog

      "Ent_BlogPost" -> do
        return Ent_BlogPost

      "Ent_BlogComment" -> do
        return Ent_BlogComment

      "Ent_Resource" -> do
        return Ent_Resource

      "Ent_Leuron" -> do
        return Ent_Leuron

      "Ent_Comment" -> do
        return Ent_Comment

      "Ent_Api" -> do
        return Ent_Api

      "Ent_Like" -> do
        return Ent_Like

      "Ent_Star" -> do
        return Ent_Star

      "Ent_None" -> do
        return Ent_None

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ApplicationError where
  toJSON (Error_Empty ) = object $
    [ "tag" .= "Error_Empty"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_NotFound ) = object $
    [ "tag" .= "Error_NotFound"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_PermissionDenied ) = object $
    [ "tag" .= "Error_PermissionDenied"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_Visibility ) = object $
    [ "tag" .= "Error_Visibility"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_Membership ) = object $
    [ "tag" .= "Error_Membership"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_Unexpected ) = object $
    [ "tag" .= "Error_Unexpected"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON ApplicationError where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "Error_Empty" -> do
        return Error_Empty

      "Error_NotFound" -> do
        return Error_NotFound

      "Error_PermissionDenied" -> do
        return Error_PermissionDenied

      "Error_Visibility" -> do
        return Error_Visibility

      "Error_Membership" -> do
        return Error_Membership

      "Error_Unexpected" -> do
        return Error_Unexpected

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ForumRequest where
  toJSON ForumRequest{..} = object $
    [ "tag" .= "ForumRequest"
    , "display_name" .= forumRequestDisplayName
    , "description" .= forumRequestDescription
    , "threads_per_board" .= forumRequestThreadsPerBoard
    , "thread_posts_per_thread" .= forumRequestThreadPostsPerThread
    , "recent_threads_limit" .= forumRequestRecentThreadsLimit
    , "recent_posts_limit" .= forumRequestRecentPostsLimit
    , "motw_limit" .= forumRequestMotwLimit
    , "icon" .= forumRequestIcon
    , "tags" .= forumRequestTags
    , "visibility" .= forumRequestVisibility
    , "guard" .= forumRequestGuard
    ]


instance FromJSON ForumRequest where
  parseJSON (Object o) = do
    forumRequestDisplayName <- o .: "display_name"
    forumRequestDescription <- o .: "description"
    forumRequestThreadsPerBoard <- o .: "threads_per_board"
    forumRequestThreadPostsPerThread <- o .: "thread_posts_per_thread"
    forumRequestRecentThreadsLimit <- o .: "recent_threads_limit"
    forumRequestRecentPostsLimit <- o .: "recent_posts_limit"
    forumRequestMotwLimit <- o .: "motw_limit"
    forumRequestIcon <- o .: "icon"
    forumRequestTags <- o .: "tags"
    forumRequestVisibility <- o .: "visibility"
    forumRequestGuard <- o .: "guard"
    return $ ForumRequest {
      forumRequestDisplayName = forumRequestDisplayName,
      forumRequestDescription = forumRequestDescription,
      forumRequestThreadsPerBoard = forumRequestThreadsPerBoard,
      forumRequestThreadPostsPerThread = forumRequestThreadPostsPerThread,
      forumRequestRecentThreadsLimit = forumRequestRecentThreadsLimit,
      forumRequestRecentPostsLimit = forumRequestRecentPostsLimit,
      forumRequestMotwLimit = forumRequestMotwLimit,
      forumRequestIcon = forumRequestIcon,
      forumRequestTags = forumRequestTags,
      forumRequestVisibility = forumRequestVisibility,
      forumRequestGuard = forumRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ForumResponse where
  toJSON ForumResponse{..} = object $
    [ "tag" .= "ForumResponse"
    , "id" .= forumResponseId
    , "user_id" .= forumResponseUserId
    , "org_id" .= forumResponseOrgId
    , "name" .= forumResponseName
    , "display_name" .= forumResponseDisplayName
    , "description" .= forumResponseDescription
    , "threads_per_board" .= forumResponseThreadsPerBoard
    , "thread_posts_per_thread" .= forumResponseThreadPostsPerThread
    , "recent_threads_limit" .= forumResponseRecentThreadsLimit
    , "recent_posts_limit" .= forumResponseRecentPostsLimit
    , "motw_limit" .= forumResponseMotwLimit
    , "icon" .= forumResponseIcon
    , "tags" .= forumResponseTags
    , "visibility" .= forumResponseVisibility
    , "active" .= forumResponseActive
    , "guard" .= forumResponseGuard
    , "created_at" .= forumResponseCreatedAt
    , "modified_by" .= forumResponseModifiedBy
    , "modified_at" .= forumResponseModifiedAt
    , "activity_at" .= forumResponseActivityAt
    ]


instance FromJSON ForumResponse where
  parseJSON (Object o) = do
    forumResponseId <- o .: "id"
    forumResponseUserId <- o .: "user_id"
    forumResponseOrgId <- o .: "org_id"
    forumResponseName <- o .: "name"
    forumResponseDisplayName <- o .: "display_name"
    forumResponseDescription <- o .: "description"
    forumResponseThreadsPerBoard <- o .: "threads_per_board"
    forumResponseThreadPostsPerThread <- o .: "thread_posts_per_thread"
    forumResponseRecentThreadsLimit <- o .: "recent_threads_limit"
    forumResponseRecentPostsLimit <- o .: "recent_posts_limit"
    forumResponseMotwLimit <- o .: "motw_limit"
    forumResponseIcon <- o .: "icon"
    forumResponseTags <- o .: "tags"
    forumResponseVisibility <- o .: "visibility"
    forumResponseActive <- o .: "active"
    forumResponseGuard <- o .: "guard"
    forumResponseCreatedAt <- o .: "created_at"
    forumResponseModifiedBy <- o .: "modified_by"
    forumResponseModifiedAt <- o .: "modified_at"
    forumResponseActivityAt <- o .: "activity_at"
    return $ ForumResponse {
      forumResponseId = forumResponseId,
      forumResponseUserId = forumResponseUserId,
      forumResponseOrgId = forumResponseOrgId,
      forumResponseName = forumResponseName,
      forumResponseDisplayName = forumResponseDisplayName,
      forumResponseDescription = forumResponseDescription,
      forumResponseThreadsPerBoard = forumResponseThreadsPerBoard,
      forumResponseThreadPostsPerThread = forumResponseThreadPostsPerThread,
      forumResponseRecentThreadsLimit = forumResponseRecentThreadsLimit,
      forumResponseRecentPostsLimit = forumResponseRecentPostsLimit,
      forumResponseMotwLimit = forumResponseMotwLimit,
      forumResponseIcon = forumResponseIcon,
      forumResponseTags = forumResponseTags,
      forumResponseVisibility = forumResponseVisibility,
      forumResponseActive = forumResponseActive,
      forumResponseGuard = forumResponseGuard,
      forumResponseCreatedAt = forumResponseCreatedAt,
      forumResponseModifiedBy = forumResponseModifiedBy,
      forumResponseModifiedAt = forumResponseModifiedAt,
      forumResponseActivityAt = forumResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ForumResponses where
  toJSON ForumResponses{..} = object $
    [ "tag" .= "ForumResponses"
    , "forum_responses" .= forumResponses
    ]


instance FromJSON ForumResponses where
  parseJSON (Object o) = do
    forumResponses <- o .: "forum_responses"
    return $ ForumResponses {
      forumResponses = forumResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ForumStatResponse where
  toJSON ForumStatResponse{..} = object $
    [ "tag" .= "ForumStatResponse"
    , "forum_id" .= forumStatResponseForumId
    , "boards" .= forumStatResponseBoards
    , "threads" .= forumStatResponseThreads
    , "thread_posts" .= forumStatResponseThreadPosts
    , "views" .= forumStatResponseViews
    ]


instance FromJSON ForumStatResponse where
  parseJSON (Object o) = do
    forumStatResponseForumId <- o .: "forum_id"
    forumStatResponseBoards <- o .: "boards"
    forumStatResponseThreads <- o .: "threads"
    forumStatResponseThreadPosts <- o .: "thread_posts"
    forumStatResponseViews <- o .: "views"
    return $ ForumStatResponse {
      forumStatResponseForumId = forumStatResponseForumId,
      forumStatResponseBoards = forumStatResponseBoards,
      forumStatResponseThreads = forumStatResponseThreads,
      forumStatResponseThreadPosts = forumStatResponseThreadPosts,
      forumStatResponseViews = forumStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ForumStatResponses where
  toJSON ForumStatResponses{..} = object $
    [ "tag" .= "ForumStatResponses"
    , "forum_stat_responses" .= forumStatResponses
    ]


instance FromJSON ForumStatResponses where
  parseJSON (Object o) = do
    forumStatResponses <- o .: "forum_stat_responses"
    return $ ForumStatResponses {
      forumStatResponses = forumStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GlobalGroupRequest where
  toJSON GlobalGroupRequest{..} = object $
    [ "tag" .= "GlobalGroupRequest"
    , "display_name" .= globalGroupRequestDisplayName
    , "description" .= globalGroupRequestDescription
    , "membership" .= globalGroupRequestMembership
    , "icon" .= globalGroupRequestIcon
    , "tags" .= globalGroupRequestTags
    , "visibility" .= globalGroupRequestVisibility
    , "guard" .= globalGroupRequestGuard
    ]


instance FromJSON GlobalGroupRequest where
  parseJSON (Object o) = do
    globalGroupRequestDisplayName <- o .: "display_name"
    globalGroupRequestDescription <- o .: "description"
    globalGroupRequestMembership <- o .: "membership"
    globalGroupRequestIcon <- o .: "icon"
    globalGroupRequestTags <- o .: "tags"
    globalGroupRequestVisibility <- o .: "visibility"
    globalGroupRequestGuard <- o .: "guard"
    return $ GlobalGroupRequest {
      globalGroupRequestDisplayName = globalGroupRequestDisplayName,
      globalGroupRequestDescription = globalGroupRequestDescription,
      globalGroupRequestMembership = globalGroupRequestMembership,
      globalGroupRequestIcon = globalGroupRequestIcon,
      globalGroupRequestTags = globalGroupRequestTags,
      globalGroupRequestVisibility = globalGroupRequestVisibility,
      globalGroupRequestGuard = globalGroupRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GlobalGroupResponse where
  toJSON GlobalGroupResponse{..} = object $
    [ "tag" .= "GlobalGroupResponse"
    , "id" .= globalGroupResponseId
    , "user_id" .= globalGroupResponseUserId
    , "name" .= globalGroupResponseName
    , "display_name" .= globalGroupResponseDisplayName
    , "description" .= globalGroupResponseDescription
    , "membership" .= globalGroupResponseMembership
    , "icon" .= globalGroupResponseIcon
    , "tags" .= globalGroupResponseTags
    , "visibility" .= globalGroupResponseVisibility
    , "active" .= globalGroupResponseActive
    , "guard" .= globalGroupResponseGuard
    , "created_at" .= globalGroupResponseCreatedAt
    , "modified_by" .= globalGroupResponseModifiedBy
    , "modified_at" .= globalGroupResponseModifiedAt
    , "activity_at" .= globalGroupResponseActivityAt
    ]


instance FromJSON GlobalGroupResponse where
  parseJSON (Object o) = do
    globalGroupResponseId <- o .: "id"
    globalGroupResponseUserId <- o .: "user_id"
    globalGroupResponseName <- o .: "name"
    globalGroupResponseDisplayName <- o .: "display_name"
    globalGroupResponseDescription <- o .: "description"
    globalGroupResponseMembership <- o .: "membership"
    globalGroupResponseIcon <- o .: "icon"
    globalGroupResponseTags <- o .: "tags"
    globalGroupResponseVisibility <- o .: "visibility"
    globalGroupResponseActive <- o .: "active"
    globalGroupResponseGuard <- o .: "guard"
    globalGroupResponseCreatedAt <- o .: "created_at"
    globalGroupResponseModifiedBy <- o .: "modified_by"
    globalGroupResponseModifiedAt <- o .: "modified_at"
    globalGroupResponseActivityAt <- o .: "activity_at"
    return $ GlobalGroupResponse {
      globalGroupResponseId = globalGroupResponseId,
      globalGroupResponseUserId = globalGroupResponseUserId,
      globalGroupResponseName = globalGroupResponseName,
      globalGroupResponseDisplayName = globalGroupResponseDisplayName,
      globalGroupResponseDescription = globalGroupResponseDescription,
      globalGroupResponseMembership = globalGroupResponseMembership,
      globalGroupResponseIcon = globalGroupResponseIcon,
      globalGroupResponseTags = globalGroupResponseTags,
      globalGroupResponseVisibility = globalGroupResponseVisibility,
      globalGroupResponseActive = globalGroupResponseActive,
      globalGroupResponseGuard = globalGroupResponseGuard,
      globalGroupResponseCreatedAt = globalGroupResponseCreatedAt,
      globalGroupResponseModifiedBy = globalGroupResponseModifiedBy,
      globalGroupResponseModifiedAt = globalGroupResponseModifiedAt,
      globalGroupResponseActivityAt = globalGroupResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GlobalGroupResponses where
  toJSON GlobalGroupResponses{..} = object $
    [ "tag" .= "GlobalGroupResponses"
    , "global_group_responses" .= globalGroupResponses
    ]


instance FromJSON GlobalGroupResponses where
  parseJSON (Object o) = do
    globalGroupResponses <- o .: "global_group_responses"
    return $ GlobalGroupResponses {
      globalGroupResponses = globalGroupResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GlobalGroupStatResponse where
  toJSON GlobalGroupStatResponse{..} = object $
    [ "tag" .= "GlobalGroupStatResponse"
    , "groups" .= globalGroupStatResponseGroups
    ]


instance FromJSON GlobalGroupStatResponse where
  parseJSON (Object o) = do
    globalGroupStatResponseGroups <- o .: "groups"
    return $ GlobalGroupStatResponse {
      globalGroupStatResponseGroups = globalGroupStatResponseGroups
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GlobalGroupStatResponses where
  toJSON GlobalGroupStatResponses{..} = object $
    [ "tag" .= "GlobalGroupStatResponses"
    , "global_group_stat_responses" .= globalGroupStatResponses
    ]


instance FromJSON GlobalGroupStatResponses where
  parseJSON (Object o) = do
    globalGroupStatResponses <- o .: "global_group_stat_responses"
    return $ GlobalGroupStatResponses {
      globalGroupStatResponses = globalGroupStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupRequest where
  toJSON GroupRequest{..} = object $
    [ "tag" .= "GroupRequest"
    , "guard" .= groupRequestGuard
    ]


instance FromJSON GroupRequest where
  parseJSON (Object o) = do
    groupRequestGuard <- o .: "guard"
    return $ GroupRequest {
      groupRequestGuard = groupRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupResponse where
  toJSON GroupResponse{..} = object $
    [ "tag" .= "GroupResponse"
    , "id" .= groupResponseId
    , "user_id" .= groupResponseUserId
    , "global_group_id" .= groupResponseGlobalGroupId
    , "organization_id" .= groupResponseOrganizationId
    , "active" .= groupResponseActive
    , "guard" .= groupResponseGuard
    , "created_at" .= groupResponseCreatedAt
    , "modified_by" .= groupResponseModifiedBy
    , "modified_at" .= groupResponseModifiedAt
    , "activity_at" .= groupResponseActivityAt
    ]


instance FromJSON GroupResponse where
  parseJSON (Object o) = do
    groupResponseId <- o .: "id"
    groupResponseUserId <- o .: "user_id"
    groupResponseGlobalGroupId <- o .: "global_group_id"
    groupResponseOrganizationId <- o .: "organization_id"
    groupResponseActive <- o .: "active"
    groupResponseGuard <- o .: "guard"
    groupResponseCreatedAt <- o .: "created_at"
    groupResponseModifiedBy <- o .: "modified_by"
    groupResponseModifiedAt <- o .: "modified_at"
    groupResponseActivityAt <- o .: "activity_at"
    return $ GroupResponse {
      groupResponseId = groupResponseId,
      groupResponseUserId = groupResponseUserId,
      groupResponseGlobalGroupId = groupResponseGlobalGroupId,
      groupResponseOrganizationId = groupResponseOrganizationId,
      groupResponseActive = groupResponseActive,
      groupResponseGuard = groupResponseGuard,
      groupResponseCreatedAt = groupResponseCreatedAt,
      groupResponseModifiedBy = groupResponseModifiedBy,
      groupResponseModifiedAt = groupResponseModifiedAt,
      groupResponseActivityAt = groupResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupResponses where
  toJSON GroupResponses{..} = object $
    [ "tag" .= "GroupResponses"
    , "group_responses" .= groupResponses
    ]


instance FromJSON GroupResponses where
  parseJSON (Object o) = do
    groupResponses <- o .: "group_responses"
    return $ GroupResponses {
      groupResponses = groupResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupStatResponse where
  toJSON GroupStatResponse{..} = object $
    [ "tag" .= "GroupStatResponse"
    , "members" .= groupStatResponseMembers
    ]


instance FromJSON GroupStatResponse where
  parseJSON (Object o) = do
    groupStatResponseMembers <- o .: "members"
    return $ GroupStatResponse {
      groupStatResponseMembers = groupStatResponseMembers
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupStatResponses where
  toJSON GroupStatResponses{..} = object $
    [ "tag" .= "GroupStatResponses"
    , "group_stat_responses" .= groupStatResponses
    ]


instance FromJSON GroupStatResponses where
  parseJSON (Object o) = do
    groupStatResponses <- o .: "group_stat_responses"
    return $ GroupStatResponses {
      groupStatResponses = groupStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupMemberRequest where
  toJSON GroupMemberRequest{..} = object $
    [ "tag" .= "GroupMemberRequest"
    , "guard" .= groupMemberRequestGuard
    ]


instance FromJSON GroupMemberRequest where
  parseJSON (Object o) = do
    groupMemberRequestGuard <- o .: "guard"
    return $ GroupMemberRequest {
      groupMemberRequestGuard = groupMemberRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupMemberResponse where
  toJSON GroupMemberResponse{..} = object $
    [ "tag" .= "GroupMemberResponse"
    , "id" .= groupMemberResponseId
    , "user_id" .= groupMemberResponseUserId
    , "global_group_id" .= groupMemberResponseGlobalGroupId
    , "created_at" .= groupMemberResponseCreatedAt
    , "modified_by" .= groupMemberResponseModifiedBy
    , "modified_at" .= groupMemberResponseModifiedAt
    , "activity_at" .= groupMemberResponseActivityAt
    ]


instance FromJSON GroupMemberResponse where
  parseJSON (Object o) = do
    groupMemberResponseId <- o .: "id"
    groupMemberResponseUserId <- o .: "user_id"
    groupMemberResponseGlobalGroupId <- o .: "global_group_id"
    groupMemberResponseCreatedAt <- o .: "created_at"
    groupMemberResponseModifiedBy <- o .: "modified_by"
    groupMemberResponseModifiedAt <- o .: "modified_at"
    groupMemberResponseActivityAt <- o .: "activity_at"
    return $ GroupMemberResponse {
      groupMemberResponseId = groupMemberResponseId,
      groupMemberResponseUserId = groupMemberResponseUserId,
      groupMemberResponseGlobalGroupId = groupMemberResponseGlobalGroupId,
      groupMemberResponseCreatedAt = groupMemberResponseCreatedAt,
      groupMemberResponseModifiedBy = groupMemberResponseModifiedBy,
      groupMemberResponseModifiedAt = groupMemberResponseModifiedAt,
      groupMemberResponseActivityAt = groupMemberResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupMemberResponses where
  toJSON GroupMemberResponses{..} = object $
    [ "tag" .= "GroupMemberResponses"
    , "group_member_responses" .= groupMemberResponses
    ]


instance FromJSON GroupMemberResponses where
  parseJSON (Object o) = do
    groupMemberResponses <- o .: "group_member_responses"
    return $ GroupMemberResponses {
      groupMemberResponses = groupMemberResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupMemberStatResponse where
  toJSON (GroupMemberStatResponse ) = object $
    [ "tag" .= "GroupMemberStatResponse"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON GroupMemberStatResponse where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "GroupMemberStatResponse" -> do
        return GroupMemberStatResponse

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupMemberStatResponses where
  toJSON (GroupMemberStatResponses ) = object $
    [ "tag" .= "GroupMemberStatResponses"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON GroupMemberStatResponses where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "GroupMemberStatResponses" -> do
        return GroupMemberStatResponses

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronRequest where
  toJSON LeuronRequest{..} = object $
    [ "tag" .= "LeuronRequest"
    , "data" .= leuronRequestData
    , "title" .= leuronRequestTitle
    , "description" .= leuronRequestDescription
    , "section" .= leuronRequestSection
    , "page" .= leuronRequestPage
    , "examples" .= leuronRequestExamples
    , "strengths" .= leuronRequestStrengths
    , "categories" .= leuronRequestCategories
    , "splits" .= leuronRequestSplits
    , "substitutions" .= leuronRequestSubstitutions
    , "tags" .= leuronRequestTags
    , "style" .= leuronRequestStyle
    , "guard" .= leuronRequestGuard
    ]


instance FromJSON LeuronRequest where
  parseJSON (Object o) = do
    leuronRequestData <- o .: "data"
    leuronRequestTitle <- o .: "title"
    leuronRequestDescription <- o .: "description"
    leuronRequestSection <- o .: "section"
    leuronRequestPage <- o .: "page"
    leuronRequestExamples <- o .: "examples"
    leuronRequestStrengths <- o .: "strengths"
    leuronRequestCategories <- o .: "categories"
    leuronRequestSplits <- o .: "splits"
    leuronRequestSubstitutions <- o .: "substitutions"
    leuronRequestTags <- o .: "tags"
    leuronRequestStyle <- o .: "style"
    leuronRequestGuard <- o .: "guard"
    return $ LeuronRequest {
      leuronRequestData = leuronRequestData,
      leuronRequestTitle = leuronRequestTitle,
      leuronRequestDescription = leuronRequestDescription,
      leuronRequestSection = leuronRequestSection,
      leuronRequestPage = leuronRequestPage,
      leuronRequestExamples = leuronRequestExamples,
      leuronRequestStrengths = leuronRequestStrengths,
      leuronRequestCategories = leuronRequestCategories,
      leuronRequestSplits = leuronRequestSplits,
      leuronRequestSubstitutions = leuronRequestSubstitutions,
      leuronRequestTags = leuronRequestTags,
      leuronRequestStyle = leuronRequestStyle,
      leuronRequestGuard = leuronRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronResponse where
  toJSON LeuronResponse{..} = object $
    [ "tag" .= "LeuronResponse"
    , "id" .= leuronResponseId
    , "user_id" .= leuronResponseUserId
    , "resource_id" .= leuronResponseResourceId
    , "data" .= leuronResponseData
    , "title" .= leuronResponseTitle
    , "description" .= leuronResponseDescription
    , "section" .= leuronResponseSection
    , "page" .= leuronResponsePage
    , "examples" .= leuronResponseExamples
    , "strengths" .= leuronResponseStrengths
    , "categories" .= leuronResponseCategories
    , "splits" .= leuronResponseSplits
    , "substitutions" .= leuronResponseSubstitutions
    , "tags" .= leuronResponseTags
    , "style" .= leuronResponseStyle
    , "active" .= leuronResponseActive
    , "guard" .= leuronResponseGuard
    , "created_at" .= leuronResponseCreatedAt
    , "modified_at" .= leuronResponseModifiedAt
    , "activity_at" .= leuronResponseActivityAt
    ]


instance FromJSON LeuronResponse where
  parseJSON (Object o) = do
    leuronResponseId <- o .: "id"
    leuronResponseUserId <- o .: "user_id"
    leuronResponseResourceId <- o .: "resource_id"
    leuronResponseData <- o .: "data"
    leuronResponseTitle <- o .: "title"
    leuronResponseDescription <- o .: "description"
    leuronResponseSection <- o .: "section"
    leuronResponsePage <- o .: "page"
    leuronResponseExamples <- o .: "examples"
    leuronResponseStrengths <- o .: "strengths"
    leuronResponseCategories <- o .: "categories"
    leuronResponseSplits <- o .: "splits"
    leuronResponseSubstitutions <- o .: "substitutions"
    leuronResponseTags <- o .: "tags"
    leuronResponseStyle <- o .: "style"
    leuronResponseActive <- o .: "active"
    leuronResponseGuard <- o .: "guard"
    leuronResponseCreatedAt <- o .: "created_at"
    leuronResponseModifiedAt <- o .: "modified_at"
    leuronResponseActivityAt <- o .: "activity_at"
    return $ LeuronResponse {
      leuronResponseId = leuronResponseId,
      leuronResponseUserId = leuronResponseUserId,
      leuronResponseResourceId = leuronResponseResourceId,
      leuronResponseData = leuronResponseData,
      leuronResponseTitle = leuronResponseTitle,
      leuronResponseDescription = leuronResponseDescription,
      leuronResponseSection = leuronResponseSection,
      leuronResponsePage = leuronResponsePage,
      leuronResponseExamples = leuronResponseExamples,
      leuronResponseStrengths = leuronResponseStrengths,
      leuronResponseCategories = leuronResponseCategories,
      leuronResponseSplits = leuronResponseSplits,
      leuronResponseSubstitutions = leuronResponseSubstitutions,
      leuronResponseTags = leuronResponseTags,
      leuronResponseStyle = leuronResponseStyle,
      leuronResponseActive = leuronResponseActive,
      leuronResponseGuard = leuronResponseGuard,
      leuronResponseCreatedAt = leuronResponseCreatedAt,
      leuronResponseModifiedAt = leuronResponseModifiedAt,
      leuronResponseActivityAt = leuronResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronResponses where
  toJSON LeuronResponses{..} = object $
    [ "tag" .= "LeuronResponses"
    , "leuron_responses" .= leuronResponses
    ]


instance FromJSON LeuronResponses where
  parseJSON (Object o) = do
    leuronResponses <- o .: "leuron_responses"
    return $ LeuronResponses {
      leuronResponses = leuronResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronStatResponse where
  toJSON LeuronStatResponse{..} = object $
    [ "tag" .= "LeuronStatResponse"
    , "leuron_id" .= leuronStatResponseLeuronId
    , "likes" .= leuronStatResponseLikes
    , "neutral" .= leuronStatResponseNeutral
    , "dislikes" .= leuronStatResponseDislikes
    , "stars" .= leuronStatResponseStars
    , "views" .= leuronStatResponseViews
    ]


instance FromJSON LeuronStatResponse where
  parseJSON (Object o) = do
    leuronStatResponseLeuronId <- o .: "leuron_id"
    leuronStatResponseLikes <- o .: "likes"
    leuronStatResponseNeutral <- o .: "neutral"
    leuronStatResponseDislikes <- o .: "dislikes"
    leuronStatResponseStars <- o .: "stars"
    leuronStatResponseViews <- o .: "views"
    return $ LeuronStatResponse {
      leuronStatResponseLeuronId = leuronStatResponseLeuronId,
      leuronStatResponseLikes = leuronStatResponseLikes,
      leuronStatResponseNeutral = leuronStatResponseNeutral,
      leuronStatResponseDislikes = leuronStatResponseDislikes,
      leuronStatResponseStars = leuronStatResponseStars,
      leuronStatResponseViews = leuronStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronStatResponses where
  toJSON LeuronStatResponses{..} = object $
    [ "tag" .= "LeuronStatResponses"
    , "leuron_stat_responses" .= leuronStatResponses
    ]


instance FromJSON LeuronStatResponses where
  parseJSON (Object o) = do
    leuronStatResponses <- o .: "leuron_stat_responses"
    return $ LeuronStatResponses {
      leuronStatResponses = leuronStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronTrainingSummary where
  toJSON (LTS_View ) = object $
    [ "tag" .= "LTS_View"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_Skip ) = object $
    [ "tag" .= "LTS_Skip"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_Know ) = object $
    [ "tag" .= "LTS_Know"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_DontKnow ) = object $
    [ "tag" .= "LTS_DontKnow"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_DontUnderstand ) = object $
    [ "tag" .= "LTS_DontUnderstand"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_DontCare ) = object $
    [ "tag" .= "LTS_DontCare"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_Protest ) = object $
    [ "tag" .= "LTS_Protest"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON LeuronTrainingSummary where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "LTS_View" -> do
        return LTS_View

      "LTS_Skip" -> do
        return LTS_Skip

      "LTS_Know" -> do
        return LTS_Know

      "LTS_DontKnow" -> do
        return LTS_DontKnow

      "LTS_DontUnderstand" -> do
        return LTS_DontUnderstand

      "LTS_DontCare" -> do
        return LTS_DontCare

      "LTS_Protest" -> do
        return LTS_Protest

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronTrainingRequest where
  toJSON LeuronTrainingRequest{..} = object $
    [ "tag" .= "LeuronTrainingRequest"
    , "summary" .= leuronTrainingRequestSummary
    , "guard" .= leuronTrainingRequestGuard
    ]


instance FromJSON LeuronTrainingRequest where
  parseJSON (Object o) = do
    leuronTrainingRequestSummary <- o .: "summary"
    leuronTrainingRequestGuard <- o .: "guard"
    return $ LeuronTrainingRequest {
      leuronTrainingRequestSummary = leuronTrainingRequestSummary,
      leuronTrainingRequestGuard = leuronTrainingRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronTrainingResponse where
  toJSON LeuronTrainingResponse{..} = object $
    [ "tag" .= "LeuronTrainingResponse"
    , "id" .= leuronTrainingResponseId
    , "user_id" .= leuronTrainingResponseUserId
    , "leuron_id" .= leuronTrainingResponseLeuronId
    , "summary" .= leuronTrainingResponseSummary
    , "guard" .= leuronTrainingResponseGuard
    , "created_at" .= leuronTrainingResponseCreatedAt
    , "modified_at" .= leuronTrainingResponseModifiedAt
    ]


instance FromJSON LeuronTrainingResponse where
  parseJSON (Object o) = do
    leuronTrainingResponseId <- o .: "id"
    leuronTrainingResponseUserId <- o .: "user_id"
    leuronTrainingResponseLeuronId <- o .: "leuron_id"
    leuronTrainingResponseSummary <- o .: "summary"
    leuronTrainingResponseGuard <- o .: "guard"
    leuronTrainingResponseCreatedAt <- o .: "created_at"
    leuronTrainingResponseModifiedAt <- o .: "modified_at"
    return $ LeuronTrainingResponse {
      leuronTrainingResponseId = leuronTrainingResponseId,
      leuronTrainingResponseUserId = leuronTrainingResponseUserId,
      leuronTrainingResponseLeuronId = leuronTrainingResponseLeuronId,
      leuronTrainingResponseSummary = leuronTrainingResponseSummary,
      leuronTrainingResponseGuard = leuronTrainingResponseGuard,
      leuronTrainingResponseCreatedAt = leuronTrainingResponseCreatedAt,
      leuronTrainingResponseModifiedAt = leuronTrainingResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronTrainingResponses where
  toJSON LeuronTrainingResponses{..} = object $
    [ "tag" .= "LeuronTrainingResponses"
    , "leuron_training_responses" .= leuronTrainingResponses
    ]


instance FromJSON LeuronTrainingResponses where
  parseJSON (Object o) = do
    leuronTrainingResponses <- o .: "leuron_training_responses"
    return $ LeuronTrainingResponses {
      leuronTrainingResponses = leuronTrainingResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronTrainingStatResponse where
  toJSON LeuronTrainingStatResponse{..} = object $
    [ "tag" .= "LeuronTrainingStatResponse"
    , "leuron_training_id" .= leuronTrainingStatResponseLeuronTrainingId
    ]


instance FromJSON LeuronTrainingStatResponse where
  parseJSON (Object o) = do
    leuronTrainingStatResponseLeuronTrainingId <- o .: "leuron_training_id"
    return $ LeuronTrainingStatResponse {
      leuronTrainingStatResponseLeuronTrainingId = leuronTrainingStatResponseLeuronTrainingId
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronTrainingStatResponses where
  toJSON LeuronTrainingStatResponses{..} = object $
    [ "tag" .= "LeuronTrainingStatResponses"
    , "leuron_training_stat_responses" .= leuronTrainingStatResponses
    ]


instance FromJSON LeuronTrainingStatResponses where
  parseJSON (Object o) = do
    leuronTrainingStatResponses <- o .: "leuron_training_stat_responses"
    return $ LeuronTrainingStatResponses {
      leuronTrainingStatResponses = leuronTrainingStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LikeOpt where
  toJSON (Like ) = object $
    [ "tag" .= "Like"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Neutral ) = object $
    [ "tag" .= "Neutral"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Dislike ) = object $
    [ "tag" .= "Dislike"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON LikeOpt where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "Like" -> do
        return Like

      "Neutral" -> do
        return Neutral

      "Dislike" -> do
        return Dislike

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LikeRequest where
  toJSON LikeRequest{..} = object $
    [ "tag" .= "LikeRequest"
    , "opt" .= likeRequestOpt
    , "reason" .= likeRequestReason
    , "guard" .= likeRequestGuard
    ]


instance FromJSON LikeRequest where
  parseJSON (Object o) = do
    likeRequestOpt <- o .: "opt"
    likeRequestReason <- o .: "reason"
    likeRequestGuard <- o .: "guard"
    return $ LikeRequest {
      likeRequestOpt = likeRequestOpt,
      likeRequestReason = likeRequestReason,
      likeRequestGuard = likeRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LikeResponse where
  toJSON LikeResponse{..} = object $
    [ "tag" .= "LikeResponse"
    , "id" .= likeResponseId
    , "ent" .= likeResponseEnt
    , "ent_id" .= likeResponseEntId
    , "user_id" .= likeResponseUserId
    , "opt" .= likeResponseOpt
    , "score" .= likeResponseScore
    , "reason" .= likeResponseReason
    , "active" .= likeResponseActive
    , "guard" .= likeResponseGuard
    , "created_at" .= likeResponseCreatedAt
    , "modified_at" .= likeResponseModifiedAt
    ]


instance FromJSON LikeResponse where
  parseJSON (Object o) = do
    likeResponseId <- o .: "id"
    likeResponseEnt <- o .: "ent"
    likeResponseEntId <- o .: "ent_id"
    likeResponseUserId <- o .: "user_id"
    likeResponseOpt <- o .: "opt"
    likeResponseScore <- o .: "score"
    likeResponseReason <- o .: "reason"
    likeResponseActive <- o .: "active"
    likeResponseGuard <- o .: "guard"
    likeResponseCreatedAt <- o .: "created_at"
    likeResponseModifiedAt <- o .: "modified_at"
    return $ LikeResponse {
      likeResponseId = likeResponseId,
      likeResponseEnt = likeResponseEnt,
      likeResponseEntId = likeResponseEntId,
      likeResponseUserId = likeResponseUserId,
      likeResponseOpt = likeResponseOpt,
      likeResponseScore = likeResponseScore,
      likeResponseReason = likeResponseReason,
      likeResponseActive = likeResponseActive,
      likeResponseGuard = likeResponseGuard,
      likeResponseCreatedAt = likeResponseCreatedAt,
      likeResponseModifiedAt = likeResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LikeResponses where
  toJSON LikeResponses{..} = object $
    [ "tag" .= "LikeResponses"
    , "like_responses" .= likeResponses
    ]


instance FromJSON LikeResponses where
  parseJSON (Object o) = do
    likeResponses <- o .: "like_responses"
    return $ LikeResponses {
      likeResponses = likeResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LikeStatResponse where
  toJSON LikeStatResponse{..} = object $
    [ "tag" .= "LikeStatResponse"
    , "ent" .= likeStatResponseEnt
    , "ent_id" .= likeStatResponseEntId
    , "score" .= likeStatResponseScore
    , "like" .= likeStatResponseLike
    , "neutral" .= likeStatResponseNeutral
    , "dislike" .= likeStatResponseDislike
    ]


instance FromJSON LikeStatResponse where
  parseJSON (Object o) = do
    likeStatResponseEnt <- o .: "ent"
    likeStatResponseEntId <- o .: "ent_id"
    likeStatResponseScore <- o .: "score"
    likeStatResponseLike <- o .: "like"
    likeStatResponseNeutral <- o .: "neutral"
    likeStatResponseDislike <- o .: "dislike"
    return $ LikeStatResponse {
      likeStatResponseEnt = likeStatResponseEnt,
      likeStatResponseEntId = likeStatResponseEntId,
      likeStatResponseScore = likeStatResponseScore,
      likeStatResponseLike = likeStatResponseLike,
      likeStatResponseNeutral = likeStatResponseNeutral,
      likeStatResponseDislike = likeStatResponseDislike
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LikeStatResponses where
  toJSON LikeStatResponses{..} = object $
    [ "tag" .= "LikeStatResponses"
    , "like_stat_responses" .= likeStatResponses
    ]


instance FromJSON LikeStatResponses where
  parseJSON (Object o) = do
    likeStatResponses <- o .: "like_stat_responses"
    return $ LikeStatResponses {
      likeStatResponses = likeStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronData where
  toJSON (LnFact x0) = object $
    [ "tag" .= "LnFact"
    , "contents" .= toJSON x0
    ]
  toJSON (LnFactList x0) = object $
    [ "tag" .= "LnFactList"
    , "contents" .= toJSON x0
    ]
  toJSON (LnCard x0) = object $
    [ "tag" .= "LnCard"
    , "contents" .= toJSON x0
    ]
  toJSON (LnDCard x0) = object $
    [ "tag" .= "LnDCard"
    , "contents" .= toJSON x0
    ]
  toJSON (LnDCardX x0) = object $
    [ "tag" .= "LnDCardX"
    , "contents" .= toJSON x0
    ]
  toJSON (LnAcronym x0) = object $
    [ "tag" .= "LnAcronym"
    , "contents" .= toJSON x0
    ]
  toJSON (LnSynonym x0) = object $
    [ "tag" .= "LnSynonym"
    , "contents" .= toJSON x0
    ]
  toJSON (LnAntonym x0) = object $
    [ "tag" .= "LnAntonym"
    , "contents" .= toJSON x0
    ]
  toJSON (LnTemplate x0) = object $
    [ "tag" .= "LnTemplate"
    , "contents" .= toJSON x0
    ]
  toJSON (LnImageAssociation x0) = object $
    [ "tag" .= "LnImageAssociation"
    , "contents" .= toJSON x0
    ]
  toJSON (LnLinearDemo x0) = object $
    [ "tag" .= "LnLinearDemo"
    , "contents" .= toJSON x0
    ]
  toJSON (LnTable x0) = object $
    [ "tag" .= "LnTable"
    , "contents" .= toJSON x0
    ]
  toJSON (LnScript x0) = object $
    [ "tag" .= "LnScript"
    , "contents" .= toJSON x0
    ]
  toJSON (LnQA x0) = object $
    [ "tag" .= "LnQA"
    , "contents" .= toJSON x0
    ]
  toJSON (LnExamples ) = object $
    [ "tag" .= "LnExamples"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LnEmpty ) = object $
    [ "tag" .= "LnEmpty"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON LeuronData where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "LnFact" -> do
        x0 <- o .: "contents"
        LnFact <$> parseJSON x0

      "LnFactList" -> do
        x0 <- o .: "contents"
        LnFactList <$> parseJSON x0

      "LnCard" -> do
        x0 <- o .: "contents"
        LnCard <$> parseJSON x0

      "LnDCard" -> do
        x0 <- o .: "contents"
        LnDCard <$> parseJSON x0

      "LnDCardX" -> do
        x0 <- o .: "contents"
        LnDCardX <$> parseJSON x0

      "LnAcronym" -> do
        x0 <- o .: "contents"
        LnAcronym <$> parseJSON x0

      "LnSynonym" -> do
        x0 <- o .: "contents"
        LnSynonym <$> parseJSON x0

      "LnAntonym" -> do
        x0 <- o .: "contents"
        LnAntonym <$> parseJSON x0

      "LnTemplate" -> do
        x0 <- o .: "contents"
        LnTemplate <$> parseJSON x0

      "LnImageAssociation" -> do
        x0 <- o .: "contents"
        LnImageAssociation <$> parseJSON x0

      "LnLinearDemo" -> do
        x0 <- o .: "contents"
        LnLinearDemo <$> parseJSON x0

      "LnTable" -> do
        x0 <- o .: "contents"
        LnTable <$> parseJSON x0

      "LnScript" -> do
        x0 <- o .: "contents"
        LnScript <$> parseJSON x0

      "LnQA" -> do
        x0 <- o .: "contents"
        LnQA <$> parseJSON x0

      "LnExamples" -> do
        return LnExamples

      "LnEmpty" -> do
        return LnEmpty

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TyLeuron where
  toJSON (TyLnFact ) = object $
    [ "tag" .= "TyLnFact"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnFactList ) = object $
    [ "tag" .= "TyLnFactList"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnCard ) = object $
    [ "tag" .= "TyLnCard"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnDCard ) = object $
    [ "tag" .= "TyLnDCard"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnDCardX ) = object $
    [ "tag" .= "TyLnDCardX"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnAcronym ) = object $
    [ "tag" .= "TyLnAcronym"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnSynonym ) = object $
    [ "tag" .= "TyLnSynonym"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnAntonym ) = object $
    [ "tag" .= "TyLnAntonym"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnTemplate ) = object $
    [ "tag" .= "TyLnTemplate"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnImageAssociation ) = object $
    [ "tag" .= "TyLnImageAssociation"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnLinearDemo ) = object $
    [ "tag" .= "TyLnLinearDemo"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnTable ) = object $
    [ "tag" .= "TyLnTable"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnScript ) = object $
    [ "tag" .= "TyLnScript"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnQA ) = object $
    [ "tag" .= "TyLnQA"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnExamples ) = object $
    [ "tag" .= "TyLnExamples"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnEmpty ) = object $
    [ "tag" .= "TyLnEmpty"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON TyLeuron where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "TyLnFact" -> do
        return TyLnFact

      "TyLnFactList" -> do
        return TyLnFactList

      "TyLnCard" -> do
        return TyLnCard

      "TyLnDCard" -> do
        return TyLnDCard

      "TyLnDCardX" -> do
        return TyLnDCardX

      "TyLnAcronym" -> do
        return TyLnAcronym

      "TyLnSynonym" -> do
        return TyLnSynonym

      "TyLnAntonym" -> do
        return TyLnAntonym

      "TyLnTemplate" -> do
        return TyLnTemplate

      "TyLnImageAssociation" -> do
        return TyLnImageAssociation

      "TyLnLinearDemo" -> do
        return TyLnLinearDemo

      "TyLnTable" -> do
        return TyLnTable

      "TyLnScript" -> do
        return TyLnScript

      "TyLnQA" -> do
        return TyLnQA

      "TyLnExamples" -> do
        return TyLnExamples

      "TyLnEmpty" -> do
        return TyLnEmpty

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Fact where
  toJSON Fact{..} = object $
    [ "tag" .= "Fact"
    , "text" .= factText
    ]


instance FromJSON Fact where
  parseJSON (Object o) = do
    factText <- o .: "text"
    return $ Fact {
      factText = factText
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON FactList where
  toJSON FactList{..} = object $
    [ "tag" .= "FactList"
    , "fact" .= factListFact
    , "list" .= factListList
    ]


instance FromJSON FactList where
  parseJSON (Object o) = do
    factListFact <- o .: "fact"
    factListList <- o .: "list"
    return $ FactList {
      factListFact = factListFact,
      factListList = factListList
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Card where
  toJSON Card{..} = object $
    [ "tag" .= "Card"
    , "front" .= cardFront
    , "back" .= cardBack
    ]


instance FromJSON Card where
  parseJSON (Object o) = do
    cardFront <- o .: "front"
    cardBack <- o .: "back"
    return $ Card {
      cardFront = cardFront,
      cardBack = cardBack
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON DCard where
  toJSON DCard{..} = object $
    [ "tag" .= "DCard"
    , "front" .= dcardFront
    , "back" .= dcardBack
    ]


instance FromJSON DCard where
  parseJSON (Object o) = do
    dcardFront <- o .: "front"
    dcardBack <- o .: "back"
    return $ DCard {
      dcardFront = dcardFront,
      dcardBack = dcardBack
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON DCardX where
  toJSON DCardX{..} = object $
    [ "tag" .= "DCardX"
    , "front" .= dcardxFront
    , "back" .= dcardxBack
    ]


instance FromJSON DCardX where
  parseJSON (Object o) = do
    dcardxFront <- o .: "front"
    dcardxBack <- o .: "back"
    return $ DCardX {
      dcardxFront = dcardxFront,
      dcardxBack = dcardxBack
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Acronym where
  toJSON Acronym{..} = object $
    [ "tag" .= "Acronym"
    , "abbreviation" .= acronymAbbreviation
    , "meaning" .= acronymMeaning
    ]


instance FromJSON Acronym where
  parseJSON (Object o) = do
    acronymAbbreviation <- o .: "abbreviation"
    acronymMeaning <- o .: "meaning"
    return $ Acronym {
      acronymAbbreviation = acronymAbbreviation,
      acronymMeaning = acronymMeaning
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Synonym where
  toJSON Synonym{..} = object $
    [ "tag" .= "Synonym"
    , "a" .= synonymA
    , "b" .= synonymB
    ]


instance FromJSON Synonym where
  parseJSON (Object o) = do
    synonymA <- o .: "a"
    synonymB <- o .: "b"
    return $ Synonym {
      synonymA = synonymA,
      synonymB = synonymB
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Antonym where
  toJSON Antonym{..} = object $
    [ "tag" .= "Antonym"
    , "a" .= antonymA
    , "b" .= antonymB
    ]


instance FromJSON Antonym where
  parseJSON (Object o) = do
    antonymA <- o .: "a"
    antonymB <- o .: "b"
    return $ Antonym {
      antonymA = antonymA,
      antonymB = antonymB
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Template where
  toJSON Template{..} = object $
    [ "tag" .= "Template"
    , "template" .= template
    , "values" .= templateValues
    ]


instance FromJSON Template where
  parseJSON (Object o) = do
    template <- o .: "template"
    templateValues <- o .: "values"
    return $ Template {
      template = template,
      templateValues = templateValues
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ImageAssociation where
  toJSON ImageAssociation{..} = object $
    [ "tag" .= "ImageAssociation"
    , "image_url" .= imageUrl
    , "assoc_by" .= assocBy
    , "assoc_result" .= assocResult
    ]


instance FromJSON ImageAssociation where
  parseJSON (Object o) = do
    imageUrl <- o .: "image_url"
    assocBy <- o .: "assoc_by"
    assocResult <- o .: "assoc_result"
    return $ ImageAssociation {
      imageUrl = imageUrl,
      assocBy = assocBy,
      assocResult = assocResult
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Script where
  toJSON Script{..} = object $
    [ "tag" .= "Script"
    , "title" .= scriptTitle
    , "desc" .= scriptDesc
    , "url" .= scriptUrl
    ]


instance FromJSON Script where
  parseJSON (Object o) = do
    scriptTitle <- o .: "title"
    scriptDesc <- o .: "desc"
    scriptUrl <- o .: "url"
    return $ Script {
      scriptTitle = scriptTitle,
      scriptDesc = scriptDesc,
      scriptUrl = scriptUrl
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LinearDemo where
  toJSON LinearDemo{..} = object $
    [ "tag" .= "LinearDemo"
    , "label" .= linearDemoLabel
    , "content" .= linearDemoContent
    ]


instance FromJSON LinearDemo where
  parseJSON (Object o) = do
    linearDemoLabel <- o .: "label"
    linearDemoContent <- o .: "content"
    return $ LinearDemo {
      linearDemoLabel = linearDemoLabel,
      linearDemoContent = linearDemoContent
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON QA where
  toJSON QA{..} = object $
    [ "tag" .= "QA"
    , "question" .= qaQuestion
    , "answer" .= qaAnswer
    ]


instance FromJSON QA where
  parseJSON (Object o) = do
    qaQuestion <- o .: "question"
    qaAnswer <- o .: "answer"
    return $ QA {
      qaQuestion = qaQuestion,
      qaAnswer = qaAnswer
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Table where
  toJSON Table{..} = object $
    [ "tag" .= "Table"
    , "title" .= tableTitle
    , "columns" .= tableColumns
    , "rows" .= tableRows
    ]


instance FromJSON Table where
  parseJSON (Object o) = do
    tableTitle <- o .: "title"
    tableColumns <- o .: "columns"
    tableRows <- o .: "rows"
    return $ Table {
      tableTitle = tableTitle,
      tableColumns = tableColumns,
      tableRows = tableRows
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Membership where
  toJSON (Membership_InviteOnly ) = object $
    [ "tag" .= "Membership_InviteOnly"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Membership_RequestInvite ) = object $
    [ "tag" .= "Membership_RequestInvite"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Membership_Join ) = object $
    [ "tag" .= "Membership_Join"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Membership_Locked ) = object $
    [ "tag" .= "Membership_Locked"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON Membership where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "Membership_InviteOnly" -> do
        return Membership_InviteOnly

      "Membership_RequestInvite" -> do
        return Membership_RequestInvite

      "Membership_Join" -> do
        return Membership_Join

      "Membership_Locked" -> do
        return Membership_Locked

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON OrganizationRequest where
  toJSON OrganizationRequest{..} = object $
    [ "tag" .= "OrganizationRequest"
    , "display_name" .= organizationRequestDisplayName
    , "description" .= organizationRequestDescription
    , "company" .= organizationRequestCompany
    , "location" .= organizationRequestLocation
    , "email" .= organizationRequestEmail
    , "membership" .= organizationRequestMembership
    , "tags" .= organizationRequestTags
    , "icon" .= organizationRequestIcon
    , "visibility" .= organizationRequestVisibility
    , "guard" .= organizationRequestGuard
    ]


instance FromJSON OrganizationRequest where
  parseJSON (Object o) = do
    organizationRequestDisplayName <- o .: "display_name"
    organizationRequestDescription <- o .: "description"
    organizationRequestCompany <- o .: "company"
    organizationRequestLocation <- o .: "location"
    organizationRequestEmail <- o .: "email"
    organizationRequestMembership <- o .: "membership"
    organizationRequestTags <- o .: "tags"
    organizationRequestIcon <- o .: "icon"
    organizationRequestVisibility <- o .: "visibility"
    organizationRequestGuard <- o .: "guard"
    return $ OrganizationRequest {
      organizationRequestDisplayName = organizationRequestDisplayName,
      organizationRequestDescription = organizationRequestDescription,
      organizationRequestCompany = organizationRequestCompany,
      organizationRequestLocation = organizationRequestLocation,
      organizationRequestEmail = organizationRequestEmail,
      organizationRequestMembership = organizationRequestMembership,
      organizationRequestTags = organizationRequestTags,
      organizationRequestIcon = organizationRequestIcon,
      organizationRequestVisibility = organizationRequestVisibility,
      organizationRequestGuard = organizationRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON OrganizationResponse where
  toJSON OrganizationResponse{..} = object $
    [ "tag" .= "OrganizationResponse"
    , "id" .= organizationResponseId
    , "user_id" .= organizationResponseUserId
    , "name" .= organizationResponseName
    , "display_name" .= organizationResponseDisplayName
    , "description" .= organizationResponseDescription
    , "company" .= organizationResponseCompany
    , "location" .= organizationResponseLocation
    , "email" .= organizationResponseEmail
    , "email_md5" .= organizationResponseEmailMD5
    , "membership" .= organizationResponseMembership
    , "icon" .= organizationResponseIcon
    , "tags" .= organizationResponseTags
    , "visibility" .= organizationResponseVisibility
    , "active" .= organizationResponseActive
    , "guard" .= organizationResponseGuard
    , "created_at" .= organizationResponseCreatedAt
    , "modified_by" .= organizationResponseModifiedBy
    , "modified_at" .= organizationResponseModifiedAt
    , "activity_at" .= organizationResponseActivityAt
    ]


instance FromJSON OrganizationResponse where
  parseJSON (Object o) = do
    organizationResponseId <- o .: "id"
    organizationResponseUserId <- o .: "user_id"
    organizationResponseName <- o .: "name"
    organizationResponseDisplayName <- o .: "display_name"
    organizationResponseDescription <- o .: "description"
    organizationResponseCompany <- o .: "company"
    organizationResponseLocation <- o .: "location"
    organizationResponseEmail <- o .: "email"
    organizationResponseEmailMD5 <- o .: "email_md5"
    organizationResponseMembership <- o .: "membership"
    organizationResponseIcon <- o .: "icon"
    organizationResponseTags <- o .: "tags"
    organizationResponseVisibility <- o .: "visibility"
    organizationResponseActive <- o .: "active"
    organizationResponseGuard <- o .: "guard"
    organizationResponseCreatedAt <- o .: "created_at"
    organizationResponseModifiedBy <- o .: "modified_by"
    organizationResponseModifiedAt <- o .: "modified_at"
    organizationResponseActivityAt <- o .: "activity_at"
    return $ OrganizationResponse {
      organizationResponseId = organizationResponseId,
      organizationResponseUserId = organizationResponseUserId,
      organizationResponseName = organizationResponseName,
      organizationResponseDisplayName = organizationResponseDisplayName,
      organizationResponseDescription = organizationResponseDescription,
      organizationResponseCompany = organizationResponseCompany,
      organizationResponseLocation = organizationResponseLocation,
      organizationResponseEmail = organizationResponseEmail,
      organizationResponseEmailMD5 = organizationResponseEmailMD5,
      organizationResponseMembership = organizationResponseMembership,
      organizationResponseIcon = organizationResponseIcon,
      organizationResponseTags = organizationResponseTags,
      organizationResponseVisibility = organizationResponseVisibility,
      organizationResponseActive = organizationResponseActive,
      organizationResponseGuard = organizationResponseGuard,
      organizationResponseCreatedAt = organizationResponseCreatedAt,
      organizationResponseModifiedBy = organizationResponseModifiedBy,
      organizationResponseModifiedAt = organizationResponseModifiedAt,
      organizationResponseActivityAt = organizationResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON OrganizationResponses where
  toJSON OrganizationResponses{..} = object $
    [ "tag" .= "OrganizationResponses"
    , "organization_responses" .= organizationResponses
    ]


instance FromJSON OrganizationResponses where
  parseJSON (Object o) = do
    organizationResponses <- o .: "organization_responses"
    return $ OrganizationResponses {
      organizationResponses = organizationResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON OrganizationStatResponse where
  toJSON OrganizationStatResponse{..} = object $
    [ "tag" .= "OrganizationStatResponse"
    , "organization_id" .= organizationStatResponseOrganizationId
    , "teams" .= organizationStatResponseTeams
    , "members" .= organizationStatResponseMembers
    , "forums" .= organizationStatResponseForums
    , "boards" .= organizationStatResponseBoards
    , "threads" .= organizationStatResponseThreads
    , "thread_posts" .= organizationStatResponseThreadPosts
    , "views" .= organizationStatResponseViews
    ]


instance FromJSON OrganizationStatResponse where
  parseJSON (Object o) = do
    organizationStatResponseOrganizationId <- o .: "organization_id"
    organizationStatResponseTeams <- o .: "teams"
    organizationStatResponseMembers <- o .: "members"
    organizationStatResponseForums <- o .: "forums"
    organizationStatResponseBoards <- o .: "boards"
    organizationStatResponseThreads <- o .: "threads"
    organizationStatResponseThreadPosts <- o .: "thread_posts"
    organizationStatResponseViews <- o .: "views"
    return $ OrganizationStatResponse {
      organizationStatResponseOrganizationId = organizationStatResponseOrganizationId,
      organizationStatResponseTeams = organizationStatResponseTeams,
      organizationStatResponseMembers = organizationStatResponseMembers,
      organizationStatResponseForums = organizationStatResponseForums,
      organizationStatResponseBoards = organizationStatResponseBoards,
      organizationStatResponseThreads = organizationStatResponseThreads,
      organizationStatResponseThreadPosts = organizationStatResponseThreadPosts,
      organizationStatResponseViews = organizationStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON OrganizationStatResponses where
  toJSON OrganizationStatResponses{..} = object $
    [ "tag" .= "OrganizationStatResponses"
    , "organization_stat_responses" .= organizationStatResponses
    ]


instance FromJSON OrganizationStatResponses where
  parseJSON (Object o) = do
    organizationStatResponses <- o .: "organization_stat_responses"
    return $ OrganizationStatResponses {
      organizationStatResponses = organizationStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Param where
  toJSON (Limit x0) = object $
    [ "tag" .= "Limit"
    , "contents" .= toJSON x0
    ]
  toJSON (Offset x0) = object $
    [ "tag" .= "Offset"
    , "contents" .= toJSON x0
    ]
  toJSON (SortOrder x0) = object $
    [ "tag" .= "SortOrder"
    , "contents" .= toJSON x0
    ]
  toJSON (Order x0) = object $
    [ "tag" .= "Order"
    , "contents" .= toJSON x0
    ]
  toJSON (ByOrganizationId x0) = object $
    [ "tag" .= "ByOrganizationId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByOrganizationsIds x0) = object $
    [ "tag" .= "ByOrganizationsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByOrganizationName x0) = object $
    [ "tag" .= "ByOrganizationName"
    , "contents" .= toJSON x0
    ]
  toJSON (ByTeamId x0) = object $
    [ "tag" .= "ByTeamId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByTeamsIds x0) = object $
    [ "tag" .= "ByTeamsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByTeamName x0) = object $
    [ "tag" .= "ByTeamName"
    , "contents" .= toJSON x0
    ]
  toJSON (ByTeamMemberId x0) = object $
    [ "tag" .= "ByTeamMemberId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByTeamMembersIds x0) = object $
    [ "tag" .= "ByTeamMembersIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByUserId x0) = object $
    [ "tag" .= "ByUserId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByUsersIds x0) = object $
    [ "tag" .= "ByUsersIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByUserNick x0) = object $
    [ "tag" .= "ByUserNick"
    , "contents" .= toJSON x0
    ]
  toJSON (ByUsersNicks x0) = object $
    [ "tag" .= "ByUsersNicks"
    , "contents" .= toJSON x0
    ]
  toJSON (ByGlobalGroupId x0) = object $
    [ "tag" .= "ByGlobalGroupId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByGlobalGroupsIds x0) = object $
    [ "tag" .= "ByGlobalGroupsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByGroupId x0) = object $
    [ "tag" .= "ByGroupId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByGroupsIds x0) = object $
    [ "tag" .= "ByGroupsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByGroupMemberId x0) = object $
    [ "tag" .= "ByGroupMemberId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByGroupMembersIds x0) = object $
    [ "tag" .= "ByGroupMembersIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByForumId x0) = object $
    [ "tag" .= "ByForumId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByForumsIds x0) = object $
    [ "tag" .= "ByForumsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByForumName x0) = object $
    [ "tag" .= "ByForumName"
    , "contents" .= toJSON x0
    ]
  toJSON (ByBoardId x0) = object $
    [ "tag" .= "ByBoardId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByBoardsIds x0) = object $
    [ "tag" .= "ByBoardsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByBoardName x0) = object $
    [ "tag" .= "ByBoardName"
    , "contents" .= toJSON x0
    ]
  toJSON (ByThreadId x0) = object $
    [ "tag" .= "ByThreadId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByThreadsIds x0) = object $
    [ "tag" .= "ByThreadsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByThreadName x0) = object $
    [ "tag" .= "ByThreadName"
    , "contents" .= toJSON x0
    ]
  toJSON (ByThreadPostId x0) = object $
    [ "tag" .= "ByThreadPostId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByThreadPostsIds x0) = object $
    [ "tag" .= "ByThreadPostsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByThreadPostName x0) = object $
    [ "tag" .= "ByThreadPostName"
    , "contents" .= toJSON x0
    ]
  toJSON (ByThreadPostLikeId x0) = object $
    [ "tag" .= "ByThreadPostLikeId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByThreadPostLikesIds x0) = object $
    [ "tag" .= "ByThreadPostLikesIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByThreadPostStarId x0) = object $
    [ "tag" .= "ByThreadPostStarId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByThreadPostStarsIds x0) = object $
    [ "tag" .= "ByThreadPostStarsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByBucketId x0) = object $
    [ "tag" .= "ByBucketId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByResourceId x0) = object $
    [ "tag" .= "ByResourceId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByResourcesIds x0) = object $
    [ "tag" .= "ByResourcesIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByResourceName x0) = object $
    [ "tag" .= "ByResourceName"
    , "contents" .= toJSON x0
    ]
  toJSON (ByLeuronId x0) = object $
    [ "tag" .= "ByLeuronId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByLeuronsIds x0) = object $
    [ "tag" .= "ByLeuronsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByPmId x0) = object $
    [ "tag" .= "ByPmId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByPmsIds x0) = object $
    [ "tag" .= "ByPmsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByReminderId x0) = object $
    [ "tag" .= "ByReminderId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByReminderFolderId x0) = object $
    [ "tag" .= "ByReminderFolderId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByParentId x0) = object $
    [ "tag" .= "ByParentId"
    , "contents" .= toJSON x0
    ]
  toJSON (ByParentsIds x0) = object $
    [ "tag" .= "ByParentsIds"
    , "contents" .= toJSON x0
    ]
  toJSON (ByParentName x0) = object $
    [ "tag" .= "ByParentName"
    , "contents" .= toJSON x0
    ]
  toJSON (BySelf x0) = object $
    [ "tag" .= "BySelf"
    , "contents" .= toJSON x0
    ]
  toJSON (Timestamp x0) = object $
    [ "tag" .= "Timestamp"
    , "contents" .= toJSON x0
    ]
  toJSON (UnixTimestamp x0) = object $
    [ "tag" .= "UnixTimestamp"
    , "contents" .= toJSON x0
    ]
  toJSON (CreatedAtTimestamp x0) = object $
    [ "tag" .= "CreatedAtTimestamp"
    , "contents" .= toJSON x0
    ]
  toJSON (CreatedAtUnixTimestamp x0) = object $
    [ "tag" .= "CreatedAtUnixTimestamp"
    , "contents" .= toJSON x0
    ]
  toJSON (RealIP x0) = object $
    [ "tag" .= "RealIP"
    , "contents" .= toJSON x0
    ]
  toJSON (IP x0) = object $
    [ "tag" .= "IP"
    , "contents" .= toJSON x0
    ]
  toJSON (WithOrganization x0) = object $
    [ "tag" .= "WithOrganization"
    , "contents" .= toJSON x0
    ]
  toJSON (WithForum x0) = object $
    [ "tag" .= "WithForum"
    , "contents" .= toJSON x0
    ]
  toJSON (WithBoard x0) = object $
    [ "tag" .= "WithBoard"
    , "contents" .= toJSON x0
    ]
  toJSON (WithThread x0) = object $
    [ "tag" .= "WithThread"
    , "contents" .= toJSON x0
    ]
  toJSON (WithResource x0) = object $
    [ "tag" .= "WithResource"
    , "contents" .= toJSON x0
    ]


instance FromJSON Param where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "Limit" -> do
        x0 <- o .: "contents"
        Limit <$> parseJSON x0

      "Offset" -> do
        x0 <- o .: "contents"
        Offset <$> parseJSON x0

      "SortOrder" -> do
        x0 <- o .: "contents"
        SortOrder <$> parseJSON x0

      "Order" -> do
        x0 <- o .: "contents"
        Order <$> parseJSON x0

      "ByOrganizationId" -> do
        x0 <- o .: "contents"
        ByOrganizationId <$> parseJSON x0

      "ByOrganizationsIds" -> do
        x0 <- o .: "contents"
        ByOrganizationsIds <$> parseJSON x0

      "ByOrganizationName" -> do
        x0 <- o .: "contents"
        ByOrganizationName <$> parseJSON x0

      "ByTeamId" -> do
        x0 <- o .: "contents"
        ByTeamId <$> parseJSON x0

      "ByTeamsIds" -> do
        x0 <- o .: "contents"
        ByTeamsIds <$> parseJSON x0

      "ByTeamName" -> do
        x0 <- o .: "contents"
        ByTeamName <$> parseJSON x0

      "ByTeamMemberId" -> do
        x0 <- o .: "contents"
        ByTeamMemberId <$> parseJSON x0

      "ByTeamMembersIds" -> do
        x0 <- o .: "contents"
        ByTeamMembersIds <$> parseJSON x0

      "ByUserId" -> do
        x0 <- o .: "contents"
        ByUserId <$> parseJSON x0

      "ByUsersIds" -> do
        x0 <- o .: "contents"
        ByUsersIds <$> parseJSON x0

      "ByUserNick" -> do
        x0 <- o .: "contents"
        ByUserNick <$> parseJSON x0

      "ByUsersNicks" -> do
        x0 <- o .: "contents"
        ByUsersNicks <$> parseJSON x0

      "ByGlobalGroupId" -> do
        x0 <- o .: "contents"
        ByGlobalGroupId <$> parseJSON x0

      "ByGlobalGroupsIds" -> do
        x0 <- o .: "contents"
        ByGlobalGroupsIds <$> parseJSON x0

      "ByGroupId" -> do
        x0 <- o .: "contents"
        ByGroupId <$> parseJSON x0

      "ByGroupsIds" -> do
        x0 <- o .: "contents"
        ByGroupsIds <$> parseJSON x0

      "ByGroupMemberId" -> do
        x0 <- o .: "contents"
        ByGroupMemberId <$> parseJSON x0

      "ByGroupMembersIds" -> do
        x0 <- o .: "contents"
        ByGroupMembersIds <$> parseJSON x0

      "ByForumId" -> do
        x0 <- o .: "contents"
        ByForumId <$> parseJSON x0

      "ByForumsIds" -> do
        x0 <- o .: "contents"
        ByForumsIds <$> parseJSON x0

      "ByForumName" -> do
        x0 <- o .: "contents"
        ByForumName <$> parseJSON x0

      "ByBoardId" -> do
        x0 <- o .: "contents"
        ByBoardId <$> parseJSON x0

      "ByBoardsIds" -> do
        x0 <- o .: "contents"
        ByBoardsIds <$> parseJSON x0

      "ByBoardName" -> do
        x0 <- o .: "contents"
        ByBoardName <$> parseJSON x0

      "ByThreadId" -> do
        x0 <- o .: "contents"
        ByThreadId <$> parseJSON x0

      "ByThreadsIds" -> do
        x0 <- o .: "contents"
        ByThreadsIds <$> parseJSON x0

      "ByThreadName" -> do
        x0 <- o .: "contents"
        ByThreadName <$> parseJSON x0

      "ByThreadPostId" -> do
        x0 <- o .: "contents"
        ByThreadPostId <$> parseJSON x0

      "ByThreadPostsIds" -> do
        x0 <- o .: "contents"
        ByThreadPostsIds <$> parseJSON x0

      "ByThreadPostName" -> do
        x0 <- o .: "contents"
        ByThreadPostName <$> parseJSON x0

      "ByThreadPostLikeId" -> do
        x0 <- o .: "contents"
        ByThreadPostLikeId <$> parseJSON x0

      "ByThreadPostLikesIds" -> do
        x0 <- o .: "contents"
        ByThreadPostLikesIds <$> parseJSON x0

      "ByThreadPostStarId" -> do
        x0 <- o .: "contents"
        ByThreadPostStarId <$> parseJSON x0

      "ByThreadPostStarsIds" -> do
        x0 <- o .: "contents"
        ByThreadPostStarsIds <$> parseJSON x0

      "ByBucketId" -> do
        x0 <- o .: "contents"
        ByBucketId <$> parseJSON x0

      "ByResourceId" -> do
        x0 <- o .: "contents"
        ByResourceId <$> parseJSON x0

      "ByResourcesIds" -> do
        x0 <- o .: "contents"
        ByResourcesIds <$> parseJSON x0

      "ByResourceName" -> do
        x0 <- o .: "contents"
        ByResourceName <$> parseJSON x0

      "ByLeuronId" -> do
        x0 <- o .: "contents"
        ByLeuronId <$> parseJSON x0

      "ByLeuronsIds" -> do
        x0 <- o .: "contents"
        ByLeuronsIds <$> parseJSON x0

      "ByPmId" -> do
        x0 <- o .: "contents"
        ByPmId <$> parseJSON x0

      "ByPmsIds" -> do
        x0 <- o .: "contents"
        ByPmsIds <$> parseJSON x0

      "ByReminderId" -> do
        x0 <- o .: "contents"
        ByReminderId <$> parseJSON x0

      "ByReminderFolderId" -> do
        x0 <- o .: "contents"
        ByReminderFolderId <$> parseJSON x0

      "ByParentId" -> do
        x0 <- o .: "contents"
        ByParentId <$> parseJSON x0

      "ByParentsIds" -> do
        x0 <- o .: "contents"
        ByParentsIds <$> parseJSON x0

      "ByParentName" -> do
        x0 <- o .: "contents"
        ByParentName <$> parseJSON x0

      "BySelf" -> do
        x0 <- o .: "contents"
        BySelf <$> parseJSON x0

      "Timestamp" -> do
        x0 <- o .: "contents"
        Timestamp <$> parseJSON x0

      "UnixTimestamp" -> do
        x0 <- o .: "contents"
        UnixTimestamp <$> parseJSON x0

      "CreatedAtTimestamp" -> do
        x0 <- o .: "contents"
        CreatedAtTimestamp <$> parseJSON x0

      "CreatedAtUnixTimestamp" -> do
        x0 <- o .: "contents"
        CreatedAtUnixTimestamp <$> parseJSON x0

      "RealIP" -> do
        x0 <- o .: "contents"
        RealIP <$> parseJSON x0

      "IP" -> do
        x0 <- o .: "contents"
        IP <$> parseJSON x0

      "WithOrganization" -> do
        x0 <- o .: "contents"
        WithOrganization <$> parseJSON x0

      "WithForum" -> do
        x0 <- o .: "contents"
        WithForum <$> parseJSON x0

      "WithBoard" -> do
        x0 <- o .: "contents"
        WithBoard <$> parseJSON x0

      "WithThread" -> do
        x0 <- o .: "contents"
        WithThread <$> parseJSON x0

      "WithResource" -> do
        x0 <- o .: "contents"
        WithResource <$> parseJSON x0

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ParamTag where
  toJSON (ParamTag_Limit ) = object $
    [ "tag" .= "ParamTag_Limit"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_Offset ) = object $
    [ "tag" .= "ParamTag_Offset"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_SortOrder ) = object $
    [ "tag" .= "ParamTag_SortOrder"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_Order ) = object $
    [ "tag" .= "ParamTag_Order"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByOrganizationId ) = object $
    [ "tag" .= "ParamTag_ByOrganizationId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByOrganizationsIds ) = object $
    [ "tag" .= "ParamTag_ByOrganizationsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByOrganizationName ) = object $
    [ "tag" .= "ParamTag_ByOrganizationName"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByTeamId ) = object $
    [ "tag" .= "ParamTag_ByTeamId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByTeamsIds ) = object $
    [ "tag" .= "ParamTag_ByTeamsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByTeamName ) = object $
    [ "tag" .= "ParamTag_ByTeamName"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByTeamMemberId ) = object $
    [ "tag" .= "ParamTag_ByTeamMemberId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByTeamMembersIds ) = object $
    [ "tag" .= "ParamTag_ByTeamMembersIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByUserId ) = object $
    [ "tag" .= "ParamTag_ByUserId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByUsersIds ) = object $
    [ "tag" .= "ParamTag_ByUsersIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByUserNick ) = object $
    [ "tag" .= "ParamTag_ByUserNick"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByUsersNicks ) = object $
    [ "tag" .= "ParamTag_ByUsersNicks"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGlobalGroupId ) = object $
    [ "tag" .= "ParamTag_ByGlobalGroupId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGlobalGroupsIds ) = object $
    [ "tag" .= "ParamTag_ByGlobalGroupsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGroupId ) = object $
    [ "tag" .= "ParamTag_ByGroupId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGroupsIds ) = object $
    [ "tag" .= "ParamTag_ByGroupsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGroupMemberId ) = object $
    [ "tag" .= "ParamTag_ByGroupMemberId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGroupMembersIds ) = object $
    [ "tag" .= "ParamTag_ByGroupMembersIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByForumId ) = object $
    [ "tag" .= "ParamTag_ByForumId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByForumsIds ) = object $
    [ "tag" .= "ParamTag_ByForumsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByForumName ) = object $
    [ "tag" .= "ParamTag_ByForumName"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByBoardId ) = object $
    [ "tag" .= "ParamTag_ByBoardId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByBoardsIds ) = object $
    [ "tag" .= "ParamTag_ByBoardsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByBoardName ) = object $
    [ "tag" .= "ParamTag_ByBoardName"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadId ) = object $
    [ "tag" .= "ParamTag_ByThreadId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadsIds ) = object $
    [ "tag" .= "ParamTag_ByThreadsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadName ) = object $
    [ "tag" .= "ParamTag_ByThreadName"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostId ) = object $
    [ "tag" .= "ParamTag_ByThreadPostId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostsIds ) = object $
    [ "tag" .= "ParamTag_ByThreadPostsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostName ) = object $
    [ "tag" .= "ParamTag_ByThreadPostName"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostLikeId ) = object $
    [ "tag" .= "ParamTag_ByThreadPostLikeId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostLikesIds ) = object $
    [ "tag" .= "ParamTag_ByThreadPostLikesIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostStarId ) = object $
    [ "tag" .= "ParamTag_ByThreadPostStarId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostStarsIds ) = object $
    [ "tag" .= "ParamTag_ByThreadPostStarsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByBucketId ) = object $
    [ "tag" .= "ParamTag_ByBucketId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByResourceId ) = object $
    [ "tag" .= "ParamTag_ByResourceId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByResourcesIds ) = object $
    [ "tag" .= "ParamTag_ByResourcesIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByResourceName ) = object $
    [ "tag" .= "ParamTag_ByResourceName"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByLeuronId ) = object $
    [ "tag" .= "ParamTag_ByLeuronId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByLeuronsIds ) = object $
    [ "tag" .= "ParamTag_ByLeuronsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByPmId ) = object $
    [ "tag" .= "ParamTag_ByPmId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByPmsIds ) = object $
    [ "tag" .= "ParamTag_ByPmsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByReminderId ) = object $
    [ "tag" .= "ParamTag_ByReminderId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByReminderFolderId ) = object $
    [ "tag" .= "ParamTag_ByReminderFolderId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByParentId ) = object $
    [ "tag" .= "ParamTag_ByParentId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByParentsIds ) = object $
    [ "tag" .= "ParamTag_ByParentsIds"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByParentName ) = object $
    [ "tag" .= "ParamTag_ByParentName"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_BySelf ) = object $
    [ "tag" .= "ParamTag_BySelf"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_Timestamp ) = object $
    [ "tag" .= "ParamTag_Timestamp"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_UnixTimestamp ) = object $
    [ "tag" .= "ParamTag_UnixTimestamp"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_CreatedAtTimestamp ) = object $
    [ "tag" .= "ParamTag_CreatedAtTimestamp"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_CreatedAtUnixTimestamp ) = object $
    [ "tag" .= "ParamTag_CreatedAtUnixTimestamp"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_RealIP ) = object $
    [ "tag" .= "ParamTag_RealIP"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_IP ) = object $
    [ "tag" .= "ParamTag_IP"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_WithOrganization ) = object $
    [ "tag" .= "ParamTag_WithOrganization"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_WithForum ) = object $
    [ "tag" .= "ParamTag_WithForum"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_WithBoard ) = object $
    [ "tag" .= "ParamTag_WithBoard"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_WithThread ) = object $
    [ "tag" .= "ParamTag_WithThread"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_WithResource ) = object $
    [ "tag" .= "ParamTag_WithResource"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON ParamTag where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "ParamTag_Limit" -> do
        return ParamTag_Limit

      "ParamTag_Offset" -> do
        return ParamTag_Offset

      "ParamTag_SortOrder" -> do
        return ParamTag_SortOrder

      "ParamTag_Order" -> do
        return ParamTag_Order

      "ParamTag_ByOrganizationId" -> do
        return ParamTag_ByOrganizationId

      "ParamTag_ByOrganizationsIds" -> do
        return ParamTag_ByOrganizationsIds

      "ParamTag_ByOrganizationName" -> do
        return ParamTag_ByOrganizationName

      "ParamTag_ByTeamId" -> do
        return ParamTag_ByTeamId

      "ParamTag_ByTeamsIds" -> do
        return ParamTag_ByTeamsIds

      "ParamTag_ByTeamName" -> do
        return ParamTag_ByTeamName

      "ParamTag_ByTeamMemberId" -> do
        return ParamTag_ByTeamMemberId

      "ParamTag_ByTeamMembersIds" -> do
        return ParamTag_ByTeamMembersIds

      "ParamTag_ByUserId" -> do
        return ParamTag_ByUserId

      "ParamTag_ByUsersIds" -> do
        return ParamTag_ByUsersIds

      "ParamTag_ByUserNick" -> do
        return ParamTag_ByUserNick

      "ParamTag_ByUsersNicks" -> do
        return ParamTag_ByUsersNicks

      "ParamTag_ByGlobalGroupId" -> do
        return ParamTag_ByGlobalGroupId

      "ParamTag_ByGlobalGroupsIds" -> do
        return ParamTag_ByGlobalGroupsIds

      "ParamTag_ByGroupId" -> do
        return ParamTag_ByGroupId

      "ParamTag_ByGroupsIds" -> do
        return ParamTag_ByGroupsIds

      "ParamTag_ByGroupMemberId" -> do
        return ParamTag_ByGroupMemberId

      "ParamTag_ByGroupMembersIds" -> do
        return ParamTag_ByGroupMembersIds

      "ParamTag_ByForumId" -> do
        return ParamTag_ByForumId

      "ParamTag_ByForumsIds" -> do
        return ParamTag_ByForumsIds

      "ParamTag_ByForumName" -> do
        return ParamTag_ByForumName

      "ParamTag_ByBoardId" -> do
        return ParamTag_ByBoardId

      "ParamTag_ByBoardsIds" -> do
        return ParamTag_ByBoardsIds

      "ParamTag_ByBoardName" -> do
        return ParamTag_ByBoardName

      "ParamTag_ByThreadId" -> do
        return ParamTag_ByThreadId

      "ParamTag_ByThreadsIds" -> do
        return ParamTag_ByThreadsIds

      "ParamTag_ByThreadName" -> do
        return ParamTag_ByThreadName

      "ParamTag_ByThreadPostId" -> do
        return ParamTag_ByThreadPostId

      "ParamTag_ByThreadPostsIds" -> do
        return ParamTag_ByThreadPostsIds

      "ParamTag_ByThreadPostName" -> do
        return ParamTag_ByThreadPostName

      "ParamTag_ByThreadPostLikeId" -> do
        return ParamTag_ByThreadPostLikeId

      "ParamTag_ByThreadPostLikesIds" -> do
        return ParamTag_ByThreadPostLikesIds

      "ParamTag_ByThreadPostStarId" -> do
        return ParamTag_ByThreadPostStarId

      "ParamTag_ByThreadPostStarsIds" -> do
        return ParamTag_ByThreadPostStarsIds

      "ParamTag_ByBucketId" -> do
        return ParamTag_ByBucketId

      "ParamTag_ByResourceId" -> do
        return ParamTag_ByResourceId

      "ParamTag_ByResourcesIds" -> do
        return ParamTag_ByResourcesIds

      "ParamTag_ByResourceName" -> do
        return ParamTag_ByResourceName

      "ParamTag_ByLeuronId" -> do
        return ParamTag_ByLeuronId

      "ParamTag_ByLeuronsIds" -> do
        return ParamTag_ByLeuronsIds

      "ParamTag_ByPmId" -> do
        return ParamTag_ByPmId

      "ParamTag_ByPmsIds" -> do
        return ParamTag_ByPmsIds

      "ParamTag_ByReminderId" -> do
        return ParamTag_ByReminderId

      "ParamTag_ByReminderFolderId" -> do
        return ParamTag_ByReminderFolderId

      "ParamTag_ByParentId" -> do
        return ParamTag_ByParentId

      "ParamTag_ByParentsIds" -> do
        return ParamTag_ByParentsIds

      "ParamTag_ByParentName" -> do
        return ParamTag_ByParentName

      "ParamTag_BySelf" -> do
        return ParamTag_BySelf

      "ParamTag_Timestamp" -> do
        return ParamTag_Timestamp

      "ParamTag_UnixTimestamp" -> do
        return ParamTag_UnixTimestamp

      "ParamTag_CreatedAtTimestamp" -> do
        return ParamTag_CreatedAtTimestamp

      "ParamTag_CreatedAtUnixTimestamp" -> do
        return ParamTag_CreatedAtUnixTimestamp

      "ParamTag_RealIP" -> do
        return ParamTag_RealIP

      "ParamTag_IP" -> do
        return ParamTag_IP

      "ParamTag_WithOrganization" -> do
        return ParamTag_WithOrganization

      "ParamTag_WithForum" -> do
        return ParamTag_WithForum

      "ParamTag_WithBoard" -> do
        return ParamTag_WithBoard

      "ParamTag_WithThread" -> do
        return ParamTag_WithThread

      "ParamTag_WithResource" -> do
        return ParamTag_WithResource

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON SortOrderBy where
  toJSON (SortOrderBy_Asc ) = object $
    [ "tag" .= "SortOrderBy_Asc"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (SortOrderBy_Dsc ) = object $
    [ "tag" .= "SortOrderBy_Dsc"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (SortOrderBy_Rnd ) = object $
    [ "tag" .= "SortOrderBy_Rnd"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (SortOrderBy_None ) = object $
    [ "tag" .= "SortOrderBy_None"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON SortOrderBy where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "SortOrderBy_Asc" -> do
        return SortOrderBy_Asc

      "SortOrderBy_Dsc" -> do
        return SortOrderBy_Dsc

      "SortOrderBy_Rnd" -> do
        return SortOrderBy_Rnd

      "SortOrderBy_None" -> do
        return SortOrderBy_None

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON OrderBy where
  toJSON (OrderBy_UserId ) = object $
    [ "tag" .= "OrderBy_UserId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_CreatedAt ) = object $
    [ "tag" .= "OrderBy_CreatedAt"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_ModifiedAt ) = object $
    [ "tag" .= "OrderBy_ModifiedAt"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_ModifiedBy ) = object $
    [ "tag" .= "OrderBy_ModifiedBy"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_ActivityAt ) = object $
    [ "tag" .= "OrderBy_ActivityAt"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_OrganizationId ) = object $
    [ "tag" .= "OrderBy_OrganizationId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_TeamId ) = object $
    [ "tag" .= "OrderBy_TeamId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_ForumId ) = object $
    [ "tag" .= "OrderBy_ForumId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_BoardId ) = object $
    [ "tag" .= "OrderBy_BoardId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_ThreadId ) = object $
    [ "tag" .= "OrderBy_ThreadId"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_Id ) = object $
    [ "tag" .= "OrderBy_Id"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_None ) = object $
    [ "tag" .= "OrderBy_None"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON OrderBy where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "OrderBy_UserId" -> do
        return OrderBy_UserId

      "OrderBy_CreatedAt" -> do
        return OrderBy_CreatedAt

      "OrderBy_ModifiedAt" -> do
        return OrderBy_ModifiedAt

      "OrderBy_ModifiedBy" -> do
        return OrderBy_ModifiedBy

      "OrderBy_ActivityAt" -> do
        return OrderBy_ActivityAt

      "OrderBy_OrganizationId" -> do
        return OrderBy_OrganizationId

      "OrderBy_TeamId" -> do
        return OrderBy_TeamId

      "OrderBy_ForumId" -> do
        return OrderBy_ForumId

      "OrderBy_BoardId" -> do
        return OrderBy_BoardId

      "OrderBy_ThreadId" -> do
        return OrderBy_ThreadId

      "OrderBy_Id" -> do
        return OrderBy_Id

      "OrderBy_None" -> do
        return OrderBy_None

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Permission where
  toJSON (Perm_Create ) = object $
    [ "tag" .= "Perm_Create"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Perm_Read ) = object $
    [ "tag" .= "Perm_Read"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Perm_Update ) = object $
    [ "tag" .= "Perm_Update"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Perm_Delete ) = object $
    [ "tag" .= "Perm_Delete"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Perm_Execute ) = object $
    [ "tag" .= "Perm_Execute"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON Permission where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "Perm_Create" -> do
        return Perm_Create

      "Perm_Read" -> do
        return Perm_Read

      "Perm_Update" -> do
        return Perm_Update

      "Perm_Delete" -> do
        return Perm_Delete

      "Perm_Execute" -> do
        return Perm_Execute

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmRequest where
  toJSON PmRequest{..} = object $
    [ "tag" .= "PmRequest"
    , "subject" .= pmRequestSubject
    , "body" .= pmRequestBody
    , "guard" .= pmRequestGuard
    ]


instance FromJSON PmRequest where
  parseJSON (Object o) = do
    pmRequestSubject <- o .: "subject"
    pmRequestBody <- o .: "body"
    pmRequestGuard <- o .: "guard"
    return $ PmRequest {
      pmRequestSubject = pmRequestSubject,
      pmRequestBody = pmRequestBody,
      pmRequestGuard = pmRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmResponse where
  toJSON PmResponse{..} = object $
    [ "tag" .= "PmResponse"
    , "id" .= pmResponseId
    , "user_id" .= pmResponseUserId
    , "to_user_id" .= pmResponseToUserId
    , "subject" .= pmResponseSubject
    , "body" .= pmResponseBody
    , "active" .= pmResponseActive
    , "guard" .= pmResponseGuard
    , "created_at" .= pmResponseCreatedAt
    , "modified_at" .= pmResponseModifiedAt
    , "activity_at" .= pmResponseActivityAt
    ]


instance FromJSON PmResponse where
  parseJSON (Object o) = do
    pmResponseId <- o .: "id"
    pmResponseUserId <- o .: "user_id"
    pmResponseToUserId <- o .: "to_user_id"
    pmResponseSubject <- o .: "subject"
    pmResponseBody <- o .: "body"
    pmResponseActive <- o .: "active"
    pmResponseGuard <- o .: "guard"
    pmResponseCreatedAt <- o .: "created_at"
    pmResponseModifiedAt <- o .: "modified_at"
    pmResponseActivityAt <- o .: "activity_at"
    return $ PmResponse {
      pmResponseId = pmResponseId,
      pmResponseUserId = pmResponseUserId,
      pmResponseToUserId = pmResponseToUserId,
      pmResponseSubject = pmResponseSubject,
      pmResponseBody = pmResponseBody,
      pmResponseActive = pmResponseActive,
      pmResponseGuard = pmResponseGuard,
      pmResponseCreatedAt = pmResponseCreatedAt,
      pmResponseModifiedAt = pmResponseModifiedAt,
      pmResponseActivityAt = pmResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmResponses where
  toJSON PmResponses{..} = object $
    [ "tag" .= "PmResponses"
    , "pm_responses" .= pmResponses
    ]


instance FromJSON PmResponses where
  parseJSON (Object o) = do
    pmResponses <- o .: "pm_responses"
    return $ PmResponses {
      pmResponses = pmResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmInRequest where
  toJSON PmInRequest{..} = object $
    [ "tag" .= "PmInRequest"
    , "label" .= pmInRequestLabel
    , "is_read" .= pmInRequestIsRead
    , "is_starred" .= pmInRequestIsStarred
    , "guard" .= pmInRequestGuard
    ]


instance FromJSON PmInRequest where
  parseJSON (Object o) = do
    pmInRequestLabel <- o .: "label"
    pmInRequestIsRead <- o .: "is_read"
    pmInRequestIsStarred <- o .: "is_starred"
    pmInRequestGuard <- o .: "guard"
    return $ PmInRequest {
      pmInRequestLabel = pmInRequestLabel,
      pmInRequestIsRead = pmInRequestIsRead,
      pmInRequestIsStarred = pmInRequestIsStarred,
      pmInRequestGuard = pmInRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmInResponse where
  toJSON PmInResponse{..} = object $
    [ "tag" .= "PmInResponse"
    , "id" .= pmInResponseId
    , "pm_id" .= pmInResponsePmId
    , "user_id" .= pmInResponseUserId
    , "label" .= pmInResponseLabel
    , "is_read" .= pmInResponseIsRead
    , "is_starred" .= pmInResponseIsStarred
    , "is_new" .= pmInResponseIsNew
    , "is_saved" .= pmInResponseIsSaved
    , "active" .= pmInResponseActive
    , "guard" .= pmInResponseGuard
    , "created_at" .= pmInResponseCreatedAt
    , "modified_at" .= pmInResponseModifiedAt
    ]


instance FromJSON PmInResponse where
  parseJSON (Object o) = do
    pmInResponseId <- o .: "id"
    pmInResponsePmId <- o .: "pm_id"
    pmInResponseUserId <- o .: "user_id"
    pmInResponseLabel <- o .: "label"
    pmInResponseIsRead <- o .: "is_read"
    pmInResponseIsStarred <- o .: "is_starred"
    pmInResponseIsNew <- o .: "is_new"
    pmInResponseIsSaved <- o .: "is_saved"
    pmInResponseActive <- o .: "active"
    pmInResponseGuard <- o .: "guard"
    pmInResponseCreatedAt <- o .: "created_at"
    pmInResponseModifiedAt <- o .: "modified_at"
    return $ PmInResponse {
      pmInResponseId = pmInResponseId,
      pmInResponsePmId = pmInResponsePmId,
      pmInResponseUserId = pmInResponseUserId,
      pmInResponseLabel = pmInResponseLabel,
      pmInResponseIsRead = pmInResponseIsRead,
      pmInResponseIsStarred = pmInResponseIsStarred,
      pmInResponseIsNew = pmInResponseIsNew,
      pmInResponseIsSaved = pmInResponseIsSaved,
      pmInResponseActive = pmInResponseActive,
      pmInResponseGuard = pmInResponseGuard,
      pmInResponseCreatedAt = pmInResponseCreatedAt,
      pmInResponseModifiedAt = pmInResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmInResponses where
  toJSON PmInResponses{..} = object $
    [ "tag" .= "PmInResponses"
    , "pm_in_responses" .= pmInResponses
    ]


instance FromJSON PmInResponses where
  parseJSON (Object o) = do
    pmInResponses <- o .: "pm_in_responses"
    return $ PmInResponses {
      pmInResponses = pmInResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmOutRequest where
  toJSON PmOutRequest{..} = object $
    [ "tag" .= "PmOutRequest"
    , "label" .= pmOutRequestLabel
    , "guard" .= pmOutRequestGuard
    ]


instance FromJSON PmOutRequest where
  parseJSON (Object o) = do
    pmOutRequestLabel <- o .: "label"
    pmOutRequestGuard <- o .: "guard"
    return $ PmOutRequest {
      pmOutRequestLabel = pmOutRequestLabel,
      pmOutRequestGuard = pmOutRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmOutResponse where
  toJSON PmOutResponse{..} = object $
    [ "tag" .= "PmOutResponse"
    , "id" .= pmOutResponseId
    , "pm_id" .= pmOutResponsePmId
    , "user_id" .= pmOutResponseUserId
    , "label" .= pmOutResponseLabel
    , "is_saved" .= pmOutResponseIsSaved
    , "active" .= pmOutResponseActive
    , "guard" .= pmOutResponseGuard
    , "created_at" .= pmOutResponseCreatedAt
    , "modified_at" .= pmOutResponseModifiedAt
    ]


instance FromJSON PmOutResponse where
  parseJSON (Object o) = do
    pmOutResponseId <- o .: "id"
    pmOutResponsePmId <- o .: "pm_id"
    pmOutResponseUserId <- o .: "user_id"
    pmOutResponseLabel <- o .: "label"
    pmOutResponseIsSaved <- o .: "is_saved"
    pmOutResponseActive <- o .: "active"
    pmOutResponseGuard <- o .: "guard"
    pmOutResponseCreatedAt <- o .: "created_at"
    pmOutResponseModifiedAt <- o .: "modified_at"
    return $ PmOutResponse {
      pmOutResponseId = pmOutResponseId,
      pmOutResponsePmId = pmOutResponsePmId,
      pmOutResponseUserId = pmOutResponseUserId,
      pmOutResponseLabel = pmOutResponseLabel,
      pmOutResponseIsSaved = pmOutResponseIsSaved,
      pmOutResponseActive = pmOutResponseActive,
      pmOutResponseGuard = pmOutResponseGuard,
      pmOutResponseCreatedAt = pmOutResponseCreatedAt,
      pmOutResponseModifiedAt = pmOutResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmOutResponses where
  toJSON PmOutResponses{..} = object $
    [ "tag" .= "PmOutResponses"
    , "pm_out_responses" .= pmOutResponses
    ]


instance FromJSON PmOutResponses where
  parseJSON (Object o) = do
    pmOutResponses <- o .: "pm_out_responses"
    return $ PmOutResponses {
      pmOutResponses = pmOutResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ProfileX where
  toJSON ProfileX{..} = object $
    [ "tag" .= "ProfileX"
    , "profile_login" .= profileLogin
    , "profile_name" .= profileName
    , "profile_email" .= profileEmail
    ]


instance FromJSON ProfileX where
  parseJSON (Object o) = do
    profileLogin <- o .: "profile_login"
    profileName <- o .: "profile_name"
    profileEmail <- o .: "profile_email"
    return $ ProfileX {
      profileLogin = profileLogin,
      profileName = profileName,
      profileEmail = profileEmail
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ProfileGender where
  toJSON (GenderMale ) = object $
    [ "tag" .= "GenderMale"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (GenderFemale ) = object $
    [ "tag" .= "GenderFemale"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (GenderUnknown ) = object $
    [ "tag" .= "GenderUnknown"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON ProfileGender where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "GenderMale" -> do
        return GenderMale

      "GenderFemale" -> do
        return GenderFemale

      "GenderUnknown" -> do
        return GenderUnknown

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ProfileRequest where
  toJSON ProfileRequest{..} = object $
    [ "tag" .= "ProfileRequest"
    , "gender" .= profileRequestGender
    , "birthdate" .= profileRequestBirthdate
    , "website" .= profileRequestWebsite
    , "location" .= profileRequestLocation
    , "signature" .= profileRequestSignature
    , "debug" .= profileRequestDebug
    , "guard" .= profileRequestGuard
    ]


instance FromJSON ProfileRequest where
  parseJSON (Object o) = do
    profileRequestGender <- o .: "gender"
    profileRequestBirthdate <- o .: "birthdate"
    profileRequestWebsite <- o .: "website"
    profileRequestLocation <- o .: "location"
    profileRequestSignature <- o .: "signature"
    profileRequestDebug <- o .: "debug"
    profileRequestGuard <- o .: "guard"
    return $ ProfileRequest {
      profileRequestGender = profileRequestGender,
      profileRequestBirthdate = profileRequestBirthdate,
      profileRequestWebsite = profileRequestWebsite,
      profileRequestLocation = profileRequestLocation,
      profileRequestSignature = profileRequestSignature,
      profileRequestDebug = profileRequestDebug,
      profileRequestGuard = profileRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ProfileResponse where
  toJSON ProfileResponse{..} = object $
    [ "tag" .= "ProfileResponse"
    , "id" .= profileResponseId
    , "ent" .= profileResponseEnt
    , "ent_id" .= profileResponseEntId
    , "gender" .= profileResponseGender
    , "birthdate" .= profileResponseBirthdate
    , "website" .= profileResponseWebsite
    , "location" .= profileResponseLocation
    , "signature" .= profileResponseSignature
    , "debug" .= profileResponseDebug
    , "karma_good" .= profileResponseKarmaGood
    , "karma_bad" .= profileResponseKarmaBad
    , "guard" .= profileResponseGuard
    , "created_at" .= profileResponseCreatedAt
    , "modified_at" .= profileResponseModifiedAt
    ]


instance FromJSON ProfileResponse where
  parseJSON (Object o) = do
    profileResponseId <- o .: "id"
    profileResponseEnt <- o .: "ent"
    profileResponseEntId <- o .: "ent_id"
    profileResponseGender <- o .: "gender"
    profileResponseBirthdate <- o .: "birthdate"
    profileResponseWebsite <- o .: "website"
    profileResponseLocation <- o .: "location"
    profileResponseSignature <- o .: "signature"
    profileResponseDebug <- o .: "debug"
    profileResponseKarmaGood <- o .: "karma_good"
    profileResponseKarmaBad <- o .: "karma_bad"
    profileResponseGuard <- o .: "guard"
    profileResponseCreatedAt <- o .: "created_at"
    profileResponseModifiedAt <- o .: "modified_at"
    return $ ProfileResponse {
      profileResponseId = profileResponseId,
      profileResponseEnt = profileResponseEnt,
      profileResponseEntId = profileResponseEntId,
      profileResponseGender = profileResponseGender,
      profileResponseBirthdate = profileResponseBirthdate,
      profileResponseWebsite = profileResponseWebsite,
      profileResponseLocation = profileResponseLocation,
      profileResponseSignature = profileResponseSignature,
      profileResponseDebug = profileResponseDebug,
      profileResponseKarmaGood = profileResponseKarmaGood,
      profileResponseKarmaBad = profileResponseKarmaBad,
      profileResponseGuard = profileResponseGuard,
      profileResponseCreatedAt = profileResponseCreatedAt,
      profileResponseModifiedAt = profileResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ProfileResponses where
  toJSON ProfileResponses{..} = object $
    [ "tag" .= "ProfileResponses"
    , "profile_responses" .= profileResponses
    ]


instance FromJSON ProfileResponses where
  parseJSON (Object o) = do
    profileResponses <- o .: "profile_responses"
    return $ ProfileResponses {
      profileResponses = profileResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ReminderRequest where
  toJSON ReminderRequest{..} = object $
    [ "tag" .= "ReminderRequest"
    , "data" .= reminderRequestData
    , "guard" .= reminderRequestGuard
    ]


instance FromJSON ReminderRequest where
  parseJSON (Object o) = do
    reminderRequestData <- o .: "data"
    reminderRequestGuard <- o .: "guard"
    return $ ReminderRequest {
      reminderRequestData = reminderRequestData,
      reminderRequestGuard = reminderRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ReminderResponse where
  toJSON ReminderResponse{..} = object $
    [ "tag" .= "ReminderResponse"
    , "id" .= reminderResponseId
    , "user_id" .= reminderResponseUserId
    , "parent_folder_id" .= reminderResponseParentFolderId
    , "data" .= reminderResponseData
    , "active" .= reminderResponseActive
    , "guard" .= reminderResponseGuard
    , "created_at" .= reminderResponseCreatedAt
    , "modified_at" .= reminderResponseModifiedAt
    , "activity_at" .= reminderResponseActivityAt
    ]


instance FromJSON ReminderResponse where
  parseJSON (Object o) = do
    reminderResponseId <- o .: "id"
    reminderResponseUserId <- o .: "user_id"
    reminderResponseParentFolderId <- o .: "parent_folder_id"
    reminderResponseData <- o .: "data"
    reminderResponseActive <- o .: "active"
    reminderResponseGuard <- o .: "guard"
    reminderResponseCreatedAt <- o .: "created_at"
    reminderResponseModifiedAt <- o .: "modified_at"
    reminderResponseActivityAt <- o .: "activity_at"
    return $ ReminderResponse {
      reminderResponseId = reminderResponseId,
      reminderResponseUserId = reminderResponseUserId,
      reminderResponseParentFolderId = reminderResponseParentFolderId,
      reminderResponseData = reminderResponseData,
      reminderResponseActive = reminderResponseActive,
      reminderResponseGuard = reminderResponseGuard,
      reminderResponseCreatedAt = reminderResponseCreatedAt,
      reminderResponseModifiedAt = reminderResponseModifiedAt,
      reminderResponseActivityAt = reminderResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ReminderResponses where
  toJSON ReminderResponses{..} = object $
    [ "tag" .= "ReminderResponses"
    , "reminder_responses" .= reminderResponses
    ]


instance FromJSON ReminderResponses where
  parseJSON (Object o) = do
    reminderResponses <- o .: "reminder_responses"
    return $ ReminderResponses {
      reminderResponses = reminderResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ReminderFolderRequest where
  toJSON ReminderFolderRequest{..} = object $
    [ "tag" .= "ReminderFolderRequest"
    , "display_name" .= reminderFolderRequestDisplayName
    , "description" .= reminderFolderRequestDescription
    , "visibility" .= reminderFolderRequestVisibility
    , "guard" .= reminderFolderRequestGuard
    ]


instance FromJSON ReminderFolderRequest where
  parseJSON (Object o) = do
    reminderFolderRequestDisplayName <- o .: "display_name"
    reminderFolderRequestDescription <- o .: "description"
    reminderFolderRequestVisibility <- o .: "visibility"
    reminderFolderRequestGuard <- o .: "guard"
    return $ ReminderFolderRequest {
      reminderFolderRequestDisplayName = reminderFolderRequestDisplayName,
      reminderFolderRequestDescription = reminderFolderRequestDescription,
      reminderFolderRequestVisibility = reminderFolderRequestVisibility,
      reminderFolderRequestGuard = reminderFolderRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ReminderFolderResponse where
  toJSON ReminderFolderResponse{..} = object $
    [ "tag" .= "ReminderFolderResponse"
    , "id" .= reminderFolderResponseId
    , "user_id" .= reminderFolderResponseUserId
    , "parent_folder_id" .= reminderFolderResponseParentFolderId
    , "name" .= reminderFolderResponseName
    , "display_name" .= reminderFolderResponseDisplayName
    , "visibility" .= reminderFolderResponseVisibility
    , "description" .= reminderFolderResponseDescription
    , "active" .= reminderFolderResponseActive
    , "guard" .= reminderFolderResponseGuard
    , "created_at" .= reminderFolderResponseCreatedAt
    , "modified_at" .= reminderFolderResponseModifiedAt
    , "activity_at" .= reminderFolderResponseActivityAt
    ]


instance FromJSON ReminderFolderResponse where
  parseJSON (Object o) = do
    reminderFolderResponseId <- o .: "id"
    reminderFolderResponseUserId <- o .: "user_id"
    reminderFolderResponseParentFolderId <- o .: "parent_folder_id"
    reminderFolderResponseName <- o .: "name"
    reminderFolderResponseDisplayName <- o .: "display_name"
    reminderFolderResponseVisibility <- o .: "visibility"
    reminderFolderResponseDescription <- o .: "description"
    reminderFolderResponseActive <- o .: "active"
    reminderFolderResponseGuard <- o .: "guard"
    reminderFolderResponseCreatedAt <- o .: "created_at"
    reminderFolderResponseModifiedAt <- o .: "modified_at"
    reminderFolderResponseActivityAt <- o .: "activity_at"
    return $ ReminderFolderResponse {
      reminderFolderResponseId = reminderFolderResponseId,
      reminderFolderResponseUserId = reminderFolderResponseUserId,
      reminderFolderResponseParentFolderId = reminderFolderResponseParentFolderId,
      reminderFolderResponseName = reminderFolderResponseName,
      reminderFolderResponseDisplayName = reminderFolderResponseDisplayName,
      reminderFolderResponseVisibility = reminderFolderResponseVisibility,
      reminderFolderResponseDescription = reminderFolderResponseDescription,
      reminderFolderResponseActive = reminderFolderResponseActive,
      reminderFolderResponseGuard = reminderFolderResponseGuard,
      reminderFolderResponseCreatedAt = reminderFolderResponseCreatedAt,
      reminderFolderResponseModifiedAt = reminderFolderResponseModifiedAt,
      reminderFolderResponseActivityAt = reminderFolderResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ReminderFolderResponses where
  toJSON ReminderFolderResponses{..} = object $
    [ "tag" .= "ReminderFolderResponses"
    , "reminder_folder_responses" .= reminderFolderResponses
    ]


instance FromJSON ReminderFolderResponses where
  parseJSON (Object o) = do
    reminderFolderResponses <- o .: "reminder_folder_responses"
    return $ ReminderFolderResponses {
      reminderFolderResponses = reminderFolderResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ResourceType where
  toJSON (ISBN13 x0) = object $
    [ "tag" .= "ISBN13"
    , "contents" .= toJSON x0
    ]
  toJSON (ISBN10 x0) = object $
    [ "tag" .= "ISBN10"
    , "contents" .= toJSON x0
    ]
  toJSON (ISBN x0) = object $
    [ "tag" .= "ISBN"
    , "contents" .= toJSON x0
    ]
  toJSON (URL x0) = object $
    [ "tag" .= "URL"
    , "contents" .= toJSON x0
    ]
  toJSON (SourceNone ) = object $
    [ "tag" .= "SourceNone"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON ResourceType where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "ISBN13" -> do
        x0 <- o .: "contents"
        ISBN13 <$> parseJSON x0

      "ISBN10" -> do
        x0 <- o .: "contents"
        ISBN10 <$> parseJSON x0

      "ISBN" -> do
        x0 <- o .: "contents"
        ISBN <$> parseJSON x0

      "URL" -> do
        x0 <- o .: "contents"
        URL <$> parseJSON x0

      "SourceNone" -> do
        return SourceNone

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TyResourceType where
  toJSON (TyISBN13 ) = object $
    [ "tag" .= "TyISBN13"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyISBN10 ) = object $
    [ "tag" .= "TyISBN10"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyISBN ) = object $
    [ "tag" .= "TyISBN"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyURL ) = object $
    [ "tag" .= "TyURL"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TySourceNone ) = object $
    [ "tag" .= "TySourceNone"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON TyResourceType where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "TyISBN13" -> do
        return TyISBN13

      "TyISBN10" -> do
        return TyISBN10

      "TyISBN" -> do
        return TyISBN

      "TyURL" -> do
        return TyURL

      "TySourceNone" -> do
        return TySourceNone

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ResourceRequest where
  toJSON ResourceRequest{..} = object $
    [ "tag" .= "ResourceRequest"
    , "display_name" .= resourceRequestDisplayName
    , "description" .= resourceRequestDescription
    , "source" .= resourceRequestSource
    , "author" .= resourceRequestAuthor
    , "prerequisites" .= resourceRequestPrerequisites
    , "categories" .= resourceRequestCategories
    , "visibility" .= resourceRequestVisibility
    , "counter" .= resourceRequestCounter
    , "version" .= resourceRequestVersion
    , "urls" .= resourceRequestUrls
    , "icon" .= resourceRequestIcon
    , "tags" .= resourceRequestTags
    , "guard" .= resourceRequestGuard
    ]


instance FromJSON ResourceRequest where
  parseJSON (Object o) = do
    resourceRequestDisplayName <- o .: "display_name"
    resourceRequestDescription <- o .: "description"
    resourceRequestSource <- o .: "source"
    resourceRequestAuthor <- o .: "author"
    resourceRequestPrerequisites <- o .: "prerequisites"
    resourceRequestCategories <- o .: "categories"
    resourceRequestVisibility <- o .: "visibility"
    resourceRequestCounter <- o .: "counter"
    resourceRequestVersion <- o .: "version"
    resourceRequestUrls <- o .: "urls"
    resourceRequestIcon <- o .: "icon"
    resourceRequestTags <- o .: "tags"
    resourceRequestGuard <- o .: "guard"
    return $ ResourceRequest {
      resourceRequestDisplayName = resourceRequestDisplayName,
      resourceRequestDescription = resourceRequestDescription,
      resourceRequestSource = resourceRequestSource,
      resourceRequestAuthor = resourceRequestAuthor,
      resourceRequestPrerequisites = resourceRequestPrerequisites,
      resourceRequestCategories = resourceRequestCategories,
      resourceRequestVisibility = resourceRequestVisibility,
      resourceRequestCounter = resourceRequestCounter,
      resourceRequestVersion = resourceRequestVersion,
      resourceRequestUrls = resourceRequestUrls,
      resourceRequestIcon = resourceRequestIcon,
      resourceRequestTags = resourceRequestTags,
      resourceRequestGuard = resourceRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ResourceResponse where
  toJSON ResourceResponse{..} = object $
    [ "tag" .= "ResourceResponse"
    , "id" .= resourceResponseId
    , "user_id" .= resourceResponseUserId
    , "name" .= resourceResponseName
    , "display_name" .= resourceResponseDisplayName
    , "description" .= resourceResponseDescription
    , "source" .= resourceResponseSource
    , "author" .= resourceResponseAuthor
    , "prerequisites" .= resourceResponsePrerequisites
    , "categories" .= resourceResponseCategories
    , "visibility" .= resourceResponseVisibility
    , "counter" .= resourceResponseCounter
    , "version" .= resourceResponseVersion
    , "urls" .= resourceResponseUrls
    , "icon" .= resourceResponseIcon
    , "tags" .= resourceResponseTags
    , "active" .= resourceResponseActive
    , "guard" .= resourceResponseGuard
    , "created_at" .= resourceResponseCreatedAt
    , "modified_at" .= resourceResponseModifiedAt
    , "activity_at" .= resourceResponseActivityAt
    ]


instance FromJSON ResourceResponse where
  parseJSON (Object o) = do
    resourceResponseId <- o .: "id"
    resourceResponseUserId <- o .: "user_id"
    resourceResponseName <- o .: "name"
    resourceResponseDisplayName <- o .: "display_name"
    resourceResponseDescription <- o .: "description"
    resourceResponseSource <- o .: "source"
    resourceResponseAuthor <- o .: "author"
    resourceResponsePrerequisites <- o .: "prerequisites"
    resourceResponseCategories <- o .: "categories"
    resourceResponseVisibility <- o .: "visibility"
    resourceResponseCounter <- o .: "counter"
    resourceResponseVersion <- o .: "version"
    resourceResponseUrls <- o .: "urls"
    resourceResponseIcon <- o .: "icon"
    resourceResponseTags <- o .: "tags"
    resourceResponseActive <- o .: "active"
    resourceResponseGuard <- o .: "guard"
    resourceResponseCreatedAt <- o .: "created_at"
    resourceResponseModifiedAt <- o .: "modified_at"
    resourceResponseActivityAt <- o .: "activity_at"
    return $ ResourceResponse {
      resourceResponseId = resourceResponseId,
      resourceResponseUserId = resourceResponseUserId,
      resourceResponseName = resourceResponseName,
      resourceResponseDisplayName = resourceResponseDisplayName,
      resourceResponseDescription = resourceResponseDescription,
      resourceResponseSource = resourceResponseSource,
      resourceResponseAuthor = resourceResponseAuthor,
      resourceResponsePrerequisites = resourceResponsePrerequisites,
      resourceResponseCategories = resourceResponseCategories,
      resourceResponseVisibility = resourceResponseVisibility,
      resourceResponseCounter = resourceResponseCounter,
      resourceResponseVersion = resourceResponseVersion,
      resourceResponseUrls = resourceResponseUrls,
      resourceResponseIcon = resourceResponseIcon,
      resourceResponseTags = resourceResponseTags,
      resourceResponseActive = resourceResponseActive,
      resourceResponseGuard = resourceResponseGuard,
      resourceResponseCreatedAt = resourceResponseCreatedAt,
      resourceResponseModifiedAt = resourceResponseModifiedAt,
      resourceResponseActivityAt = resourceResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ResourceResponses where
  toJSON ResourceResponses{..} = object $
    [ "tag" .= "ResourceResponses"
    , "resource_responses" .= resourceResponses
    ]


instance FromJSON ResourceResponses where
  parseJSON (Object o) = do
    resourceResponses <- o .: "resource_responses"
    return $ ResourceResponses {
      resourceResponses = resourceResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ResourceStatResponse where
  toJSON ResourceStatResponse{..} = object $
    [ "tag" .= "ResourceStatResponse"
    , "resource_id" .= resourceStatResponseResourceId
    , "leurons" .= resourceStatResponseLeurons
    , "likes" .= resourceStatResponseLikes
    , "neutral" .= resourceStatResponseNeutral
    , "dislikes" .= resourceStatResponseDislikes
    , "stars" .= resourceStatResponseStars
    , "views" .= resourceStatResponseViews
    ]


instance FromJSON ResourceStatResponse where
  parseJSON (Object o) = do
    resourceStatResponseResourceId <- o .: "resource_id"
    resourceStatResponseLeurons <- o .: "leurons"
    resourceStatResponseLikes <- o .: "likes"
    resourceStatResponseNeutral <- o .: "neutral"
    resourceStatResponseDislikes <- o .: "dislikes"
    resourceStatResponseStars <- o .: "stars"
    resourceStatResponseViews <- o .: "views"
    return $ ResourceStatResponse {
      resourceStatResponseResourceId = resourceStatResponseResourceId,
      resourceStatResponseLeurons = resourceStatResponseLeurons,
      resourceStatResponseLikes = resourceStatResponseLikes,
      resourceStatResponseNeutral = resourceStatResponseNeutral,
      resourceStatResponseDislikes = resourceStatResponseDislikes,
      resourceStatResponseStars = resourceStatResponseStars,
      resourceStatResponseViews = resourceStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ResourceStatResponses where
  toJSON ResourceStatResponses{..} = object $
    [ "tag" .= "ResourceStatResponses"
    , "resource_stat_responses" .= resourceStatResponses
    ]


instance FromJSON ResourceStatResponses where
  parseJSON (Object o) = do
    resourceStatResponses <- o .: "resource_stat_responses"
    return $ ResourceStatResponses {
      resourceStatResponses = resourceStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Size where
  toJSON (XSmall ) = object $
    [ "tag" .= "XSmall"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Small ) = object $
    [ "tag" .= "Small"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Medium ) = object $
    [ "tag" .= "Medium"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Large ) = object $
    [ "tag" .= "Large"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (XLarge ) = object $
    [ "tag" .= "XLarge"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON Size where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "XSmall" -> do
        return XSmall

      "Small" -> do
        return Small

      "Medium" -> do
        return Medium

      "Large" -> do
        return Large

      "XLarge" -> do
        return XLarge

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Splits where
  toJSON (SplitAt x0 x1 x2) = object $
    [ "tag" .= "SplitAt"
    , "contents" .= [toJSON x0, toJSON x1, toJSON x2]
    ]
  toJSON (SplitNone ) = object $
    [ "tag" .= "SplitNone"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON Splits where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "SplitAt" -> do
        [x0, x1, x2] <- o .: "contents"
        SplitAt <$> parseJSON x0 <*> parseJSON x1 <*> parseJSON x2

      "SplitNone" -> do
        return SplitNone

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TySplits where
  toJSON (TySplitA ) = object $
    [ "tag" .= "TySplitA"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TySplitNone ) = object $
    [ "tag" .= "TySplitNone"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON TySplits where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "TySplitA" -> do
        return TySplitA

      "TySplitNone" -> do
        return TySplitNone

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Substitutions where
  toJSON (SubsExpr x0 x1) = object $
    [ "tag" .= "SubsExpr"
    , "contents" .= [toJSON x0, toJSON x1]
    ]
  toJSON (SubsOneOf x0) = object $
    [ "tag" .= "SubsOneOf"
    , "contents" .= toJSON x0
    ]
  toJSON (SubsAllOf x0) = object $
    [ "tag" .= "SubsAllOf"
    , "contents" .= toJSON x0
    ]
  toJSON (SubsBoth x0 x1) = object $
    [ "tag" .= "SubsBoth"
    , "contents" .= [toJSON x0, toJSON x1]
    ]


instance FromJSON Substitutions where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "SubsExpr" -> do
        [x0, x1] <- o .: "contents"
        SubsExpr <$> parseJSON x0 <*> parseJSON x1

      "SubsOneOf" -> do
        x0 <- o .: "contents"
        SubsOneOf <$> parseJSON x0

      "SubsAllOf" -> do
        x0 <- o .: "contents"
        SubsAllOf <$> parseJSON x0

      "SubsBoth" -> do
        [x0, x1] <- o .: "contents"
        SubsBoth <$> parseJSON x0 <*> parseJSON x1

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TySubstitutions where
  toJSON (TySubsExpr ) = object $
    [ "tag" .= "TySubsExpr"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TySubsOneOf ) = object $
    [ "tag" .= "TySubsOneOf"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TySubsAllOf ) = object $
    [ "tag" .= "TySubsAllOf"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TySubsBoth ) = object $
    [ "tag" .= "TySubsBoth"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON TySubstitutions where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "TySubsExpr" -> do
        return TySubsExpr

      "TySubsOneOf" -> do
        return TySubsOneOf

      "TySubsAllOf" -> do
        return TySubsAllOf

      "TySubsBoth" -> do
        return TySubsBoth

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON StarRequest where
  toJSON StarRequest{..} = object $
    [ "tag" .= "StarRequest"
    , "reason" .= starRequestReason
    , "guard" .= starRequestGuard
    ]


instance FromJSON StarRequest where
  parseJSON (Object o) = do
    starRequestReason <- o .: "reason"
    starRequestGuard <- o .: "guard"
    return $ StarRequest {
      starRequestReason = starRequestReason,
      starRequestGuard = starRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON StarResponse where
  toJSON StarResponse{..} = object $
    [ "tag" .= "StarResponse"
    , "id" .= starResponseId
    , "ent" .= starResponseEnt
    , "ent_id" .= starResponseEntId
    , "user_id" .= starResponseUserId
    , "reason" .= starResponseReason
    , "active" .= starResponseActive
    , "guard" .= starResponseGuard
    , "created_at" .= starResponseCreatedAt
    , "modified_at" .= starResponseModifiedAt
    ]


instance FromJSON StarResponse where
  parseJSON (Object o) = do
    starResponseId <- o .: "id"
    starResponseEnt <- o .: "ent"
    starResponseEntId <- o .: "ent_id"
    starResponseUserId <- o .: "user_id"
    starResponseReason <- o .: "reason"
    starResponseActive <- o .: "active"
    starResponseGuard <- o .: "guard"
    starResponseCreatedAt <- o .: "created_at"
    starResponseModifiedAt <- o .: "modified_at"
    return $ StarResponse {
      starResponseId = starResponseId,
      starResponseEnt = starResponseEnt,
      starResponseEntId = starResponseEntId,
      starResponseUserId = starResponseUserId,
      starResponseReason = starResponseReason,
      starResponseActive = starResponseActive,
      starResponseGuard = starResponseGuard,
      starResponseCreatedAt = starResponseCreatedAt,
      starResponseModifiedAt = starResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON StarResponses where
  toJSON StarResponses{..} = object $
    [ "tag" .= "StarResponses"
    , "star_responses" .= starResponses
    ]


instance FromJSON StarResponses where
  parseJSON (Object o) = do
    starResponses <- o .: "star_responses"
    return $ StarResponses {
      starResponses = starResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON StarStatResponse where
  toJSON StarStatResponse{..} = object $
    [ "tag" .= "StarStatResponse"
    , "ent" .= starStatResponseEnt
    , "ent_id" .= starStatResponseEntId
    , "stars" .= starStatResponseStars
    ]


instance FromJSON StarStatResponse where
  parseJSON (Object o) = do
    starStatResponseEnt <- o .: "ent"
    starStatResponseEntId <- o .: "ent_id"
    starStatResponseStars <- o .: "stars"
    return $ StarStatResponse {
      starStatResponseEnt = starStatResponseEnt,
      starStatResponseEntId = starStatResponseEntId,
      starStatResponseStars = starStatResponseStars
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON StarStatResponses where
  toJSON StarStatResponses{..} = object $
    [ "tag" .= "StarStatResponses"
    , "star_stat_responses" .= starStatResponses
    ]


instance FromJSON StarStatResponses where
  parseJSON (Object o) = do
    starStatResponses <- o .: "star_stat_responses"
    return $ StarStatResponses {
      starStatResponses = starStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON SystemTeam where
  toJSON (Team_Owners ) = object $
    [ "tag" .= "Team_Owners"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Team_Members ) = object $
    [ "tag" .= "Team_Members"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON SystemTeam where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "Team_Owners" -> do
        return Team_Owners

      "Team_Members" -> do
        return Team_Members

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamRequest where
  toJSON TeamRequest{..} = object $
    [ "tag" .= "TeamRequest"
    , "membership" .= teamRequestMembership
    , "icon" .= teamRequestIcon
    , "tags" .= teamRequestTags
    , "visibility" .= teamRequestVisibility
    , "guard" .= teamRequestGuard
    ]


instance FromJSON TeamRequest where
  parseJSON (Object o) = do
    teamRequestMembership <- o .: "membership"
    teamRequestIcon <- o .: "icon"
    teamRequestTags <- o .: "tags"
    teamRequestVisibility <- o .: "visibility"
    teamRequestGuard <- o .: "guard"
    return $ TeamRequest {
      teamRequestMembership = teamRequestMembership,
      teamRequestIcon = teamRequestIcon,
      teamRequestTags = teamRequestTags,
      teamRequestVisibility = teamRequestVisibility,
      teamRequestGuard = teamRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamResponse where
  toJSON TeamResponse{..} = object $
    [ "tag" .= "TeamResponse"
    , "id" .= teamResponseId
    , "user_id" .= teamResponseUserId
    , "org_id" .= teamResponseOrgId
    , "system" .= teamResponseSystem
    , "membership" .= teamResponseMembership
    , "icon" .= teamResponseIcon
    , "tags" .= teamResponseTags
    , "visibility" .= teamResponseVisibility
    , "active" .= teamResponseActive
    , "guard" .= teamResponseGuard
    , "created_at" .= teamResponseCreatedAt
    , "modified_by" .= teamResponseModifiedBy
    , "modified_at" .= teamResponseModifiedAt
    , "activity_at" .= teamResponseActivityAt
    ]


instance FromJSON TeamResponse where
  parseJSON (Object o) = do
    teamResponseId <- o .: "id"
    teamResponseUserId <- o .: "user_id"
    teamResponseOrgId <- o .: "org_id"
    teamResponseSystem <- o .: "system"
    teamResponseMembership <- o .: "membership"
    teamResponseIcon <- o .: "icon"
    teamResponseTags <- o .: "tags"
    teamResponseVisibility <- o .: "visibility"
    teamResponseActive <- o .: "active"
    teamResponseGuard <- o .: "guard"
    teamResponseCreatedAt <- o .: "created_at"
    teamResponseModifiedBy <- o .: "modified_by"
    teamResponseModifiedAt <- o .: "modified_at"
    teamResponseActivityAt <- o .: "activity_at"
    return $ TeamResponse {
      teamResponseId = teamResponseId,
      teamResponseUserId = teamResponseUserId,
      teamResponseOrgId = teamResponseOrgId,
      teamResponseSystem = teamResponseSystem,
      teamResponseMembership = teamResponseMembership,
      teamResponseIcon = teamResponseIcon,
      teamResponseTags = teamResponseTags,
      teamResponseVisibility = teamResponseVisibility,
      teamResponseActive = teamResponseActive,
      teamResponseGuard = teamResponseGuard,
      teamResponseCreatedAt = teamResponseCreatedAt,
      teamResponseModifiedBy = teamResponseModifiedBy,
      teamResponseModifiedAt = teamResponseModifiedAt,
      teamResponseActivityAt = teamResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamResponses where
  toJSON TeamResponses{..} = object $
    [ "tag" .= "TeamResponses"
    , "team_responses" .= teamResponses
    ]


instance FromJSON TeamResponses where
  parseJSON (Object o) = do
    teamResponses <- o .: "team_responses"
    return $ TeamResponses {
      teamResponses = teamResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamStatResponse where
  toJSON TeamStatResponse{..} = object $
    [ "tag" .= "TeamStatResponse"
    , "members" .= teamStatResponseMembers
    ]


instance FromJSON TeamStatResponse where
  parseJSON (Object o) = do
    teamStatResponseMembers <- o .: "members"
    return $ TeamStatResponse {
      teamStatResponseMembers = teamStatResponseMembers
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamStatResponses where
  toJSON TeamStatResponses{..} = object $
    [ "tag" .= "TeamStatResponses"
    , "team_stat_responses" .= teamStatResponses
    ]


instance FromJSON TeamStatResponses where
  parseJSON (Object o) = do
    teamStatResponses <- o .: "team_stat_responses"
    return $ TeamStatResponses {
      teamStatResponses = teamStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamMemberRequest where
  toJSON TeamMemberRequest{..} = object $
    [ "tag" .= "TeamMemberRequest"
    , "guard" .= teamMemberRequestGuard
    ]


instance FromJSON TeamMemberRequest where
  parseJSON (Object o) = do
    teamMemberRequestGuard <- o .: "guard"
    return $ TeamMemberRequest {
      teamMemberRequestGuard = teamMemberRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamMemberResponse where
  toJSON TeamMemberResponse{..} = object $
    [ "tag" .= "TeamMemberResponse"
    , "id" .= teamMemberResponseId
    , "user_id" .= teamMemberResponseUserId
    , "org_id" .= teamMemberResponseOrgId
    , "team_id" .= teamMemberResponseTeamId
    , "is_accepted" .= teamMemberResponseIsAccepted
    , "accepted_at" .= teamMemberResponseAcceptedAt
    , "is_blocked" .= teamMemberResponseIsBlocked
    , "blocked_at" .= teamMemberResponseBlockedAt
    , "active" .= teamMemberResponseActive
    , "guard" .= teamMemberResponseGuard
    , "created_at" .= teamMemberResponseCreatedAt
    , "modified_by" .= teamMemberResponseModifiedBy
    , "modified_at" .= teamMemberResponseModifiedAt
    , "activity_at" .= teamMemberResponseActivityAt
    ]


instance FromJSON TeamMemberResponse where
  parseJSON (Object o) = do
    teamMemberResponseId <- o .: "id"
    teamMemberResponseUserId <- o .: "user_id"
    teamMemberResponseOrgId <- o .: "org_id"
    teamMemberResponseTeamId <- o .: "team_id"
    teamMemberResponseIsAccepted <- o .: "is_accepted"
    teamMemberResponseAcceptedAt <- o .: "accepted_at"
    teamMemberResponseIsBlocked <- o .: "is_blocked"
    teamMemberResponseBlockedAt <- o .: "blocked_at"
    teamMemberResponseActive <- o .: "active"
    teamMemberResponseGuard <- o .: "guard"
    teamMemberResponseCreatedAt <- o .: "created_at"
    teamMemberResponseModifiedBy <- o .: "modified_by"
    teamMemberResponseModifiedAt <- o .: "modified_at"
    teamMemberResponseActivityAt <- o .: "activity_at"
    return $ TeamMemberResponse {
      teamMemberResponseId = teamMemberResponseId,
      teamMemberResponseUserId = teamMemberResponseUserId,
      teamMemberResponseOrgId = teamMemberResponseOrgId,
      teamMemberResponseTeamId = teamMemberResponseTeamId,
      teamMemberResponseIsAccepted = teamMemberResponseIsAccepted,
      teamMemberResponseAcceptedAt = teamMemberResponseAcceptedAt,
      teamMemberResponseIsBlocked = teamMemberResponseIsBlocked,
      teamMemberResponseBlockedAt = teamMemberResponseBlockedAt,
      teamMemberResponseActive = teamMemberResponseActive,
      teamMemberResponseGuard = teamMemberResponseGuard,
      teamMemberResponseCreatedAt = teamMemberResponseCreatedAt,
      teamMemberResponseModifiedBy = teamMemberResponseModifiedBy,
      teamMemberResponseModifiedAt = teamMemberResponseModifiedAt,
      teamMemberResponseActivityAt = teamMemberResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamMemberResponses where
  toJSON TeamMemberResponses{..} = object $
    [ "tag" .= "TeamMemberResponses"
    , "team_member_responses" .= teamMemberResponses
    ]


instance FromJSON TeamMemberResponses where
  parseJSON (Object o) = do
    teamMemberResponses <- o .: "team_member_responses"
    return $ TeamMemberResponses {
      teamMemberResponses = teamMemberResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamMemberStatResponse where
  toJSON (TeamMemberStatResponse ) = object $
    [ "tag" .= "TeamMemberStatResponse"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON TeamMemberStatResponse where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "TeamMemberStatResponse" -> do
        return TeamMemberStatResponse

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamMemberStatResponses where
  toJSON TeamMemberStatResponses{..} = object $
    [ "tag" .= "TeamMemberStatResponses"
    , "team_member_stat_responses" .= teamMemberStatResponses
    ]


instance FromJSON TeamMemberStatResponses where
  parseJSON (Object o) = do
    teamMemberStatResponses <- o .: "team_member_stat_responses"
    return $ TeamMemberStatResponses {
      teamMemberStatResponses = teamMemberStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TestRequest where
  toJSON TestRequest{..} = object $
    [ "tag" .= "TestRequest"
    , "msg" .= testRequestMsg
    ]


instance FromJSON TestRequest where
  parseJSON (Object o) = do
    testRequestMsg <- o .: "msg"
    return $ TestRequest {
      testRequestMsg = testRequestMsg
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TestResponse where
  toJSON TestResponse{..} = object $
    [ "tag" .= "TestResponse"
    , "id" .= testResponseId
    , "user_id" .= testResponseUserId
    , "msg" .= testResponseMsg
    , "created_at" .= testResponseCreatedAt
    , "modified_at" .= testResponseModifiedAt
    ]


instance FromJSON TestResponse where
  parseJSON (Object o) = do
    testResponseId <- o .: "id"
    testResponseUserId <- o .: "user_id"
    testResponseMsg <- o .: "msg"
    testResponseCreatedAt <- o .: "created_at"
    testResponseModifiedAt <- o .: "modified_at"
    return $ TestResponse {
      testResponseId = testResponseId,
      testResponseUserId = testResponseUserId,
      testResponseMsg = testResponseMsg,
      testResponseCreatedAt = testResponseCreatedAt,
      testResponseModifiedAt = testResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TestResponses where
  toJSON TestResponses{..} = object $
    [ "tag" .= "TestResponses"
    , "test_responses" .= testResponses
    ]


instance FromJSON TestResponses where
  parseJSON (Object o) = do
    testResponses <- o .: "test_responses"
    return $ TestResponses {
      testResponses = testResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadRequest where
  toJSON ThreadRequest{..} = object $
    [ "tag" .= "ThreadRequest"
    , "display_name" .= threadRequestDisplayName
    , "description" .= threadRequestDescription
    , "sticky" .= threadRequestSticky
    , "locked" .= threadRequestLocked
    , "poll" .= threadRequestPoll
    , "icon" .= threadRequestIcon
    , "tags" .= threadRequestTags
    , "guard" .= threadRequestGuard
    ]


instance FromJSON ThreadRequest where
  parseJSON (Object o) = do
    threadRequestDisplayName <- o .: "display_name"
    threadRequestDescription <- o .: "description"
    threadRequestSticky <- o .: "sticky"
    threadRequestLocked <- o .: "locked"
    threadRequestPoll <- o .: "poll"
    threadRequestIcon <- o .: "icon"
    threadRequestTags <- o .: "tags"
    threadRequestGuard <- o .: "guard"
    return $ ThreadRequest {
      threadRequestDisplayName = threadRequestDisplayName,
      threadRequestDescription = threadRequestDescription,
      threadRequestSticky = threadRequestSticky,
      threadRequestLocked = threadRequestLocked,
      threadRequestPoll = threadRequestPoll,
      threadRequestIcon = threadRequestIcon,
      threadRequestTags = threadRequestTags,
      threadRequestGuard = threadRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadResponse where
  toJSON ThreadResponse{..} = object $
    [ "tag" .= "ThreadResponse"
    , "id" .= threadResponseId
    , "user_id" .= threadResponseUserId
    , "org_id" .= threadResponseOrgId
    , "forum_id" .= threadResponseForumId
    , "board_id" .= threadResponseBoardId
    , "name" .= threadResponseName
    , "display_name" .= threadResponseDisplayName
    , "description" .= threadResponseDescription
    , "sticky" .= threadResponseSticky
    , "locked" .= threadResponseLocked
    , "poll" .= threadResponsePoll
    , "icon" .= threadResponseIcon
    , "tags" .= threadResponseTags
    , "active" .= threadResponseActive
    , "guard" .= threadResponseGuard
    , "created_at" .= threadResponseCreatedAt
    , "modified_by" .= threadResponseModifiedBy
    , "modified_at" .= threadResponseModifiedAt
    , "activity_at" .= threadResponseActivityAt
    ]


instance FromJSON ThreadResponse where
  parseJSON (Object o) = do
    threadResponseId <- o .: "id"
    threadResponseUserId <- o .: "user_id"
    threadResponseOrgId <- o .: "org_id"
    threadResponseForumId <- o .: "forum_id"
    threadResponseBoardId <- o .: "board_id"
    threadResponseName <- o .: "name"
    threadResponseDisplayName <- o .: "display_name"
    threadResponseDescription <- o .: "description"
    threadResponseSticky <- o .: "sticky"
    threadResponseLocked <- o .: "locked"
    threadResponsePoll <- o .: "poll"
    threadResponseIcon <- o .: "icon"
    threadResponseTags <- o .: "tags"
    threadResponseActive <- o .: "active"
    threadResponseGuard <- o .: "guard"
    threadResponseCreatedAt <- o .: "created_at"
    threadResponseModifiedBy <- o .: "modified_by"
    threadResponseModifiedAt <- o .: "modified_at"
    threadResponseActivityAt <- o .: "activity_at"
    return $ ThreadResponse {
      threadResponseId = threadResponseId,
      threadResponseUserId = threadResponseUserId,
      threadResponseOrgId = threadResponseOrgId,
      threadResponseForumId = threadResponseForumId,
      threadResponseBoardId = threadResponseBoardId,
      threadResponseName = threadResponseName,
      threadResponseDisplayName = threadResponseDisplayName,
      threadResponseDescription = threadResponseDescription,
      threadResponseSticky = threadResponseSticky,
      threadResponseLocked = threadResponseLocked,
      threadResponsePoll = threadResponsePoll,
      threadResponseIcon = threadResponseIcon,
      threadResponseTags = threadResponseTags,
      threadResponseActive = threadResponseActive,
      threadResponseGuard = threadResponseGuard,
      threadResponseCreatedAt = threadResponseCreatedAt,
      threadResponseModifiedBy = threadResponseModifiedBy,
      threadResponseModifiedAt = threadResponseModifiedAt,
      threadResponseActivityAt = threadResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadResponses where
  toJSON ThreadResponses{..} = object $
    [ "tag" .= "ThreadResponses"
    , "thread_responses" .= threadResponses
    ]


instance FromJSON ThreadResponses where
  parseJSON (Object o) = do
    threadResponses <- o .: "thread_responses"
    return $ ThreadResponses {
      threadResponses = threadResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadStatResponse where
  toJSON ThreadStatResponse{..} = object $
    [ "tag" .= "ThreadStatResponse"
    , "thread_id" .= threadStatResponseThreadId
    , "thread_posts" .= threadStatResponseThreadPosts
    , "views" .= threadStatResponseViews
    ]


instance FromJSON ThreadStatResponse where
  parseJSON (Object o) = do
    threadStatResponseThreadId <- o .: "thread_id"
    threadStatResponseThreadPosts <- o .: "thread_posts"
    threadStatResponseViews <- o .: "views"
    return $ ThreadStatResponse {
      threadStatResponseThreadId = threadStatResponseThreadId,
      threadStatResponseThreadPosts = threadStatResponseThreadPosts,
      threadStatResponseViews = threadStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadStatResponses where
  toJSON ThreadStatResponses{..} = object $
    [ "tag" .= "ThreadStatResponses"
    , "thread_stat_responses" .= threadStatResponses
    ]


instance FromJSON ThreadStatResponses where
  parseJSON (Object o) = do
    threadStatResponses <- o .: "thread_stat_responses"
    return $ ThreadStatResponses {
      threadStatResponses = threadStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PostData where
  toJSON (PostDataRaw x0) = object $
    [ "tag" .= "PostDataRaw"
    , "contents" .= toJSON x0
    ]
  toJSON (PostDataMarkdown x0) = object $
    [ "tag" .= "PostDataMarkdown"
    , "contents" .= toJSON x0
    ]
  toJSON (PostDataBBCode x0) = object $
    [ "tag" .= "PostDataBBCode"
    , "contents" .= toJSON x0
    ]
  toJSON (PostDataCode x0 x1) = object $
    [ "tag" .= "PostDataCode"
    , "contents" .= [toJSON x0, toJSON x1]
    ]
  toJSON (PostDataOther x0 x1) = object $
    [ "tag" .= "PostDataOther"
    , "contents" .= [toJSON x0, toJSON x1]
    ]
  toJSON (PostDataEmpty ) = object $
    [ "tag" .= "PostDataEmpty"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON PostData where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "PostDataRaw" -> do
        x0 <- o .: "contents"
        PostDataRaw <$> parseJSON x0

      "PostDataMarkdown" -> do
        x0 <- o .: "contents"
        PostDataMarkdown <$> parseJSON x0

      "PostDataBBCode" -> do
        x0 <- o .: "contents"
        PostDataBBCode <$> parseJSON x0

      "PostDataCode" -> do
        [x0, x1] <- o .: "contents"
        PostDataCode <$> parseJSON x0 <*> parseJSON x1

      "PostDataOther" -> do
        [x0, x1] <- o .: "contents"
        PostDataOther <$> parseJSON x0 <*> parseJSON x1

      "PostDataEmpty" -> do
        return PostDataEmpty

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostRequest where
  toJSON ThreadPostRequest{..} = object $
    [ "tag" .= "ThreadPostRequest"
    , "title" .= threadPostRequestTitle
    , "body" .= threadPostRequestBody
    , "tags" .= threadPostRequestTags
    , "private_tags" .= threadPostRequestPrivateTags
    , "guard" .= threadPostRequestGuard
    ]


instance FromJSON ThreadPostRequest where
  parseJSON (Object o) = do
    threadPostRequestTitle <- o .: "title"
    threadPostRequestBody <- o .: "body"
    threadPostRequestTags <- o .: "tags"
    threadPostRequestPrivateTags <- o .: "private_tags"
    threadPostRequestGuard <- o .: "guard"
    return $ ThreadPostRequest {
      threadPostRequestTitle = threadPostRequestTitle,
      threadPostRequestBody = threadPostRequestBody,
      threadPostRequestTags = threadPostRequestTags,
      threadPostRequestPrivateTags = threadPostRequestPrivateTags,
      threadPostRequestGuard = threadPostRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostResponse where
  toJSON ThreadPostResponse{..} = object $
    [ "tag" .= "ThreadPostResponse"
    , "id" .= threadPostResponseId
    , "user_id" .= threadPostResponseUserId
    , "org_id" .= threadPostResponseOrgId
    , "forum_id" .= threadPostResponseForumId
    , "board_id" .= threadPostResponseBoardId
    , "thread_id" .= threadPostResponseThreadId
    , "parent_id" .= threadPostResponseParentId
    , "title" .= threadPostResponseTitle
    , "body" .= threadPostResponseBody
    , "tags" .= threadPostResponseTags
    , "private_tags" .= threadPostResponsePrivateTags
    , "active" .= threadPostResponseActive
    , "guard" .= threadPostResponseGuard
    , "created_at" .= threadPostResponseCreatedAt
    , "modified_by" .= threadPostResponseModifiedBy
    , "modified_at" .= threadPostResponseModifiedAt
    , "activity_at" .= threadPostResponseActivityAt
    ]


instance FromJSON ThreadPostResponse where
  parseJSON (Object o) = do
    threadPostResponseId <- o .: "id"
    threadPostResponseUserId <- o .: "user_id"
    threadPostResponseOrgId <- o .: "org_id"
    threadPostResponseForumId <- o .: "forum_id"
    threadPostResponseBoardId <- o .: "board_id"
    threadPostResponseThreadId <- o .: "thread_id"
    threadPostResponseParentId <- o .: "parent_id"
    threadPostResponseTitle <- o .: "title"
    threadPostResponseBody <- o .: "body"
    threadPostResponseTags <- o .: "tags"
    threadPostResponsePrivateTags <- o .: "private_tags"
    threadPostResponseActive <- o .: "active"
    threadPostResponseGuard <- o .: "guard"
    threadPostResponseCreatedAt <- o .: "created_at"
    threadPostResponseModifiedBy <- o .: "modified_by"
    threadPostResponseModifiedAt <- o .: "modified_at"
    threadPostResponseActivityAt <- o .: "activity_at"
    return $ ThreadPostResponse {
      threadPostResponseId = threadPostResponseId,
      threadPostResponseUserId = threadPostResponseUserId,
      threadPostResponseOrgId = threadPostResponseOrgId,
      threadPostResponseForumId = threadPostResponseForumId,
      threadPostResponseBoardId = threadPostResponseBoardId,
      threadPostResponseThreadId = threadPostResponseThreadId,
      threadPostResponseParentId = threadPostResponseParentId,
      threadPostResponseTitle = threadPostResponseTitle,
      threadPostResponseBody = threadPostResponseBody,
      threadPostResponseTags = threadPostResponseTags,
      threadPostResponsePrivateTags = threadPostResponsePrivateTags,
      threadPostResponseActive = threadPostResponseActive,
      threadPostResponseGuard = threadPostResponseGuard,
      threadPostResponseCreatedAt = threadPostResponseCreatedAt,
      threadPostResponseModifiedBy = threadPostResponseModifiedBy,
      threadPostResponseModifiedAt = threadPostResponseModifiedAt,
      threadPostResponseActivityAt = threadPostResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostResponses where
  toJSON ThreadPostResponses{..} = object $
    [ "tag" .= "ThreadPostResponses"
    , "thread_post_responses" .= threadPostResponses
    ]


instance FromJSON ThreadPostResponses where
  parseJSON (Object o) = do
    threadPostResponses <- o .: "thread_post_responses"
    return $ ThreadPostResponses {
      threadPostResponses = threadPostResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostStatResponse where
  toJSON ThreadPostStatResponse{..} = object $
    [ "tag" .= "ThreadPostStatResponse"
    , "thread_post_id" .= threadPostStatResponseThreadPostId
    , "likes" .= threadPostStatResponseLikes
    , "neutral" .= threadPostStatResponseNeutral
    , "dislikes" .= threadPostStatResponseDislikes
    , "stars" .= threadPostStatResponseStars
    , "views" .= threadPostStatResponseViews
    ]


instance FromJSON ThreadPostStatResponse where
  parseJSON (Object o) = do
    threadPostStatResponseThreadPostId <- o .: "thread_post_id"
    threadPostStatResponseLikes <- o .: "likes"
    threadPostStatResponseNeutral <- o .: "neutral"
    threadPostStatResponseDislikes <- o .: "dislikes"
    threadPostStatResponseStars <- o .: "stars"
    threadPostStatResponseViews <- o .: "views"
    return $ ThreadPostStatResponse {
      threadPostStatResponseThreadPostId = threadPostStatResponseThreadPostId,
      threadPostStatResponseLikes = threadPostStatResponseLikes,
      threadPostStatResponseNeutral = threadPostStatResponseNeutral,
      threadPostStatResponseDislikes = threadPostStatResponseDislikes,
      threadPostStatResponseStars = threadPostStatResponseStars,
      threadPostStatResponseViews = threadPostStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostStatResponses where
  toJSON ThreadPostStatResponses{..} = object $
    [ "tag" .= "ThreadPostStatResponses"
    , "thread_post_stat_responses" .= threadPostStatResponses
    ]


instance FromJSON ThreadPostStatResponses where
  parseJSON (Object o) = do
    threadPostStatResponses <- o .: "thread_post_stat_responses"
    return $ ThreadPostStatResponses {
      threadPostStatResponses = threadPostStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserRequest where
  toJSON UserRequest{..} = object $
    [ "tag" .= "UserRequest"
    , "display_nick" .= userRequestDisplayNick
    , "name" .= userRequestName
    , "email" .= userRequestEmail
    , "plugin" .= userRequestPlugin
    , "ident" .= userRequestIdent
    , "accept_tos" .= userRequestAcceptTOS
    ]


instance FromJSON UserRequest where
  parseJSON (Object o) = do
    userRequestDisplayNick <- o .: "display_nick"
    userRequestName <- o .: "name"
    userRequestEmail <- o .: "email"
    userRequestPlugin <- o .: "plugin"
    userRequestIdent <- o .: "ident"
    userRequestAcceptTOS <- o .: "accept_tos"
    return $ UserRequest {
      userRequestDisplayNick = userRequestDisplayNick,
      userRequestName = userRequestName,
      userRequestEmail = userRequestEmail,
      userRequestPlugin = userRequestPlugin,
      userRequestIdent = userRequestIdent,
      userRequestAcceptTOS = userRequestAcceptTOS
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserResponse where
  toJSON UserResponse{..} = object $
    [ "tag" .= "UserResponse"
    , "id" .= userResponseId
    , "nick" .= userResponseNick
    , "display_nick" .= userResponseDisplayNick
    , "name" .= userResponseName
    , "email" .= userResponseEmail
    , "email_md5" .= userResponseEmailMD5
    , "plugin" .= userResponsePlugin
    , "ident" .= userResponseIdent
    , "accept_tos" .= userResponseAcceptTOS
    , "active" .= userResponseActive
    , "guard" .= userResponseGuard
    , "created_at" .= userResponseCreatedAt
    , "modified_at" .= userResponseModifiedAt
    , "deactivated_at" .= userResponseDeactivatedAt
    , "activity_at" .= userResponseActivityAt
    ]


instance FromJSON UserResponse where
  parseJSON (Object o) = do
    userResponseId <- o .: "id"
    userResponseNick <- o .: "nick"
    userResponseDisplayNick <- o .: "display_nick"
    userResponseName <- o .: "name"
    userResponseEmail <- o .: "email"
    userResponseEmailMD5 <- o .: "email_md5"
    userResponsePlugin <- o .: "plugin"
    userResponseIdent <- o .: "ident"
    userResponseAcceptTOS <- o .: "accept_tos"
    userResponseActive <- o .: "active"
    userResponseGuard <- o .: "guard"
    userResponseCreatedAt <- o .: "created_at"
    userResponseModifiedAt <- o .: "modified_at"
    userResponseDeactivatedAt <- o .: "deactivated_at"
    userResponseActivityAt <- o .: "activity_at"
    return $ UserResponse {
      userResponseId = userResponseId,
      userResponseNick = userResponseNick,
      userResponseDisplayNick = userResponseDisplayNick,
      userResponseName = userResponseName,
      userResponseEmail = userResponseEmail,
      userResponseEmailMD5 = userResponseEmailMD5,
      userResponsePlugin = userResponsePlugin,
      userResponseIdent = userResponseIdent,
      userResponseAcceptTOS = userResponseAcceptTOS,
      userResponseActive = userResponseActive,
      userResponseGuard = userResponseGuard,
      userResponseCreatedAt = userResponseCreatedAt,
      userResponseModifiedAt = userResponseModifiedAt,
      userResponseDeactivatedAt = userResponseDeactivatedAt,
      userResponseActivityAt = userResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserResponses where
  toJSON UserResponses{..} = object $
    [ "tag" .= "UserResponses"
    , "user_responses" .= userResponses
    ]


instance FromJSON UserResponses where
  parseJSON (Object o) = do
    userResponses <- o .: "user_responses"
    return $ UserResponses {
      userResponses = userResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserSanitizedResponse where
  toJSON UserSanitizedResponse{..} = object $
    [ "tag" .= "UserSanitizedResponse"
    , "id" .= userSanitizedResponseId
    , "nick" .= userSanitizedResponseNick
    , "display_nick" .= userSanitizedResponseDisplayNick
    , "email_md5" .= userSanitizedResponseEmailMD5
    , "active" .= userSanitizedResponseActive
    , "guard" .= userSanitizedResponseGuard
    , "created_at" .= userSanitizedResponseCreatedAt
    , "activity_at" .= userSanitizedResponseActivityAt
    ]


instance FromJSON UserSanitizedResponse where
  parseJSON (Object o) = do
    userSanitizedResponseId <- o .: "id"
    userSanitizedResponseNick <- o .: "nick"
    userSanitizedResponseDisplayNick <- o .: "display_nick"
    userSanitizedResponseEmailMD5 <- o .: "email_md5"
    userSanitizedResponseActive <- o .: "active"
    userSanitizedResponseGuard <- o .: "guard"
    userSanitizedResponseCreatedAt <- o .: "created_at"
    userSanitizedResponseActivityAt <- o .: "activity_at"
    return $ UserSanitizedResponse {
      userSanitizedResponseId = userSanitizedResponseId,
      userSanitizedResponseNick = userSanitizedResponseNick,
      userSanitizedResponseDisplayNick = userSanitizedResponseDisplayNick,
      userSanitizedResponseEmailMD5 = userSanitizedResponseEmailMD5,
      userSanitizedResponseActive = userSanitizedResponseActive,
      userSanitizedResponseGuard = userSanitizedResponseGuard,
      userSanitizedResponseCreatedAt = userSanitizedResponseCreatedAt,
      userSanitizedResponseActivityAt = userSanitizedResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserSanitizedResponses where
  toJSON UserSanitizedResponses{..} = object $
    [ "tag" .= "UserSanitizedResponses"
    , "user_sanitized_responses" .= userSanitizedResponses
    ]


instance FromJSON UserSanitizedResponses where
  parseJSON (Object o) = do
    userSanitizedResponses <- o .: "user_sanitized_responses"
    return $ UserSanitizedResponses {
      userSanitizedResponses = userSanitizedResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserSanitizedStatResponse where
  toJSON UserSanitizedStatResponse{..} = object $
    [ "tag" .= "UserSanitizedStatResponse"
    , "user_id" .= userSanitizedStatResponseUserId
    , "threads" .= userSanitizedStatResponseThreads
    , "thread_posts" .= userSanitizedStatResponseThreadPosts
    , "respect" .= userSanitizedStatResponseRespect
    , "resources" .= userSanitizedStatResponseResources
    , "leurons" .= userSanitizedStatResponseLeurons
    , "workouts" .= userSanitizedStatResponseWorkouts
    ]


instance FromJSON UserSanitizedStatResponse where
  parseJSON (Object o) = do
    userSanitizedStatResponseUserId <- o .: "user_id"
    userSanitizedStatResponseThreads <- o .: "threads"
    userSanitizedStatResponseThreadPosts <- o .: "thread_posts"
    userSanitizedStatResponseRespect <- o .: "respect"
    userSanitizedStatResponseResources <- o .: "resources"
    userSanitizedStatResponseLeurons <- o .: "leurons"
    userSanitizedStatResponseWorkouts <- o .: "workouts"
    return $ UserSanitizedStatResponse {
      userSanitizedStatResponseUserId = userSanitizedStatResponseUserId,
      userSanitizedStatResponseThreads = userSanitizedStatResponseThreads,
      userSanitizedStatResponseThreadPosts = userSanitizedStatResponseThreadPosts,
      userSanitizedStatResponseRespect = userSanitizedStatResponseRespect,
      userSanitizedStatResponseResources = userSanitizedStatResponseResources,
      userSanitizedStatResponseLeurons = userSanitizedStatResponseLeurons,
      userSanitizedStatResponseWorkouts = userSanitizedStatResponseWorkouts
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserSanitizedStatResponses where
  toJSON UserSanitizedStatResponses{..} = object $
    [ "tag" .= "UserSanitizedStatResponses"
    , "user_sanitized_stat_responses" .= userSanitizedStatResponses
    ]


instance FromJSON UserSanitizedStatResponses where
  parseJSON (Object o) = do
    userSanitizedStatResponses <- o .: "user_sanitized_stat_responses"
    return $ UserSanitizedStatResponses {
      userSanitizedStatResponses = userSanitizedStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON Visibility where
  toJSON (Public ) = object $
    [ "tag" .= "Public"
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Private ) = object $
    [ "tag" .= "Private"
    , "contents" .= ([] :: [Text])
    ]


instance FromJSON Visibility where
  parseJSON (Object o) = do
    tag <- o .: "tag"
    case tag of
      "Public" -> do
        return Public

      "Private" -> do
        return Private

  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON OrganizationPackResponse where
  toJSON OrganizationPackResponse{..} = object $
    [ "tag" .= "OrganizationPackResponse"
    , "user" .= organizationPackResponseUser
    , "user_id" .= organizationPackResponseUserId
    , "organization" .= organizationPackResponseOrganization
    , "organization_id" .= organizationPackResponseOrganizationId
    , "stat" .= organizationPackResponseStat
    , "like" .= organizationPackResponseLike
    , "star" .= organizationPackResponseStar
    , "permissions" .= organizationPackResponsePermissions
    , "teams" .= organizationPackResponseTeams
    ]


instance FromJSON OrganizationPackResponse where
  parseJSON (Object o) = do
    organizationPackResponseUser <- o .: "user"
    organizationPackResponseUserId <- o .: "user_id"
    organizationPackResponseOrganization <- o .: "organization"
    organizationPackResponseOrganizationId <- o .: "organization_id"
    organizationPackResponseStat <- o .: "stat"
    organizationPackResponseLike <- o .: "like"
    organizationPackResponseStar <- o .: "star"
    organizationPackResponsePermissions <- o .: "permissions"
    organizationPackResponseTeams <- o .: "teams"
    return $ OrganizationPackResponse {
      organizationPackResponseUser = organizationPackResponseUser,
      organizationPackResponseUserId = organizationPackResponseUserId,
      organizationPackResponseOrganization = organizationPackResponseOrganization,
      organizationPackResponseOrganizationId = organizationPackResponseOrganizationId,
      organizationPackResponseStat = organizationPackResponseStat,
      organizationPackResponseLike = organizationPackResponseLike,
      organizationPackResponseStar = organizationPackResponseStar,
      organizationPackResponsePermissions = organizationPackResponsePermissions,
      organizationPackResponseTeams = organizationPackResponseTeams
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON OrganizationPackResponses where
  toJSON OrganizationPackResponses{..} = object $
    [ "tag" .= "OrganizationPackResponses"
    , "organization_pack_responses" .= organizationPackResponses
    ]


instance FromJSON OrganizationPackResponses where
  parseJSON (Object o) = do
    organizationPackResponses <- o .: "organization_pack_responses"
    return $ OrganizationPackResponses {
      organizationPackResponses = organizationPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamPackResponse where
  toJSON TeamPackResponse{..} = object $
    [ "tag" .= "TeamPackResponse"
    , "user" .= teamPackResponseUser
    , "user_id" .= teamPackResponseUserId
    , "team" .= teamPackResponseTeam
    , "team_id" .= teamPackResponseTeamId
    , "stat" .= teamPackResponseStat
    , "permissions" .= teamPackResponsePermissions
    ]


instance FromJSON TeamPackResponse where
  parseJSON (Object o) = do
    teamPackResponseUser <- o .: "user"
    teamPackResponseUserId <- o .: "user_id"
    teamPackResponseTeam <- o .: "team"
    teamPackResponseTeamId <- o .: "team_id"
    teamPackResponseStat <- o .: "stat"
    teamPackResponsePermissions <- o .: "permissions"
    return $ TeamPackResponse {
      teamPackResponseUser = teamPackResponseUser,
      teamPackResponseUserId = teamPackResponseUserId,
      teamPackResponseTeam = teamPackResponseTeam,
      teamPackResponseTeamId = teamPackResponseTeamId,
      teamPackResponseStat = teamPackResponseStat,
      teamPackResponsePermissions = teamPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamPackResponses where
  toJSON TeamPackResponses{..} = object $
    [ "tag" .= "TeamPackResponses"
    , "team_pack_responses" .= teamPackResponses
    ]


instance FromJSON TeamPackResponses where
  parseJSON (Object o) = do
    teamPackResponses <- o .: "team_pack_responses"
    return $ TeamPackResponses {
      teamPackResponses = teamPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamMemberPackResponse where
  toJSON TeamMemberPackResponse{..} = object $
    [ "tag" .= "TeamMemberPackResponse"
    , "user" .= teamMemberPackResponseUser
    , "user_id" .= teamMemberPackResponseUserId
    , "team_member" .= teamMemberPackResponseTeamMember
    , "team_member_id" .= teamMemberPackResponseTeamMemberId
    , "permissions" .= teamMemberPackResponsePermissions
    ]


instance FromJSON TeamMemberPackResponse where
  parseJSON (Object o) = do
    teamMemberPackResponseUser <- o .: "user"
    teamMemberPackResponseUserId <- o .: "user_id"
    teamMemberPackResponseTeamMember <- o .: "team_member"
    teamMemberPackResponseTeamMemberId <- o .: "team_member_id"
    teamMemberPackResponsePermissions <- o .: "permissions"
    return $ TeamMemberPackResponse {
      teamMemberPackResponseUser = teamMemberPackResponseUser,
      teamMemberPackResponseUserId = teamMemberPackResponseUserId,
      teamMemberPackResponseTeamMember = teamMemberPackResponseTeamMember,
      teamMemberPackResponseTeamMemberId = teamMemberPackResponseTeamMemberId,
      teamMemberPackResponsePermissions = teamMemberPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamMemberPackResponses where
  toJSON TeamMemberPackResponses{..} = object $
    [ "tag" .= "TeamMemberPackResponses"
    , "team_member_pack_responses" .= teamMemberPackResponses
    ]


instance FromJSON TeamMemberPackResponses where
  parseJSON (Object o) = do
    teamMemberPackResponses <- o .: "team_member_pack_responses"
    return $ TeamMemberPackResponses {
      teamMemberPackResponses = teamMemberPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserPackResponse where
  toJSON UserPackResponse{..} = object $
    [ "tag" .= "UserPackResponse"
    , "user" .= userPackResponseUser
    , "user_id" .= userPackResponseUserId
    , "stat" .= userPackResponseStat
    , "profile" .= userPackResponseProfile
    , "profile_id" .= userPackResponseProfileId
    ]


instance FromJSON UserPackResponse where
  parseJSON (Object o) = do
    userPackResponseUser <- o .: "user"
    userPackResponseUserId <- o .: "user_id"
    userPackResponseStat <- o .: "stat"
    userPackResponseProfile <- o .: "profile"
    userPackResponseProfileId <- o .: "profile_id"
    return $ UserPackResponse {
      userPackResponseUser = userPackResponseUser,
      userPackResponseUserId = userPackResponseUserId,
      userPackResponseStat = userPackResponseStat,
      userPackResponseProfile = userPackResponseProfile,
      userPackResponseProfileId = userPackResponseProfileId
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserPackResponses where
  toJSON UserPackResponses{..} = object $
    [ "tag" .= "UserPackResponses"
    , "user_pack_responses" .= userPackResponses
    ]


instance FromJSON UserPackResponses where
  parseJSON (Object o) = do
    userPackResponses <- o .: "user_pack_responses"
    return $ UserPackResponses {
      userPackResponses = userPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserSanitizedPackResponse where
  toJSON UserSanitizedPackResponse{..} = object $
    [ "tag" .= "UserSanitizedPackResponse"
    , "user" .= userSanitizedPackResponseUser
    , "user_id" .= userSanitizedPackResponseUserId
    , "profile" .= userSanitizedPackResponseProfile
    , "profile_id" .= userSanitizedPackResponseProfileId
    , "stat" .= userSanitizedPackResponseStat
    , "like" .= userSanitizedPackResponseLike
    , "star" .= userSanitizedPackResponseStar
    ]


instance FromJSON UserSanitizedPackResponse where
  parseJSON (Object o) = do
    userSanitizedPackResponseUser <- o .: "user"
    userSanitizedPackResponseUserId <- o .: "user_id"
    userSanitizedPackResponseProfile <- o .: "profile"
    userSanitizedPackResponseProfileId <- o .: "profile_id"
    userSanitizedPackResponseStat <- o .: "stat"
    userSanitizedPackResponseLike <- o .: "like"
    userSanitizedPackResponseStar <- o .: "star"
    return $ UserSanitizedPackResponse {
      userSanitizedPackResponseUser = userSanitizedPackResponseUser,
      userSanitizedPackResponseUserId = userSanitizedPackResponseUserId,
      userSanitizedPackResponseProfile = userSanitizedPackResponseProfile,
      userSanitizedPackResponseProfileId = userSanitizedPackResponseProfileId,
      userSanitizedPackResponseStat = userSanitizedPackResponseStat,
      userSanitizedPackResponseLike = userSanitizedPackResponseLike,
      userSanitizedPackResponseStar = userSanitizedPackResponseStar
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserSanitizedPackResponses where
  toJSON UserSanitizedPackResponses{..} = object $
    [ "tag" .= "UserSanitizedPackResponses"
    , "user_sanitized_pack_responses" .= userSanitizedPackResponses
    ]


instance FromJSON UserSanitizedPackResponses where
  parseJSON (Object o) = do
    userSanitizedPackResponses <- o .: "user_sanitized_pack_responses"
    return $ UserSanitizedPackResponses {
      userSanitizedPackResponses = userSanitizedPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GlobalGroupPackResponse where
  toJSON GlobalGroupPackResponse{..} = object $
    [ "tag" .= "GlobalGroupPackResponse"
    , "user" .= globalGroupPackResponseUser
    , "user_id" .= globalGroupPackResponseUserId
    , "global_group" .= globalGroupPackResponseGlobalGroup
    , "global_group_id" .= globalGroupPackResponseGlobalGroupId
    , "stat" .= globalGroupPackResponseStat
    , "permissions" .= globalGroupPackResponsePermissions
    ]


instance FromJSON GlobalGroupPackResponse where
  parseJSON (Object o) = do
    globalGroupPackResponseUser <- o .: "user"
    globalGroupPackResponseUserId <- o .: "user_id"
    globalGroupPackResponseGlobalGroup <- o .: "global_group"
    globalGroupPackResponseGlobalGroupId <- o .: "global_group_id"
    globalGroupPackResponseStat <- o .: "stat"
    globalGroupPackResponsePermissions <- o .: "permissions"
    return $ GlobalGroupPackResponse {
      globalGroupPackResponseUser = globalGroupPackResponseUser,
      globalGroupPackResponseUserId = globalGroupPackResponseUserId,
      globalGroupPackResponseGlobalGroup = globalGroupPackResponseGlobalGroup,
      globalGroupPackResponseGlobalGroupId = globalGroupPackResponseGlobalGroupId,
      globalGroupPackResponseStat = globalGroupPackResponseStat,
      globalGroupPackResponsePermissions = globalGroupPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GlobalGroupPackResponses where
  toJSON GlobalGroupPackResponses{..} = object $
    [ "tag" .= "GlobalGroupPackResponses"
    , "global_group_pack_responses" .= globalGroupPackResponses
    ]


instance FromJSON GlobalGroupPackResponses where
  parseJSON (Object o) = do
    globalGroupPackResponses <- o .: "global_group_pack_responses"
    return $ GlobalGroupPackResponses {
      globalGroupPackResponses = globalGroupPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupPackResponse where
  toJSON GroupPackResponse{..} = object $
    [ "tag" .= "GroupPackResponse"
    , "user" .= groupPackResponseUser
    , "user_id" .= groupPackResponseUserId
    , "group" .= groupPackResponseGroup
    , "group_id" .= groupPackResponseGroupId
    , "organization" .= groupPackResponseOrganization
    , "organization_id" .= groupPackResponseOrganizationId
    , "stat" .= groupPackResponseStat
    , "permissions" .= groupPackResponsePermissions
    ]


instance FromJSON GroupPackResponse where
  parseJSON (Object o) = do
    groupPackResponseUser <- o .: "user"
    groupPackResponseUserId <- o .: "user_id"
    groupPackResponseGroup <- o .: "group"
    groupPackResponseGroupId <- o .: "group_id"
    groupPackResponseOrganization <- o .: "organization"
    groupPackResponseOrganizationId <- o .: "organization_id"
    groupPackResponseStat <- o .: "stat"
    groupPackResponsePermissions <- o .: "permissions"
    return $ GroupPackResponse {
      groupPackResponseUser = groupPackResponseUser,
      groupPackResponseUserId = groupPackResponseUserId,
      groupPackResponseGroup = groupPackResponseGroup,
      groupPackResponseGroupId = groupPackResponseGroupId,
      groupPackResponseOrganization = groupPackResponseOrganization,
      groupPackResponseOrganizationId = groupPackResponseOrganizationId,
      groupPackResponseStat = groupPackResponseStat,
      groupPackResponsePermissions = groupPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupPackResponses where
  toJSON GroupPackResponses{..} = object $
    [ "tag" .= "GroupPackResponses"
    , "group_pack_responses" .= groupPackResponses
    ]


instance FromJSON GroupPackResponses where
  parseJSON (Object o) = do
    groupPackResponses <- o .: "group_pack_responses"
    return $ GroupPackResponses {
      groupPackResponses = groupPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupMemberPackResponse where
  toJSON GroupMemberPackResponse{..} = object $
    [ "tag" .= "GroupMemberPackResponse"
    , "user" .= groupMemberPackResponseUser
    , "user_id" .= groupMemberPackResponseUserId
    , "group_member" .= groupMemberPackResponseGroupMember
    , "group_member_id" .= groupMemberPackResponseGroupMemberId
    , "is_owner" .= groupMemberPackResponseIsOwner
    ]


instance FromJSON GroupMemberPackResponse where
  parseJSON (Object o) = do
    groupMemberPackResponseUser <- o .: "user"
    groupMemberPackResponseUserId <- o .: "user_id"
    groupMemberPackResponseGroupMember <- o .: "group_member"
    groupMemberPackResponseGroupMemberId <- o .: "group_member_id"
    groupMemberPackResponseIsOwner <- o .: "is_owner"
    return $ GroupMemberPackResponse {
      groupMemberPackResponseUser = groupMemberPackResponseUser,
      groupMemberPackResponseUserId = groupMemberPackResponseUserId,
      groupMemberPackResponseGroupMember = groupMemberPackResponseGroupMember,
      groupMemberPackResponseGroupMemberId = groupMemberPackResponseGroupMemberId,
      groupMemberPackResponseIsOwner = groupMemberPackResponseIsOwner
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON GroupMemberPackResponses where
  toJSON GroupMemberPackResponses{..} = object $
    [ "tag" .= "GroupMemberPackResponses"
    , "group_member_pack_responses" .= groupMemberPackResponses
    ]


instance FromJSON GroupMemberPackResponses where
  parseJSON (Object o) = do
    groupMemberPackResponses <- o .: "group_member_pack_responses"
    return $ GroupMemberPackResponses {
      groupMemberPackResponses = groupMemberPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ForumPackResponse where
  toJSON ForumPackResponse{..} = object $
    [ "tag" .= "ForumPackResponse"
    , "forum" .= forumPackResponseForum
    , "forum_id" .= forumPackResponseForumId
    , "stat" .= forumPackResponseStat
    , "like" .= forumPackResponseLike
    , "star" .= forumPackResponseStar
    , "with_organization" .= forumPackResponseWithOrganization
    , "permissions" .= forumPackResponsePermissions
    ]


instance FromJSON ForumPackResponse where
  parseJSON (Object o) = do
    forumPackResponseForum <- o .: "forum"
    forumPackResponseForumId <- o .: "forum_id"
    forumPackResponseStat <- o .: "stat"
    forumPackResponseLike <- o .: "like"
    forumPackResponseStar <- o .: "star"
    forumPackResponseWithOrganization <- o .: "with_organization"
    forumPackResponsePermissions <- o .: "permissions"
    return $ ForumPackResponse {
      forumPackResponseForum = forumPackResponseForum,
      forumPackResponseForumId = forumPackResponseForumId,
      forumPackResponseStat = forumPackResponseStat,
      forumPackResponseLike = forumPackResponseLike,
      forumPackResponseStar = forumPackResponseStar,
      forumPackResponseWithOrganization = forumPackResponseWithOrganization,
      forumPackResponsePermissions = forumPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ForumPackResponses where
  toJSON ForumPackResponses{..} = object $
    [ "tag" .= "ForumPackResponses"
    , "forum_pack_responses" .= forumPackResponses
    ]


instance FromJSON ForumPackResponses where
  parseJSON (Object o) = do
    forumPackResponses <- o .: "forum_pack_responses"
    return $ ForumPackResponses {
      forumPackResponses = forumPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BoardPackResponse where
  toJSON BoardPackResponse{..} = object $
    [ "tag" .= "BoardPackResponse"
    , "board" .= boardPackResponseBoard
    , "board_id" .= boardPackResponseBoardId
    , "stat" .= boardPackResponseStat
    , "like" .= boardPackResponseLike
    , "star" .= boardPackResponseStar
    , "latest_thread" .= boardPackResponseLatestThread
    , "latest_thread_post" .= boardPackResponseLatestThreadPost
    , "latest_thread_post_user" .= boardPackResponseLatestThreadPostUser
    , "with_organization" .= boardPackResponseWithOrganization
    , "with_forum" .= boardPackResponseWithForum
    , "permissions" .= boardPackResponsePermissions
    ]


instance FromJSON BoardPackResponse where
  parseJSON (Object o) = do
    boardPackResponseBoard <- o .: "board"
    boardPackResponseBoardId <- o .: "board_id"
    boardPackResponseStat <- o .: "stat"
    boardPackResponseLike <- o .: "like"
    boardPackResponseStar <- o .: "star"
    boardPackResponseLatestThread <- o .: "latest_thread"
    boardPackResponseLatestThreadPost <- o .: "latest_thread_post"
    boardPackResponseLatestThreadPostUser <- o .: "latest_thread_post_user"
    boardPackResponseWithOrganization <- o .: "with_organization"
    boardPackResponseWithForum <- o .: "with_forum"
    boardPackResponsePermissions <- o .: "permissions"
    return $ BoardPackResponse {
      boardPackResponseBoard = boardPackResponseBoard,
      boardPackResponseBoardId = boardPackResponseBoardId,
      boardPackResponseStat = boardPackResponseStat,
      boardPackResponseLike = boardPackResponseLike,
      boardPackResponseStar = boardPackResponseStar,
      boardPackResponseLatestThread = boardPackResponseLatestThread,
      boardPackResponseLatestThreadPost = boardPackResponseLatestThreadPost,
      boardPackResponseLatestThreadPostUser = boardPackResponseLatestThreadPostUser,
      boardPackResponseWithOrganization = boardPackResponseWithOrganization,
      boardPackResponseWithForum = boardPackResponseWithForum,
      boardPackResponsePermissions = boardPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BoardPackResponses where
  toJSON BoardPackResponses{..} = object $
    [ "tag" .= "BoardPackResponses"
    , "board_pack_responses" .= boardPackResponses
    ]


instance FromJSON BoardPackResponses where
  parseJSON (Object o) = do
    boardPackResponses <- o .: "board_pack_responses"
    return $ BoardPackResponses {
      boardPackResponses = boardPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPackResponse where
  toJSON ThreadPackResponse{..} = object $
    [ "tag" .= "ThreadPackResponse"
    , "thread" .= threadPackResponseThread
    , "thread_id" .= threadPackResponseThreadId
    , "user" .= threadPackResponseUser
    , "user_id" .= threadPackResponseUserId
    , "stat" .= threadPackResponseStat
    , "like" .= threadPackResponseLike
    , "star" .= threadPackResponseStar
    , "latest_thread_post" .= threadPackResponseLatestThreadPost
    , "latest_thread_post_user" .= threadPackResponseLatestThreadPostUser
    , "with_organization" .= threadPackResponseWithOrganization
    , "with_forum" .= threadPackResponseWithForum
    , "with_board" .= threadPackResponseWithBoard
    , "permissions" .= threadPackResponsePermissions
    ]


instance FromJSON ThreadPackResponse where
  parseJSON (Object o) = do
    threadPackResponseThread <- o .: "thread"
    threadPackResponseThreadId <- o .: "thread_id"
    threadPackResponseUser <- o .: "user"
    threadPackResponseUserId <- o .: "user_id"
    threadPackResponseStat <- o .: "stat"
    threadPackResponseLike <- o .: "like"
    threadPackResponseStar <- o .: "star"
    threadPackResponseLatestThreadPost <- o .: "latest_thread_post"
    threadPackResponseLatestThreadPostUser <- o .: "latest_thread_post_user"
    threadPackResponseWithOrganization <- o .: "with_organization"
    threadPackResponseWithForum <- o .: "with_forum"
    threadPackResponseWithBoard <- o .: "with_board"
    threadPackResponsePermissions <- o .: "permissions"
    return $ ThreadPackResponse {
      threadPackResponseThread = threadPackResponseThread,
      threadPackResponseThreadId = threadPackResponseThreadId,
      threadPackResponseUser = threadPackResponseUser,
      threadPackResponseUserId = threadPackResponseUserId,
      threadPackResponseStat = threadPackResponseStat,
      threadPackResponseLike = threadPackResponseLike,
      threadPackResponseStar = threadPackResponseStar,
      threadPackResponseLatestThreadPost = threadPackResponseLatestThreadPost,
      threadPackResponseLatestThreadPostUser = threadPackResponseLatestThreadPostUser,
      threadPackResponseWithOrganization = threadPackResponseWithOrganization,
      threadPackResponseWithForum = threadPackResponseWithForum,
      threadPackResponseWithBoard = threadPackResponseWithBoard,
      threadPackResponsePermissions = threadPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPackResponses where
  toJSON ThreadPackResponses{..} = object $
    [ "tag" .= "ThreadPackResponses"
    , "thread_pack_responses" .= threadPackResponses
    ]


instance FromJSON ThreadPackResponses where
  parseJSON (Object o) = do
    threadPackResponses <- o .: "thread_pack_responses"
    return $ ThreadPackResponses {
      threadPackResponses = threadPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostPackResponse where
  toJSON ThreadPostPackResponse{..} = object $
    [ "tag" .= "ThreadPostPackResponse"
    , "thread_post" .= threadPostPackResponseThreadPost
    , "thread_post_id" .= threadPostPackResponseThreadPostId
    , "user" .= threadPostPackResponseUser
    , "user_id" .= threadPostPackResponseUserId
    , "stat" .= threadPostPackResponseStat
    , "like" .= threadPostPackResponseLike
    , "star" .= threadPostPackResponseStar
    , "with_organization" .= threadPostPackResponseWithOrganization
    , "with_forum" .= threadPostPackResponseWithForum
    , "with_board" .= threadPostPackResponseWithBoard
    , "with_thread" .= threadPostPackResponseWithThread
    , "permissions" .= threadPostPackResponsePermissions
    ]


instance FromJSON ThreadPostPackResponse where
  parseJSON (Object o) = do
    threadPostPackResponseThreadPost <- o .: "thread_post"
    threadPostPackResponseThreadPostId <- o .: "thread_post_id"
    threadPostPackResponseUser <- o .: "user"
    threadPostPackResponseUserId <- o .: "user_id"
    threadPostPackResponseStat <- o .: "stat"
    threadPostPackResponseLike <- o .: "like"
    threadPostPackResponseStar <- o .: "star"
    threadPostPackResponseWithOrganization <- o .: "with_organization"
    threadPostPackResponseWithForum <- o .: "with_forum"
    threadPostPackResponseWithBoard <- o .: "with_board"
    threadPostPackResponseWithThread <- o .: "with_thread"
    threadPostPackResponsePermissions <- o .: "permissions"
    return $ ThreadPostPackResponse {
      threadPostPackResponseThreadPost = threadPostPackResponseThreadPost,
      threadPostPackResponseThreadPostId = threadPostPackResponseThreadPostId,
      threadPostPackResponseUser = threadPostPackResponseUser,
      threadPostPackResponseUserId = threadPostPackResponseUserId,
      threadPostPackResponseStat = threadPostPackResponseStat,
      threadPostPackResponseLike = threadPostPackResponseLike,
      threadPostPackResponseStar = threadPostPackResponseStar,
      threadPostPackResponseWithOrganization = threadPostPackResponseWithOrganization,
      threadPostPackResponseWithForum = threadPostPackResponseWithForum,
      threadPostPackResponseWithBoard = threadPostPackResponseWithBoard,
      threadPostPackResponseWithThread = threadPostPackResponseWithThread,
      threadPostPackResponsePermissions = threadPostPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostPackResponses where
  toJSON ThreadPostPackResponses{..} = object $
    [ "tag" .= "ThreadPostPackResponses"
    , "thread_post_pack_responses" .= threadPostPackResponses
    ]


instance FromJSON ThreadPostPackResponses where
  parseJSON (Object o) = do
    threadPostPackResponses <- o .: "thread_post_pack_responses"
    return $ ThreadPostPackResponses {
      threadPostPackResponses = threadPostPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ResourcePackResponse where
  toJSON ResourcePackResponse{..} = object $
    [ "tag" .= "ResourcePackResponse"
    , "resource" .= resourcePackResponseResource
    , "resource_id" .= resourcePackResponseResourceId
    , "user" .= resourcePackResponseUser
    , "user_id" .= resourcePackResponseUserId
    , "stat" .= resourcePackResponseStat
    , "like" .= resourcePackResponseLike
    , "star" .= resourcePackResponseStar
    , "permissions" .= resourcePackResponsePermissions
    ]


instance FromJSON ResourcePackResponse where
  parseJSON (Object o) = do
    resourcePackResponseResource <- o .: "resource"
    resourcePackResponseResourceId <- o .: "resource_id"
    resourcePackResponseUser <- o .: "user"
    resourcePackResponseUserId <- o .: "user_id"
    resourcePackResponseStat <- o .: "stat"
    resourcePackResponseLike <- o .: "like"
    resourcePackResponseStar <- o .: "star"
    resourcePackResponsePermissions <- o .: "permissions"
    return $ ResourcePackResponse {
      resourcePackResponseResource = resourcePackResponseResource,
      resourcePackResponseResourceId = resourcePackResponseResourceId,
      resourcePackResponseUser = resourcePackResponseUser,
      resourcePackResponseUserId = resourcePackResponseUserId,
      resourcePackResponseStat = resourcePackResponseStat,
      resourcePackResponseLike = resourcePackResponseLike,
      resourcePackResponseStar = resourcePackResponseStar,
      resourcePackResponsePermissions = resourcePackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ResourcePackResponses where
  toJSON ResourcePackResponses{..} = object $
    [ "tag" .= "ResourcePackResponses"
    , "resource_pack_responses" .= resourcePackResponses
    ]


instance FromJSON ResourcePackResponses where
  parseJSON (Object o) = do
    resourcePackResponses <- o .: "resource_pack_responses"
    return $ ResourcePackResponses {
      resourcePackResponses = resourcePackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronPackResponse where
  toJSON LeuronPackResponse{..} = object $
    [ "tag" .= "LeuronPackResponse"
    , "leuron" .= leuronPackResponseLeuron
    , "leuron_id" .= leuronPackResponseLeuronId
    , "user" .= leuronPackResponseUser
    , "user_id" .= leuronPackResponseUserId
    , "training" .= leuronPackResponseTraining
    , "stat" .= leuronPackResponseStat
    , "like" .= leuronPackResponseLike
    , "star" .= leuronPackResponseStar
    , "permissions" .= leuronPackResponsePermissions
    ]


instance FromJSON LeuronPackResponse where
  parseJSON (Object o) = do
    leuronPackResponseLeuron <- o .: "leuron"
    leuronPackResponseLeuronId <- o .: "leuron_id"
    leuronPackResponseUser <- o .: "user"
    leuronPackResponseUserId <- o .: "user_id"
    leuronPackResponseTraining <- o .: "training"
    leuronPackResponseStat <- o .: "stat"
    leuronPackResponseLike <- o .: "like"
    leuronPackResponseStar <- o .: "star"
    leuronPackResponsePermissions <- o .: "permissions"
    return $ LeuronPackResponse {
      leuronPackResponseLeuron = leuronPackResponseLeuron,
      leuronPackResponseLeuronId = leuronPackResponseLeuronId,
      leuronPackResponseUser = leuronPackResponseUser,
      leuronPackResponseUserId = leuronPackResponseUserId,
      leuronPackResponseTraining = leuronPackResponseTraining,
      leuronPackResponseStat = leuronPackResponseStat,
      leuronPackResponseLike = leuronPackResponseLike,
      leuronPackResponseStar = leuronPackResponseStar,
      leuronPackResponsePermissions = leuronPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON LeuronPackResponses where
  toJSON LeuronPackResponses{..} = object $
    [ "tag" .= "LeuronPackResponses"
    , "leuron_pack_responses" .= leuronPackResponses
    ]


instance FromJSON LeuronPackResponses where
  parseJSON (Object o) = do
    leuronPackResponses <- o .: "leuron_pack_responses"
    return $ LeuronPackResponses {
      leuronPackResponses = leuronPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmInPackResponse where
  toJSON PmInPackResponse{..} = object $
    [ "tag" .= "PmInPackResponse"
    , "pm_in" .= pmInPackResponsePmIn
    , "pm_in_id" .= pmInPackResponsePmInId
    , "user" .= pmInPackResponseUser
    , "user_id" .= pmInPackResponseUserId
    ]


instance FromJSON PmInPackResponse where
  parseJSON (Object o) = do
    pmInPackResponsePmIn <- o .: "pm_in"
    pmInPackResponsePmInId <- o .: "pm_in_id"
    pmInPackResponseUser <- o .: "user"
    pmInPackResponseUserId <- o .: "user_id"
    return $ PmInPackResponse {
      pmInPackResponsePmIn = pmInPackResponsePmIn,
      pmInPackResponsePmInId = pmInPackResponsePmInId,
      pmInPackResponseUser = pmInPackResponseUser,
      pmInPackResponseUserId = pmInPackResponseUserId
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmInPackResponses where
  toJSON PmInPackResponses{..} = object $
    [ "tag" .= "PmInPackResponses"
    , "pm_in_pack_responses" .= pmInPackResponses
    ]


instance FromJSON PmInPackResponses where
  parseJSON (Object o) = do
    pmInPackResponses <- o .: "pm_in_pack_responses"
    return $ PmInPackResponses {
      pmInPackResponses = pmInPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmOutPackResponse where
  toJSON PmOutPackResponse{..} = object $
    [ "tag" .= "PmOutPackResponse"
    , "pm_out" .= pmOutPackResponsePmOut
    , "pm_out_id" .= pmOutPackResponsePmOutId
    , "user" .= pmOutPackResponseUser
    , "user_id" .= pmOutPackResponseUserId
    ]


instance FromJSON PmOutPackResponse where
  parseJSON (Object o) = do
    pmOutPackResponsePmOut <- o .: "pm_out"
    pmOutPackResponsePmOutId <- o .: "pm_out_id"
    pmOutPackResponseUser <- o .: "user"
    pmOutPackResponseUserId <- o .: "user_id"
    return $ PmOutPackResponse {
      pmOutPackResponsePmOut = pmOutPackResponsePmOut,
      pmOutPackResponsePmOutId = pmOutPackResponsePmOutId,
      pmOutPackResponseUser = pmOutPackResponseUser,
      pmOutPackResponseUserId = pmOutPackResponseUserId
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON PmOutPackResponses where
  toJSON PmOutPackResponses{..} = object $
    [ "tag" .= "PmOutPackResponses"
    , "pm_out_pack_responses" .= pmOutPackResponses
    ]


instance FromJSON PmOutPackResponses where
  parseJSON (Object o) = do
    pmOutPackResponses <- o .: "pm_out_pack_responses"
    return $ PmOutPackResponses {
      pmOutPackResponses = pmOutPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x

-- footer