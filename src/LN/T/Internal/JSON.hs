{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}
{-# LANGUAGE ScopedTypeVariables  #-}

module LN.T.Internal.JSON where




import           Data.Aeson          (FromJSON, ToJSON (), Value (..), parseJSON, toJSON, object, (.=), (.:))
import           Data.Text           (Text)
import qualified Data.Text           as T
import           Data.Monoid         ((<>))
import           Haskell.Api.Helpers (QueryParam, qp)

import LN.T.Internal.Types

instance FromJSON ACL where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("ACL_Grant" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ACL_Grant <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ACL_Grant"

      ("ACL_Deny" :: Text) -> do
        pure ACL_Deny

      _ -> fail "Could not parse ACL"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ACL where
  toJSON (ACL_Grant x0) = object $
    [ "tag" .= ("ACL_Grant" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ACL_Deny ) = object $
    [ "tag" .= ("ACL_Deny" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq ACL where
  (==) (ACL_Grant x0a) (ACL_Grant x0b) = x0a == x0b
  (==) ACL_Deny ACL_Deny = True
  (==) _ _ = False

instance FromJSON ApiRequest where
  parseJSON (Object o) = do
    apiRequestComment <- o .: ("comment" :: Text)
    apiRequestGuard <- o .: ("guard" :: Text)
    pure $ ApiRequest {
      apiRequestComment = apiRequestComment,
      apiRequestGuard = apiRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ApiRequest where
  toJSON ApiRequest{..} = object $
    [ "tag" .= ("ApiRequest" :: Text)
    , "comment" .= apiRequestComment
    , "guard" .= apiRequestGuard
    ]


instance Eq ApiRequest where
  (==) a b = apiRequestComment a == apiRequestComment b && apiRequestGuard a == apiRequestGuard b

instance FromJSON ApiResponse where
  parseJSON (Object o) = do
    apiResponseId <- o .: ("id" :: Text)
    apiResponseUserId <- o .: ("user_id" :: Text)
    apiResponseKey <- o .: ("key" :: Text)
    apiResponseComment <- o .: ("comment" :: Text)
    apiResponseGuard <- o .: ("guard" :: Text)
    apiResponseCreatedAt <- o .: ("created_at" :: Text)
    apiResponseModifiedAt <- o .: ("modified_at" :: Text)
    pure $ ApiResponse {
      apiResponseId = apiResponseId,
      apiResponseUserId = apiResponseUserId,
      apiResponseKey = apiResponseKey,
      apiResponseComment = apiResponseComment,
      apiResponseGuard = apiResponseGuard,
      apiResponseCreatedAt = apiResponseCreatedAt,
      apiResponseModifiedAt = apiResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ApiResponse where
  toJSON ApiResponse{..} = object $
    [ "tag" .= ("ApiResponse" :: Text)
    , "id" .= apiResponseId
    , "user_id" .= apiResponseUserId
    , "key" .= apiResponseKey
    , "comment" .= apiResponseComment
    , "guard" .= apiResponseGuard
    , "created_at" .= apiResponseCreatedAt
    , "modified_at" .= apiResponseModifiedAt
    ]


instance Eq ApiResponse where
  (==) a b = apiResponseId a == apiResponseId b && apiResponseUserId a == apiResponseUserId b && apiResponseKey a == apiResponseKey b && apiResponseComment a == apiResponseComment b && apiResponseGuard a == apiResponseGuard b && apiResponseCreatedAt a == apiResponseCreatedAt b && apiResponseModifiedAt a == apiResponseModifiedAt b

instance FromJSON ApiResponses where
  parseJSON (Object o) = do
    apiResponses <- o .: ("api_responses" :: Text)
    pure $ ApiResponses {
      apiResponses = apiResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ApiResponses where
  toJSON ApiResponses{..} = object $
    [ "tag" .= ("ApiResponses" :: Text)
    , "api_responses" .= apiResponses
    ]


instance Eq ApiResponses where
  (==) a b = apiResponses a == apiResponses b

instance FromJSON BoardRequest where
  parseJSON (Object o) = do
    boardRequestDisplayName <- o .: ("display_name" :: Text)
    boardRequestDescription <- o .: ("description" :: Text)
    boardRequestIsAnonymous <- o .: ("is_anonymous" :: Text)
    boardRequestCanCreateSubBoards <- o .: ("can_create_sub_boards" :: Text)
    boardRequestCanCreateThreads <- o .: ("can_create_threads" :: Text)
    boardRequestSuggestedTags <- o .: ("suggested_tags" :: Text)
    boardRequestIcon <- o .: ("icon" :: Text)
    boardRequestTags <- o .: ("tags" :: Text)
    boardRequestGuard <- o .: ("guard" :: Text)
    pure $ BoardRequest {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BoardRequest where
  toJSON BoardRequest{..} = object $
    [ "tag" .= ("BoardRequest" :: Text)
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


instance Eq BoardRequest where
  (==) a b = boardRequestDisplayName a == boardRequestDisplayName b && boardRequestDescription a == boardRequestDescription b && boardRequestIsAnonymous a == boardRequestIsAnonymous b && boardRequestCanCreateSubBoards a == boardRequestCanCreateSubBoards b && boardRequestCanCreateThreads a == boardRequestCanCreateThreads b && boardRequestSuggestedTags a == boardRequestSuggestedTags b && boardRequestIcon a == boardRequestIcon b && boardRequestTags a == boardRequestTags b && boardRequestGuard a == boardRequestGuard b

instance FromJSON BoardResponse where
  parseJSON (Object o) = do
    boardResponseId <- o .: ("id" :: Text)
    boardResponseUserId <- o .: ("user_id" :: Text)
    boardResponseOrgId <- o .: ("org_id" :: Text)
    boardResponseForumId <- o .: ("forum_id" :: Text)
    boardResponseParentId <- o .: ("parent_id" :: Text)
    boardResponseName <- o .: ("name" :: Text)
    boardResponseDisplayName <- o .: ("display_name" :: Text)
    boardResponseDescription <- o .: ("description" :: Text)
    boardResponseIsAnonymous <- o .: ("is_anonymous" :: Text)
    boardResponseCanCreateSubBoards <- o .: ("can_create_sub_boards" :: Text)
    boardResponseCanCreateThreads <- o .: ("can_create_threads" :: Text)
    boardResponseSuggestedTags <- o .: ("suggested_tags" :: Text)
    boardResponseIcon <- o .: ("icon" :: Text)
    boardResponseTags <- o .: ("tags" :: Text)
    boardResponseActive <- o .: ("active" :: Text)
    boardResponseGuard <- o .: ("guard" :: Text)
    boardResponseCreatedAt <- o .: ("created_at" :: Text)
    boardResponseModifiedBy <- o .: ("modified_by" :: Text)
    boardResponseModifiedAt <- o .: ("modified_at" :: Text)
    boardResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ BoardResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BoardResponse where
  toJSON BoardResponse{..} = object $
    [ "tag" .= ("BoardResponse" :: Text)
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


instance Eq BoardResponse where
  (==) a b = boardResponseId a == boardResponseId b && boardResponseUserId a == boardResponseUserId b && boardResponseOrgId a == boardResponseOrgId b && boardResponseForumId a == boardResponseForumId b && boardResponseParentId a == boardResponseParentId b && boardResponseName a == boardResponseName b && boardResponseDisplayName a == boardResponseDisplayName b && boardResponseDescription a == boardResponseDescription b && boardResponseIsAnonymous a == boardResponseIsAnonymous b && boardResponseCanCreateSubBoards a == boardResponseCanCreateSubBoards b && boardResponseCanCreateThreads a == boardResponseCanCreateThreads b && boardResponseSuggestedTags a == boardResponseSuggestedTags b && boardResponseIcon a == boardResponseIcon b && boardResponseTags a == boardResponseTags b && boardResponseActive a == boardResponseActive b && boardResponseGuard a == boardResponseGuard b && boardResponseCreatedAt a == boardResponseCreatedAt b && boardResponseModifiedBy a == boardResponseModifiedBy b && boardResponseModifiedAt a == boardResponseModifiedAt b && boardResponseActivityAt a == boardResponseActivityAt b

instance FromJSON BoardResponses where
  parseJSON (Object o) = do
    boardResponses <- o .: ("board_responses" :: Text)
    pure $ BoardResponses {
      boardResponses = boardResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BoardResponses where
  toJSON BoardResponses{..} = object $
    [ "tag" .= ("BoardResponses" :: Text)
    , "board_responses" .= boardResponses
    ]


instance Eq BoardResponses where
  (==) a b = boardResponses a == boardResponses b

instance FromJSON BoardStatResponse where
  parseJSON (Object o) = do
    boardStatResponseBoardId <- o .: ("board_id" :: Text)
    boardStatResponseThreads <- o .: ("threads" :: Text)
    boardStatResponseThreadPosts <- o .: ("thread_posts" :: Text)
    boardStatResponseViews <- o .: ("views" :: Text)
    pure $ BoardStatResponse {
      boardStatResponseBoardId = boardStatResponseBoardId,
      boardStatResponseThreads = boardStatResponseThreads,
      boardStatResponseThreadPosts = boardStatResponseThreadPosts,
      boardStatResponseViews = boardStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BoardStatResponse where
  toJSON BoardStatResponse{..} = object $
    [ "tag" .= ("BoardStatResponse" :: Text)
    , "board_id" .= boardStatResponseBoardId
    , "threads" .= boardStatResponseThreads
    , "thread_posts" .= boardStatResponseThreadPosts
    , "views" .= boardStatResponseViews
    ]


instance Eq BoardStatResponse where
  (==) a b = boardStatResponseBoardId a == boardStatResponseBoardId b && boardStatResponseThreads a == boardStatResponseThreads b && boardStatResponseThreadPosts a == boardStatResponseThreadPosts b && boardStatResponseViews a == boardStatResponseViews b

instance FromJSON BoardStatResponses where
  parseJSON (Object o) = do
    boardStatResponses <- o .: ("board_stat_responses" :: Text)
    pure $ BoardStatResponses {
      boardStatResponses = boardStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BoardStatResponses where
  toJSON BoardStatResponses{..} = object $
    [ "tag" .= ("BoardStatResponses" :: Text)
    , "board_stat_responses" .= boardStatResponses
    ]


instance Eq BoardStatResponses where
  (==) a b = boardStatResponses a == boardStatResponses b

instance FromJSON BucketRequest where
  parseJSON (Object o) = do
    bucketRequestDisplayName <- o .: ("display_name" :: Text)
    bucketRequestDescription <- o .: ("description" :: Text)
    bucketRequestScoreLo <- o .: ("score_lo" :: Text)
    bucketRequestScoreHi <- o .: ("score_hi" :: Text)
    bucketRequestLeurons <- o .: ("leurons" :: Text)
    bucketRequestResources <- o .: ("resources" :: Text)
    bucketRequestCategories <- o .: ("categories" :: Text)
    bucketRequestFilters <- o .: ("filters" :: Text)
    bucketRequestGuard <- o .: ("guard" :: Text)
    pure $ BucketRequest {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BucketRequest where
  toJSON BucketRequest{..} = object $
    [ "tag" .= ("BucketRequest" :: Text)
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


instance Eq BucketRequest where
  (==) a b = bucketRequestDisplayName a == bucketRequestDisplayName b && bucketRequestDescription a == bucketRequestDescription b && bucketRequestScoreLo a == bucketRequestScoreLo b && bucketRequestScoreHi a == bucketRequestScoreHi b && bucketRequestLeurons a == bucketRequestLeurons b && bucketRequestResources a == bucketRequestResources b && bucketRequestCategories a == bucketRequestCategories b && bucketRequestFilters a == bucketRequestFilters b && bucketRequestGuard a == bucketRequestGuard b

instance FromJSON BucketResponse where
  parseJSON (Object o) = do
    bucketResponseId <- o .: ("id" :: Text)
    bucketResponseUserId <- o .: ("user_id" :: Text)
    bucketResponseName <- o .: ("name" :: Text)
    bucketResponseDisplayName <- o .: ("display_name" :: Text)
    bucketResponseDescription <- o .: ("description" :: Text)
    bucketResponseScoreLo <- o .: ("score_lo" :: Text)
    bucketResponseScoreHi <- o .: ("score_hi" :: Text)
    bucketResponseLeurons <- o .: ("leurons" :: Text)
    bucketResponseResources <- o .: ("resources" :: Text)
    bucketResponseCategories <- o .: ("categories" :: Text)
    bucketResponseFilters <- o .: ("filters" :: Text)
    bucketResponseActive <- o .: ("active" :: Text)
    bucketResponseGuard <- o .: ("guard" :: Text)
    bucketResponseCreatedAt <- o .: ("created_at" :: Text)
    bucketResponseModifiedAt <- o .: ("modified_at" :: Text)
    bucketResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ BucketResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BucketResponse where
  toJSON BucketResponse{..} = object $
    [ "tag" .= ("BucketResponse" :: Text)
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


instance Eq BucketResponse where
  (==) a b = bucketResponseId a == bucketResponseId b && bucketResponseUserId a == bucketResponseUserId b && bucketResponseName a == bucketResponseName b && bucketResponseDisplayName a == bucketResponseDisplayName b && bucketResponseDescription a == bucketResponseDescription b && bucketResponseScoreLo a == bucketResponseScoreLo b && bucketResponseScoreHi a == bucketResponseScoreHi b && bucketResponseLeurons a == bucketResponseLeurons b && bucketResponseResources a == bucketResponseResources b && bucketResponseCategories a == bucketResponseCategories b && bucketResponseFilters a == bucketResponseFilters b && bucketResponseActive a == bucketResponseActive b && bucketResponseGuard a == bucketResponseGuard b && bucketResponseCreatedAt a == bucketResponseCreatedAt b && bucketResponseModifiedAt a == bucketResponseModifiedAt b && bucketResponseActivityAt a == bucketResponseActivityAt b

instance FromJSON BucketResponses where
  parseJSON (Object o) = do
    bucketResponses <- o .: ("bucket_responses" :: Text)
    pure $ BucketResponses {
      bucketResponses = bucketResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BucketResponses where
  toJSON BucketResponses{..} = object $
    [ "tag" .= ("BucketResponses" :: Text)
    , "bucket_responses" .= bucketResponses
    ]


instance Eq BucketResponses where
  (==) a b = bucketResponses a == bucketResponses b

instance FromJSON CountResponse where
  parseJSON (Object o) = do
    countResponseId <- o .: ("id" :: Text)
    countResponseN <- o .: ("n" :: Text)
    pure $ CountResponse {
      countResponseId = countResponseId,
      countResponseN = countResponseN
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON CountResponse where
  toJSON CountResponse{..} = object $
    [ "tag" .= ("CountResponse" :: Text)
    , "id" .= countResponseId
    , "n" .= countResponseN
    ]


instance Eq CountResponse where
  (==) a b = countResponseId a == countResponseId b && countResponseN a == countResponseN b

instance FromJSON CountResponses where
  parseJSON (Object o) = do
    countResponses <- o .: ("count_responses" :: Text)
    pure $ CountResponses {
      countResponses = countResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON CountResponses where
  toJSON CountResponses{..} = object $
    [ "tag" .= ("CountResponses" :: Text)
    , "count_responses" .= countResponses
    ]


instance Eq CountResponses where
  (==) a b = countResponses a == countResponses b

instance FromJSON EmptyRequest where
  parseJSON (Object o) = do
    emptyRequestValue <- o .: ("value" :: Text)
    pure $ EmptyRequest {
      emptyRequestValue = emptyRequestValue
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON EmptyRequest where
  toJSON EmptyRequest{..} = object $
    [ "tag" .= ("EmptyRequest" :: Text)
    , "value" .= emptyRequestValue
    ]


instance Eq EmptyRequest where
  (==) a b = emptyRequestValue a == emptyRequestValue b

instance FromJSON EmptyResponse where
  parseJSON (Object o) = do
    emptyResponseId <- o .: ("id" :: Text)
    emptyResponseUserId <- o .: ("user_id" :: Text)
    emptyResponseValue <- o .: ("value" :: Text)
    emptyResponseCreatedAt <- o .: ("created_at" :: Text)
    emptyResponseModifiedAt <- o .: ("modified_at" :: Text)
    pure $ EmptyResponse {
      emptyResponseId = emptyResponseId,
      emptyResponseUserId = emptyResponseUserId,
      emptyResponseValue = emptyResponseValue,
      emptyResponseCreatedAt = emptyResponseCreatedAt,
      emptyResponseModifiedAt = emptyResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON EmptyResponse where
  toJSON EmptyResponse{..} = object $
    [ "tag" .= ("EmptyResponse" :: Text)
    , "id" .= emptyResponseId
    , "user_id" .= emptyResponseUserId
    , "value" .= emptyResponseValue
    , "created_at" .= emptyResponseCreatedAt
    , "modified_at" .= emptyResponseModifiedAt
    ]


instance Eq EmptyResponse where
  (==) a b = emptyResponseId a == emptyResponseId b && emptyResponseUserId a == emptyResponseUserId b && emptyResponseValue a == emptyResponseValue b && emptyResponseCreatedAt a == emptyResponseCreatedAt b && emptyResponseModifiedAt a == emptyResponseModifiedAt b

instance FromJSON EmptyResponses where
  parseJSON (Object o) = do
    emptyResponses <- o .: ("empty_responses" :: Text)
    pure $ EmptyResponses {
      emptyResponses = emptyResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON EmptyResponses where
  toJSON EmptyResponses{..} = object $
    [ "tag" .= ("EmptyResponses" :: Text)
    , "empty_responses" .= emptyResponses
    ]


instance Eq EmptyResponses where
  (==) a b = emptyResponses a == emptyResponses b

instance FromJSON Ent where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("Ent_Organization" :: Text) -> do
        pure Ent_Organization

      ("Ent_Team" :: Text) -> do
        pure Ent_Team

      ("Ent_TeamMember" :: Text) -> do
        pure Ent_TeamMember

      ("Ent_GlobalGroup" :: Text) -> do
        pure Ent_GlobalGroup

      ("Ent_Group" :: Text) -> do
        pure Ent_Group

      ("Ent_GroupMember" :: Text) -> do
        pure Ent_GroupMember

      ("Ent_User" :: Text) -> do
        pure Ent_User

      ("Ent_UserSanitized" :: Text) -> do
        pure Ent_UserSanitized

      ("Ent_Forum" :: Text) -> do
        pure Ent_Forum

      ("Ent_Board" :: Text) -> do
        pure Ent_Board

      ("Ent_Thread" :: Text) -> do
        pure Ent_Thread

      ("Ent_ThreadPost" :: Text) -> do
        pure Ent_ThreadPost

      ("Ent_Blog" :: Text) -> do
        pure Ent_Blog

      ("Ent_BlogPost" :: Text) -> do
        pure Ent_BlogPost

      ("Ent_BlogComment" :: Text) -> do
        pure Ent_BlogComment

      ("Ent_Resource" :: Text) -> do
        pure Ent_Resource

      ("Ent_Leuron" :: Text) -> do
        pure Ent_Leuron

      ("Ent_Comment" :: Text) -> do
        pure Ent_Comment

      ("Ent_Api" :: Text) -> do
        pure Ent_Api

      ("Ent_Like" :: Text) -> do
        pure Ent_Like

      ("Ent_Star" :: Text) -> do
        pure Ent_Star

      ("Ent_None" :: Text) -> do
        pure Ent_None

      _ -> fail "Could not parse Ent"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Ent where
  toJSON (Ent_Organization ) = object $
    [ "tag" .= ("Ent_Organization" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Team ) = object $
    [ "tag" .= ("Ent_Team" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_TeamMember ) = object $
    [ "tag" .= ("Ent_TeamMember" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_GlobalGroup ) = object $
    [ "tag" .= ("Ent_GlobalGroup" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Group ) = object $
    [ "tag" .= ("Ent_Group" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_GroupMember ) = object $
    [ "tag" .= ("Ent_GroupMember" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_User ) = object $
    [ "tag" .= ("Ent_User" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_UserSanitized ) = object $
    [ "tag" .= ("Ent_UserSanitized" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Forum ) = object $
    [ "tag" .= ("Ent_Forum" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Board ) = object $
    [ "tag" .= ("Ent_Board" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Thread ) = object $
    [ "tag" .= ("Ent_Thread" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_ThreadPost ) = object $
    [ "tag" .= ("Ent_ThreadPost" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Blog ) = object $
    [ "tag" .= ("Ent_Blog" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_BlogPost ) = object $
    [ "tag" .= ("Ent_BlogPost" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_BlogComment ) = object $
    [ "tag" .= ("Ent_BlogComment" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Resource ) = object $
    [ "tag" .= ("Ent_Resource" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Leuron ) = object $
    [ "tag" .= ("Ent_Leuron" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Comment ) = object $
    [ "tag" .= ("Ent_Comment" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Api ) = object $
    [ "tag" .= ("Ent_Api" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Like ) = object $
    [ "tag" .= ("Ent_Like" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_Star ) = object $
    [ "tag" .= ("Ent_Star" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Ent_None ) = object $
    [ "tag" .= ("Ent_None" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq Ent where
  (==) Ent_Organization Ent_Organization = True
  (==) Ent_Team Ent_Team = True
  (==) Ent_TeamMember Ent_TeamMember = True
  (==) Ent_GlobalGroup Ent_GlobalGroup = True
  (==) Ent_Group Ent_Group = True
  (==) Ent_GroupMember Ent_GroupMember = True
  (==) Ent_User Ent_User = True
  (==) Ent_UserSanitized Ent_UserSanitized = True
  (==) Ent_Forum Ent_Forum = True
  (==) Ent_Board Ent_Board = True
  (==) Ent_Thread Ent_Thread = True
  (==) Ent_ThreadPost Ent_ThreadPost = True
  (==) Ent_Blog Ent_Blog = True
  (==) Ent_BlogPost Ent_BlogPost = True
  (==) Ent_BlogComment Ent_BlogComment = True
  (==) Ent_Resource Ent_Resource = True
  (==) Ent_Leuron Ent_Leuron = True
  (==) Ent_Comment Ent_Comment = True
  (==) Ent_Api Ent_Api = True
  (==) Ent_Like Ent_Like = True
  (==) Ent_Star Ent_Star = True
  (==) Ent_None Ent_None = True
  (==) _ _ = False

instance FromJSON ApplicationError where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("Error_Unknown" :: Text) -> do
        pure Error_Unknown

      ("Error_NotFound" :: Text) -> do
        pure Error_NotFound

      ("Error_PermissionDenied" :: Text) -> do
        pure Error_PermissionDenied

      ("Error_AlreadyExists" :: Text) -> do
        pure Error_AlreadyExists

      ("Error_Visibility" :: Text) -> do
        pure Error_Visibility

      ("Error_Membership" :: Text) -> do
        pure Error_Membership

      ("Error_Validation" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> Error_Validation <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: Error_Validation"

      ("Error_NotImplemented" :: Text) -> do
        pure Error_NotImplemented

      ("Error_InvalidArguments" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> Error_InvalidArguments <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: Error_InvalidArguments"

      ("Error_Unexpected" :: Text) -> do
        pure Error_Unexpected

      _ -> fail "Could not parse ApplicationError"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ApplicationError where
  toJSON (Error_Unknown ) = object $
    [ "tag" .= ("Error_Unknown" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_NotFound ) = object $
    [ "tag" .= ("Error_NotFound" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_PermissionDenied ) = object $
    [ "tag" .= ("Error_PermissionDenied" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_AlreadyExists ) = object $
    [ "tag" .= ("Error_AlreadyExists" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_Visibility ) = object $
    [ "tag" .= ("Error_Visibility" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_Membership ) = object $
    [ "tag" .= ("Error_Membership" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_Validation x0) = object $
    [ "tag" .= ("Error_Validation" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (Error_NotImplemented ) = object $
    [ "tag" .= ("Error_NotImplemented" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Error_InvalidArguments x0) = object $
    [ "tag" .= ("Error_InvalidArguments" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (Error_Unexpected ) = object $
    [ "tag" .= ("Error_Unexpected" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq ApplicationError where
  (==) Error_Unknown Error_Unknown = True
  (==) Error_NotFound Error_NotFound = True
  (==) Error_PermissionDenied Error_PermissionDenied = True
  (==) Error_AlreadyExists Error_AlreadyExists = True
  (==) Error_Visibility Error_Visibility = True
  (==) Error_Membership Error_Membership = True
  (==) (Error_Validation x0a) (Error_Validation x0b) = x0a == x0b
  (==) Error_NotImplemented Error_NotImplemented = True
  (==) (Error_InvalidArguments x0a) (Error_InvalidArguments x0b) = x0a == x0b
  (==) Error_Unexpected Error_Unexpected = True
  (==) _ _ = False

instance FromJSON ValidationError where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("Validate" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0, x1] -> Validate <$> parseJSON x0 <*> parseJSON x1
          _ -> fail "FromJON Typemismatch: Validate"

      _ -> fail "Could not parse ValidationError"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ValidationError where
  toJSON (Validate x0 x1) = object $
    [ "tag" .= ("Validate" :: Text)
    , "contents" .= [toJSON x0, toJSON x1]
    ]


instance Eq ValidationError where
  (==) (Validate x0a x1a) (Validate x0b x1b) = x0a == x0b && x1a == x1b


instance FromJSON ValidationErrorCode where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("Validate_Unknown" :: Text) -> do
        pure Validate_Unknown

      ("Validate_InvalidCharacters" :: Text) -> do
        pure Validate_InvalidCharacters

      ("Validate_InvalidEmail" :: Text) -> do
        pure Validate_InvalidEmail

      ("Validate_InvalidDate" :: Text) -> do
        pure Validate_InvalidDate

      ("Validate_CannotBeEmpty" :: Text) -> do
        pure Validate_CannotBeEmpty

      ("Validate_TooLong" :: Text) -> do
        pure Validate_TooLong

      ("Validate_TooShort" :: Text) -> do
        pure Validate_TooShort

      ("Validate_GreaterThanMaximum" :: Text) -> do
        pure Validate_GreaterThanMaximum

      ("Validate_SmallerThanMinimum" :: Text) -> do
        pure Validate_SmallerThanMinimum

      ("Validate_Reason" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> Validate_Reason <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: Validate_Reason"

      _ -> fail "Could not parse ValidationErrorCode"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ValidationErrorCode where
  toJSON (Validate_Unknown ) = object $
    [ "tag" .= ("Validate_Unknown" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Validate_InvalidCharacters ) = object $
    [ "tag" .= ("Validate_InvalidCharacters" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Validate_InvalidEmail ) = object $
    [ "tag" .= ("Validate_InvalidEmail" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Validate_InvalidDate ) = object $
    [ "tag" .= ("Validate_InvalidDate" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Validate_CannotBeEmpty ) = object $
    [ "tag" .= ("Validate_CannotBeEmpty" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Validate_TooLong ) = object $
    [ "tag" .= ("Validate_TooLong" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Validate_TooShort ) = object $
    [ "tag" .= ("Validate_TooShort" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Validate_GreaterThanMaximum ) = object $
    [ "tag" .= ("Validate_GreaterThanMaximum" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Validate_SmallerThanMinimum ) = object $
    [ "tag" .= ("Validate_SmallerThanMinimum" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Validate_Reason x0) = object $
    [ "tag" .= ("Validate_Reason" :: Text)
    , "contents" .= [toJSON x0]
    ]


instance Eq ValidationErrorCode where
  (==) Validate_Unknown Validate_Unknown = True
  (==) Validate_InvalidCharacters Validate_InvalidCharacters = True
  (==) Validate_InvalidEmail Validate_InvalidEmail = True
  (==) Validate_InvalidDate Validate_InvalidDate = True
  (==) Validate_CannotBeEmpty Validate_CannotBeEmpty = True
  (==) Validate_TooLong Validate_TooLong = True
  (==) Validate_TooShort Validate_TooShort = True
  (==) Validate_GreaterThanMaximum Validate_GreaterThanMaximum = True
  (==) Validate_SmallerThanMinimum Validate_SmallerThanMinimum = True
  (==) (Validate_Reason x0a) (Validate_Reason x0b) = x0a == x0b
  (==) _ _ = False

instance FromJSON ForumRequest where
  parseJSON (Object o) = do
    forumRequestDisplayName <- o .: ("display_name" :: Text)
    forumRequestDescription <- o .: ("description" :: Text)
    forumRequestThreadsPerBoard <- o .: ("threads_per_board" :: Text)
    forumRequestThreadPostsPerThread <- o .: ("thread_posts_per_thread" :: Text)
    forumRequestRecentThreadsLimit <- o .: ("recent_threads_limit" :: Text)
    forumRequestRecentPostsLimit <- o .: ("recent_posts_limit" :: Text)
    forumRequestMotwLimit <- o .: ("motw_limit" :: Text)
    forumRequestIcon <- o .: ("icon" :: Text)
    forumRequestTags <- o .: ("tags" :: Text)
    forumRequestVisibility <- o .: ("visibility" :: Text)
    forumRequestGuard <- o .: ("guard" :: Text)
    pure $ ForumRequest {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ForumRequest where
  toJSON ForumRequest{..} = object $
    [ "tag" .= ("ForumRequest" :: Text)
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


instance Eq ForumRequest where
  (==) a b = forumRequestDisplayName a == forumRequestDisplayName b && forumRequestDescription a == forumRequestDescription b && forumRequestThreadsPerBoard a == forumRequestThreadsPerBoard b && forumRequestThreadPostsPerThread a == forumRequestThreadPostsPerThread b && forumRequestRecentThreadsLimit a == forumRequestRecentThreadsLimit b && forumRequestRecentPostsLimit a == forumRequestRecentPostsLimit b && forumRequestMotwLimit a == forumRequestMotwLimit b && forumRequestIcon a == forumRequestIcon b && forumRequestTags a == forumRequestTags b && forumRequestVisibility a == forumRequestVisibility b && forumRequestGuard a == forumRequestGuard b

instance FromJSON ForumResponse where
  parseJSON (Object o) = do
    forumResponseId <- o .: ("id" :: Text)
    forumResponseUserId <- o .: ("user_id" :: Text)
    forumResponseOrgId <- o .: ("org_id" :: Text)
    forumResponseName <- o .: ("name" :: Text)
    forumResponseDisplayName <- o .: ("display_name" :: Text)
    forumResponseDescription <- o .: ("description" :: Text)
    forumResponseThreadsPerBoard <- o .: ("threads_per_board" :: Text)
    forumResponseThreadPostsPerThread <- o .: ("thread_posts_per_thread" :: Text)
    forumResponseRecentThreadsLimit <- o .: ("recent_threads_limit" :: Text)
    forumResponseRecentPostsLimit <- o .: ("recent_posts_limit" :: Text)
    forumResponseMotwLimit <- o .: ("motw_limit" :: Text)
    forumResponseIcon <- o .: ("icon" :: Text)
    forumResponseTags <- o .: ("tags" :: Text)
    forumResponseVisibility <- o .: ("visibility" :: Text)
    forumResponseActive <- o .: ("active" :: Text)
    forumResponseGuard <- o .: ("guard" :: Text)
    forumResponseCreatedAt <- o .: ("created_at" :: Text)
    forumResponseModifiedBy <- o .: ("modified_by" :: Text)
    forumResponseModifiedAt <- o .: ("modified_at" :: Text)
    forumResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ ForumResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ForumResponse where
  toJSON ForumResponse{..} = object $
    [ "tag" .= ("ForumResponse" :: Text)
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


instance Eq ForumResponse where
  (==) a b = forumResponseId a == forumResponseId b && forumResponseUserId a == forumResponseUserId b && forumResponseOrgId a == forumResponseOrgId b && forumResponseName a == forumResponseName b && forumResponseDisplayName a == forumResponseDisplayName b && forumResponseDescription a == forumResponseDescription b && forumResponseThreadsPerBoard a == forumResponseThreadsPerBoard b && forumResponseThreadPostsPerThread a == forumResponseThreadPostsPerThread b && forumResponseRecentThreadsLimit a == forumResponseRecentThreadsLimit b && forumResponseRecentPostsLimit a == forumResponseRecentPostsLimit b && forumResponseMotwLimit a == forumResponseMotwLimit b && forumResponseIcon a == forumResponseIcon b && forumResponseTags a == forumResponseTags b && forumResponseVisibility a == forumResponseVisibility b && forumResponseActive a == forumResponseActive b && forumResponseGuard a == forumResponseGuard b && forumResponseCreatedAt a == forumResponseCreatedAt b && forumResponseModifiedBy a == forumResponseModifiedBy b && forumResponseModifiedAt a == forumResponseModifiedAt b && forumResponseActivityAt a == forumResponseActivityAt b

instance FromJSON ForumResponses where
  parseJSON (Object o) = do
    forumResponses <- o .: ("forum_responses" :: Text)
    pure $ ForumResponses {
      forumResponses = forumResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ForumResponses where
  toJSON ForumResponses{..} = object $
    [ "tag" .= ("ForumResponses" :: Text)
    , "forum_responses" .= forumResponses
    ]


instance Eq ForumResponses where
  (==) a b = forumResponses a == forumResponses b

instance FromJSON ForumStatResponse where
  parseJSON (Object o) = do
    forumStatResponseForumId <- o .: ("forum_id" :: Text)
    forumStatResponseBoards <- o .: ("boards" :: Text)
    forumStatResponseThreads <- o .: ("threads" :: Text)
    forumStatResponseThreadPosts <- o .: ("thread_posts" :: Text)
    forumStatResponseViews <- o .: ("views" :: Text)
    pure $ ForumStatResponse {
      forumStatResponseForumId = forumStatResponseForumId,
      forumStatResponseBoards = forumStatResponseBoards,
      forumStatResponseThreads = forumStatResponseThreads,
      forumStatResponseThreadPosts = forumStatResponseThreadPosts,
      forumStatResponseViews = forumStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ForumStatResponse where
  toJSON ForumStatResponse{..} = object $
    [ "tag" .= ("ForumStatResponse" :: Text)
    , "forum_id" .= forumStatResponseForumId
    , "boards" .= forumStatResponseBoards
    , "threads" .= forumStatResponseThreads
    , "thread_posts" .= forumStatResponseThreadPosts
    , "views" .= forumStatResponseViews
    ]


instance Eq ForumStatResponse where
  (==) a b = forumStatResponseForumId a == forumStatResponseForumId b && forumStatResponseBoards a == forumStatResponseBoards b && forumStatResponseThreads a == forumStatResponseThreads b && forumStatResponseThreadPosts a == forumStatResponseThreadPosts b && forumStatResponseViews a == forumStatResponseViews b

instance FromJSON ForumStatResponses where
  parseJSON (Object o) = do
    forumStatResponses <- o .: ("forum_stat_responses" :: Text)
    pure $ ForumStatResponses {
      forumStatResponses = forumStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ForumStatResponses where
  toJSON ForumStatResponses{..} = object $
    [ "tag" .= ("ForumStatResponses" :: Text)
    , "forum_stat_responses" .= forumStatResponses
    ]


instance Eq ForumStatResponses where
  (==) a b = forumStatResponses a == forumStatResponses b

instance FromJSON GlobalGroupRequest where
  parseJSON (Object o) = do
    globalGroupRequestDisplayName <- o .: ("display_name" :: Text)
    globalGroupRequestDescription <- o .: ("description" :: Text)
    globalGroupRequestMembership <- o .: ("membership" :: Text)
    globalGroupRequestIcon <- o .: ("icon" :: Text)
    globalGroupRequestTags <- o .: ("tags" :: Text)
    globalGroupRequestVisibility <- o .: ("visibility" :: Text)
    globalGroupRequestGuard <- o .: ("guard" :: Text)
    pure $ GlobalGroupRequest {
      globalGroupRequestDisplayName = globalGroupRequestDisplayName,
      globalGroupRequestDescription = globalGroupRequestDescription,
      globalGroupRequestMembership = globalGroupRequestMembership,
      globalGroupRequestIcon = globalGroupRequestIcon,
      globalGroupRequestTags = globalGroupRequestTags,
      globalGroupRequestVisibility = globalGroupRequestVisibility,
      globalGroupRequestGuard = globalGroupRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GlobalGroupRequest where
  toJSON GlobalGroupRequest{..} = object $
    [ "tag" .= ("GlobalGroupRequest" :: Text)
    , "display_name" .= globalGroupRequestDisplayName
    , "description" .= globalGroupRequestDescription
    , "membership" .= globalGroupRequestMembership
    , "icon" .= globalGroupRequestIcon
    , "tags" .= globalGroupRequestTags
    , "visibility" .= globalGroupRequestVisibility
    , "guard" .= globalGroupRequestGuard
    ]


instance Eq GlobalGroupRequest where
  (==) a b = globalGroupRequestDisplayName a == globalGroupRequestDisplayName b && globalGroupRequestDescription a == globalGroupRequestDescription b && globalGroupRequestMembership a == globalGroupRequestMembership b && globalGroupRequestIcon a == globalGroupRequestIcon b && globalGroupRequestTags a == globalGroupRequestTags b && globalGroupRequestVisibility a == globalGroupRequestVisibility b && globalGroupRequestGuard a == globalGroupRequestGuard b

instance FromJSON GlobalGroupResponse where
  parseJSON (Object o) = do
    globalGroupResponseId <- o .: ("id" :: Text)
    globalGroupResponseUserId <- o .: ("user_id" :: Text)
    globalGroupResponseName <- o .: ("name" :: Text)
    globalGroupResponseDisplayName <- o .: ("display_name" :: Text)
    globalGroupResponseDescription <- o .: ("description" :: Text)
    globalGroupResponseMembership <- o .: ("membership" :: Text)
    globalGroupResponseIcon <- o .: ("icon" :: Text)
    globalGroupResponseTags <- o .: ("tags" :: Text)
    globalGroupResponseVisibility <- o .: ("visibility" :: Text)
    globalGroupResponseActive <- o .: ("active" :: Text)
    globalGroupResponseGuard <- o .: ("guard" :: Text)
    globalGroupResponseCreatedAt <- o .: ("created_at" :: Text)
    globalGroupResponseModifiedBy <- o .: ("modified_by" :: Text)
    globalGroupResponseModifiedAt <- o .: ("modified_at" :: Text)
    globalGroupResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ GlobalGroupResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GlobalGroupResponse where
  toJSON GlobalGroupResponse{..} = object $
    [ "tag" .= ("GlobalGroupResponse" :: Text)
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


instance Eq GlobalGroupResponse where
  (==) a b = globalGroupResponseId a == globalGroupResponseId b && globalGroupResponseUserId a == globalGroupResponseUserId b && globalGroupResponseName a == globalGroupResponseName b && globalGroupResponseDisplayName a == globalGroupResponseDisplayName b && globalGroupResponseDescription a == globalGroupResponseDescription b && globalGroupResponseMembership a == globalGroupResponseMembership b && globalGroupResponseIcon a == globalGroupResponseIcon b && globalGroupResponseTags a == globalGroupResponseTags b && globalGroupResponseVisibility a == globalGroupResponseVisibility b && globalGroupResponseActive a == globalGroupResponseActive b && globalGroupResponseGuard a == globalGroupResponseGuard b && globalGroupResponseCreatedAt a == globalGroupResponseCreatedAt b && globalGroupResponseModifiedBy a == globalGroupResponseModifiedBy b && globalGroupResponseModifiedAt a == globalGroupResponseModifiedAt b && globalGroupResponseActivityAt a == globalGroupResponseActivityAt b

instance FromJSON GlobalGroupResponses where
  parseJSON (Object o) = do
    globalGroupResponses <- o .: ("global_group_responses" :: Text)
    pure $ GlobalGroupResponses {
      globalGroupResponses = globalGroupResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GlobalGroupResponses where
  toJSON GlobalGroupResponses{..} = object $
    [ "tag" .= ("GlobalGroupResponses" :: Text)
    , "global_group_responses" .= globalGroupResponses
    ]


instance Eq GlobalGroupResponses where
  (==) a b = globalGroupResponses a == globalGroupResponses b

instance FromJSON GlobalGroupStatResponse where
  parseJSON (Object o) = do
    globalGroupStatResponseGroups <- o .: ("groups" :: Text)
    pure $ GlobalGroupStatResponse {
      globalGroupStatResponseGroups = globalGroupStatResponseGroups
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GlobalGroupStatResponse where
  toJSON GlobalGroupStatResponse{..} = object $
    [ "tag" .= ("GlobalGroupStatResponse" :: Text)
    , "groups" .= globalGroupStatResponseGroups
    ]


instance Eq GlobalGroupStatResponse where
  (==) a b = globalGroupStatResponseGroups a == globalGroupStatResponseGroups b

instance FromJSON GlobalGroupStatResponses where
  parseJSON (Object o) = do
    globalGroupStatResponses <- o .: ("global_group_stat_responses" :: Text)
    pure $ GlobalGroupStatResponses {
      globalGroupStatResponses = globalGroupStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GlobalGroupStatResponses where
  toJSON GlobalGroupStatResponses{..} = object $
    [ "tag" .= ("GlobalGroupStatResponses" :: Text)
    , "global_group_stat_responses" .= globalGroupStatResponses
    ]


instance Eq GlobalGroupStatResponses where
  (==) a b = globalGroupStatResponses a == globalGroupStatResponses b

instance FromJSON GroupRequest where
  parseJSON (Object o) = do
    groupRequestGuard <- o .: ("guard" :: Text)
    pure $ GroupRequest {
      groupRequestGuard = groupRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupRequest where
  toJSON GroupRequest{..} = object $
    [ "tag" .= ("GroupRequest" :: Text)
    , "guard" .= groupRequestGuard
    ]


instance Eq GroupRequest where
  (==) a b = groupRequestGuard a == groupRequestGuard b

instance FromJSON GroupResponse where
  parseJSON (Object o) = do
    groupResponseId <- o .: ("id" :: Text)
    groupResponseUserId <- o .: ("user_id" :: Text)
    groupResponseGlobalGroupId <- o .: ("global_group_id" :: Text)
    groupResponseOrganizationId <- o .: ("organization_id" :: Text)
    groupResponseActive <- o .: ("active" :: Text)
    groupResponseGuard <- o .: ("guard" :: Text)
    groupResponseCreatedAt <- o .: ("created_at" :: Text)
    groupResponseModifiedBy <- o .: ("modified_by" :: Text)
    groupResponseModifiedAt <- o .: ("modified_at" :: Text)
    groupResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ GroupResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupResponse where
  toJSON GroupResponse{..} = object $
    [ "tag" .= ("GroupResponse" :: Text)
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


instance Eq GroupResponse where
  (==) a b = groupResponseId a == groupResponseId b && groupResponseUserId a == groupResponseUserId b && groupResponseGlobalGroupId a == groupResponseGlobalGroupId b && groupResponseOrganizationId a == groupResponseOrganizationId b && groupResponseActive a == groupResponseActive b && groupResponseGuard a == groupResponseGuard b && groupResponseCreatedAt a == groupResponseCreatedAt b && groupResponseModifiedBy a == groupResponseModifiedBy b && groupResponseModifiedAt a == groupResponseModifiedAt b && groupResponseActivityAt a == groupResponseActivityAt b

instance FromJSON GroupResponses where
  parseJSON (Object o) = do
    groupResponses <- o .: ("group_responses" :: Text)
    pure $ GroupResponses {
      groupResponses = groupResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupResponses where
  toJSON GroupResponses{..} = object $
    [ "tag" .= ("GroupResponses" :: Text)
    , "group_responses" .= groupResponses
    ]


instance Eq GroupResponses where
  (==) a b = groupResponses a == groupResponses b

instance FromJSON GroupStatResponse where
  parseJSON (Object o) = do
    groupStatResponseMembers <- o .: ("members" :: Text)
    pure $ GroupStatResponse {
      groupStatResponseMembers = groupStatResponseMembers
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupStatResponse where
  toJSON GroupStatResponse{..} = object $
    [ "tag" .= ("GroupStatResponse" :: Text)
    , "members" .= groupStatResponseMembers
    ]


instance Eq GroupStatResponse where
  (==) a b = groupStatResponseMembers a == groupStatResponseMembers b

instance FromJSON GroupStatResponses where
  parseJSON (Object o) = do
    groupStatResponses <- o .: ("group_stat_responses" :: Text)
    pure $ GroupStatResponses {
      groupStatResponses = groupStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupStatResponses where
  toJSON GroupStatResponses{..} = object $
    [ "tag" .= ("GroupStatResponses" :: Text)
    , "group_stat_responses" .= groupStatResponses
    ]


instance Eq GroupStatResponses where
  (==) a b = groupStatResponses a == groupStatResponses b

instance FromJSON GroupMemberRequest where
  parseJSON (Object o) = do
    groupMemberRequestGuard <- o .: ("guard" :: Text)
    pure $ GroupMemberRequest {
      groupMemberRequestGuard = groupMemberRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupMemberRequest where
  toJSON GroupMemberRequest{..} = object $
    [ "tag" .= ("GroupMemberRequest" :: Text)
    , "guard" .= groupMemberRequestGuard
    ]


instance Eq GroupMemberRequest where
  (==) a b = groupMemberRequestGuard a == groupMemberRequestGuard b

instance FromJSON GroupMemberResponse where
  parseJSON (Object o) = do
    groupMemberResponseId <- o .: ("id" :: Text)
    groupMemberResponseUserId <- o .: ("user_id" :: Text)
    groupMemberResponseGlobalGroupId <- o .: ("global_group_id" :: Text)
    groupMemberResponseCreatedAt <- o .: ("created_at" :: Text)
    groupMemberResponseModifiedBy <- o .: ("modified_by" :: Text)
    groupMemberResponseModifiedAt <- o .: ("modified_at" :: Text)
    groupMemberResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ GroupMemberResponse {
      groupMemberResponseId = groupMemberResponseId,
      groupMemberResponseUserId = groupMemberResponseUserId,
      groupMemberResponseGlobalGroupId = groupMemberResponseGlobalGroupId,
      groupMemberResponseCreatedAt = groupMemberResponseCreatedAt,
      groupMemberResponseModifiedBy = groupMemberResponseModifiedBy,
      groupMemberResponseModifiedAt = groupMemberResponseModifiedAt,
      groupMemberResponseActivityAt = groupMemberResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupMemberResponse where
  toJSON GroupMemberResponse{..} = object $
    [ "tag" .= ("GroupMemberResponse" :: Text)
    , "id" .= groupMemberResponseId
    , "user_id" .= groupMemberResponseUserId
    , "global_group_id" .= groupMemberResponseGlobalGroupId
    , "created_at" .= groupMemberResponseCreatedAt
    , "modified_by" .= groupMemberResponseModifiedBy
    , "modified_at" .= groupMemberResponseModifiedAt
    , "activity_at" .= groupMemberResponseActivityAt
    ]


instance Eq GroupMemberResponse where
  (==) a b = groupMemberResponseId a == groupMemberResponseId b && groupMemberResponseUserId a == groupMemberResponseUserId b && groupMemberResponseGlobalGroupId a == groupMemberResponseGlobalGroupId b && groupMemberResponseCreatedAt a == groupMemberResponseCreatedAt b && groupMemberResponseModifiedBy a == groupMemberResponseModifiedBy b && groupMemberResponseModifiedAt a == groupMemberResponseModifiedAt b && groupMemberResponseActivityAt a == groupMemberResponseActivityAt b

instance FromJSON GroupMemberResponses where
  parseJSON (Object o) = do
    groupMemberResponses <- o .: ("group_member_responses" :: Text)
    pure $ GroupMemberResponses {
      groupMemberResponses = groupMemberResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupMemberResponses where
  toJSON GroupMemberResponses{..} = object $
    [ "tag" .= ("GroupMemberResponses" :: Text)
    , "group_member_responses" .= groupMemberResponses
    ]


instance Eq GroupMemberResponses where
  (==) a b = groupMemberResponses a == groupMemberResponses b

instance FromJSON GroupMemberStatResponse where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("GroupMemberStatResponse" :: Text) -> do
        pure GroupMemberStatResponse

      _ -> fail "Could not parse GroupMemberStatResponse"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupMemberStatResponse where
  toJSON (GroupMemberStatResponse ) = object $
    [ "tag" .= ("GroupMemberStatResponse" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq GroupMemberStatResponse where
  (==) GroupMemberStatResponse GroupMemberStatResponse = True


instance FromJSON GroupMemberStatResponses where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("GroupMemberStatResponses" :: Text) -> do
        pure GroupMemberStatResponses

      _ -> fail "Could not parse GroupMemberStatResponses"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupMemberStatResponses where
  toJSON (GroupMemberStatResponses ) = object $
    [ "tag" .= ("GroupMemberStatResponses" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq GroupMemberStatResponses where
  (==) GroupMemberStatResponses GroupMemberStatResponses = True


instance FromJSON LeuronRequest where
  parseJSON (Object o) = do
    leuronRequestData <- o .: ("data" :: Text)
    leuronRequestTitle <- o .: ("title" :: Text)
    leuronRequestDescription <- o .: ("description" :: Text)
    leuronRequestSection <- o .: ("section" :: Text)
    leuronRequestPage <- o .: ("page" :: Text)
    leuronRequestExamples <- o .: ("examples" :: Text)
    leuronRequestStrengths <- o .: ("strengths" :: Text)
    leuronRequestCategories <- o .: ("categories" :: Text)
    leuronRequestSplits <- o .: ("splits" :: Text)
    leuronRequestSubstitutions <- o .: ("substitutions" :: Text)
    leuronRequestTags <- o .: ("tags" :: Text)
    leuronRequestStyle <- o .: ("style" :: Text)
    leuronRequestGuard <- o .: ("guard" :: Text)
    pure $ LeuronRequest {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronRequest where
  toJSON LeuronRequest{..} = object $
    [ "tag" .= ("LeuronRequest" :: Text)
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


instance Eq LeuronRequest where
  (==) a b = leuronRequestData a == leuronRequestData b && leuronRequestTitle a == leuronRequestTitle b && leuronRequestDescription a == leuronRequestDescription b && leuronRequestSection a == leuronRequestSection b && leuronRequestPage a == leuronRequestPage b && leuronRequestExamples a == leuronRequestExamples b && leuronRequestStrengths a == leuronRequestStrengths b && leuronRequestCategories a == leuronRequestCategories b && leuronRequestSplits a == leuronRequestSplits b && leuronRequestSubstitutions a == leuronRequestSubstitutions b && leuronRequestTags a == leuronRequestTags b && leuronRequestStyle a == leuronRequestStyle b && leuronRequestGuard a == leuronRequestGuard b

instance FromJSON LeuronResponse where
  parseJSON (Object o) = do
    leuronResponseId <- o .: ("id" :: Text)
    leuronResponseUserId <- o .: ("user_id" :: Text)
    leuronResponseResourceId <- o .: ("resource_id" :: Text)
    leuronResponseData <- o .: ("data" :: Text)
    leuronResponseTitle <- o .: ("title" :: Text)
    leuronResponseDescription <- o .: ("description" :: Text)
    leuronResponseSection <- o .: ("section" :: Text)
    leuronResponsePage <- o .: ("page" :: Text)
    leuronResponseExamples <- o .: ("examples" :: Text)
    leuronResponseStrengths <- o .: ("strengths" :: Text)
    leuronResponseCategories <- o .: ("categories" :: Text)
    leuronResponseSplits <- o .: ("splits" :: Text)
    leuronResponseSubstitutions <- o .: ("substitutions" :: Text)
    leuronResponseTags <- o .: ("tags" :: Text)
    leuronResponseStyle <- o .: ("style" :: Text)
    leuronResponseActive <- o .: ("active" :: Text)
    leuronResponseGuard <- o .: ("guard" :: Text)
    leuronResponseCreatedAt <- o .: ("created_at" :: Text)
    leuronResponseModifiedAt <- o .: ("modified_at" :: Text)
    leuronResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ LeuronResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronResponse where
  toJSON LeuronResponse{..} = object $
    [ "tag" .= ("LeuronResponse" :: Text)
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


instance Eq LeuronResponse where
  (==) a b = leuronResponseId a == leuronResponseId b && leuronResponseUserId a == leuronResponseUserId b && leuronResponseResourceId a == leuronResponseResourceId b && leuronResponseData a == leuronResponseData b && leuronResponseTitle a == leuronResponseTitle b && leuronResponseDescription a == leuronResponseDescription b && leuronResponseSection a == leuronResponseSection b && leuronResponsePage a == leuronResponsePage b && leuronResponseExamples a == leuronResponseExamples b && leuronResponseStrengths a == leuronResponseStrengths b && leuronResponseCategories a == leuronResponseCategories b && leuronResponseSplits a == leuronResponseSplits b && leuronResponseSubstitutions a == leuronResponseSubstitutions b && leuronResponseTags a == leuronResponseTags b && leuronResponseStyle a == leuronResponseStyle b && leuronResponseActive a == leuronResponseActive b && leuronResponseGuard a == leuronResponseGuard b && leuronResponseCreatedAt a == leuronResponseCreatedAt b && leuronResponseModifiedAt a == leuronResponseModifiedAt b && leuronResponseActivityAt a == leuronResponseActivityAt b

instance FromJSON LeuronResponses where
  parseJSON (Object o) = do
    leuronResponses <- o .: ("leuron_responses" :: Text)
    pure $ LeuronResponses {
      leuronResponses = leuronResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronResponses where
  toJSON LeuronResponses{..} = object $
    [ "tag" .= ("LeuronResponses" :: Text)
    , "leuron_responses" .= leuronResponses
    ]


instance Eq LeuronResponses where
  (==) a b = leuronResponses a == leuronResponses b

instance FromJSON LeuronStatResponse where
  parseJSON (Object o) = do
    leuronStatResponseLeuronId <- o .: ("leuron_id" :: Text)
    leuronStatResponseLikes <- o .: ("likes" :: Text)
    leuronStatResponseNeutral <- o .: ("neutral" :: Text)
    leuronStatResponseDislikes <- o .: ("dislikes" :: Text)
    leuronStatResponseStars <- o .: ("stars" :: Text)
    leuronStatResponseViews <- o .: ("views" :: Text)
    pure $ LeuronStatResponse {
      leuronStatResponseLeuronId = leuronStatResponseLeuronId,
      leuronStatResponseLikes = leuronStatResponseLikes,
      leuronStatResponseNeutral = leuronStatResponseNeutral,
      leuronStatResponseDislikes = leuronStatResponseDislikes,
      leuronStatResponseStars = leuronStatResponseStars,
      leuronStatResponseViews = leuronStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronStatResponse where
  toJSON LeuronStatResponse{..} = object $
    [ "tag" .= ("LeuronStatResponse" :: Text)
    , "leuron_id" .= leuronStatResponseLeuronId
    , "likes" .= leuronStatResponseLikes
    , "neutral" .= leuronStatResponseNeutral
    , "dislikes" .= leuronStatResponseDislikes
    , "stars" .= leuronStatResponseStars
    , "views" .= leuronStatResponseViews
    ]


instance Eq LeuronStatResponse where
  (==) a b = leuronStatResponseLeuronId a == leuronStatResponseLeuronId b && leuronStatResponseLikes a == leuronStatResponseLikes b && leuronStatResponseNeutral a == leuronStatResponseNeutral b && leuronStatResponseDislikes a == leuronStatResponseDislikes b && leuronStatResponseStars a == leuronStatResponseStars b && leuronStatResponseViews a == leuronStatResponseViews b

instance FromJSON LeuronStatResponses where
  parseJSON (Object o) = do
    leuronStatResponses <- o .: ("leuron_stat_responses" :: Text)
    pure $ LeuronStatResponses {
      leuronStatResponses = leuronStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronStatResponses where
  toJSON LeuronStatResponses{..} = object $
    [ "tag" .= ("LeuronStatResponses" :: Text)
    , "leuron_stat_responses" .= leuronStatResponses
    ]


instance Eq LeuronStatResponses where
  (==) a b = leuronStatResponses a == leuronStatResponses b

instance FromJSON LeuronTrainingSummary where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("LTS_View" :: Text) -> do
        pure LTS_View

      ("LTS_Skip" :: Text) -> do
        pure LTS_Skip

      ("LTS_Know" :: Text) -> do
        pure LTS_Know

      ("LTS_DontKnow" :: Text) -> do
        pure LTS_DontKnow

      ("LTS_DontUnderstand" :: Text) -> do
        pure LTS_DontUnderstand

      ("LTS_DontCare" :: Text) -> do
        pure LTS_DontCare

      ("LTS_Protest" :: Text) -> do
        pure LTS_Protest

      _ -> fail "Could not parse LeuronTrainingSummary"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronTrainingSummary where
  toJSON (LTS_View ) = object $
    [ "tag" .= ("LTS_View" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_Skip ) = object $
    [ "tag" .= ("LTS_Skip" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_Know ) = object $
    [ "tag" .= ("LTS_Know" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_DontKnow ) = object $
    [ "tag" .= ("LTS_DontKnow" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_DontUnderstand ) = object $
    [ "tag" .= ("LTS_DontUnderstand" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_DontCare ) = object $
    [ "tag" .= ("LTS_DontCare" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LTS_Protest ) = object $
    [ "tag" .= ("LTS_Protest" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq LeuronTrainingSummary where
  (==) LTS_View LTS_View = True
  (==) LTS_Skip LTS_Skip = True
  (==) LTS_Know LTS_Know = True
  (==) LTS_DontKnow LTS_DontKnow = True
  (==) LTS_DontUnderstand LTS_DontUnderstand = True
  (==) LTS_DontCare LTS_DontCare = True
  (==) LTS_Protest LTS_Protest = True
  (==) _ _ = False

instance FromJSON LeuronTrainingRequest where
  parseJSON (Object o) = do
    leuronTrainingRequestSummary <- o .: ("summary" :: Text)
    leuronTrainingRequestGuard <- o .: ("guard" :: Text)
    pure $ LeuronTrainingRequest {
      leuronTrainingRequestSummary = leuronTrainingRequestSummary,
      leuronTrainingRequestGuard = leuronTrainingRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronTrainingRequest where
  toJSON LeuronTrainingRequest{..} = object $
    [ "tag" .= ("LeuronTrainingRequest" :: Text)
    , "summary" .= leuronTrainingRequestSummary
    , "guard" .= leuronTrainingRequestGuard
    ]


instance Eq LeuronTrainingRequest where
  (==) a b = leuronTrainingRequestSummary a == leuronTrainingRequestSummary b && leuronTrainingRequestGuard a == leuronTrainingRequestGuard b

instance FromJSON LeuronTrainingResponse where
  parseJSON (Object o) = do
    leuronTrainingResponseId <- o .: ("id" :: Text)
    leuronTrainingResponseUserId <- o .: ("user_id" :: Text)
    leuronTrainingResponseLeuronId <- o .: ("leuron_id" :: Text)
    leuronTrainingResponseSummary <- o .: ("summary" :: Text)
    leuronTrainingResponseGuard <- o .: ("guard" :: Text)
    leuronTrainingResponseCreatedAt <- o .: ("created_at" :: Text)
    leuronTrainingResponseModifiedAt <- o .: ("modified_at" :: Text)
    pure $ LeuronTrainingResponse {
      leuronTrainingResponseId = leuronTrainingResponseId,
      leuronTrainingResponseUserId = leuronTrainingResponseUserId,
      leuronTrainingResponseLeuronId = leuronTrainingResponseLeuronId,
      leuronTrainingResponseSummary = leuronTrainingResponseSummary,
      leuronTrainingResponseGuard = leuronTrainingResponseGuard,
      leuronTrainingResponseCreatedAt = leuronTrainingResponseCreatedAt,
      leuronTrainingResponseModifiedAt = leuronTrainingResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronTrainingResponse where
  toJSON LeuronTrainingResponse{..} = object $
    [ "tag" .= ("LeuronTrainingResponse" :: Text)
    , "id" .= leuronTrainingResponseId
    , "user_id" .= leuronTrainingResponseUserId
    , "leuron_id" .= leuronTrainingResponseLeuronId
    , "summary" .= leuronTrainingResponseSummary
    , "guard" .= leuronTrainingResponseGuard
    , "created_at" .= leuronTrainingResponseCreatedAt
    , "modified_at" .= leuronTrainingResponseModifiedAt
    ]


instance Eq LeuronTrainingResponse where
  (==) a b = leuronTrainingResponseId a == leuronTrainingResponseId b && leuronTrainingResponseUserId a == leuronTrainingResponseUserId b && leuronTrainingResponseLeuronId a == leuronTrainingResponseLeuronId b && leuronTrainingResponseSummary a == leuronTrainingResponseSummary b && leuronTrainingResponseGuard a == leuronTrainingResponseGuard b && leuronTrainingResponseCreatedAt a == leuronTrainingResponseCreatedAt b && leuronTrainingResponseModifiedAt a == leuronTrainingResponseModifiedAt b

instance FromJSON LeuronTrainingResponses where
  parseJSON (Object o) = do
    leuronTrainingResponses <- o .: ("leuron_training_responses" :: Text)
    pure $ LeuronTrainingResponses {
      leuronTrainingResponses = leuronTrainingResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronTrainingResponses where
  toJSON LeuronTrainingResponses{..} = object $
    [ "tag" .= ("LeuronTrainingResponses" :: Text)
    , "leuron_training_responses" .= leuronTrainingResponses
    ]


instance Eq LeuronTrainingResponses where
  (==) a b = leuronTrainingResponses a == leuronTrainingResponses b

instance FromJSON LeuronTrainingStatResponse where
  parseJSON (Object o) = do
    leuronTrainingStatResponseLeuronTrainingId <- o .: ("leuron_training_id" :: Text)
    pure $ LeuronTrainingStatResponse {
      leuronTrainingStatResponseLeuronTrainingId = leuronTrainingStatResponseLeuronTrainingId
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronTrainingStatResponse where
  toJSON LeuronTrainingStatResponse{..} = object $
    [ "tag" .= ("LeuronTrainingStatResponse" :: Text)
    , "leuron_training_id" .= leuronTrainingStatResponseLeuronTrainingId
    ]


instance Eq LeuronTrainingStatResponse where
  (==) a b = leuronTrainingStatResponseLeuronTrainingId a == leuronTrainingStatResponseLeuronTrainingId b

instance FromJSON LeuronTrainingStatResponses where
  parseJSON (Object o) = do
    leuronTrainingStatResponses <- o .: ("leuron_training_stat_responses" :: Text)
    pure $ LeuronTrainingStatResponses {
      leuronTrainingStatResponses = leuronTrainingStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronTrainingStatResponses where
  toJSON LeuronTrainingStatResponses{..} = object $
    [ "tag" .= ("LeuronTrainingStatResponses" :: Text)
    , "leuron_training_stat_responses" .= leuronTrainingStatResponses
    ]


instance Eq LeuronTrainingStatResponses where
  (==) a b = leuronTrainingStatResponses a == leuronTrainingStatResponses b

instance FromJSON LikeOpt where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("Like" :: Text) -> do
        pure Like

      ("Neutral" :: Text) -> do
        pure Neutral

      ("Dislike" :: Text) -> do
        pure Dislike

      _ -> fail "Could not parse LikeOpt"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LikeOpt where
  toJSON (Like ) = object $
    [ "tag" .= ("Like" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Neutral ) = object $
    [ "tag" .= ("Neutral" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Dislike ) = object $
    [ "tag" .= ("Dislike" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq LikeOpt where
  (==) Like Like = True
  (==) Neutral Neutral = True
  (==) Dislike Dislike = True
  (==) _ _ = False

instance FromJSON LikeRequest where
  parseJSON (Object o) = do
    likeRequestOpt <- o .: ("opt" :: Text)
    likeRequestReason <- o .: ("reason" :: Text)
    likeRequestGuard <- o .: ("guard" :: Text)
    pure $ LikeRequest {
      likeRequestOpt = likeRequestOpt,
      likeRequestReason = likeRequestReason,
      likeRequestGuard = likeRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LikeRequest where
  toJSON LikeRequest{..} = object $
    [ "tag" .= ("LikeRequest" :: Text)
    , "opt" .= likeRequestOpt
    , "reason" .= likeRequestReason
    , "guard" .= likeRequestGuard
    ]


instance Eq LikeRequest where
  (==) a b = likeRequestOpt a == likeRequestOpt b && likeRequestReason a == likeRequestReason b && likeRequestGuard a == likeRequestGuard b

instance FromJSON LikeResponse where
  parseJSON (Object o) = do
    likeResponseId <- o .: ("id" :: Text)
    likeResponseEnt <- o .: ("ent" :: Text)
    likeResponseEntId <- o .: ("ent_id" :: Text)
    likeResponseUserId <- o .: ("user_id" :: Text)
    likeResponseOpt <- o .: ("opt" :: Text)
    likeResponseScore <- o .: ("score" :: Text)
    likeResponseReason <- o .: ("reason" :: Text)
    likeResponseActive <- o .: ("active" :: Text)
    likeResponseGuard <- o .: ("guard" :: Text)
    likeResponseCreatedAt <- o .: ("created_at" :: Text)
    likeResponseModifiedAt <- o .: ("modified_at" :: Text)
    pure $ LikeResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LikeResponse where
  toJSON LikeResponse{..} = object $
    [ "tag" .= ("LikeResponse" :: Text)
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


instance Eq LikeResponse where
  (==) a b = likeResponseId a == likeResponseId b && likeResponseEnt a == likeResponseEnt b && likeResponseEntId a == likeResponseEntId b && likeResponseUserId a == likeResponseUserId b && likeResponseOpt a == likeResponseOpt b && likeResponseScore a == likeResponseScore b && likeResponseReason a == likeResponseReason b && likeResponseActive a == likeResponseActive b && likeResponseGuard a == likeResponseGuard b && likeResponseCreatedAt a == likeResponseCreatedAt b && likeResponseModifiedAt a == likeResponseModifiedAt b

instance FromJSON LikeResponses where
  parseJSON (Object o) = do
    likeResponses <- o .: ("like_responses" :: Text)
    pure $ LikeResponses {
      likeResponses = likeResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LikeResponses where
  toJSON LikeResponses{..} = object $
    [ "tag" .= ("LikeResponses" :: Text)
    , "like_responses" .= likeResponses
    ]


instance Eq LikeResponses where
  (==) a b = likeResponses a == likeResponses b

instance FromJSON LikeStatResponse where
  parseJSON (Object o) = do
    likeStatResponseEnt <- o .: ("ent" :: Text)
    likeStatResponseEntId <- o .: ("ent_id" :: Text)
    likeStatResponseScore <- o .: ("score" :: Text)
    likeStatResponseLike <- o .: ("like" :: Text)
    likeStatResponseNeutral <- o .: ("neutral" :: Text)
    likeStatResponseDislike <- o .: ("dislike" :: Text)
    pure $ LikeStatResponse {
      likeStatResponseEnt = likeStatResponseEnt,
      likeStatResponseEntId = likeStatResponseEntId,
      likeStatResponseScore = likeStatResponseScore,
      likeStatResponseLike = likeStatResponseLike,
      likeStatResponseNeutral = likeStatResponseNeutral,
      likeStatResponseDislike = likeStatResponseDislike
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LikeStatResponse where
  toJSON LikeStatResponse{..} = object $
    [ "tag" .= ("LikeStatResponse" :: Text)
    , "ent" .= likeStatResponseEnt
    , "ent_id" .= likeStatResponseEntId
    , "score" .= likeStatResponseScore
    , "like" .= likeStatResponseLike
    , "neutral" .= likeStatResponseNeutral
    , "dislike" .= likeStatResponseDislike
    ]


instance Eq LikeStatResponse where
  (==) a b = likeStatResponseEnt a == likeStatResponseEnt b && likeStatResponseEntId a == likeStatResponseEntId b && likeStatResponseScore a == likeStatResponseScore b && likeStatResponseLike a == likeStatResponseLike b && likeStatResponseNeutral a == likeStatResponseNeutral b && likeStatResponseDislike a == likeStatResponseDislike b

instance FromJSON LikeStatResponses where
  parseJSON (Object o) = do
    likeStatResponses <- o .: ("like_stat_responses" :: Text)
    pure $ LikeStatResponses {
      likeStatResponses = likeStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LikeStatResponses where
  toJSON LikeStatResponses{..} = object $
    [ "tag" .= ("LikeStatResponses" :: Text)
    , "like_stat_responses" .= likeStatResponses
    ]


instance Eq LikeStatResponses where
  (==) a b = likeStatResponses a == likeStatResponses b

instance FromJSON LeuronData where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("LnFact" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnFact <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnFact"

      ("LnFactList" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnFactList <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnFactList"

      ("LnCard" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnCard <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnCard"

      ("LnDCard" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnDCard <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnDCard"

      ("LnDCardX" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnDCardX <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnDCardX"

      ("LnAcronym" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnAcronym <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnAcronym"

      ("LnSynonym" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnSynonym <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnSynonym"

      ("LnAntonym" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnAntonym <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnAntonym"

      ("LnTemplate" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnTemplate <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnTemplate"

      ("LnImageAssociation" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnImageAssociation <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnImageAssociation"

      ("LnLinearDemo" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnLinearDemo <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnLinearDemo"

      ("LnTable" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnTable <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnTable"

      ("LnScript" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnScript <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnScript"

      ("LnQA" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> LnQA <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: LnQA"

      ("LnExamples" :: Text) -> do
        pure LnExamples

      ("LnEmpty" :: Text) -> do
        pure LnEmpty

      _ -> fail "Could not parse LeuronData"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronData where
  toJSON (LnFact x0) = object $
    [ "tag" .= ("LnFact" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnFactList x0) = object $
    [ "tag" .= ("LnFactList" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnCard x0) = object $
    [ "tag" .= ("LnCard" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnDCard x0) = object $
    [ "tag" .= ("LnDCard" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnDCardX x0) = object $
    [ "tag" .= ("LnDCardX" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnAcronym x0) = object $
    [ "tag" .= ("LnAcronym" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnSynonym x0) = object $
    [ "tag" .= ("LnSynonym" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnAntonym x0) = object $
    [ "tag" .= ("LnAntonym" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnTemplate x0) = object $
    [ "tag" .= ("LnTemplate" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnImageAssociation x0) = object $
    [ "tag" .= ("LnImageAssociation" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnLinearDemo x0) = object $
    [ "tag" .= ("LnLinearDemo" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnTable x0) = object $
    [ "tag" .= ("LnTable" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnScript x0) = object $
    [ "tag" .= ("LnScript" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnQA x0) = object $
    [ "tag" .= ("LnQA" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (LnExamples ) = object $
    [ "tag" .= ("LnExamples" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (LnEmpty ) = object $
    [ "tag" .= ("LnEmpty" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq LeuronData where
  (==) (LnFact x0a) (LnFact x0b) = x0a == x0b
  (==) (LnFactList x0a) (LnFactList x0b) = x0a == x0b
  (==) (LnCard x0a) (LnCard x0b) = x0a == x0b
  (==) (LnDCard x0a) (LnDCard x0b) = x0a == x0b
  (==) (LnDCardX x0a) (LnDCardX x0b) = x0a == x0b
  (==) (LnAcronym x0a) (LnAcronym x0b) = x0a == x0b
  (==) (LnSynonym x0a) (LnSynonym x0b) = x0a == x0b
  (==) (LnAntonym x0a) (LnAntonym x0b) = x0a == x0b
  (==) (LnTemplate x0a) (LnTemplate x0b) = x0a == x0b
  (==) (LnImageAssociation x0a) (LnImageAssociation x0b) = x0a == x0b
  (==) (LnLinearDemo x0a) (LnLinearDemo x0b) = x0a == x0b
  (==) (LnTable x0a) (LnTable x0b) = x0a == x0b
  (==) (LnScript x0a) (LnScript x0b) = x0a == x0b
  (==) (LnQA x0a) (LnQA x0b) = x0a == x0b
  (==) LnExamples LnExamples = True
  (==) LnEmpty LnEmpty = True
  (==) _ _ = False

instance FromJSON TyLeuron where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("TyLnFact" :: Text) -> do
        pure TyLnFact

      ("TyLnFactList" :: Text) -> do
        pure TyLnFactList

      ("TyLnCard" :: Text) -> do
        pure TyLnCard

      ("TyLnDCard" :: Text) -> do
        pure TyLnDCard

      ("TyLnDCardX" :: Text) -> do
        pure TyLnDCardX

      ("TyLnAcronym" :: Text) -> do
        pure TyLnAcronym

      ("TyLnSynonym" :: Text) -> do
        pure TyLnSynonym

      ("TyLnAntonym" :: Text) -> do
        pure TyLnAntonym

      ("TyLnTemplate" :: Text) -> do
        pure TyLnTemplate

      ("TyLnImageAssociation" :: Text) -> do
        pure TyLnImageAssociation

      ("TyLnLinearDemo" :: Text) -> do
        pure TyLnLinearDemo

      ("TyLnTable" :: Text) -> do
        pure TyLnTable

      ("TyLnScript" :: Text) -> do
        pure TyLnScript

      ("TyLnQA" :: Text) -> do
        pure TyLnQA

      ("TyLnExamples" :: Text) -> do
        pure TyLnExamples

      ("TyLnEmpty" :: Text) -> do
        pure TyLnEmpty

      _ -> fail "Could not parse TyLeuron"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TyLeuron where
  toJSON (TyLnFact ) = object $
    [ "tag" .= ("TyLnFact" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnFactList ) = object $
    [ "tag" .= ("TyLnFactList" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnCard ) = object $
    [ "tag" .= ("TyLnCard" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnDCard ) = object $
    [ "tag" .= ("TyLnDCard" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnDCardX ) = object $
    [ "tag" .= ("TyLnDCardX" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnAcronym ) = object $
    [ "tag" .= ("TyLnAcronym" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnSynonym ) = object $
    [ "tag" .= ("TyLnSynonym" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnAntonym ) = object $
    [ "tag" .= ("TyLnAntonym" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnTemplate ) = object $
    [ "tag" .= ("TyLnTemplate" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnImageAssociation ) = object $
    [ "tag" .= ("TyLnImageAssociation" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnLinearDemo ) = object $
    [ "tag" .= ("TyLnLinearDemo" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnTable ) = object $
    [ "tag" .= ("TyLnTable" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnScript ) = object $
    [ "tag" .= ("TyLnScript" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnQA ) = object $
    [ "tag" .= ("TyLnQA" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnExamples ) = object $
    [ "tag" .= ("TyLnExamples" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyLnEmpty ) = object $
    [ "tag" .= ("TyLnEmpty" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq TyLeuron where
  (==) TyLnFact TyLnFact = True
  (==) TyLnFactList TyLnFactList = True
  (==) TyLnCard TyLnCard = True
  (==) TyLnDCard TyLnDCard = True
  (==) TyLnDCardX TyLnDCardX = True
  (==) TyLnAcronym TyLnAcronym = True
  (==) TyLnSynonym TyLnSynonym = True
  (==) TyLnAntonym TyLnAntonym = True
  (==) TyLnTemplate TyLnTemplate = True
  (==) TyLnImageAssociation TyLnImageAssociation = True
  (==) TyLnLinearDemo TyLnLinearDemo = True
  (==) TyLnTable TyLnTable = True
  (==) TyLnScript TyLnScript = True
  (==) TyLnQA TyLnQA = True
  (==) TyLnExamples TyLnExamples = True
  (==) TyLnEmpty TyLnEmpty = True
  (==) _ _ = False

instance FromJSON Fact where
  parseJSON (Object o) = do
    factText <- o .: ("text" :: Text)
    pure $ Fact {
      factText = factText
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Fact where
  toJSON Fact{..} = object $
    [ "tag" .= ("Fact" :: Text)
    , "text" .= factText
    ]


instance Eq Fact where
  (==) a b = factText a == factText b

instance FromJSON FactList where
  parseJSON (Object o) = do
    factListFact <- o .: ("fact" :: Text)
    factListList <- o .: ("list" :: Text)
    pure $ FactList {
      factListFact = factListFact,
      factListList = factListList
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON FactList where
  toJSON FactList{..} = object $
    [ "tag" .= ("FactList" :: Text)
    , "fact" .= factListFact
    , "list" .= factListList
    ]


instance Eq FactList where
  (==) a b = factListFact a == factListFact b && factListList a == factListList b

instance FromJSON Card where
  parseJSON (Object o) = do
    cardFront <- o .: ("front" :: Text)
    cardBack <- o .: ("back" :: Text)
    pure $ Card {
      cardFront = cardFront,
      cardBack = cardBack
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Card where
  toJSON Card{..} = object $
    [ "tag" .= ("Card" :: Text)
    , "front" .= cardFront
    , "back" .= cardBack
    ]


instance Eq Card where
  (==) a b = cardFront a == cardFront b && cardBack a == cardBack b

instance FromJSON DCard where
  parseJSON (Object o) = do
    dcardFront <- o .: ("front" :: Text)
    dcardBack <- o .: ("back" :: Text)
    pure $ DCard {
      dcardFront = dcardFront,
      dcardBack = dcardBack
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON DCard where
  toJSON DCard{..} = object $
    [ "tag" .= ("DCard" :: Text)
    , "front" .= dcardFront
    , "back" .= dcardBack
    ]


instance Eq DCard where
  (==) a b = dcardFront a == dcardFront b && dcardBack a == dcardBack b

instance FromJSON DCardX where
  parseJSON (Object o) = do
    dcardxFront <- o .: ("front" :: Text)
    dcardxBack <- o .: ("back" :: Text)
    pure $ DCardX {
      dcardxFront = dcardxFront,
      dcardxBack = dcardxBack
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON DCardX where
  toJSON DCardX{..} = object $
    [ "tag" .= ("DCardX" :: Text)
    , "front" .= dcardxFront
    , "back" .= dcardxBack
    ]


instance Eq DCardX where
  (==) a b = dcardxFront a == dcardxFront b && dcardxBack a == dcardxBack b

instance FromJSON Acronym where
  parseJSON (Object o) = do
    acronymAbbreviation <- o .: ("abbreviation" :: Text)
    acronymMeaning <- o .: ("meaning" :: Text)
    pure $ Acronym {
      acronymAbbreviation = acronymAbbreviation,
      acronymMeaning = acronymMeaning
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Acronym where
  toJSON Acronym{..} = object $
    [ "tag" .= ("Acronym" :: Text)
    , "abbreviation" .= acronymAbbreviation
    , "meaning" .= acronymMeaning
    ]


instance Eq Acronym where
  (==) a b = acronymAbbreviation a == acronymAbbreviation b && acronymMeaning a == acronymMeaning b

instance FromJSON Synonym where
  parseJSON (Object o) = do
    synonymA <- o .: ("a" :: Text)
    synonymB <- o .: ("b" :: Text)
    pure $ Synonym {
      synonymA = synonymA,
      synonymB = synonymB
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Synonym where
  toJSON Synonym{..} = object $
    [ "tag" .= ("Synonym" :: Text)
    , "a" .= synonymA
    , "b" .= synonymB
    ]


instance Eq Synonym where
  (==) a b = synonymA a == synonymA b && synonymB a == synonymB b

instance FromJSON Antonym where
  parseJSON (Object o) = do
    antonymA <- o .: ("a" :: Text)
    antonymB <- o .: ("b" :: Text)
    pure $ Antonym {
      antonymA = antonymA,
      antonymB = antonymB
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Antonym where
  toJSON Antonym{..} = object $
    [ "tag" .= ("Antonym" :: Text)
    , "a" .= antonymA
    , "b" .= antonymB
    ]


instance Eq Antonym where
  (==) a b = antonymA a == antonymA b && antonymB a == antonymB b

instance FromJSON Template where
  parseJSON (Object o) = do
    template <- o .: ("template" :: Text)
    templateValues <- o .: ("values" :: Text)
    pure $ Template {
      template = template,
      templateValues = templateValues
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Template where
  toJSON Template{..} = object $
    [ "tag" .= ("Template" :: Text)
    , "template" .= template
    , "values" .= templateValues
    ]


instance Eq Template where
  (==) a b = template a == template b && templateValues a == templateValues b

instance FromJSON ImageAssociation where
  parseJSON (Object o) = do
    imageUrl <- o .: ("image_url" :: Text)
    assocBy <- o .: ("assoc_by" :: Text)
    assocResult <- o .: ("assoc_result" :: Text)
    pure $ ImageAssociation {
      imageUrl = imageUrl,
      assocBy = assocBy,
      assocResult = assocResult
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ImageAssociation where
  toJSON ImageAssociation{..} = object $
    [ "tag" .= ("ImageAssociation" :: Text)
    , "image_url" .= imageUrl
    , "assoc_by" .= assocBy
    , "assoc_result" .= assocResult
    ]


instance Eq ImageAssociation where
  (==) a b = imageUrl a == imageUrl b && assocBy a == assocBy b && assocResult a == assocResult b

instance FromJSON Script where
  parseJSON (Object o) = do
    scriptTitle <- o .: ("title" :: Text)
    scriptDesc <- o .: ("desc" :: Text)
    scriptUrl <- o .: ("url" :: Text)
    pure $ Script {
      scriptTitle = scriptTitle,
      scriptDesc = scriptDesc,
      scriptUrl = scriptUrl
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Script where
  toJSON Script{..} = object $
    [ "tag" .= ("Script" :: Text)
    , "title" .= scriptTitle
    , "desc" .= scriptDesc
    , "url" .= scriptUrl
    ]


instance Eq Script where
  (==) a b = scriptTitle a == scriptTitle b && scriptDesc a == scriptDesc b && scriptUrl a == scriptUrl b

instance FromJSON LinearDemo where
  parseJSON (Object o) = do
    linearDemoLabel <- o .: ("label" :: Text)
    linearDemoContent <- o .: ("content" :: Text)
    pure $ LinearDemo {
      linearDemoLabel = linearDemoLabel,
      linearDemoContent = linearDemoContent
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LinearDemo where
  toJSON LinearDemo{..} = object $
    [ "tag" .= ("LinearDemo" :: Text)
    , "label" .= linearDemoLabel
    , "content" .= linearDemoContent
    ]


instance Eq LinearDemo where
  (==) a b = linearDemoLabel a == linearDemoLabel b && linearDemoContent a == linearDemoContent b

instance FromJSON QA where
  parseJSON (Object o) = do
    qaQuestion <- o .: ("question" :: Text)
    qaAnswer <- o .: ("answer" :: Text)
    pure $ QA {
      qaQuestion = qaQuestion,
      qaAnswer = qaAnswer
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON QA where
  toJSON QA{..} = object $
    [ "tag" .= ("QA" :: Text)
    , "question" .= qaQuestion
    , "answer" .= qaAnswer
    ]


instance Eq QA where
  (==) a b = qaQuestion a == qaQuestion b && qaAnswer a == qaAnswer b

instance FromJSON Table where
  parseJSON (Object o) = do
    tableTitle <- o .: ("title" :: Text)
    tableColumns <- o .: ("columns" :: Text)
    tableRows <- o .: ("rows" :: Text)
    pure $ Table {
      tableTitle = tableTitle,
      tableColumns = tableColumns,
      tableRows = tableRows
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Table where
  toJSON Table{..} = object $
    [ "tag" .= ("Table" :: Text)
    , "title" .= tableTitle
    , "columns" .= tableColumns
    , "rows" .= tableRows
    ]


instance Eq Table where
  (==) a b = tableTitle a == tableTitle b && tableColumns a == tableColumns b && tableRows a == tableRows b

instance FromJSON Membership where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("Membership_InviteOnly" :: Text) -> do
        pure Membership_InviteOnly

      ("Membership_RequestInvite" :: Text) -> do
        pure Membership_RequestInvite

      ("Membership_Join" :: Text) -> do
        pure Membership_Join

      ("Membership_Locked" :: Text) -> do
        pure Membership_Locked

      _ -> fail "Could not parse Membership"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Membership where
  toJSON (Membership_InviteOnly ) = object $
    [ "tag" .= ("Membership_InviteOnly" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Membership_RequestInvite ) = object $
    [ "tag" .= ("Membership_RequestInvite" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Membership_Join ) = object $
    [ "tag" .= ("Membership_Join" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Membership_Locked ) = object $
    [ "tag" .= ("Membership_Locked" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq Membership where
  (==) Membership_InviteOnly Membership_InviteOnly = True
  (==) Membership_RequestInvite Membership_RequestInvite = True
  (==) Membership_Join Membership_Join = True
  (==) Membership_Locked Membership_Locked = True
  (==) _ _ = False

instance FromJSON OrganizationRequest where
  parseJSON (Object o) = do
    organizationRequestDisplayName <- o .: ("display_name" :: Text)
    organizationRequestDescription <- o .: ("description" :: Text)
    organizationRequestCompany <- o .: ("company" :: Text)
    organizationRequestLocation <- o .: ("location" :: Text)
    organizationRequestEmail <- o .: ("email" :: Text)
    organizationRequestMembership <- o .: ("membership" :: Text)
    organizationRequestTags <- o .: ("tags" :: Text)
    organizationRequestIcon <- o .: ("icon" :: Text)
    organizationRequestVisibility <- o .: ("visibility" :: Text)
    organizationRequestGuard <- o .: ("guard" :: Text)
    pure $ OrganizationRequest {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON OrganizationRequest where
  toJSON OrganizationRequest{..} = object $
    [ "tag" .= ("OrganizationRequest" :: Text)
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


instance Eq OrganizationRequest where
  (==) a b = organizationRequestDisplayName a == organizationRequestDisplayName b && organizationRequestDescription a == organizationRequestDescription b && organizationRequestCompany a == organizationRequestCompany b && organizationRequestLocation a == organizationRequestLocation b && organizationRequestEmail a == organizationRequestEmail b && organizationRequestMembership a == organizationRequestMembership b && organizationRequestTags a == organizationRequestTags b && organizationRequestIcon a == organizationRequestIcon b && organizationRequestVisibility a == organizationRequestVisibility b && organizationRequestGuard a == organizationRequestGuard b

instance FromJSON OrganizationResponse where
  parseJSON (Object o) = do
    organizationResponseId <- o .: ("id" :: Text)
    organizationResponseUserId <- o .: ("user_id" :: Text)
    organizationResponseName <- o .: ("name" :: Text)
    organizationResponseDisplayName <- o .: ("display_name" :: Text)
    organizationResponseDescription <- o .: ("description" :: Text)
    organizationResponseCompany <- o .: ("company" :: Text)
    organizationResponseLocation <- o .: ("location" :: Text)
    organizationResponseEmail <- o .: ("email" :: Text)
    organizationResponseEmailMD5 <- o .: ("email_md5" :: Text)
    organizationResponseMembership <- o .: ("membership" :: Text)
    organizationResponseIcon <- o .: ("icon" :: Text)
    organizationResponseTags <- o .: ("tags" :: Text)
    organizationResponseVisibility <- o .: ("visibility" :: Text)
    organizationResponseActive <- o .: ("active" :: Text)
    organizationResponseGuard <- o .: ("guard" :: Text)
    organizationResponseCreatedAt <- o .: ("created_at" :: Text)
    organizationResponseModifiedBy <- o .: ("modified_by" :: Text)
    organizationResponseModifiedAt <- o .: ("modified_at" :: Text)
    organizationResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ OrganizationResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON OrganizationResponse where
  toJSON OrganizationResponse{..} = object $
    [ "tag" .= ("OrganizationResponse" :: Text)
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


instance Eq OrganizationResponse where
  (==) a b = organizationResponseId a == organizationResponseId b && organizationResponseUserId a == organizationResponseUserId b && organizationResponseName a == organizationResponseName b && organizationResponseDisplayName a == organizationResponseDisplayName b && organizationResponseDescription a == organizationResponseDescription b && organizationResponseCompany a == organizationResponseCompany b && organizationResponseLocation a == organizationResponseLocation b && organizationResponseEmail a == organizationResponseEmail b && organizationResponseEmailMD5 a == organizationResponseEmailMD5 b && organizationResponseMembership a == organizationResponseMembership b && organizationResponseIcon a == organizationResponseIcon b && organizationResponseTags a == organizationResponseTags b && organizationResponseVisibility a == organizationResponseVisibility b && organizationResponseActive a == organizationResponseActive b && organizationResponseGuard a == organizationResponseGuard b && organizationResponseCreatedAt a == organizationResponseCreatedAt b && organizationResponseModifiedBy a == organizationResponseModifiedBy b && organizationResponseModifiedAt a == organizationResponseModifiedAt b && organizationResponseActivityAt a == organizationResponseActivityAt b

instance FromJSON OrganizationResponses where
  parseJSON (Object o) = do
    organizationResponses <- o .: ("organization_responses" :: Text)
    pure $ OrganizationResponses {
      organizationResponses = organizationResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON OrganizationResponses where
  toJSON OrganizationResponses{..} = object $
    [ "tag" .= ("OrganizationResponses" :: Text)
    , "organization_responses" .= organizationResponses
    ]


instance Eq OrganizationResponses where
  (==) a b = organizationResponses a == organizationResponses b

instance FromJSON OrganizationStatResponse where
  parseJSON (Object o) = do
    organizationStatResponseOrganizationId <- o .: ("organization_id" :: Text)
    organizationStatResponseTeams <- o .: ("teams" :: Text)
    organizationStatResponseMembers <- o .: ("members" :: Text)
    organizationStatResponseForums <- o .: ("forums" :: Text)
    organizationStatResponseBoards <- o .: ("boards" :: Text)
    organizationStatResponseThreads <- o .: ("threads" :: Text)
    organizationStatResponseThreadPosts <- o .: ("thread_posts" :: Text)
    organizationStatResponseViews <- o .: ("views" :: Text)
    pure $ OrganizationStatResponse {
      organizationStatResponseOrganizationId = organizationStatResponseOrganizationId,
      organizationStatResponseTeams = organizationStatResponseTeams,
      organizationStatResponseMembers = organizationStatResponseMembers,
      organizationStatResponseForums = organizationStatResponseForums,
      organizationStatResponseBoards = organizationStatResponseBoards,
      organizationStatResponseThreads = organizationStatResponseThreads,
      organizationStatResponseThreadPosts = organizationStatResponseThreadPosts,
      organizationStatResponseViews = organizationStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON OrganizationStatResponse where
  toJSON OrganizationStatResponse{..} = object $
    [ "tag" .= ("OrganizationStatResponse" :: Text)
    , "organization_id" .= organizationStatResponseOrganizationId
    , "teams" .= organizationStatResponseTeams
    , "members" .= organizationStatResponseMembers
    , "forums" .= organizationStatResponseForums
    , "boards" .= organizationStatResponseBoards
    , "threads" .= organizationStatResponseThreads
    , "thread_posts" .= organizationStatResponseThreadPosts
    , "views" .= organizationStatResponseViews
    ]


instance Eq OrganizationStatResponse where
  (==) a b = organizationStatResponseOrganizationId a == organizationStatResponseOrganizationId b && organizationStatResponseTeams a == organizationStatResponseTeams b && organizationStatResponseMembers a == organizationStatResponseMembers b && organizationStatResponseForums a == organizationStatResponseForums b && organizationStatResponseBoards a == organizationStatResponseBoards b && organizationStatResponseThreads a == organizationStatResponseThreads b && organizationStatResponseThreadPosts a == organizationStatResponseThreadPosts b && organizationStatResponseViews a == organizationStatResponseViews b

instance FromJSON OrganizationStatResponses where
  parseJSON (Object o) = do
    organizationStatResponses <- o .: ("organization_stat_responses" :: Text)
    pure $ OrganizationStatResponses {
      organizationStatResponses = organizationStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON OrganizationStatResponses where
  toJSON OrganizationStatResponses{..} = object $
    [ "tag" .= ("OrganizationStatResponses" :: Text)
    , "organization_stat_responses" .= organizationStatResponses
    ]


instance Eq OrganizationStatResponses where
  (==) a b = organizationStatResponses a == organizationStatResponses b

instance FromJSON Param where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("Limit" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> Limit <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: Limit"

      ("Offset" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> Offset <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: Offset"

      ("SortOrder" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> SortOrder <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: SortOrder"

      ("Order" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> Order <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: Order"

      ("ByOrganizationId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByOrganizationId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByOrganizationId"

      ("ByOrganizationsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByOrganizationsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByOrganizationsIds"

      ("ByOrganizationName" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByOrganizationName <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByOrganizationName"

      ("ByTeamId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByTeamId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByTeamId"

      ("ByTeamsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByTeamsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByTeamsIds"

      ("ByTeamName" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByTeamName <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByTeamName"

      ("ByTeamMemberId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByTeamMemberId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByTeamMemberId"

      ("ByTeamMembersIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByTeamMembersIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByTeamMembersIds"

      ("ByUserId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByUserId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByUserId"

      ("ByUsersIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByUsersIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByUsersIds"

      ("ByUserNick" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByUserNick <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByUserNick"

      ("ByUsersNicks" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByUsersNicks <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByUsersNicks"

      ("ByGlobalGroupId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByGlobalGroupId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByGlobalGroupId"

      ("ByGlobalGroupsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByGlobalGroupsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByGlobalGroupsIds"

      ("ByGroupId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByGroupId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByGroupId"

      ("ByGroupsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByGroupsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByGroupsIds"

      ("ByGroupMemberId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByGroupMemberId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByGroupMemberId"

      ("ByGroupMembersIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByGroupMembersIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByGroupMembersIds"

      ("ByForumId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByForumId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByForumId"

      ("ByForumsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByForumsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByForumsIds"

      ("ByForumName" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByForumName <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByForumName"

      ("ByBoardId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByBoardId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByBoardId"

      ("ByBoardsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByBoardsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByBoardsIds"

      ("ByBoardName" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByBoardName <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByBoardName"

      ("ByThreadId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByThreadId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByThreadId"

      ("ByThreadsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByThreadsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByThreadsIds"

      ("ByThreadName" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByThreadName <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByThreadName"

      ("ByThreadPostId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByThreadPostId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByThreadPostId"

      ("ByThreadPostsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByThreadPostsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByThreadPostsIds"

      ("ByThreadPostName" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByThreadPostName <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByThreadPostName"

      ("ByThreadPostLikeId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByThreadPostLikeId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByThreadPostLikeId"

      ("ByThreadPostLikesIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByThreadPostLikesIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByThreadPostLikesIds"

      ("ByThreadPostStarId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByThreadPostStarId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByThreadPostStarId"

      ("ByThreadPostStarsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByThreadPostStarsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByThreadPostStarsIds"

      ("ByBucketId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByBucketId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByBucketId"

      ("ByResourceId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByResourceId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByResourceId"

      ("ByResourcesIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByResourcesIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByResourcesIds"

      ("ByResourceName" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByResourceName <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByResourceName"

      ("ByLeuronId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByLeuronId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByLeuronId"

      ("ByLeuronsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByLeuronsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByLeuronsIds"

      ("ByPmId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByPmId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByPmId"

      ("ByPmsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByPmsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByPmsIds"

      ("ByReminderId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByReminderId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByReminderId"

      ("ByReminderFolderId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByReminderFolderId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByReminderFolderId"

      ("ByParentId" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByParentId <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByParentId"

      ("ByParentsIds" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByParentsIds <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByParentsIds"

      ("ByParentName" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ByParentName <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ByParentName"

      ("BySelf" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> BySelf <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: BySelf"

      ("Timestamp" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> Timestamp <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: Timestamp"

      ("UnixTimestamp" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> UnixTimestamp <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: UnixTimestamp"

      ("CreatedAtTimestamp" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> CreatedAtTimestamp <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: CreatedAtTimestamp"

      ("CreatedAtUnixTimestamp" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> CreatedAtUnixTimestamp <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: CreatedAtUnixTimestamp"

      ("RealIP" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> RealIP <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: RealIP"

      ("IP" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> IP <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: IP"

      ("WithOrganization" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> WithOrganization <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: WithOrganization"

      ("WithForum" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> WithForum <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: WithForum"

      ("WithBoard" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> WithBoard <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: WithBoard"

      ("WithThread" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> WithThread <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: WithThread"

      ("WithResource" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> WithResource <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: WithResource"

      _ -> fail "Could not parse Param"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Param where
  toJSON (Limit x0) = object $
    [ "tag" .= ("Limit" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (Offset x0) = object $
    [ "tag" .= ("Offset" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (SortOrder x0) = object $
    [ "tag" .= ("SortOrder" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (Order x0) = object $
    [ "tag" .= ("Order" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByOrganizationId x0) = object $
    [ "tag" .= ("ByOrganizationId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByOrganizationsIds x0) = object $
    [ "tag" .= ("ByOrganizationsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByOrganizationName x0) = object $
    [ "tag" .= ("ByOrganizationName" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByTeamId x0) = object $
    [ "tag" .= ("ByTeamId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByTeamsIds x0) = object $
    [ "tag" .= ("ByTeamsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByTeamName x0) = object $
    [ "tag" .= ("ByTeamName" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByTeamMemberId x0) = object $
    [ "tag" .= ("ByTeamMemberId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByTeamMembersIds x0) = object $
    [ "tag" .= ("ByTeamMembersIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByUserId x0) = object $
    [ "tag" .= ("ByUserId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByUsersIds x0) = object $
    [ "tag" .= ("ByUsersIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByUserNick x0) = object $
    [ "tag" .= ("ByUserNick" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByUsersNicks x0) = object $
    [ "tag" .= ("ByUsersNicks" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByGlobalGroupId x0) = object $
    [ "tag" .= ("ByGlobalGroupId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByGlobalGroupsIds x0) = object $
    [ "tag" .= ("ByGlobalGroupsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByGroupId x0) = object $
    [ "tag" .= ("ByGroupId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByGroupsIds x0) = object $
    [ "tag" .= ("ByGroupsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByGroupMemberId x0) = object $
    [ "tag" .= ("ByGroupMemberId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByGroupMembersIds x0) = object $
    [ "tag" .= ("ByGroupMembersIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByForumId x0) = object $
    [ "tag" .= ("ByForumId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByForumsIds x0) = object $
    [ "tag" .= ("ByForumsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByForumName x0) = object $
    [ "tag" .= ("ByForumName" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByBoardId x0) = object $
    [ "tag" .= ("ByBoardId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByBoardsIds x0) = object $
    [ "tag" .= ("ByBoardsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByBoardName x0) = object $
    [ "tag" .= ("ByBoardName" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByThreadId x0) = object $
    [ "tag" .= ("ByThreadId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByThreadsIds x0) = object $
    [ "tag" .= ("ByThreadsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByThreadName x0) = object $
    [ "tag" .= ("ByThreadName" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByThreadPostId x0) = object $
    [ "tag" .= ("ByThreadPostId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByThreadPostsIds x0) = object $
    [ "tag" .= ("ByThreadPostsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByThreadPostName x0) = object $
    [ "tag" .= ("ByThreadPostName" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByThreadPostLikeId x0) = object $
    [ "tag" .= ("ByThreadPostLikeId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByThreadPostLikesIds x0) = object $
    [ "tag" .= ("ByThreadPostLikesIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByThreadPostStarId x0) = object $
    [ "tag" .= ("ByThreadPostStarId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByThreadPostStarsIds x0) = object $
    [ "tag" .= ("ByThreadPostStarsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByBucketId x0) = object $
    [ "tag" .= ("ByBucketId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByResourceId x0) = object $
    [ "tag" .= ("ByResourceId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByResourcesIds x0) = object $
    [ "tag" .= ("ByResourcesIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByResourceName x0) = object $
    [ "tag" .= ("ByResourceName" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByLeuronId x0) = object $
    [ "tag" .= ("ByLeuronId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByLeuronsIds x0) = object $
    [ "tag" .= ("ByLeuronsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByPmId x0) = object $
    [ "tag" .= ("ByPmId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByPmsIds x0) = object $
    [ "tag" .= ("ByPmsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByReminderId x0) = object $
    [ "tag" .= ("ByReminderId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByReminderFolderId x0) = object $
    [ "tag" .= ("ByReminderFolderId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByParentId x0) = object $
    [ "tag" .= ("ByParentId" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByParentsIds x0) = object $
    [ "tag" .= ("ByParentsIds" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ByParentName x0) = object $
    [ "tag" .= ("ByParentName" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (BySelf x0) = object $
    [ "tag" .= ("BySelf" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (Timestamp x0) = object $
    [ "tag" .= ("Timestamp" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (UnixTimestamp x0) = object $
    [ "tag" .= ("UnixTimestamp" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (CreatedAtTimestamp x0) = object $
    [ "tag" .= ("CreatedAtTimestamp" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (CreatedAtUnixTimestamp x0) = object $
    [ "tag" .= ("CreatedAtUnixTimestamp" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (RealIP x0) = object $
    [ "tag" .= ("RealIP" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (IP x0) = object $
    [ "tag" .= ("IP" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (WithOrganization x0) = object $
    [ "tag" .= ("WithOrganization" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (WithForum x0) = object $
    [ "tag" .= ("WithForum" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (WithBoard x0) = object $
    [ "tag" .= ("WithBoard" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (WithThread x0) = object $
    [ "tag" .= ("WithThread" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (WithResource x0) = object $
    [ "tag" .= ("WithResource" :: Text)
    , "contents" .= [toJSON x0]
    ]


instance Eq Param where
  (==) (Limit x0a) (Limit x0b) = x0a == x0b
  (==) (Offset x0a) (Offset x0b) = x0a == x0b
  (==) (SortOrder x0a) (SortOrder x0b) = x0a == x0b
  (==) (Order x0a) (Order x0b) = x0a == x0b
  (==) (ByOrganizationId x0a) (ByOrganizationId x0b) = x0a == x0b
  (==) (ByOrganizationsIds x0a) (ByOrganizationsIds x0b) = x0a == x0b
  (==) (ByOrganizationName x0a) (ByOrganizationName x0b) = x0a == x0b
  (==) (ByTeamId x0a) (ByTeamId x0b) = x0a == x0b
  (==) (ByTeamsIds x0a) (ByTeamsIds x0b) = x0a == x0b
  (==) (ByTeamName x0a) (ByTeamName x0b) = x0a == x0b
  (==) (ByTeamMemberId x0a) (ByTeamMemberId x0b) = x0a == x0b
  (==) (ByTeamMembersIds x0a) (ByTeamMembersIds x0b) = x0a == x0b
  (==) (ByUserId x0a) (ByUserId x0b) = x0a == x0b
  (==) (ByUsersIds x0a) (ByUsersIds x0b) = x0a == x0b
  (==) (ByUserNick x0a) (ByUserNick x0b) = x0a == x0b
  (==) (ByUsersNicks x0a) (ByUsersNicks x0b) = x0a == x0b
  (==) (ByGlobalGroupId x0a) (ByGlobalGroupId x0b) = x0a == x0b
  (==) (ByGlobalGroupsIds x0a) (ByGlobalGroupsIds x0b) = x0a == x0b
  (==) (ByGroupId x0a) (ByGroupId x0b) = x0a == x0b
  (==) (ByGroupsIds x0a) (ByGroupsIds x0b) = x0a == x0b
  (==) (ByGroupMemberId x0a) (ByGroupMemberId x0b) = x0a == x0b
  (==) (ByGroupMembersIds x0a) (ByGroupMembersIds x0b) = x0a == x0b
  (==) (ByForumId x0a) (ByForumId x0b) = x0a == x0b
  (==) (ByForumsIds x0a) (ByForumsIds x0b) = x0a == x0b
  (==) (ByForumName x0a) (ByForumName x0b) = x0a == x0b
  (==) (ByBoardId x0a) (ByBoardId x0b) = x0a == x0b
  (==) (ByBoardsIds x0a) (ByBoardsIds x0b) = x0a == x0b
  (==) (ByBoardName x0a) (ByBoardName x0b) = x0a == x0b
  (==) (ByThreadId x0a) (ByThreadId x0b) = x0a == x0b
  (==) (ByThreadsIds x0a) (ByThreadsIds x0b) = x0a == x0b
  (==) (ByThreadName x0a) (ByThreadName x0b) = x0a == x0b
  (==) (ByThreadPostId x0a) (ByThreadPostId x0b) = x0a == x0b
  (==) (ByThreadPostsIds x0a) (ByThreadPostsIds x0b) = x0a == x0b
  (==) (ByThreadPostName x0a) (ByThreadPostName x0b) = x0a == x0b
  (==) (ByThreadPostLikeId x0a) (ByThreadPostLikeId x0b) = x0a == x0b
  (==) (ByThreadPostLikesIds x0a) (ByThreadPostLikesIds x0b) = x0a == x0b
  (==) (ByThreadPostStarId x0a) (ByThreadPostStarId x0b) = x0a == x0b
  (==) (ByThreadPostStarsIds x0a) (ByThreadPostStarsIds x0b) = x0a == x0b
  (==) (ByBucketId x0a) (ByBucketId x0b) = x0a == x0b
  (==) (ByResourceId x0a) (ByResourceId x0b) = x0a == x0b
  (==) (ByResourcesIds x0a) (ByResourcesIds x0b) = x0a == x0b
  (==) (ByResourceName x0a) (ByResourceName x0b) = x0a == x0b
  (==) (ByLeuronId x0a) (ByLeuronId x0b) = x0a == x0b
  (==) (ByLeuronsIds x0a) (ByLeuronsIds x0b) = x0a == x0b
  (==) (ByPmId x0a) (ByPmId x0b) = x0a == x0b
  (==) (ByPmsIds x0a) (ByPmsIds x0b) = x0a == x0b
  (==) (ByReminderId x0a) (ByReminderId x0b) = x0a == x0b
  (==) (ByReminderFolderId x0a) (ByReminderFolderId x0b) = x0a == x0b
  (==) (ByParentId x0a) (ByParentId x0b) = x0a == x0b
  (==) (ByParentsIds x0a) (ByParentsIds x0b) = x0a == x0b
  (==) (ByParentName x0a) (ByParentName x0b) = x0a == x0b
  (==) (BySelf x0a) (BySelf x0b) = x0a == x0b
  (==) (Timestamp x0a) (Timestamp x0b) = x0a == x0b
  (==) (UnixTimestamp x0a) (UnixTimestamp x0b) = x0a == x0b
  (==) (CreatedAtTimestamp x0a) (CreatedAtTimestamp x0b) = x0a == x0b
  (==) (CreatedAtUnixTimestamp x0a) (CreatedAtUnixTimestamp x0b) = x0a == x0b
  (==) (RealIP x0a) (RealIP x0b) = x0a == x0b
  (==) (IP x0a) (IP x0b) = x0a == x0b
  (==) (WithOrganization x0a) (WithOrganization x0b) = x0a == x0b
  (==) (WithForum x0a) (WithForum x0b) = x0a == x0b
  (==) (WithBoard x0a) (WithBoard x0b) = x0a == x0b
  (==) (WithThread x0a) (WithThread x0b) = x0a == x0b
  (==) (WithResource x0a) (WithResource x0b) = x0a == x0b
  (==) _ _ = False

instance Show Param where
  show (Limit x0) = "limit: " <> show x0
  show (Offset x0) = "offset: " <> show x0
  show (SortOrder x0) = "sort_order: " <> show x0
  show (Order x0) = "order: " <> show x0
  show (ByOrganizationId x0) = "by_organization_id: " <> show x0
  show (ByOrganizationsIds x0) = "by_organizations_ids: " <> show x0
  show (ByOrganizationName x0) = "by_organization_name: " <> show x0
  show (ByTeamId x0) = "by_team_id: " <> show x0
  show (ByTeamsIds x0) = "by_teams_ids: " <> show x0
  show (ByTeamName x0) = "by_team_name: " <> show x0
  show (ByTeamMemberId x0) = "by_team_member_id: " <> show x0
  show (ByTeamMembersIds x0) = "by_team_members_ids: " <> show x0
  show (ByUserId x0) = "by_user_id: " <> show x0
  show (ByUsersIds x0) = "by_users_ids: " <> show x0
  show (ByUserNick x0) = "by_user_nick: " <> show x0
  show (ByUsersNicks x0) = "by_users_nicks: " <> show x0
  show (ByGlobalGroupId x0) = "by_global_group_id: " <> show x0
  show (ByGlobalGroupsIds x0) = "by_global_groups_ids: " <> show x0
  show (ByGroupId x0) = "by_group_id: " <> show x0
  show (ByGroupsIds x0) = "by_groups_ids: " <> show x0
  show (ByGroupMemberId x0) = "by_group_member_id: " <> show x0
  show (ByGroupMembersIds x0) = "by_group_members_ids: " <> show x0
  show (ByForumId x0) = "by_forum_id: " <> show x0
  show (ByForumsIds x0) = "by_forums_ids: " <> show x0
  show (ByForumName x0) = "by_forum_name: " <> show x0
  show (ByBoardId x0) = "by_board_id: " <> show x0
  show (ByBoardsIds x0) = "by_boards_ids: " <> show x0
  show (ByBoardName x0) = "by_board_name: " <> show x0
  show (ByThreadId x0) = "by_thread_id: " <> show x0
  show (ByThreadsIds x0) = "by_threads_ids: " <> show x0
  show (ByThreadName x0) = "by_thread_name: " <> show x0
  show (ByThreadPostId x0) = "by_thread_post_id: " <> show x0
  show (ByThreadPostsIds x0) = "by_thread_posts_ids: " <> show x0
  show (ByThreadPostName x0) = "by_thread_post_name: " <> show x0
  show (ByThreadPostLikeId x0) = "by_thread_post_like_id: " <> show x0
  show (ByThreadPostLikesIds x0) = "by_thread_post_likes_ids: " <> show x0
  show (ByThreadPostStarId x0) = "by_thread_post_star_id: " <> show x0
  show (ByThreadPostStarsIds x0) = "by_thread_post_stars_ids: " <> show x0
  show (ByBucketId x0) = "by_bucket_id: " <> show x0
  show (ByResourceId x0) = "by_resource_id: " <> show x0
  show (ByResourcesIds x0) = "by_resources_ids: " <> show x0
  show (ByResourceName x0) = "by_resource_name: " <> show x0
  show (ByLeuronId x0) = "by_leuron_id: " <> show x0
  show (ByLeuronsIds x0) = "by_leurons_ids: " <> show x0
  show (ByPmId x0) = "by_pm_id: " <> show x0
  show (ByPmsIds x0) = "by_pms_ids: " <> show x0
  show (ByReminderId x0) = "by_reminder_id: " <> show x0
  show (ByReminderFolderId x0) = "by_reminder_folder_id: " <> show x0
  show (ByParentId x0) = "by_parent_id: " <> show x0
  show (ByParentsIds x0) = "by_parents_ids: " <> show x0
  show (ByParentName x0) = "by_parent_name: " <> show x0
  show (BySelf x0) = "by_self: " <> show x0
  show (Timestamp x0) = "timestamp: " <> show x0
  show (UnixTimestamp x0) = "unix_timestamp: " <> show x0
  show (CreatedAtTimestamp x0) = "created_at_timestamp: " <> show x0
  show (CreatedAtUnixTimestamp x0) = "created_at_unix_timestamp: " <> show x0
  show (RealIP x0) = "real_ip: " <> show x0
  show (IP x0) = "ip: " <> show x0
  show (WithOrganization x0) = "with_organization: " <> show x0
  show (WithForum x0) = "with_forum: " <> show x0
  show (WithBoard x0) = "with_board: " <> show x0
  show (WithThread x0) = "with_thread: " <> show x0
  show (WithResource x0) = "with_resource: " <> show x0


instance QueryParam Param where
  qp (Limit x0) = ("limit", (T.pack $ show x0))
  qp (Offset x0) = ("offset", (T.pack $ show x0))
  qp (SortOrder x0) = ("sort_order", (T.pack $ show x0))
  qp (Order x0) = ("order", (T.pack $ show x0))
  qp (ByOrganizationId x0) = ("by_organization_id", (T.pack $ show x0))
  qp (ByOrganizationsIds x0) = ("by_organizations_ids", (T.pack $ show x0))
  qp (ByOrganizationName x0) = ("by_organization_name", x0)
  qp (ByTeamId x0) = ("by_team_id", (T.pack $ show x0))
  qp (ByTeamsIds x0) = ("by_teams_ids", (T.pack $ show x0))
  qp (ByTeamName x0) = ("by_team_name", x0)
  qp (ByTeamMemberId x0) = ("by_team_member_id", (T.pack $ show x0))
  qp (ByTeamMembersIds x0) = ("by_team_members_ids", (T.pack $ show x0))
  qp (ByUserId x0) = ("by_user_id", (T.pack $ show x0))
  qp (ByUsersIds x0) = ("by_users_ids", (T.pack $ show x0))
  qp (ByUserNick x0) = ("by_user_nick", x0)
  qp (ByUsersNicks x0) = ("by_users_nicks", (T.pack $ show x0))
  qp (ByGlobalGroupId x0) = ("by_global_group_id", (T.pack $ show x0))
  qp (ByGlobalGroupsIds x0) = ("by_global_groups_ids", (T.pack $ show x0))
  qp (ByGroupId x0) = ("by_group_id", (T.pack $ show x0))
  qp (ByGroupsIds x0) = ("by_groups_ids", (T.pack $ show x0))
  qp (ByGroupMemberId x0) = ("by_group_member_id", (T.pack $ show x0))
  qp (ByGroupMembersIds x0) = ("by_group_members_ids", (T.pack $ show x0))
  qp (ByForumId x0) = ("by_forum_id", (T.pack $ show x0))
  qp (ByForumsIds x0) = ("by_forums_ids", (T.pack $ show x0))
  qp (ByForumName x0) = ("by_forum_name", x0)
  qp (ByBoardId x0) = ("by_board_id", (T.pack $ show x0))
  qp (ByBoardsIds x0) = ("by_boards_ids", (T.pack $ show x0))
  qp (ByBoardName x0) = ("by_board_name", x0)
  qp (ByThreadId x0) = ("by_thread_id", (T.pack $ show x0))
  qp (ByThreadsIds x0) = ("by_threads_ids", (T.pack $ show x0))
  qp (ByThreadName x0) = ("by_thread_name", x0)
  qp (ByThreadPostId x0) = ("by_thread_post_id", (T.pack $ show x0))
  qp (ByThreadPostsIds x0) = ("by_thread_posts_ids", (T.pack $ show x0))
  qp (ByThreadPostName x0) = ("by_thread_post_name", x0)
  qp (ByThreadPostLikeId x0) = ("by_thread_post_like_id", (T.pack $ show x0))
  qp (ByThreadPostLikesIds x0) = ("by_thread_post_likes_ids", (T.pack $ show x0))
  qp (ByThreadPostStarId x0) = ("by_thread_post_star_id", (T.pack $ show x0))
  qp (ByThreadPostStarsIds x0) = ("by_thread_post_stars_ids", (T.pack $ show x0))
  qp (ByBucketId x0) = ("by_bucket_id", (T.pack $ show x0))
  qp (ByResourceId x0) = ("by_resource_id", (T.pack $ show x0))
  qp (ByResourcesIds x0) = ("by_resources_ids", (T.pack $ show x0))
  qp (ByResourceName x0) = ("by_resource_name", x0)
  qp (ByLeuronId x0) = ("by_leuron_id", (T.pack $ show x0))
  qp (ByLeuronsIds x0) = ("by_leurons_ids", (T.pack $ show x0))
  qp (ByPmId x0) = ("by_pm_id", (T.pack $ show x0))
  qp (ByPmsIds x0) = ("by_pms_ids", (T.pack $ show x0))
  qp (ByReminderId x0) = ("by_reminder_id", (T.pack $ show x0))
  qp (ByReminderFolderId x0) = ("by_reminder_folder_id", (T.pack $ show x0))
  qp (ByParentId x0) = ("by_parent_id", (T.pack $ show x0))
  qp (ByParentsIds x0) = ("by_parents_ids", (T.pack $ show x0))
  qp (ByParentName x0) = ("by_parent_name", x0)
  qp (BySelf x0) = ("by_self", (T.pack $ show x0))
  qp (Timestamp x0) = ("timestamp", (T.pack $ show x0))
  qp (UnixTimestamp x0) = ("unix_timestamp", (T.pack $ show x0))
  qp (CreatedAtTimestamp x0) = ("created_at_timestamp", (T.pack $ show x0))
  qp (CreatedAtUnixTimestamp x0) = ("created_at_unix_timestamp", (T.pack $ show x0))
  qp (RealIP x0) = ("real_ip", x0)
  qp (IP x0) = ("ip", x0)
  qp (WithOrganization x0) = ("with_organization", (T.pack $ show x0))
  qp (WithForum x0) = ("with_forum", (T.pack $ show x0))
  qp (WithBoard x0) = ("with_board", (T.pack $ show x0))
  qp (WithThread x0) = ("with_thread", (T.pack $ show x0))
  qp (WithResource x0) = ("with_resource", (T.pack $ show x0))


instance FromJSON ParamTag where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("ParamTag_Limit" :: Text) -> do
        pure ParamTag_Limit

      ("ParamTag_Offset" :: Text) -> do
        pure ParamTag_Offset

      ("ParamTag_SortOrder" :: Text) -> do
        pure ParamTag_SortOrder

      ("ParamTag_Order" :: Text) -> do
        pure ParamTag_Order

      ("ParamTag_ByOrganizationId" :: Text) -> do
        pure ParamTag_ByOrganizationId

      ("ParamTag_ByOrganizationsIds" :: Text) -> do
        pure ParamTag_ByOrganizationsIds

      ("ParamTag_ByOrganizationName" :: Text) -> do
        pure ParamTag_ByOrganizationName

      ("ParamTag_ByTeamId" :: Text) -> do
        pure ParamTag_ByTeamId

      ("ParamTag_ByTeamsIds" :: Text) -> do
        pure ParamTag_ByTeamsIds

      ("ParamTag_ByTeamName" :: Text) -> do
        pure ParamTag_ByTeamName

      ("ParamTag_ByTeamMemberId" :: Text) -> do
        pure ParamTag_ByTeamMemberId

      ("ParamTag_ByTeamMembersIds" :: Text) -> do
        pure ParamTag_ByTeamMembersIds

      ("ParamTag_ByUserId" :: Text) -> do
        pure ParamTag_ByUserId

      ("ParamTag_ByUsersIds" :: Text) -> do
        pure ParamTag_ByUsersIds

      ("ParamTag_ByUserNick" :: Text) -> do
        pure ParamTag_ByUserNick

      ("ParamTag_ByUsersNicks" :: Text) -> do
        pure ParamTag_ByUsersNicks

      ("ParamTag_ByGlobalGroupId" :: Text) -> do
        pure ParamTag_ByGlobalGroupId

      ("ParamTag_ByGlobalGroupsIds" :: Text) -> do
        pure ParamTag_ByGlobalGroupsIds

      ("ParamTag_ByGroupId" :: Text) -> do
        pure ParamTag_ByGroupId

      ("ParamTag_ByGroupsIds" :: Text) -> do
        pure ParamTag_ByGroupsIds

      ("ParamTag_ByGroupMemberId" :: Text) -> do
        pure ParamTag_ByGroupMemberId

      ("ParamTag_ByGroupMembersIds" :: Text) -> do
        pure ParamTag_ByGroupMembersIds

      ("ParamTag_ByForumId" :: Text) -> do
        pure ParamTag_ByForumId

      ("ParamTag_ByForumsIds" :: Text) -> do
        pure ParamTag_ByForumsIds

      ("ParamTag_ByForumName" :: Text) -> do
        pure ParamTag_ByForumName

      ("ParamTag_ByBoardId" :: Text) -> do
        pure ParamTag_ByBoardId

      ("ParamTag_ByBoardsIds" :: Text) -> do
        pure ParamTag_ByBoardsIds

      ("ParamTag_ByBoardName" :: Text) -> do
        pure ParamTag_ByBoardName

      ("ParamTag_ByThreadId" :: Text) -> do
        pure ParamTag_ByThreadId

      ("ParamTag_ByThreadsIds" :: Text) -> do
        pure ParamTag_ByThreadsIds

      ("ParamTag_ByThreadName" :: Text) -> do
        pure ParamTag_ByThreadName

      ("ParamTag_ByThreadPostId" :: Text) -> do
        pure ParamTag_ByThreadPostId

      ("ParamTag_ByThreadPostsIds" :: Text) -> do
        pure ParamTag_ByThreadPostsIds

      ("ParamTag_ByThreadPostName" :: Text) -> do
        pure ParamTag_ByThreadPostName

      ("ParamTag_ByThreadPostLikeId" :: Text) -> do
        pure ParamTag_ByThreadPostLikeId

      ("ParamTag_ByThreadPostLikesIds" :: Text) -> do
        pure ParamTag_ByThreadPostLikesIds

      ("ParamTag_ByThreadPostStarId" :: Text) -> do
        pure ParamTag_ByThreadPostStarId

      ("ParamTag_ByThreadPostStarsIds" :: Text) -> do
        pure ParamTag_ByThreadPostStarsIds

      ("ParamTag_ByBucketId" :: Text) -> do
        pure ParamTag_ByBucketId

      ("ParamTag_ByResourceId" :: Text) -> do
        pure ParamTag_ByResourceId

      ("ParamTag_ByResourcesIds" :: Text) -> do
        pure ParamTag_ByResourcesIds

      ("ParamTag_ByResourceName" :: Text) -> do
        pure ParamTag_ByResourceName

      ("ParamTag_ByLeuronId" :: Text) -> do
        pure ParamTag_ByLeuronId

      ("ParamTag_ByLeuronsIds" :: Text) -> do
        pure ParamTag_ByLeuronsIds

      ("ParamTag_ByPmId" :: Text) -> do
        pure ParamTag_ByPmId

      ("ParamTag_ByPmsIds" :: Text) -> do
        pure ParamTag_ByPmsIds

      ("ParamTag_ByReminderId" :: Text) -> do
        pure ParamTag_ByReminderId

      ("ParamTag_ByReminderFolderId" :: Text) -> do
        pure ParamTag_ByReminderFolderId

      ("ParamTag_ByParentId" :: Text) -> do
        pure ParamTag_ByParentId

      ("ParamTag_ByParentsIds" :: Text) -> do
        pure ParamTag_ByParentsIds

      ("ParamTag_ByParentName" :: Text) -> do
        pure ParamTag_ByParentName

      ("ParamTag_BySelf" :: Text) -> do
        pure ParamTag_BySelf

      ("ParamTag_Timestamp" :: Text) -> do
        pure ParamTag_Timestamp

      ("ParamTag_UnixTimestamp" :: Text) -> do
        pure ParamTag_UnixTimestamp

      ("ParamTag_CreatedAtTimestamp" :: Text) -> do
        pure ParamTag_CreatedAtTimestamp

      ("ParamTag_CreatedAtUnixTimestamp" :: Text) -> do
        pure ParamTag_CreatedAtUnixTimestamp

      ("ParamTag_RealIP" :: Text) -> do
        pure ParamTag_RealIP

      ("ParamTag_IP" :: Text) -> do
        pure ParamTag_IP

      ("ParamTag_WithOrganization" :: Text) -> do
        pure ParamTag_WithOrganization

      ("ParamTag_WithForum" :: Text) -> do
        pure ParamTag_WithForum

      ("ParamTag_WithBoard" :: Text) -> do
        pure ParamTag_WithBoard

      ("ParamTag_WithThread" :: Text) -> do
        pure ParamTag_WithThread

      ("ParamTag_WithResource" :: Text) -> do
        pure ParamTag_WithResource

      _ -> fail "Could not parse ParamTag"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ParamTag where
  toJSON (ParamTag_Limit ) = object $
    [ "tag" .= ("ParamTag_Limit" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_Offset ) = object $
    [ "tag" .= ("ParamTag_Offset" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_SortOrder ) = object $
    [ "tag" .= ("ParamTag_SortOrder" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_Order ) = object $
    [ "tag" .= ("ParamTag_Order" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByOrganizationId ) = object $
    [ "tag" .= ("ParamTag_ByOrganizationId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByOrganizationsIds ) = object $
    [ "tag" .= ("ParamTag_ByOrganizationsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByOrganizationName ) = object $
    [ "tag" .= ("ParamTag_ByOrganizationName" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByTeamId ) = object $
    [ "tag" .= ("ParamTag_ByTeamId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByTeamsIds ) = object $
    [ "tag" .= ("ParamTag_ByTeamsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByTeamName ) = object $
    [ "tag" .= ("ParamTag_ByTeamName" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByTeamMemberId ) = object $
    [ "tag" .= ("ParamTag_ByTeamMemberId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByTeamMembersIds ) = object $
    [ "tag" .= ("ParamTag_ByTeamMembersIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByUserId ) = object $
    [ "tag" .= ("ParamTag_ByUserId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByUsersIds ) = object $
    [ "tag" .= ("ParamTag_ByUsersIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByUserNick ) = object $
    [ "tag" .= ("ParamTag_ByUserNick" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByUsersNicks ) = object $
    [ "tag" .= ("ParamTag_ByUsersNicks" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGlobalGroupId ) = object $
    [ "tag" .= ("ParamTag_ByGlobalGroupId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGlobalGroupsIds ) = object $
    [ "tag" .= ("ParamTag_ByGlobalGroupsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGroupId ) = object $
    [ "tag" .= ("ParamTag_ByGroupId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGroupsIds ) = object $
    [ "tag" .= ("ParamTag_ByGroupsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGroupMemberId ) = object $
    [ "tag" .= ("ParamTag_ByGroupMemberId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByGroupMembersIds ) = object $
    [ "tag" .= ("ParamTag_ByGroupMembersIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByForumId ) = object $
    [ "tag" .= ("ParamTag_ByForumId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByForumsIds ) = object $
    [ "tag" .= ("ParamTag_ByForumsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByForumName ) = object $
    [ "tag" .= ("ParamTag_ByForumName" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByBoardId ) = object $
    [ "tag" .= ("ParamTag_ByBoardId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByBoardsIds ) = object $
    [ "tag" .= ("ParamTag_ByBoardsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByBoardName ) = object $
    [ "tag" .= ("ParamTag_ByBoardName" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadId ) = object $
    [ "tag" .= ("ParamTag_ByThreadId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadsIds ) = object $
    [ "tag" .= ("ParamTag_ByThreadsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadName ) = object $
    [ "tag" .= ("ParamTag_ByThreadName" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostId ) = object $
    [ "tag" .= ("ParamTag_ByThreadPostId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostsIds ) = object $
    [ "tag" .= ("ParamTag_ByThreadPostsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostName ) = object $
    [ "tag" .= ("ParamTag_ByThreadPostName" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostLikeId ) = object $
    [ "tag" .= ("ParamTag_ByThreadPostLikeId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostLikesIds ) = object $
    [ "tag" .= ("ParamTag_ByThreadPostLikesIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostStarId ) = object $
    [ "tag" .= ("ParamTag_ByThreadPostStarId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByThreadPostStarsIds ) = object $
    [ "tag" .= ("ParamTag_ByThreadPostStarsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByBucketId ) = object $
    [ "tag" .= ("ParamTag_ByBucketId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByResourceId ) = object $
    [ "tag" .= ("ParamTag_ByResourceId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByResourcesIds ) = object $
    [ "tag" .= ("ParamTag_ByResourcesIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByResourceName ) = object $
    [ "tag" .= ("ParamTag_ByResourceName" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByLeuronId ) = object $
    [ "tag" .= ("ParamTag_ByLeuronId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByLeuronsIds ) = object $
    [ "tag" .= ("ParamTag_ByLeuronsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByPmId ) = object $
    [ "tag" .= ("ParamTag_ByPmId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByPmsIds ) = object $
    [ "tag" .= ("ParamTag_ByPmsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByReminderId ) = object $
    [ "tag" .= ("ParamTag_ByReminderId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByReminderFolderId ) = object $
    [ "tag" .= ("ParamTag_ByReminderFolderId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByParentId ) = object $
    [ "tag" .= ("ParamTag_ByParentId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByParentsIds ) = object $
    [ "tag" .= ("ParamTag_ByParentsIds" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_ByParentName ) = object $
    [ "tag" .= ("ParamTag_ByParentName" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_BySelf ) = object $
    [ "tag" .= ("ParamTag_BySelf" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_Timestamp ) = object $
    [ "tag" .= ("ParamTag_Timestamp" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_UnixTimestamp ) = object $
    [ "tag" .= ("ParamTag_UnixTimestamp" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_CreatedAtTimestamp ) = object $
    [ "tag" .= ("ParamTag_CreatedAtTimestamp" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_CreatedAtUnixTimestamp ) = object $
    [ "tag" .= ("ParamTag_CreatedAtUnixTimestamp" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_RealIP ) = object $
    [ "tag" .= ("ParamTag_RealIP" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_IP ) = object $
    [ "tag" .= ("ParamTag_IP" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_WithOrganization ) = object $
    [ "tag" .= ("ParamTag_WithOrganization" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_WithForum ) = object $
    [ "tag" .= ("ParamTag_WithForum" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_WithBoard ) = object $
    [ "tag" .= ("ParamTag_WithBoard" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_WithThread ) = object $
    [ "tag" .= ("ParamTag_WithThread" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (ParamTag_WithResource ) = object $
    [ "tag" .= ("ParamTag_WithResource" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq ParamTag where
  (==) ParamTag_Limit ParamTag_Limit = True
  (==) ParamTag_Offset ParamTag_Offset = True
  (==) ParamTag_SortOrder ParamTag_SortOrder = True
  (==) ParamTag_Order ParamTag_Order = True
  (==) ParamTag_ByOrganizationId ParamTag_ByOrganizationId = True
  (==) ParamTag_ByOrganizationsIds ParamTag_ByOrganizationsIds = True
  (==) ParamTag_ByOrganizationName ParamTag_ByOrganizationName = True
  (==) ParamTag_ByTeamId ParamTag_ByTeamId = True
  (==) ParamTag_ByTeamsIds ParamTag_ByTeamsIds = True
  (==) ParamTag_ByTeamName ParamTag_ByTeamName = True
  (==) ParamTag_ByTeamMemberId ParamTag_ByTeamMemberId = True
  (==) ParamTag_ByTeamMembersIds ParamTag_ByTeamMembersIds = True
  (==) ParamTag_ByUserId ParamTag_ByUserId = True
  (==) ParamTag_ByUsersIds ParamTag_ByUsersIds = True
  (==) ParamTag_ByUserNick ParamTag_ByUserNick = True
  (==) ParamTag_ByUsersNicks ParamTag_ByUsersNicks = True
  (==) ParamTag_ByGlobalGroupId ParamTag_ByGlobalGroupId = True
  (==) ParamTag_ByGlobalGroupsIds ParamTag_ByGlobalGroupsIds = True
  (==) ParamTag_ByGroupId ParamTag_ByGroupId = True
  (==) ParamTag_ByGroupsIds ParamTag_ByGroupsIds = True
  (==) ParamTag_ByGroupMemberId ParamTag_ByGroupMemberId = True
  (==) ParamTag_ByGroupMembersIds ParamTag_ByGroupMembersIds = True
  (==) ParamTag_ByForumId ParamTag_ByForumId = True
  (==) ParamTag_ByForumsIds ParamTag_ByForumsIds = True
  (==) ParamTag_ByForumName ParamTag_ByForumName = True
  (==) ParamTag_ByBoardId ParamTag_ByBoardId = True
  (==) ParamTag_ByBoardsIds ParamTag_ByBoardsIds = True
  (==) ParamTag_ByBoardName ParamTag_ByBoardName = True
  (==) ParamTag_ByThreadId ParamTag_ByThreadId = True
  (==) ParamTag_ByThreadsIds ParamTag_ByThreadsIds = True
  (==) ParamTag_ByThreadName ParamTag_ByThreadName = True
  (==) ParamTag_ByThreadPostId ParamTag_ByThreadPostId = True
  (==) ParamTag_ByThreadPostsIds ParamTag_ByThreadPostsIds = True
  (==) ParamTag_ByThreadPostName ParamTag_ByThreadPostName = True
  (==) ParamTag_ByThreadPostLikeId ParamTag_ByThreadPostLikeId = True
  (==) ParamTag_ByThreadPostLikesIds ParamTag_ByThreadPostLikesIds = True
  (==) ParamTag_ByThreadPostStarId ParamTag_ByThreadPostStarId = True
  (==) ParamTag_ByThreadPostStarsIds ParamTag_ByThreadPostStarsIds = True
  (==) ParamTag_ByBucketId ParamTag_ByBucketId = True
  (==) ParamTag_ByResourceId ParamTag_ByResourceId = True
  (==) ParamTag_ByResourcesIds ParamTag_ByResourcesIds = True
  (==) ParamTag_ByResourceName ParamTag_ByResourceName = True
  (==) ParamTag_ByLeuronId ParamTag_ByLeuronId = True
  (==) ParamTag_ByLeuronsIds ParamTag_ByLeuronsIds = True
  (==) ParamTag_ByPmId ParamTag_ByPmId = True
  (==) ParamTag_ByPmsIds ParamTag_ByPmsIds = True
  (==) ParamTag_ByReminderId ParamTag_ByReminderId = True
  (==) ParamTag_ByReminderFolderId ParamTag_ByReminderFolderId = True
  (==) ParamTag_ByParentId ParamTag_ByParentId = True
  (==) ParamTag_ByParentsIds ParamTag_ByParentsIds = True
  (==) ParamTag_ByParentName ParamTag_ByParentName = True
  (==) ParamTag_BySelf ParamTag_BySelf = True
  (==) ParamTag_Timestamp ParamTag_Timestamp = True
  (==) ParamTag_UnixTimestamp ParamTag_UnixTimestamp = True
  (==) ParamTag_CreatedAtTimestamp ParamTag_CreatedAtTimestamp = True
  (==) ParamTag_CreatedAtUnixTimestamp ParamTag_CreatedAtUnixTimestamp = True
  (==) ParamTag_RealIP ParamTag_RealIP = True
  (==) ParamTag_IP ParamTag_IP = True
  (==) ParamTag_WithOrganization ParamTag_WithOrganization = True
  (==) ParamTag_WithForum ParamTag_WithForum = True
  (==) ParamTag_WithBoard ParamTag_WithBoard = True
  (==) ParamTag_WithThread ParamTag_WithThread = True
  (==) ParamTag_WithResource ParamTag_WithResource = True
  (==) _ _ = False

instance Show ParamTag where
  show ParamTag_Limit = "limit"
  show ParamTag_Offset = "offset"
  show ParamTag_SortOrder = "sort_order"
  show ParamTag_Order = "order"
  show ParamTag_ByOrganizationId = "by_organization_id"
  show ParamTag_ByOrganizationsIds = "by_organizations_ids"
  show ParamTag_ByOrganizationName = "by_organization_name"
  show ParamTag_ByTeamId = "by_team_id"
  show ParamTag_ByTeamsIds = "by_teams_ids"
  show ParamTag_ByTeamName = "by_team_name"
  show ParamTag_ByTeamMemberId = "by_team_member_id"
  show ParamTag_ByTeamMembersIds = "by_team_members_ids"
  show ParamTag_ByUserId = "by_user_id"
  show ParamTag_ByUsersIds = "by_users_ids"
  show ParamTag_ByUserNick = "by_user_nick"
  show ParamTag_ByUsersNicks = "by_users_nicks"
  show ParamTag_ByGlobalGroupId = "by_global_group_id"
  show ParamTag_ByGlobalGroupsIds = "by_global_groups_ids"
  show ParamTag_ByGroupId = "by_group_id"
  show ParamTag_ByGroupsIds = "by_groups_ids"
  show ParamTag_ByGroupMemberId = "by_group_member_id"
  show ParamTag_ByGroupMembersIds = "by_group_members_ids"
  show ParamTag_ByForumId = "by_forum_id"
  show ParamTag_ByForumsIds = "by_forums_ids"
  show ParamTag_ByForumName = "by_forum_name"
  show ParamTag_ByBoardId = "by_board_id"
  show ParamTag_ByBoardsIds = "by_boards_ids"
  show ParamTag_ByBoardName = "by_board_name"
  show ParamTag_ByThreadId = "by_thread_id"
  show ParamTag_ByThreadsIds = "by_threads_ids"
  show ParamTag_ByThreadName = "by_thread_name"
  show ParamTag_ByThreadPostId = "by_thread_post_id"
  show ParamTag_ByThreadPostsIds = "by_thread_posts_ids"
  show ParamTag_ByThreadPostName = "by_thread_post_name"
  show ParamTag_ByThreadPostLikeId = "by_thread_post_like_id"
  show ParamTag_ByThreadPostLikesIds = "by_thread_post_likes_ids"
  show ParamTag_ByThreadPostStarId = "by_thread_post_star_id"
  show ParamTag_ByThreadPostStarsIds = "by_thread_post_stars_ids"
  show ParamTag_ByBucketId = "by_bucket_id"
  show ParamTag_ByResourceId = "by_resource_id"
  show ParamTag_ByResourcesIds = "by_resources_ids"
  show ParamTag_ByResourceName = "by_resource_name"
  show ParamTag_ByLeuronId = "by_leuron_id"
  show ParamTag_ByLeuronsIds = "by_leurons_ids"
  show ParamTag_ByPmId = "by_pm_id"
  show ParamTag_ByPmsIds = "by_pms_ids"
  show ParamTag_ByReminderId = "by_reminder_id"
  show ParamTag_ByReminderFolderId = "by_reminder_folder_id"
  show ParamTag_ByParentId = "by_parent_id"
  show ParamTag_ByParentsIds = "by_parents_ids"
  show ParamTag_ByParentName = "by_parent_name"
  show ParamTag_BySelf = "by_self"
  show ParamTag_Timestamp = "timestamp"
  show ParamTag_UnixTimestamp = "unix_timestamp"
  show ParamTag_CreatedAtTimestamp = "created_at_timestamp"
  show ParamTag_CreatedAtUnixTimestamp = "created_at_unix_timestamp"
  show ParamTag_RealIP = "real_ip"
  show ParamTag_IP = "ip"
  show ParamTag_WithOrganization = "with_organization"
  show ParamTag_WithForum = "with_forum"
  show ParamTag_WithBoard = "with_board"
  show ParamTag_WithThread = "with_thread"
  show ParamTag_WithResource = "with_resource"


instance Read ParamTag where
  readsPrec _ "limit" = [(ParamTag_Limit, "")]
  readsPrec _ "offset" = [(ParamTag_Offset, "")]
  readsPrec _ "sort_order" = [(ParamTag_SortOrder, "")]
  readsPrec _ "order" = [(ParamTag_Order, "")]
  readsPrec _ "by_organization_id" = [(ParamTag_ByOrganizationId, "")]
  readsPrec _ "by_organizations_ids" = [(ParamTag_ByOrganizationsIds, "")]
  readsPrec _ "by_organization_name" = [(ParamTag_ByOrganizationName, "")]
  readsPrec _ "by_team_id" = [(ParamTag_ByTeamId, "")]
  readsPrec _ "by_teams_ids" = [(ParamTag_ByTeamsIds, "")]
  readsPrec _ "by_team_name" = [(ParamTag_ByTeamName, "")]
  readsPrec _ "by_team_member_id" = [(ParamTag_ByTeamMemberId, "")]
  readsPrec _ "by_team_members_ids" = [(ParamTag_ByTeamMembersIds, "")]
  readsPrec _ "by_user_id" = [(ParamTag_ByUserId, "")]
  readsPrec _ "by_users_ids" = [(ParamTag_ByUsersIds, "")]
  readsPrec _ "by_user_nick" = [(ParamTag_ByUserNick, "")]
  readsPrec _ "by_users_nicks" = [(ParamTag_ByUsersNicks, "")]
  readsPrec _ "by_global_group_id" = [(ParamTag_ByGlobalGroupId, "")]
  readsPrec _ "by_global_groups_ids" = [(ParamTag_ByGlobalGroupsIds, "")]
  readsPrec _ "by_group_id" = [(ParamTag_ByGroupId, "")]
  readsPrec _ "by_groups_ids" = [(ParamTag_ByGroupsIds, "")]
  readsPrec _ "by_group_member_id" = [(ParamTag_ByGroupMemberId, "")]
  readsPrec _ "by_group_members_ids" = [(ParamTag_ByGroupMembersIds, "")]
  readsPrec _ "by_forum_id" = [(ParamTag_ByForumId, "")]
  readsPrec _ "by_forums_ids" = [(ParamTag_ByForumsIds, "")]
  readsPrec _ "by_forum_name" = [(ParamTag_ByForumName, "")]
  readsPrec _ "by_board_id" = [(ParamTag_ByBoardId, "")]
  readsPrec _ "by_boards_ids" = [(ParamTag_ByBoardsIds, "")]
  readsPrec _ "by_board_name" = [(ParamTag_ByBoardName, "")]
  readsPrec _ "by_thread_id" = [(ParamTag_ByThreadId, "")]
  readsPrec _ "by_threads_ids" = [(ParamTag_ByThreadsIds, "")]
  readsPrec _ "by_thread_name" = [(ParamTag_ByThreadName, "")]
  readsPrec _ "by_thread_post_id" = [(ParamTag_ByThreadPostId, "")]
  readsPrec _ "by_thread_posts_ids" = [(ParamTag_ByThreadPostsIds, "")]
  readsPrec _ "by_thread_post_name" = [(ParamTag_ByThreadPostName, "")]
  readsPrec _ "by_thread_post_like_id" = [(ParamTag_ByThreadPostLikeId, "")]
  readsPrec _ "by_thread_post_likes_ids" = [(ParamTag_ByThreadPostLikesIds, "")]
  readsPrec _ "by_thread_post_star_id" = [(ParamTag_ByThreadPostStarId, "")]
  readsPrec _ "by_thread_post_stars_ids" = [(ParamTag_ByThreadPostStarsIds, "")]
  readsPrec _ "by_bucket_id" = [(ParamTag_ByBucketId, "")]
  readsPrec _ "by_resource_id" = [(ParamTag_ByResourceId, "")]
  readsPrec _ "by_resources_ids" = [(ParamTag_ByResourcesIds, "")]
  readsPrec _ "by_resource_name" = [(ParamTag_ByResourceName, "")]
  readsPrec _ "by_leuron_id" = [(ParamTag_ByLeuronId, "")]
  readsPrec _ "by_leurons_ids" = [(ParamTag_ByLeuronsIds, "")]
  readsPrec _ "by_pm_id" = [(ParamTag_ByPmId, "")]
  readsPrec _ "by_pms_ids" = [(ParamTag_ByPmsIds, "")]
  readsPrec _ "by_reminder_id" = [(ParamTag_ByReminderId, "")]
  readsPrec _ "by_reminder_folder_id" = [(ParamTag_ByReminderFolderId, "")]
  readsPrec _ "by_parent_id" = [(ParamTag_ByParentId, "")]
  readsPrec _ "by_parents_ids" = [(ParamTag_ByParentsIds, "")]
  readsPrec _ "by_parent_name" = [(ParamTag_ByParentName, "")]
  readsPrec _ "by_self" = [(ParamTag_BySelf, "")]
  readsPrec _ "timestamp" = [(ParamTag_Timestamp, "")]
  readsPrec _ "unix_timestamp" = [(ParamTag_UnixTimestamp, "")]
  readsPrec _ "created_at_timestamp" = [(ParamTag_CreatedAtTimestamp, "")]
  readsPrec _ "created_at_unix_timestamp" = [(ParamTag_CreatedAtUnixTimestamp, "")]
  readsPrec _ "real_ip" = [(ParamTag_RealIP, "")]
  readsPrec _ "ip" = [(ParamTag_IP, "")]
  readsPrec _ "with_organization" = [(ParamTag_WithOrganization, "")]
  readsPrec _ "with_forum" = [(ParamTag_WithForum, "")]
  readsPrec _ "with_board" = [(ParamTag_WithBoard, "")]
  readsPrec _ "with_thread" = [(ParamTag_WithThread, "")]
  readsPrec _ "with_resource" = [(ParamTag_WithResource, "")]
  readsPrec _ _ = []


instance FromJSON SortOrderBy where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("SortOrderBy_Asc" :: Text) -> do
        pure SortOrderBy_Asc

      ("SortOrderBy_Dsc" :: Text) -> do
        pure SortOrderBy_Dsc

      ("SortOrderBy_Rnd" :: Text) -> do
        pure SortOrderBy_Rnd

      ("SortOrderBy_None" :: Text) -> do
        pure SortOrderBy_None

      _ -> fail "Could not parse SortOrderBy"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON SortOrderBy where
  toJSON (SortOrderBy_Asc ) = object $
    [ "tag" .= ("SortOrderBy_Asc" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (SortOrderBy_Dsc ) = object $
    [ "tag" .= ("SortOrderBy_Dsc" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (SortOrderBy_Rnd ) = object $
    [ "tag" .= ("SortOrderBy_Rnd" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (SortOrderBy_None ) = object $
    [ "tag" .= ("SortOrderBy_None" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq SortOrderBy where
  (==) SortOrderBy_Asc SortOrderBy_Asc = True
  (==) SortOrderBy_Dsc SortOrderBy_Dsc = True
  (==) SortOrderBy_Rnd SortOrderBy_Rnd = True
  (==) SortOrderBy_None SortOrderBy_None = True
  (==) _ _ = False

instance Show SortOrderBy where
  show SortOrderBy_Asc = "asc"
  show SortOrderBy_Dsc = "dsc"
  show SortOrderBy_Rnd = "rnd"
  show SortOrderBy_None = "none"


instance Read SortOrderBy where
  readsPrec _ "asc" = [(SortOrderBy_Asc, "")]
  readsPrec _ "dsc" = [(SortOrderBy_Dsc, "")]
  readsPrec _ "rnd" = [(SortOrderBy_Rnd, "")]
  readsPrec _ "none" = [(SortOrderBy_None, "")]
  readsPrec _ _ = []


instance FromJSON OrderBy where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("OrderBy_UserId" :: Text) -> do
        pure OrderBy_UserId

      ("OrderBy_CreatedAt" :: Text) -> do
        pure OrderBy_CreatedAt

      ("OrderBy_ModifiedAt" :: Text) -> do
        pure OrderBy_ModifiedAt

      ("OrderBy_ModifiedBy" :: Text) -> do
        pure OrderBy_ModifiedBy

      ("OrderBy_ActivityAt" :: Text) -> do
        pure OrderBy_ActivityAt

      ("OrderBy_OrganizationId" :: Text) -> do
        pure OrderBy_OrganizationId

      ("OrderBy_TeamId" :: Text) -> do
        pure OrderBy_TeamId

      ("OrderBy_ForumId" :: Text) -> do
        pure OrderBy_ForumId

      ("OrderBy_BoardId" :: Text) -> do
        pure OrderBy_BoardId

      ("OrderBy_ThreadId" :: Text) -> do
        pure OrderBy_ThreadId

      ("OrderBy_Id" :: Text) -> do
        pure OrderBy_Id

      ("OrderBy_None" :: Text) -> do
        pure OrderBy_None

      _ -> fail "Could not parse OrderBy"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON OrderBy where
  toJSON (OrderBy_UserId ) = object $
    [ "tag" .= ("OrderBy_UserId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_CreatedAt ) = object $
    [ "tag" .= ("OrderBy_CreatedAt" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_ModifiedAt ) = object $
    [ "tag" .= ("OrderBy_ModifiedAt" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_ModifiedBy ) = object $
    [ "tag" .= ("OrderBy_ModifiedBy" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_ActivityAt ) = object $
    [ "tag" .= ("OrderBy_ActivityAt" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_OrganizationId ) = object $
    [ "tag" .= ("OrderBy_OrganizationId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_TeamId ) = object $
    [ "tag" .= ("OrderBy_TeamId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_ForumId ) = object $
    [ "tag" .= ("OrderBy_ForumId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_BoardId ) = object $
    [ "tag" .= ("OrderBy_BoardId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_ThreadId ) = object $
    [ "tag" .= ("OrderBy_ThreadId" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_Id ) = object $
    [ "tag" .= ("OrderBy_Id" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (OrderBy_None ) = object $
    [ "tag" .= ("OrderBy_None" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq OrderBy where
  (==) OrderBy_UserId OrderBy_UserId = True
  (==) OrderBy_CreatedAt OrderBy_CreatedAt = True
  (==) OrderBy_ModifiedAt OrderBy_ModifiedAt = True
  (==) OrderBy_ModifiedBy OrderBy_ModifiedBy = True
  (==) OrderBy_ActivityAt OrderBy_ActivityAt = True
  (==) OrderBy_OrganizationId OrderBy_OrganizationId = True
  (==) OrderBy_TeamId OrderBy_TeamId = True
  (==) OrderBy_ForumId OrderBy_ForumId = True
  (==) OrderBy_BoardId OrderBy_BoardId = True
  (==) OrderBy_ThreadId OrderBy_ThreadId = True
  (==) OrderBy_Id OrderBy_Id = True
  (==) OrderBy_None OrderBy_None = True
  (==) _ _ = False

instance Show OrderBy where
  show OrderBy_UserId = "user_id"
  show OrderBy_CreatedAt = "created_at"
  show OrderBy_ModifiedAt = "modified_at"
  show OrderBy_ModifiedBy = "modified_by"
  show OrderBy_ActivityAt = "activity_at"
  show OrderBy_OrganizationId = "organization_id"
  show OrderBy_TeamId = "team_id"
  show OrderBy_ForumId = "forum_id"
  show OrderBy_BoardId = "board_id"
  show OrderBy_ThreadId = "thread_id"
  show OrderBy_Id = "id"
  show OrderBy_None = "none"


instance Read OrderBy where
  readsPrec _ "user_id" = [(OrderBy_UserId, "")]
  readsPrec _ "created_at" = [(OrderBy_CreatedAt, "")]
  readsPrec _ "modified_at" = [(OrderBy_ModifiedAt, "")]
  readsPrec _ "modified_by" = [(OrderBy_ModifiedBy, "")]
  readsPrec _ "activity_at" = [(OrderBy_ActivityAt, "")]
  readsPrec _ "organization_id" = [(OrderBy_OrganizationId, "")]
  readsPrec _ "team_id" = [(OrderBy_TeamId, "")]
  readsPrec _ "forum_id" = [(OrderBy_ForumId, "")]
  readsPrec _ "board_id" = [(OrderBy_BoardId, "")]
  readsPrec _ "thread_id" = [(OrderBy_ThreadId, "")]
  readsPrec _ "id" = [(OrderBy_Id, "")]
  readsPrec _ "none" = [(OrderBy_None, "")]
  readsPrec _ _ = []


instance FromJSON Permission where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("Perm_Create" :: Text) -> do
        pure Perm_Create

      ("Perm_Read" :: Text) -> do
        pure Perm_Read

      ("Perm_Update" :: Text) -> do
        pure Perm_Update

      ("Perm_Delete" :: Text) -> do
        pure Perm_Delete

      ("Perm_Execute" :: Text) -> do
        pure Perm_Execute

      _ -> fail "Could not parse Permission"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Permission where
  toJSON (Perm_Create ) = object $
    [ "tag" .= ("Perm_Create" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Perm_Read ) = object $
    [ "tag" .= ("Perm_Read" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Perm_Update ) = object $
    [ "tag" .= ("Perm_Update" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Perm_Delete ) = object $
    [ "tag" .= ("Perm_Delete" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Perm_Execute ) = object $
    [ "tag" .= ("Perm_Execute" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq Permission where
  (==) Perm_Create Perm_Create = True
  (==) Perm_Read Perm_Read = True
  (==) Perm_Update Perm_Update = True
  (==) Perm_Delete Perm_Delete = True
  (==) Perm_Execute Perm_Execute = True
  (==) _ _ = False

instance FromJSON PmRequest where
  parseJSON (Object o) = do
    pmRequestSubject <- o .: ("subject" :: Text)
    pmRequestBody <- o .: ("body" :: Text)
    pmRequestGuard <- o .: ("guard" :: Text)
    pure $ PmRequest {
      pmRequestSubject = pmRequestSubject,
      pmRequestBody = pmRequestBody,
      pmRequestGuard = pmRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmRequest where
  toJSON PmRequest{..} = object $
    [ "tag" .= ("PmRequest" :: Text)
    , "subject" .= pmRequestSubject
    , "body" .= pmRequestBody
    , "guard" .= pmRequestGuard
    ]


instance Eq PmRequest where
  (==) a b = pmRequestSubject a == pmRequestSubject b && pmRequestBody a == pmRequestBody b && pmRequestGuard a == pmRequestGuard b

instance FromJSON PmResponse where
  parseJSON (Object o) = do
    pmResponseId <- o .: ("id" :: Text)
    pmResponseUserId <- o .: ("user_id" :: Text)
    pmResponseToUserId <- o .: ("to_user_id" :: Text)
    pmResponseSubject <- o .: ("subject" :: Text)
    pmResponseBody <- o .: ("body" :: Text)
    pmResponseActive <- o .: ("active" :: Text)
    pmResponseGuard <- o .: ("guard" :: Text)
    pmResponseCreatedAt <- o .: ("created_at" :: Text)
    pmResponseModifiedAt <- o .: ("modified_at" :: Text)
    pmResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ PmResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmResponse where
  toJSON PmResponse{..} = object $
    [ "tag" .= ("PmResponse" :: Text)
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


instance Eq PmResponse where
  (==) a b = pmResponseId a == pmResponseId b && pmResponseUserId a == pmResponseUserId b && pmResponseToUserId a == pmResponseToUserId b && pmResponseSubject a == pmResponseSubject b && pmResponseBody a == pmResponseBody b && pmResponseActive a == pmResponseActive b && pmResponseGuard a == pmResponseGuard b && pmResponseCreatedAt a == pmResponseCreatedAt b && pmResponseModifiedAt a == pmResponseModifiedAt b && pmResponseActivityAt a == pmResponseActivityAt b

instance FromJSON PmResponses where
  parseJSON (Object o) = do
    pmResponses <- o .: ("pm_responses" :: Text)
    pure $ PmResponses {
      pmResponses = pmResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmResponses where
  toJSON PmResponses{..} = object $
    [ "tag" .= ("PmResponses" :: Text)
    , "pm_responses" .= pmResponses
    ]


instance Eq PmResponses where
  (==) a b = pmResponses a == pmResponses b

instance FromJSON PmInRequest where
  parseJSON (Object o) = do
    pmInRequestLabel <- o .: ("label" :: Text)
    pmInRequestIsRead <- o .: ("is_read" :: Text)
    pmInRequestIsStarred <- o .: ("is_starred" :: Text)
    pmInRequestGuard <- o .: ("guard" :: Text)
    pure $ PmInRequest {
      pmInRequestLabel = pmInRequestLabel,
      pmInRequestIsRead = pmInRequestIsRead,
      pmInRequestIsStarred = pmInRequestIsStarred,
      pmInRequestGuard = pmInRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmInRequest where
  toJSON PmInRequest{..} = object $
    [ "tag" .= ("PmInRequest" :: Text)
    , "label" .= pmInRequestLabel
    , "is_read" .= pmInRequestIsRead
    , "is_starred" .= pmInRequestIsStarred
    , "guard" .= pmInRequestGuard
    ]


instance Eq PmInRequest where
  (==) a b = pmInRequestLabel a == pmInRequestLabel b && pmInRequestIsRead a == pmInRequestIsRead b && pmInRequestIsStarred a == pmInRequestIsStarred b && pmInRequestGuard a == pmInRequestGuard b

instance FromJSON PmInResponse where
  parseJSON (Object o) = do
    pmInResponseId <- o .: ("id" :: Text)
    pmInResponsePmId <- o .: ("pm_id" :: Text)
    pmInResponseUserId <- o .: ("user_id" :: Text)
    pmInResponseLabel <- o .: ("label" :: Text)
    pmInResponseIsRead <- o .: ("is_read" :: Text)
    pmInResponseIsStarred <- o .: ("is_starred" :: Text)
    pmInResponseIsNew <- o .: ("is_new" :: Text)
    pmInResponseIsSaved <- o .: ("is_saved" :: Text)
    pmInResponseActive <- o .: ("active" :: Text)
    pmInResponseGuard <- o .: ("guard" :: Text)
    pmInResponseCreatedAt <- o .: ("created_at" :: Text)
    pmInResponseModifiedAt <- o .: ("modified_at" :: Text)
    pure $ PmInResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmInResponse where
  toJSON PmInResponse{..} = object $
    [ "tag" .= ("PmInResponse" :: Text)
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


instance Eq PmInResponse where
  (==) a b = pmInResponseId a == pmInResponseId b && pmInResponsePmId a == pmInResponsePmId b && pmInResponseUserId a == pmInResponseUserId b && pmInResponseLabel a == pmInResponseLabel b && pmInResponseIsRead a == pmInResponseIsRead b && pmInResponseIsStarred a == pmInResponseIsStarred b && pmInResponseIsNew a == pmInResponseIsNew b && pmInResponseIsSaved a == pmInResponseIsSaved b && pmInResponseActive a == pmInResponseActive b && pmInResponseGuard a == pmInResponseGuard b && pmInResponseCreatedAt a == pmInResponseCreatedAt b && pmInResponseModifiedAt a == pmInResponseModifiedAt b

instance FromJSON PmInResponses where
  parseJSON (Object o) = do
    pmInResponses <- o .: ("pm_in_responses" :: Text)
    pure $ PmInResponses {
      pmInResponses = pmInResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmInResponses where
  toJSON PmInResponses{..} = object $
    [ "tag" .= ("PmInResponses" :: Text)
    , "pm_in_responses" .= pmInResponses
    ]


instance Eq PmInResponses where
  (==) a b = pmInResponses a == pmInResponses b

instance FromJSON PmOutRequest where
  parseJSON (Object o) = do
    pmOutRequestLabel <- o .: ("label" :: Text)
    pmOutRequestGuard <- o .: ("guard" :: Text)
    pure $ PmOutRequest {
      pmOutRequestLabel = pmOutRequestLabel,
      pmOutRequestGuard = pmOutRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmOutRequest where
  toJSON PmOutRequest{..} = object $
    [ "tag" .= ("PmOutRequest" :: Text)
    , "label" .= pmOutRequestLabel
    , "guard" .= pmOutRequestGuard
    ]


instance Eq PmOutRequest where
  (==) a b = pmOutRequestLabel a == pmOutRequestLabel b && pmOutRequestGuard a == pmOutRequestGuard b

instance FromJSON PmOutResponse where
  parseJSON (Object o) = do
    pmOutResponseId <- o .: ("id" :: Text)
    pmOutResponsePmId <- o .: ("pm_id" :: Text)
    pmOutResponseUserId <- o .: ("user_id" :: Text)
    pmOutResponseLabel <- o .: ("label" :: Text)
    pmOutResponseIsSaved <- o .: ("is_saved" :: Text)
    pmOutResponseActive <- o .: ("active" :: Text)
    pmOutResponseGuard <- o .: ("guard" :: Text)
    pmOutResponseCreatedAt <- o .: ("created_at" :: Text)
    pmOutResponseModifiedAt <- o .: ("modified_at" :: Text)
    pure $ PmOutResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmOutResponse where
  toJSON PmOutResponse{..} = object $
    [ "tag" .= ("PmOutResponse" :: Text)
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


instance Eq PmOutResponse where
  (==) a b = pmOutResponseId a == pmOutResponseId b && pmOutResponsePmId a == pmOutResponsePmId b && pmOutResponseUserId a == pmOutResponseUserId b && pmOutResponseLabel a == pmOutResponseLabel b && pmOutResponseIsSaved a == pmOutResponseIsSaved b && pmOutResponseActive a == pmOutResponseActive b && pmOutResponseGuard a == pmOutResponseGuard b && pmOutResponseCreatedAt a == pmOutResponseCreatedAt b && pmOutResponseModifiedAt a == pmOutResponseModifiedAt b

instance FromJSON PmOutResponses where
  parseJSON (Object o) = do
    pmOutResponses <- o .: ("pm_out_responses" :: Text)
    pure $ PmOutResponses {
      pmOutResponses = pmOutResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmOutResponses where
  toJSON PmOutResponses{..} = object $
    [ "tag" .= ("PmOutResponses" :: Text)
    , "pm_out_responses" .= pmOutResponses
    ]


instance Eq PmOutResponses where
  (==) a b = pmOutResponses a == pmOutResponses b

instance FromJSON ProfileX where
  parseJSON (Object o) = do
    profileLogin <- o .: ("profile_login" :: Text)
    profileName <- o .: ("profile_name" :: Text)
    profileEmail <- o .: ("profile_email" :: Text)
    pure $ ProfileX {
      profileLogin = profileLogin,
      profileName = profileName,
      profileEmail = profileEmail
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ProfileX where
  toJSON ProfileX{..} = object $
    [ "tag" .= ("ProfileX" :: Text)
    , "profile_login" .= profileLogin
    , "profile_name" .= profileName
    , "profile_email" .= profileEmail
    ]


instance Eq ProfileX where
  (==) a b = profileLogin a == profileLogin b && profileName a == profileName b && profileEmail a == profileEmail b

instance FromJSON ProfileGender where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("GenderMale" :: Text) -> do
        pure GenderMale

      ("GenderFemale" :: Text) -> do
        pure GenderFemale

      ("GenderUnknown" :: Text) -> do
        pure GenderUnknown

      _ -> fail "Could not parse ProfileGender"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ProfileGender where
  toJSON (GenderMale ) = object $
    [ "tag" .= ("GenderMale" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (GenderFemale ) = object $
    [ "tag" .= ("GenderFemale" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (GenderUnknown ) = object $
    [ "tag" .= ("GenderUnknown" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq ProfileGender where
  (==) GenderMale GenderMale = True
  (==) GenderFemale GenderFemale = True
  (==) GenderUnknown GenderUnknown = True
  (==) _ _ = False

instance FromJSON ProfileRequest where
  parseJSON (Object o) = do
    profileRequestGender <- o .: ("gender" :: Text)
    profileRequestBirthdate <- o .: ("birthdate" :: Text)
    profileRequestWebsite <- o .: ("website" :: Text)
    profileRequestLocation <- o .: ("location" :: Text)
    profileRequestSignature <- o .: ("signature" :: Text)
    profileRequestDebug <- o .: ("debug" :: Text)
    profileRequestGuard <- o .: ("guard" :: Text)
    pure $ ProfileRequest {
      profileRequestGender = profileRequestGender,
      profileRequestBirthdate = profileRequestBirthdate,
      profileRequestWebsite = profileRequestWebsite,
      profileRequestLocation = profileRequestLocation,
      profileRequestSignature = profileRequestSignature,
      profileRequestDebug = profileRequestDebug,
      profileRequestGuard = profileRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ProfileRequest where
  toJSON ProfileRequest{..} = object $
    [ "tag" .= ("ProfileRequest" :: Text)
    , "gender" .= profileRequestGender
    , "birthdate" .= profileRequestBirthdate
    , "website" .= profileRequestWebsite
    , "location" .= profileRequestLocation
    , "signature" .= profileRequestSignature
    , "debug" .= profileRequestDebug
    , "guard" .= profileRequestGuard
    ]


instance Eq ProfileRequest where
  (==) a b = profileRequestGender a == profileRequestGender b && profileRequestBirthdate a == profileRequestBirthdate b && profileRequestWebsite a == profileRequestWebsite b && profileRequestLocation a == profileRequestLocation b && profileRequestSignature a == profileRequestSignature b && profileRequestDebug a == profileRequestDebug b && profileRequestGuard a == profileRequestGuard b

instance FromJSON ProfileResponse where
  parseJSON (Object o) = do
    profileResponseId <- o .: ("id" :: Text)
    profileResponseEnt <- o .: ("ent" :: Text)
    profileResponseEntId <- o .: ("ent_id" :: Text)
    profileResponseGender <- o .: ("gender" :: Text)
    profileResponseBirthdate <- o .: ("birthdate" :: Text)
    profileResponseWebsite <- o .: ("website" :: Text)
    profileResponseLocation <- o .: ("location" :: Text)
    profileResponseSignature <- o .: ("signature" :: Text)
    profileResponseDebug <- o .: ("debug" :: Text)
    profileResponseKarmaGood <- o .: ("karma_good" :: Text)
    profileResponseKarmaBad <- o .: ("karma_bad" :: Text)
    profileResponseGuard <- o .: ("guard" :: Text)
    profileResponseCreatedAt <- o .: ("created_at" :: Text)
    profileResponseModifiedAt <- o .: ("modified_at" :: Text)
    pure $ ProfileResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ProfileResponse where
  toJSON ProfileResponse{..} = object $
    [ "tag" .= ("ProfileResponse" :: Text)
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


instance Eq ProfileResponse where
  (==) a b = profileResponseId a == profileResponseId b && profileResponseEnt a == profileResponseEnt b && profileResponseEntId a == profileResponseEntId b && profileResponseGender a == profileResponseGender b && profileResponseBirthdate a == profileResponseBirthdate b && profileResponseWebsite a == profileResponseWebsite b && profileResponseLocation a == profileResponseLocation b && profileResponseSignature a == profileResponseSignature b && profileResponseDebug a == profileResponseDebug b && profileResponseKarmaGood a == profileResponseKarmaGood b && profileResponseKarmaBad a == profileResponseKarmaBad b && profileResponseGuard a == profileResponseGuard b && profileResponseCreatedAt a == profileResponseCreatedAt b && profileResponseModifiedAt a == profileResponseModifiedAt b

instance FromJSON ProfileResponses where
  parseJSON (Object o) = do
    profileResponses <- o .: ("profile_responses" :: Text)
    pure $ ProfileResponses {
      profileResponses = profileResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ProfileResponses where
  toJSON ProfileResponses{..} = object $
    [ "tag" .= ("ProfileResponses" :: Text)
    , "profile_responses" .= profileResponses
    ]


instance Eq ProfileResponses where
  (==) a b = profileResponses a == profileResponses b

instance FromJSON ReminderRequest where
  parseJSON (Object o) = do
    reminderRequestData <- o .: ("data" :: Text)
    reminderRequestGuard <- o .: ("guard" :: Text)
    pure $ ReminderRequest {
      reminderRequestData = reminderRequestData,
      reminderRequestGuard = reminderRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ReminderRequest where
  toJSON ReminderRequest{..} = object $
    [ "tag" .= ("ReminderRequest" :: Text)
    , "data" .= reminderRequestData
    , "guard" .= reminderRequestGuard
    ]


instance Eq ReminderRequest where
  (==) a b = reminderRequestData a == reminderRequestData b && reminderRequestGuard a == reminderRequestGuard b

instance FromJSON ReminderResponse where
  parseJSON (Object o) = do
    reminderResponseId <- o .: ("id" :: Text)
    reminderResponseUserId <- o .: ("user_id" :: Text)
    reminderResponseParentFolderId <- o .: ("parent_folder_id" :: Text)
    reminderResponseData <- o .: ("data" :: Text)
    reminderResponseActive <- o .: ("active" :: Text)
    reminderResponseGuard <- o .: ("guard" :: Text)
    reminderResponseCreatedAt <- o .: ("created_at" :: Text)
    reminderResponseModifiedAt <- o .: ("modified_at" :: Text)
    reminderResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ ReminderResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ReminderResponse where
  toJSON ReminderResponse{..} = object $
    [ "tag" .= ("ReminderResponse" :: Text)
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


instance Eq ReminderResponse where
  (==) a b = reminderResponseId a == reminderResponseId b && reminderResponseUserId a == reminderResponseUserId b && reminderResponseParentFolderId a == reminderResponseParentFolderId b && reminderResponseData a == reminderResponseData b && reminderResponseActive a == reminderResponseActive b && reminderResponseGuard a == reminderResponseGuard b && reminderResponseCreatedAt a == reminderResponseCreatedAt b && reminderResponseModifiedAt a == reminderResponseModifiedAt b && reminderResponseActivityAt a == reminderResponseActivityAt b

instance FromJSON ReminderResponses where
  parseJSON (Object o) = do
    reminderResponses <- o .: ("reminder_responses" :: Text)
    pure $ ReminderResponses {
      reminderResponses = reminderResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ReminderResponses where
  toJSON ReminderResponses{..} = object $
    [ "tag" .= ("ReminderResponses" :: Text)
    , "reminder_responses" .= reminderResponses
    ]


instance Eq ReminderResponses where
  (==) a b = reminderResponses a == reminderResponses b

instance FromJSON ReminderFolderRequest where
  parseJSON (Object o) = do
    reminderFolderRequestDisplayName <- o .: ("display_name" :: Text)
    reminderFolderRequestDescription <- o .: ("description" :: Text)
    reminderFolderRequestVisibility <- o .: ("visibility" :: Text)
    reminderFolderRequestGuard <- o .: ("guard" :: Text)
    pure $ ReminderFolderRequest {
      reminderFolderRequestDisplayName = reminderFolderRequestDisplayName,
      reminderFolderRequestDescription = reminderFolderRequestDescription,
      reminderFolderRequestVisibility = reminderFolderRequestVisibility,
      reminderFolderRequestGuard = reminderFolderRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ReminderFolderRequest where
  toJSON ReminderFolderRequest{..} = object $
    [ "tag" .= ("ReminderFolderRequest" :: Text)
    , "display_name" .= reminderFolderRequestDisplayName
    , "description" .= reminderFolderRequestDescription
    , "visibility" .= reminderFolderRequestVisibility
    , "guard" .= reminderFolderRequestGuard
    ]


instance Eq ReminderFolderRequest where
  (==) a b = reminderFolderRequestDisplayName a == reminderFolderRequestDisplayName b && reminderFolderRequestDescription a == reminderFolderRequestDescription b && reminderFolderRequestVisibility a == reminderFolderRequestVisibility b && reminderFolderRequestGuard a == reminderFolderRequestGuard b

instance FromJSON ReminderFolderResponse where
  parseJSON (Object o) = do
    reminderFolderResponseId <- o .: ("id" :: Text)
    reminderFolderResponseUserId <- o .: ("user_id" :: Text)
    reminderFolderResponseParentFolderId <- o .: ("parent_folder_id" :: Text)
    reminderFolderResponseName <- o .: ("name" :: Text)
    reminderFolderResponseDisplayName <- o .: ("display_name" :: Text)
    reminderFolderResponseVisibility <- o .: ("visibility" :: Text)
    reminderFolderResponseDescription <- o .: ("description" :: Text)
    reminderFolderResponseActive <- o .: ("active" :: Text)
    reminderFolderResponseGuard <- o .: ("guard" :: Text)
    reminderFolderResponseCreatedAt <- o .: ("created_at" :: Text)
    reminderFolderResponseModifiedAt <- o .: ("modified_at" :: Text)
    reminderFolderResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ ReminderFolderResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ReminderFolderResponse where
  toJSON ReminderFolderResponse{..} = object $
    [ "tag" .= ("ReminderFolderResponse" :: Text)
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


instance Eq ReminderFolderResponse where
  (==) a b = reminderFolderResponseId a == reminderFolderResponseId b && reminderFolderResponseUserId a == reminderFolderResponseUserId b && reminderFolderResponseParentFolderId a == reminderFolderResponseParentFolderId b && reminderFolderResponseName a == reminderFolderResponseName b && reminderFolderResponseDisplayName a == reminderFolderResponseDisplayName b && reminderFolderResponseVisibility a == reminderFolderResponseVisibility b && reminderFolderResponseDescription a == reminderFolderResponseDescription b && reminderFolderResponseActive a == reminderFolderResponseActive b && reminderFolderResponseGuard a == reminderFolderResponseGuard b && reminderFolderResponseCreatedAt a == reminderFolderResponseCreatedAt b && reminderFolderResponseModifiedAt a == reminderFolderResponseModifiedAt b && reminderFolderResponseActivityAt a == reminderFolderResponseActivityAt b

instance FromJSON ReminderFolderResponses where
  parseJSON (Object o) = do
    reminderFolderResponses <- o .: ("reminder_folder_responses" :: Text)
    pure $ ReminderFolderResponses {
      reminderFolderResponses = reminderFolderResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ReminderFolderResponses where
  toJSON ReminderFolderResponses{..} = object $
    [ "tag" .= ("ReminderFolderResponses" :: Text)
    , "reminder_folder_responses" .= reminderFolderResponses
    ]


instance Eq ReminderFolderResponses where
  (==) a b = reminderFolderResponses a == reminderFolderResponses b

instance FromJSON ResourceType where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("ISBN13" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ISBN13 <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ISBN13"

      ("ISBN10" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ISBN10 <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ISBN10"

      ("ISBN" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> ISBN <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: ISBN"

      ("URL" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> URL <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: URL"

      ("SourceNone" :: Text) -> do
        pure SourceNone

      _ -> fail "Could not parse ResourceType"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ResourceType where
  toJSON (ISBN13 x0) = object $
    [ "tag" .= ("ISBN13" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ISBN10 x0) = object $
    [ "tag" .= ("ISBN10" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (ISBN x0) = object $
    [ "tag" .= ("ISBN" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (URL x0) = object $
    [ "tag" .= ("URL" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (SourceNone ) = object $
    [ "tag" .= ("SourceNone" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq ResourceType where
  (==) (ISBN13 x0a) (ISBN13 x0b) = x0a == x0b
  (==) (ISBN10 x0a) (ISBN10 x0b) = x0a == x0b
  (==) (ISBN x0a) (ISBN x0b) = x0a == x0b
  (==) (URL x0a) (URL x0b) = x0a == x0b
  (==) SourceNone SourceNone = True
  (==) _ _ = False

instance FromJSON TyResourceType where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("TyISBN13" :: Text) -> do
        pure TyISBN13

      ("TyISBN10" :: Text) -> do
        pure TyISBN10

      ("TyISBN" :: Text) -> do
        pure TyISBN

      ("TyURL" :: Text) -> do
        pure TyURL

      ("TySourceNone" :: Text) -> do
        pure TySourceNone

      _ -> fail "Could not parse TyResourceType"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TyResourceType where
  toJSON (TyISBN13 ) = object $
    [ "tag" .= ("TyISBN13" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyISBN10 ) = object $
    [ "tag" .= ("TyISBN10" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyISBN ) = object $
    [ "tag" .= ("TyISBN" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TyURL ) = object $
    [ "tag" .= ("TyURL" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TySourceNone ) = object $
    [ "tag" .= ("TySourceNone" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq TyResourceType where
  (==) TyISBN13 TyISBN13 = True
  (==) TyISBN10 TyISBN10 = True
  (==) TyISBN TyISBN = True
  (==) TyURL TyURL = True
  (==) TySourceNone TySourceNone = True
  (==) _ _ = False

instance FromJSON ResourceRequest where
  parseJSON (Object o) = do
    resourceRequestDisplayName <- o .: ("display_name" :: Text)
    resourceRequestDescription <- o .: ("description" :: Text)
    resourceRequestSource <- o .: ("source" :: Text)
    resourceRequestAuthor <- o .: ("author" :: Text)
    resourceRequestPrerequisites <- o .: ("prerequisites" :: Text)
    resourceRequestCategories <- o .: ("categories" :: Text)
    resourceRequestVisibility <- o .: ("visibility" :: Text)
    resourceRequestCounter <- o .: ("counter" :: Text)
    resourceRequestVersion <- o .: ("version" :: Text)
    resourceRequestUrls <- o .: ("urls" :: Text)
    resourceRequestIcon <- o .: ("icon" :: Text)
    resourceRequestTags <- o .: ("tags" :: Text)
    resourceRequestGuard <- o .: ("guard" :: Text)
    pure $ ResourceRequest {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ResourceRequest where
  toJSON ResourceRequest{..} = object $
    [ "tag" .= ("ResourceRequest" :: Text)
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


instance Eq ResourceRequest where
  (==) a b = resourceRequestDisplayName a == resourceRequestDisplayName b && resourceRequestDescription a == resourceRequestDescription b && resourceRequestSource a == resourceRequestSource b && resourceRequestAuthor a == resourceRequestAuthor b && resourceRequestPrerequisites a == resourceRequestPrerequisites b && resourceRequestCategories a == resourceRequestCategories b && resourceRequestVisibility a == resourceRequestVisibility b && resourceRequestCounter a == resourceRequestCounter b && resourceRequestVersion a == resourceRequestVersion b && resourceRequestUrls a == resourceRequestUrls b && resourceRequestIcon a == resourceRequestIcon b && resourceRequestTags a == resourceRequestTags b && resourceRequestGuard a == resourceRequestGuard b

instance FromJSON ResourceResponse where
  parseJSON (Object o) = do
    resourceResponseId <- o .: ("id" :: Text)
    resourceResponseUserId <- o .: ("user_id" :: Text)
    resourceResponseName <- o .: ("name" :: Text)
    resourceResponseDisplayName <- o .: ("display_name" :: Text)
    resourceResponseDescription <- o .: ("description" :: Text)
    resourceResponseSource <- o .: ("source" :: Text)
    resourceResponseAuthor <- o .: ("author" :: Text)
    resourceResponsePrerequisites <- o .: ("prerequisites" :: Text)
    resourceResponseCategories <- o .: ("categories" :: Text)
    resourceResponseVisibility <- o .: ("visibility" :: Text)
    resourceResponseCounter <- o .: ("counter" :: Text)
    resourceResponseVersion <- o .: ("version" :: Text)
    resourceResponseUrls <- o .: ("urls" :: Text)
    resourceResponseIcon <- o .: ("icon" :: Text)
    resourceResponseTags <- o .: ("tags" :: Text)
    resourceResponseActive <- o .: ("active" :: Text)
    resourceResponseGuard <- o .: ("guard" :: Text)
    resourceResponseCreatedAt <- o .: ("created_at" :: Text)
    resourceResponseModifiedAt <- o .: ("modified_at" :: Text)
    resourceResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ ResourceResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ResourceResponse where
  toJSON ResourceResponse{..} = object $
    [ "tag" .= ("ResourceResponse" :: Text)
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


instance Eq ResourceResponse where
  (==) a b = resourceResponseId a == resourceResponseId b && resourceResponseUserId a == resourceResponseUserId b && resourceResponseName a == resourceResponseName b && resourceResponseDisplayName a == resourceResponseDisplayName b && resourceResponseDescription a == resourceResponseDescription b && resourceResponseSource a == resourceResponseSource b && resourceResponseAuthor a == resourceResponseAuthor b && resourceResponsePrerequisites a == resourceResponsePrerequisites b && resourceResponseCategories a == resourceResponseCategories b && resourceResponseVisibility a == resourceResponseVisibility b && resourceResponseCounter a == resourceResponseCounter b && resourceResponseVersion a == resourceResponseVersion b && resourceResponseUrls a == resourceResponseUrls b && resourceResponseIcon a == resourceResponseIcon b && resourceResponseTags a == resourceResponseTags b && resourceResponseActive a == resourceResponseActive b && resourceResponseGuard a == resourceResponseGuard b && resourceResponseCreatedAt a == resourceResponseCreatedAt b && resourceResponseModifiedAt a == resourceResponseModifiedAt b && resourceResponseActivityAt a == resourceResponseActivityAt b

instance FromJSON ResourceResponses where
  parseJSON (Object o) = do
    resourceResponses <- o .: ("resource_responses" :: Text)
    pure $ ResourceResponses {
      resourceResponses = resourceResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ResourceResponses where
  toJSON ResourceResponses{..} = object $
    [ "tag" .= ("ResourceResponses" :: Text)
    , "resource_responses" .= resourceResponses
    ]


instance Eq ResourceResponses where
  (==) a b = resourceResponses a == resourceResponses b

instance FromJSON ResourceStatResponse where
  parseJSON (Object o) = do
    resourceStatResponseResourceId <- o .: ("resource_id" :: Text)
    resourceStatResponseLeurons <- o .: ("leurons" :: Text)
    resourceStatResponseLikes <- o .: ("likes" :: Text)
    resourceStatResponseNeutral <- o .: ("neutral" :: Text)
    resourceStatResponseDislikes <- o .: ("dislikes" :: Text)
    resourceStatResponseStars <- o .: ("stars" :: Text)
    resourceStatResponseViews <- o .: ("views" :: Text)
    pure $ ResourceStatResponse {
      resourceStatResponseResourceId = resourceStatResponseResourceId,
      resourceStatResponseLeurons = resourceStatResponseLeurons,
      resourceStatResponseLikes = resourceStatResponseLikes,
      resourceStatResponseNeutral = resourceStatResponseNeutral,
      resourceStatResponseDislikes = resourceStatResponseDislikes,
      resourceStatResponseStars = resourceStatResponseStars,
      resourceStatResponseViews = resourceStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ResourceStatResponse where
  toJSON ResourceStatResponse{..} = object $
    [ "tag" .= ("ResourceStatResponse" :: Text)
    , "resource_id" .= resourceStatResponseResourceId
    , "leurons" .= resourceStatResponseLeurons
    , "likes" .= resourceStatResponseLikes
    , "neutral" .= resourceStatResponseNeutral
    , "dislikes" .= resourceStatResponseDislikes
    , "stars" .= resourceStatResponseStars
    , "views" .= resourceStatResponseViews
    ]


instance Eq ResourceStatResponse where
  (==) a b = resourceStatResponseResourceId a == resourceStatResponseResourceId b && resourceStatResponseLeurons a == resourceStatResponseLeurons b && resourceStatResponseLikes a == resourceStatResponseLikes b && resourceStatResponseNeutral a == resourceStatResponseNeutral b && resourceStatResponseDislikes a == resourceStatResponseDislikes b && resourceStatResponseStars a == resourceStatResponseStars b && resourceStatResponseViews a == resourceStatResponseViews b

instance FromJSON ResourceStatResponses where
  parseJSON (Object o) = do
    resourceStatResponses <- o .: ("resource_stat_responses" :: Text)
    pure $ ResourceStatResponses {
      resourceStatResponses = resourceStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ResourceStatResponses where
  toJSON ResourceStatResponses{..} = object $
    [ "tag" .= ("ResourceStatResponses" :: Text)
    , "resource_stat_responses" .= resourceStatResponses
    ]


instance Eq ResourceStatResponses where
  (==) a b = resourceStatResponses a == resourceStatResponses b

instance FromJSON Size where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("XSmall" :: Text) -> do
        pure XSmall

      ("Small" :: Text) -> do
        pure Small

      ("Medium" :: Text) -> do
        pure Medium

      ("Large" :: Text) -> do
        pure Large

      ("XLarge" :: Text) -> do
        pure XLarge

      _ -> fail "Could not parse Size"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Size where
  toJSON (XSmall ) = object $
    [ "tag" .= ("XSmall" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Small ) = object $
    [ "tag" .= ("Small" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Medium ) = object $
    [ "tag" .= ("Medium" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Large ) = object $
    [ "tag" .= ("Large" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (XLarge ) = object $
    [ "tag" .= ("XLarge" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq Size where
  (==) XSmall XSmall = True
  (==) Small Small = True
  (==) Medium Medium = True
  (==) Large Large = True
  (==) XLarge XLarge = True
  (==) _ _ = False

instance FromJSON Splits where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("SplitAt" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0, x1, x2] -> SplitAt <$> parseJSON x0 <*> parseJSON x1 <*> parseJSON x2
          _ -> fail "FromJON Typemismatch: SplitAt"

      ("SplitNone" :: Text) -> do
        pure SplitNone

      _ -> fail "Could not parse Splits"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Splits where
  toJSON (SplitAt x0 x1 x2) = object $
    [ "tag" .= ("SplitAt" :: Text)
    , "contents" .= [toJSON x0, toJSON x1, toJSON x2]
    ]
  toJSON (SplitNone ) = object $
    [ "tag" .= ("SplitNone" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq Splits where
  (==) (SplitAt x0a x1a x2a) (SplitAt x0b x1b x2b) = x0a == x0b && x1a == x1b && x2a == x2b
  (==) SplitNone SplitNone = True
  (==) _ _ = False

instance FromJSON TySplits where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("TySplitA" :: Text) -> do
        pure TySplitA

      ("TySplitNone" :: Text) -> do
        pure TySplitNone

      _ -> fail "Could not parse TySplits"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TySplits where
  toJSON (TySplitA ) = object $
    [ "tag" .= ("TySplitA" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TySplitNone ) = object $
    [ "tag" .= ("TySplitNone" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq TySplits where
  (==) TySplitA TySplitA = True
  (==) TySplitNone TySplitNone = True
  (==) _ _ = False

instance FromJSON Substitutions where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("SubsExpr" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0, x1] -> SubsExpr <$> parseJSON x0 <*> parseJSON x1
          _ -> fail "FromJON Typemismatch: SubsExpr"

      ("SubsOneOf" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> SubsOneOf <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: SubsOneOf"

      ("SubsAllOf" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> SubsAllOf <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: SubsAllOf"

      ("SubsBoth" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0, x1] -> SubsBoth <$> parseJSON x0 <*> parseJSON x1
          _ -> fail "FromJON Typemismatch: SubsBoth"

      _ -> fail "Could not parse Substitutions"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Substitutions where
  toJSON (SubsExpr x0 x1) = object $
    [ "tag" .= ("SubsExpr" :: Text)
    , "contents" .= [toJSON x0, toJSON x1]
    ]
  toJSON (SubsOneOf x0) = object $
    [ "tag" .= ("SubsOneOf" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (SubsAllOf x0) = object $
    [ "tag" .= ("SubsAllOf" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (SubsBoth x0 x1) = object $
    [ "tag" .= ("SubsBoth" :: Text)
    , "contents" .= [toJSON x0, toJSON x1]
    ]


instance Eq Substitutions where
  (==) (SubsExpr x0a x1a) (SubsExpr x0b x1b) = x0a == x0b && x1a == x1b
  (==) (SubsOneOf x0a) (SubsOneOf x0b) = x0a == x0b
  (==) (SubsAllOf x0a) (SubsAllOf x0b) = x0a == x0b
  (==) (SubsBoth x0a x1a) (SubsBoth x0b x1b) = x0a == x0b && x1a == x1b
  (==) _ _ = False

instance FromJSON TySubstitutions where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("TySubsExpr" :: Text) -> do
        pure TySubsExpr

      ("TySubsOneOf" :: Text) -> do
        pure TySubsOneOf

      ("TySubsAllOf" :: Text) -> do
        pure TySubsAllOf

      ("TySubsBoth" :: Text) -> do
        pure TySubsBoth

      _ -> fail "Could not parse TySubstitutions"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TySubstitutions where
  toJSON (TySubsExpr ) = object $
    [ "tag" .= ("TySubsExpr" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TySubsOneOf ) = object $
    [ "tag" .= ("TySubsOneOf" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TySubsAllOf ) = object $
    [ "tag" .= ("TySubsAllOf" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (TySubsBoth ) = object $
    [ "tag" .= ("TySubsBoth" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq TySubstitutions where
  (==) TySubsExpr TySubsExpr = True
  (==) TySubsOneOf TySubsOneOf = True
  (==) TySubsAllOf TySubsAllOf = True
  (==) TySubsBoth TySubsBoth = True
  (==) _ _ = False

instance FromJSON StarRequest where
  parseJSON (Object o) = do
    starRequestReason <- o .: ("reason" :: Text)
    starRequestGuard <- o .: ("guard" :: Text)
    pure $ StarRequest {
      starRequestReason = starRequestReason,
      starRequestGuard = starRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON StarRequest where
  toJSON StarRequest{..} = object $
    [ "tag" .= ("StarRequest" :: Text)
    , "reason" .= starRequestReason
    , "guard" .= starRequestGuard
    ]


instance Eq StarRequest where
  (==) a b = starRequestReason a == starRequestReason b && starRequestGuard a == starRequestGuard b

instance FromJSON StarResponse where
  parseJSON (Object o) = do
    starResponseId <- o .: ("id" :: Text)
    starResponseEnt <- o .: ("ent" :: Text)
    starResponseEntId <- o .: ("ent_id" :: Text)
    starResponseUserId <- o .: ("user_id" :: Text)
    starResponseReason <- o .: ("reason" :: Text)
    starResponseActive <- o .: ("active" :: Text)
    starResponseGuard <- o .: ("guard" :: Text)
    starResponseCreatedAt <- o .: ("created_at" :: Text)
    starResponseModifiedAt <- o .: ("modified_at" :: Text)
    pure $ StarResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON StarResponse where
  toJSON StarResponse{..} = object $
    [ "tag" .= ("StarResponse" :: Text)
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


instance Eq StarResponse where
  (==) a b = starResponseId a == starResponseId b && starResponseEnt a == starResponseEnt b && starResponseEntId a == starResponseEntId b && starResponseUserId a == starResponseUserId b && starResponseReason a == starResponseReason b && starResponseActive a == starResponseActive b && starResponseGuard a == starResponseGuard b && starResponseCreatedAt a == starResponseCreatedAt b && starResponseModifiedAt a == starResponseModifiedAt b

instance FromJSON StarResponses where
  parseJSON (Object o) = do
    starResponses <- o .: ("star_responses" :: Text)
    pure $ StarResponses {
      starResponses = starResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON StarResponses where
  toJSON StarResponses{..} = object $
    [ "tag" .= ("StarResponses" :: Text)
    , "star_responses" .= starResponses
    ]


instance Eq StarResponses where
  (==) a b = starResponses a == starResponses b

instance FromJSON StarStatResponse where
  parseJSON (Object o) = do
    starStatResponseEnt <- o .: ("ent" :: Text)
    starStatResponseEntId <- o .: ("ent_id" :: Text)
    starStatResponseStars <- o .: ("stars" :: Text)
    pure $ StarStatResponse {
      starStatResponseEnt = starStatResponseEnt,
      starStatResponseEntId = starStatResponseEntId,
      starStatResponseStars = starStatResponseStars
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON StarStatResponse where
  toJSON StarStatResponse{..} = object $
    [ "tag" .= ("StarStatResponse" :: Text)
    , "ent" .= starStatResponseEnt
    , "ent_id" .= starStatResponseEntId
    , "stars" .= starStatResponseStars
    ]


instance Eq StarStatResponse where
  (==) a b = starStatResponseEnt a == starStatResponseEnt b && starStatResponseEntId a == starStatResponseEntId b && starStatResponseStars a == starStatResponseStars b

instance FromJSON StarStatResponses where
  parseJSON (Object o) = do
    starStatResponses <- o .: ("star_stat_responses" :: Text)
    pure $ StarStatResponses {
      starStatResponses = starStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON StarStatResponses where
  toJSON StarStatResponses{..} = object $
    [ "tag" .= ("StarStatResponses" :: Text)
    , "star_stat_responses" .= starStatResponses
    ]


instance Eq StarStatResponses where
  (==) a b = starStatResponses a == starStatResponses b

instance FromJSON SystemTeam where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("Team_Owners" :: Text) -> do
        pure Team_Owners

      ("Team_Members" :: Text) -> do
        pure Team_Members

      _ -> fail "Could not parse SystemTeam"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON SystemTeam where
  toJSON (Team_Owners ) = object $
    [ "tag" .= ("Team_Owners" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Team_Members ) = object $
    [ "tag" .= ("Team_Members" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq SystemTeam where
  (==) Team_Owners Team_Owners = True
  (==) Team_Members Team_Members = True
  (==) _ _ = False

instance FromJSON TeamRequest where
  parseJSON (Object o) = do
    teamRequestMembership <- o .: ("membership" :: Text)
    teamRequestIcon <- o .: ("icon" :: Text)
    teamRequestTags <- o .: ("tags" :: Text)
    teamRequestVisibility <- o .: ("visibility" :: Text)
    teamRequestGuard <- o .: ("guard" :: Text)
    pure $ TeamRequest {
      teamRequestMembership = teamRequestMembership,
      teamRequestIcon = teamRequestIcon,
      teamRequestTags = teamRequestTags,
      teamRequestVisibility = teamRequestVisibility,
      teamRequestGuard = teamRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamRequest where
  toJSON TeamRequest{..} = object $
    [ "tag" .= ("TeamRequest" :: Text)
    , "membership" .= teamRequestMembership
    , "icon" .= teamRequestIcon
    , "tags" .= teamRequestTags
    , "visibility" .= teamRequestVisibility
    , "guard" .= teamRequestGuard
    ]


instance Eq TeamRequest where
  (==) a b = teamRequestMembership a == teamRequestMembership b && teamRequestIcon a == teamRequestIcon b && teamRequestTags a == teamRequestTags b && teamRequestVisibility a == teamRequestVisibility b && teamRequestGuard a == teamRequestGuard b

instance FromJSON TeamResponse where
  parseJSON (Object o) = do
    teamResponseId <- o .: ("id" :: Text)
    teamResponseUserId <- o .: ("user_id" :: Text)
    teamResponseOrgId <- o .: ("org_id" :: Text)
    teamResponseSystem <- o .: ("system" :: Text)
    teamResponseMembership <- o .: ("membership" :: Text)
    teamResponseIcon <- o .: ("icon" :: Text)
    teamResponseTags <- o .: ("tags" :: Text)
    teamResponseVisibility <- o .: ("visibility" :: Text)
    teamResponseActive <- o .: ("active" :: Text)
    teamResponseGuard <- o .: ("guard" :: Text)
    teamResponseCreatedAt <- o .: ("created_at" :: Text)
    teamResponseModifiedBy <- o .: ("modified_by" :: Text)
    teamResponseModifiedAt <- o .: ("modified_at" :: Text)
    teamResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ TeamResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamResponse where
  toJSON TeamResponse{..} = object $
    [ "tag" .= ("TeamResponse" :: Text)
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


instance Eq TeamResponse where
  (==) a b = teamResponseId a == teamResponseId b && teamResponseUserId a == teamResponseUserId b && teamResponseOrgId a == teamResponseOrgId b && teamResponseSystem a == teamResponseSystem b && teamResponseMembership a == teamResponseMembership b && teamResponseIcon a == teamResponseIcon b && teamResponseTags a == teamResponseTags b && teamResponseVisibility a == teamResponseVisibility b && teamResponseActive a == teamResponseActive b && teamResponseGuard a == teamResponseGuard b && teamResponseCreatedAt a == teamResponseCreatedAt b && teamResponseModifiedBy a == teamResponseModifiedBy b && teamResponseModifiedAt a == teamResponseModifiedAt b && teamResponseActivityAt a == teamResponseActivityAt b

instance FromJSON TeamResponses where
  parseJSON (Object o) = do
    teamResponses <- o .: ("team_responses" :: Text)
    pure $ TeamResponses {
      teamResponses = teamResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamResponses where
  toJSON TeamResponses{..} = object $
    [ "tag" .= ("TeamResponses" :: Text)
    , "team_responses" .= teamResponses
    ]


instance Eq TeamResponses where
  (==) a b = teamResponses a == teamResponses b

instance FromJSON TeamStatResponse where
  parseJSON (Object o) = do
    teamStatResponseMembers <- o .: ("members" :: Text)
    pure $ TeamStatResponse {
      teamStatResponseMembers = teamStatResponseMembers
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamStatResponse where
  toJSON TeamStatResponse{..} = object $
    [ "tag" .= ("TeamStatResponse" :: Text)
    , "members" .= teamStatResponseMembers
    ]


instance Eq TeamStatResponse where
  (==) a b = teamStatResponseMembers a == teamStatResponseMembers b

instance FromJSON TeamStatResponses where
  parseJSON (Object o) = do
    teamStatResponses <- o .: ("team_stat_responses" :: Text)
    pure $ TeamStatResponses {
      teamStatResponses = teamStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamStatResponses where
  toJSON TeamStatResponses{..} = object $
    [ "tag" .= ("TeamStatResponses" :: Text)
    , "team_stat_responses" .= teamStatResponses
    ]


instance Eq TeamStatResponses where
  (==) a b = teamStatResponses a == teamStatResponses b

instance FromJSON TeamMemberRequest where
  parseJSON (Object o) = do
    teamMemberRequestGuard <- o .: ("guard" :: Text)
    pure $ TeamMemberRequest {
      teamMemberRequestGuard = teamMemberRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamMemberRequest where
  toJSON TeamMemberRequest{..} = object $
    [ "tag" .= ("TeamMemberRequest" :: Text)
    , "guard" .= teamMemberRequestGuard
    ]


instance Eq TeamMemberRequest where
  (==) a b = teamMemberRequestGuard a == teamMemberRequestGuard b

instance FromJSON TeamMemberResponse where
  parseJSON (Object o) = do
    teamMemberResponseId <- o .: ("id" :: Text)
    teamMemberResponseUserId <- o .: ("user_id" :: Text)
    teamMemberResponseOrgId <- o .: ("org_id" :: Text)
    teamMemberResponseTeamId <- o .: ("team_id" :: Text)
    teamMemberResponseIsAccepted <- o .: ("is_accepted" :: Text)
    teamMemberResponseAcceptedAt <- o .: ("accepted_at" :: Text)
    teamMemberResponseIsBlocked <- o .: ("is_blocked" :: Text)
    teamMemberResponseBlockedAt <- o .: ("blocked_at" :: Text)
    teamMemberResponseActive <- o .: ("active" :: Text)
    teamMemberResponseGuard <- o .: ("guard" :: Text)
    teamMemberResponseCreatedAt <- o .: ("created_at" :: Text)
    teamMemberResponseModifiedBy <- o .: ("modified_by" :: Text)
    teamMemberResponseModifiedAt <- o .: ("modified_at" :: Text)
    teamMemberResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ TeamMemberResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamMemberResponse where
  toJSON TeamMemberResponse{..} = object $
    [ "tag" .= ("TeamMemberResponse" :: Text)
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


instance Eq TeamMemberResponse where
  (==) a b = teamMemberResponseId a == teamMemberResponseId b && teamMemberResponseUserId a == teamMemberResponseUserId b && teamMemberResponseOrgId a == teamMemberResponseOrgId b && teamMemberResponseTeamId a == teamMemberResponseTeamId b && teamMemberResponseIsAccepted a == teamMemberResponseIsAccepted b && teamMemberResponseAcceptedAt a == teamMemberResponseAcceptedAt b && teamMemberResponseIsBlocked a == teamMemberResponseIsBlocked b && teamMemberResponseBlockedAt a == teamMemberResponseBlockedAt b && teamMemberResponseActive a == teamMemberResponseActive b && teamMemberResponseGuard a == teamMemberResponseGuard b && teamMemberResponseCreatedAt a == teamMemberResponseCreatedAt b && teamMemberResponseModifiedBy a == teamMemberResponseModifiedBy b && teamMemberResponseModifiedAt a == teamMemberResponseModifiedAt b && teamMemberResponseActivityAt a == teamMemberResponseActivityAt b

instance FromJSON TeamMemberResponses where
  parseJSON (Object o) = do
    teamMemberResponses <- o .: ("team_member_responses" :: Text)
    pure $ TeamMemberResponses {
      teamMemberResponses = teamMemberResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamMemberResponses where
  toJSON TeamMemberResponses{..} = object $
    [ "tag" .= ("TeamMemberResponses" :: Text)
    , "team_member_responses" .= teamMemberResponses
    ]


instance Eq TeamMemberResponses where
  (==) a b = teamMemberResponses a == teamMemberResponses b

instance FromJSON TeamMemberStatResponse where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("TeamMemberStatResponse" :: Text) -> do
        pure TeamMemberStatResponse

      _ -> fail "Could not parse TeamMemberStatResponse"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamMemberStatResponse where
  toJSON (TeamMemberStatResponse ) = object $
    [ "tag" .= ("TeamMemberStatResponse" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq TeamMemberStatResponse where
  (==) TeamMemberStatResponse TeamMemberStatResponse = True


instance FromJSON TeamMemberStatResponses where
  parseJSON (Object o) = do
    teamMemberStatResponses <- o .: ("team_member_stat_responses" :: Text)
    pure $ TeamMemberStatResponses {
      teamMemberStatResponses = teamMemberStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamMemberStatResponses where
  toJSON TeamMemberStatResponses{..} = object $
    [ "tag" .= ("TeamMemberStatResponses" :: Text)
    , "team_member_stat_responses" .= teamMemberStatResponses
    ]


instance Eq TeamMemberStatResponses where
  (==) a b = teamMemberStatResponses a == teamMemberStatResponses b

instance FromJSON TestRequest where
  parseJSON (Object o) = do
    testRequestMsg <- o .: ("msg" :: Text)
    pure $ TestRequest {
      testRequestMsg = testRequestMsg
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TestRequest where
  toJSON TestRequest{..} = object $
    [ "tag" .= ("TestRequest" :: Text)
    , "msg" .= testRequestMsg
    ]


instance Eq TestRequest where
  (==) a b = testRequestMsg a == testRequestMsg b

instance FromJSON TestResponse where
  parseJSON (Object o) = do
    testResponseId <- o .: ("id" :: Text)
    testResponseUserId <- o .: ("user_id" :: Text)
    testResponseMsg <- o .: ("msg" :: Text)
    testResponseCreatedAt <- o .: ("created_at" :: Text)
    testResponseModifiedAt <- o .: ("modified_at" :: Text)
    pure $ TestResponse {
      testResponseId = testResponseId,
      testResponseUserId = testResponseUserId,
      testResponseMsg = testResponseMsg,
      testResponseCreatedAt = testResponseCreatedAt,
      testResponseModifiedAt = testResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TestResponse where
  toJSON TestResponse{..} = object $
    [ "tag" .= ("TestResponse" :: Text)
    , "id" .= testResponseId
    , "user_id" .= testResponseUserId
    , "msg" .= testResponseMsg
    , "created_at" .= testResponseCreatedAt
    , "modified_at" .= testResponseModifiedAt
    ]


instance Eq TestResponse where
  (==) a b = testResponseId a == testResponseId b && testResponseUserId a == testResponseUserId b && testResponseMsg a == testResponseMsg b && testResponseCreatedAt a == testResponseCreatedAt b && testResponseModifiedAt a == testResponseModifiedAt b

instance FromJSON TestResponses where
  parseJSON (Object o) = do
    testResponses <- o .: ("test_responses" :: Text)
    pure $ TestResponses {
      testResponses = testResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TestResponses where
  toJSON TestResponses{..} = object $
    [ "tag" .= ("TestResponses" :: Text)
    , "test_responses" .= testResponses
    ]


instance Eq TestResponses where
  (==) a b = testResponses a == testResponses b

instance FromJSON ThreadRequest where
  parseJSON (Object o) = do
    threadRequestDisplayName <- o .: ("display_name" :: Text)
    threadRequestDescription <- o .: ("description" :: Text)
    threadRequestSticky <- o .: ("sticky" :: Text)
    threadRequestLocked <- o .: ("locked" :: Text)
    threadRequestPoll <- o .: ("poll" :: Text)
    threadRequestIcon <- o .: ("icon" :: Text)
    threadRequestTags <- o .: ("tags" :: Text)
    threadRequestGuard <- o .: ("guard" :: Text)
    pure $ ThreadRequest {
      threadRequestDisplayName = threadRequestDisplayName,
      threadRequestDescription = threadRequestDescription,
      threadRequestSticky = threadRequestSticky,
      threadRequestLocked = threadRequestLocked,
      threadRequestPoll = threadRequestPoll,
      threadRequestIcon = threadRequestIcon,
      threadRequestTags = threadRequestTags,
      threadRequestGuard = threadRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadRequest where
  toJSON ThreadRequest{..} = object $
    [ "tag" .= ("ThreadRequest" :: Text)
    , "display_name" .= threadRequestDisplayName
    , "description" .= threadRequestDescription
    , "sticky" .= threadRequestSticky
    , "locked" .= threadRequestLocked
    , "poll" .= threadRequestPoll
    , "icon" .= threadRequestIcon
    , "tags" .= threadRequestTags
    , "guard" .= threadRequestGuard
    ]


instance Eq ThreadRequest where
  (==) a b = threadRequestDisplayName a == threadRequestDisplayName b && threadRequestDescription a == threadRequestDescription b && threadRequestSticky a == threadRequestSticky b && threadRequestLocked a == threadRequestLocked b && threadRequestPoll a == threadRequestPoll b && threadRequestIcon a == threadRequestIcon b && threadRequestTags a == threadRequestTags b && threadRequestGuard a == threadRequestGuard b

instance FromJSON ThreadResponse where
  parseJSON (Object o) = do
    threadResponseId <- o .: ("id" :: Text)
    threadResponseUserId <- o .: ("user_id" :: Text)
    threadResponseOrgId <- o .: ("org_id" :: Text)
    threadResponseForumId <- o .: ("forum_id" :: Text)
    threadResponseBoardId <- o .: ("board_id" :: Text)
    threadResponseName <- o .: ("name" :: Text)
    threadResponseDisplayName <- o .: ("display_name" :: Text)
    threadResponseDescription <- o .: ("description" :: Text)
    threadResponseSticky <- o .: ("sticky" :: Text)
    threadResponseLocked <- o .: ("locked" :: Text)
    threadResponsePoll <- o .: ("poll" :: Text)
    threadResponseIcon <- o .: ("icon" :: Text)
    threadResponseTags <- o .: ("tags" :: Text)
    threadResponseActive <- o .: ("active" :: Text)
    threadResponseGuard <- o .: ("guard" :: Text)
    threadResponseCreatedAt <- o .: ("created_at" :: Text)
    threadResponseModifiedBy <- o .: ("modified_by" :: Text)
    threadResponseModifiedAt <- o .: ("modified_at" :: Text)
    threadResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ ThreadResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadResponse where
  toJSON ThreadResponse{..} = object $
    [ "tag" .= ("ThreadResponse" :: Text)
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


instance Eq ThreadResponse where
  (==) a b = threadResponseId a == threadResponseId b && threadResponseUserId a == threadResponseUserId b && threadResponseOrgId a == threadResponseOrgId b && threadResponseForumId a == threadResponseForumId b && threadResponseBoardId a == threadResponseBoardId b && threadResponseName a == threadResponseName b && threadResponseDisplayName a == threadResponseDisplayName b && threadResponseDescription a == threadResponseDescription b && threadResponseSticky a == threadResponseSticky b && threadResponseLocked a == threadResponseLocked b && threadResponsePoll a == threadResponsePoll b && threadResponseIcon a == threadResponseIcon b && threadResponseTags a == threadResponseTags b && threadResponseActive a == threadResponseActive b && threadResponseGuard a == threadResponseGuard b && threadResponseCreatedAt a == threadResponseCreatedAt b && threadResponseModifiedBy a == threadResponseModifiedBy b && threadResponseModifiedAt a == threadResponseModifiedAt b && threadResponseActivityAt a == threadResponseActivityAt b

instance FromJSON ThreadResponses where
  parseJSON (Object o) = do
    threadResponses <- o .: ("thread_responses" :: Text)
    pure $ ThreadResponses {
      threadResponses = threadResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadResponses where
  toJSON ThreadResponses{..} = object $
    [ "tag" .= ("ThreadResponses" :: Text)
    , "thread_responses" .= threadResponses
    ]


instance Eq ThreadResponses where
  (==) a b = threadResponses a == threadResponses b

instance FromJSON ThreadStatResponse where
  parseJSON (Object o) = do
    threadStatResponseThreadId <- o .: ("thread_id" :: Text)
    threadStatResponseThreadPosts <- o .: ("thread_posts" :: Text)
    threadStatResponseViews <- o .: ("views" :: Text)
    pure $ ThreadStatResponse {
      threadStatResponseThreadId = threadStatResponseThreadId,
      threadStatResponseThreadPosts = threadStatResponseThreadPosts,
      threadStatResponseViews = threadStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadStatResponse where
  toJSON ThreadStatResponse{..} = object $
    [ "tag" .= ("ThreadStatResponse" :: Text)
    , "thread_id" .= threadStatResponseThreadId
    , "thread_posts" .= threadStatResponseThreadPosts
    , "views" .= threadStatResponseViews
    ]


instance Eq ThreadStatResponse where
  (==) a b = threadStatResponseThreadId a == threadStatResponseThreadId b && threadStatResponseThreadPosts a == threadStatResponseThreadPosts b && threadStatResponseViews a == threadStatResponseViews b

instance FromJSON ThreadStatResponses where
  parseJSON (Object o) = do
    threadStatResponses <- o .: ("thread_stat_responses" :: Text)
    pure $ ThreadStatResponses {
      threadStatResponses = threadStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadStatResponses where
  toJSON ThreadStatResponses{..} = object $
    [ "tag" .= ("ThreadStatResponses" :: Text)
    , "thread_stat_responses" .= threadStatResponses
    ]


instance Eq ThreadStatResponses where
  (==) a b = threadStatResponses a == threadStatResponses b

instance FromJSON PostData where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("PostDataRaw" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> PostDataRaw <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: PostDataRaw"

      ("PostDataMarkdown" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> PostDataMarkdown <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: PostDataMarkdown"

      ("PostDataBBCode" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0] -> PostDataBBCode <$> parseJSON x0
          _ -> fail "FromJON Typemismatch: PostDataBBCode"

      ("PostDataCode" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0, x1] -> PostDataCode <$> parseJSON x0 <*> parseJSON x1
          _ -> fail "FromJON Typemismatch: PostDataCode"

      ("PostDataOther" :: Text) -> do
        r <- o .: "contents"
        case r of
          [x0, x1] -> PostDataOther <$> parseJSON x0 <*> parseJSON x1
          _ -> fail "FromJON Typemismatch: PostDataOther"

      ("PostDataEmpty" :: Text) -> do
        pure PostDataEmpty

      _ -> fail "Could not parse PostData"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PostData where
  toJSON (PostDataRaw x0) = object $
    [ "tag" .= ("PostDataRaw" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (PostDataMarkdown x0) = object $
    [ "tag" .= ("PostDataMarkdown" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (PostDataBBCode x0) = object $
    [ "tag" .= ("PostDataBBCode" :: Text)
    , "contents" .= [toJSON x0]
    ]
  toJSON (PostDataCode x0 x1) = object $
    [ "tag" .= ("PostDataCode" :: Text)
    , "contents" .= [toJSON x0, toJSON x1]
    ]
  toJSON (PostDataOther x0 x1) = object $
    [ "tag" .= ("PostDataOther" :: Text)
    , "contents" .= [toJSON x0, toJSON x1]
    ]
  toJSON (PostDataEmpty ) = object $
    [ "tag" .= ("PostDataEmpty" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq PostData where
  (==) (PostDataRaw x0a) (PostDataRaw x0b) = x0a == x0b
  (==) (PostDataMarkdown x0a) (PostDataMarkdown x0b) = x0a == x0b
  (==) (PostDataBBCode x0a) (PostDataBBCode x0b) = x0a == x0b
  (==) (PostDataCode x0a x1a) (PostDataCode x0b x1b) = x0a == x0b && x1a == x1b
  (==) (PostDataOther x0a x1a) (PostDataOther x0b x1b) = x0a == x0b && x1a == x1b
  (==) PostDataEmpty PostDataEmpty = True
  (==) _ _ = False

instance FromJSON ThreadPostRequest where
  parseJSON (Object o) = do
    threadPostRequestTitle <- o .: ("title" :: Text)
    threadPostRequestBody <- o .: ("body" :: Text)
    threadPostRequestTags <- o .: ("tags" :: Text)
    threadPostRequestPrivateTags <- o .: ("private_tags" :: Text)
    threadPostRequestGuard <- o .: ("guard" :: Text)
    pure $ ThreadPostRequest {
      threadPostRequestTitle = threadPostRequestTitle,
      threadPostRequestBody = threadPostRequestBody,
      threadPostRequestTags = threadPostRequestTags,
      threadPostRequestPrivateTags = threadPostRequestPrivateTags,
      threadPostRequestGuard = threadPostRequestGuard
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadPostRequest where
  toJSON ThreadPostRequest{..} = object $
    [ "tag" .= ("ThreadPostRequest" :: Text)
    , "title" .= threadPostRequestTitle
    , "body" .= threadPostRequestBody
    , "tags" .= threadPostRequestTags
    , "private_tags" .= threadPostRequestPrivateTags
    , "guard" .= threadPostRequestGuard
    ]


instance Eq ThreadPostRequest where
  (==) a b = threadPostRequestTitle a == threadPostRequestTitle b && threadPostRequestBody a == threadPostRequestBody b && threadPostRequestTags a == threadPostRequestTags b && threadPostRequestPrivateTags a == threadPostRequestPrivateTags b && threadPostRequestGuard a == threadPostRequestGuard b

instance FromJSON ThreadPostResponse where
  parseJSON (Object o) = do
    threadPostResponseId <- o .: ("id" :: Text)
    threadPostResponseUserId <- o .: ("user_id" :: Text)
    threadPostResponseOrgId <- o .: ("org_id" :: Text)
    threadPostResponseForumId <- o .: ("forum_id" :: Text)
    threadPostResponseBoardId <- o .: ("board_id" :: Text)
    threadPostResponseThreadId <- o .: ("thread_id" :: Text)
    threadPostResponseParentId <- o .: ("parent_id" :: Text)
    threadPostResponseTitle <- o .: ("title" :: Text)
    threadPostResponseBody <- o .: ("body" :: Text)
    threadPostResponseTags <- o .: ("tags" :: Text)
    threadPostResponsePrivateTags <- o .: ("private_tags" :: Text)
    threadPostResponseActive <- o .: ("active" :: Text)
    threadPostResponseGuard <- o .: ("guard" :: Text)
    threadPostResponseCreatedAt <- o .: ("created_at" :: Text)
    threadPostResponseModifiedBy <- o .: ("modified_by" :: Text)
    threadPostResponseModifiedAt <- o .: ("modified_at" :: Text)
    threadPostResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ ThreadPostResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadPostResponse where
  toJSON ThreadPostResponse{..} = object $
    [ "tag" .= ("ThreadPostResponse" :: Text)
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


instance Eq ThreadPostResponse where
  (==) a b = threadPostResponseId a == threadPostResponseId b && threadPostResponseUserId a == threadPostResponseUserId b && threadPostResponseOrgId a == threadPostResponseOrgId b && threadPostResponseForumId a == threadPostResponseForumId b && threadPostResponseBoardId a == threadPostResponseBoardId b && threadPostResponseThreadId a == threadPostResponseThreadId b && threadPostResponseParentId a == threadPostResponseParentId b && threadPostResponseTitle a == threadPostResponseTitle b && threadPostResponseBody a == threadPostResponseBody b && threadPostResponseTags a == threadPostResponseTags b && threadPostResponsePrivateTags a == threadPostResponsePrivateTags b && threadPostResponseActive a == threadPostResponseActive b && threadPostResponseGuard a == threadPostResponseGuard b && threadPostResponseCreatedAt a == threadPostResponseCreatedAt b && threadPostResponseModifiedBy a == threadPostResponseModifiedBy b && threadPostResponseModifiedAt a == threadPostResponseModifiedAt b && threadPostResponseActivityAt a == threadPostResponseActivityAt b

instance FromJSON ThreadPostResponses where
  parseJSON (Object o) = do
    threadPostResponses <- o .: ("thread_post_responses" :: Text)
    pure $ ThreadPostResponses {
      threadPostResponses = threadPostResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadPostResponses where
  toJSON ThreadPostResponses{..} = object $
    [ "tag" .= ("ThreadPostResponses" :: Text)
    , "thread_post_responses" .= threadPostResponses
    ]


instance Eq ThreadPostResponses where
  (==) a b = threadPostResponses a == threadPostResponses b

instance FromJSON ThreadPostStatResponse where
  parseJSON (Object o) = do
    threadPostStatResponseThreadPostId <- o .: ("thread_post_id" :: Text)
    threadPostStatResponseLikes <- o .: ("likes" :: Text)
    threadPostStatResponseNeutral <- o .: ("neutral" :: Text)
    threadPostStatResponseDislikes <- o .: ("dislikes" :: Text)
    threadPostStatResponseStars <- o .: ("stars" :: Text)
    threadPostStatResponseViews <- o .: ("views" :: Text)
    pure $ ThreadPostStatResponse {
      threadPostStatResponseThreadPostId = threadPostStatResponseThreadPostId,
      threadPostStatResponseLikes = threadPostStatResponseLikes,
      threadPostStatResponseNeutral = threadPostStatResponseNeutral,
      threadPostStatResponseDislikes = threadPostStatResponseDislikes,
      threadPostStatResponseStars = threadPostStatResponseStars,
      threadPostStatResponseViews = threadPostStatResponseViews
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadPostStatResponse where
  toJSON ThreadPostStatResponse{..} = object $
    [ "tag" .= ("ThreadPostStatResponse" :: Text)
    , "thread_post_id" .= threadPostStatResponseThreadPostId
    , "likes" .= threadPostStatResponseLikes
    , "neutral" .= threadPostStatResponseNeutral
    , "dislikes" .= threadPostStatResponseDislikes
    , "stars" .= threadPostStatResponseStars
    , "views" .= threadPostStatResponseViews
    ]


instance Eq ThreadPostStatResponse where
  (==) a b = threadPostStatResponseThreadPostId a == threadPostStatResponseThreadPostId b && threadPostStatResponseLikes a == threadPostStatResponseLikes b && threadPostStatResponseNeutral a == threadPostStatResponseNeutral b && threadPostStatResponseDislikes a == threadPostStatResponseDislikes b && threadPostStatResponseStars a == threadPostStatResponseStars b && threadPostStatResponseViews a == threadPostStatResponseViews b

instance FromJSON ThreadPostStatResponses where
  parseJSON (Object o) = do
    threadPostStatResponses <- o .: ("thread_post_stat_responses" :: Text)
    pure $ ThreadPostStatResponses {
      threadPostStatResponses = threadPostStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadPostStatResponses where
  toJSON ThreadPostStatResponses{..} = object $
    [ "tag" .= ("ThreadPostStatResponses" :: Text)
    , "thread_post_stat_responses" .= threadPostStatResponses
    ]


instance Eq ThreadPostStatResponses where
  (==) a b = threadPostStatResponses a == threadPostStatResponses b

instance FromJSON UserRequest where
  parseJSON (Object o) = do
    userRequestDisplayNick <- o .: ("display_nick" :: Text)
    userRequestName <- o .: ("name" :: Text)
    userRequestEmail <- o .: ("email" :: Text)
    userRequestPlugin <- o .: ("plugin" :: Text)
    userRequestIdent <- o .: ("ident" :: Text)
    userRequestAcceptTOS <- o .: ("accept_tos" :: Text)
    pure $ UserRequest {
      userRequestDisplayNick = userRequestDisplayNick,
      userRequestName = userRequestName,
      userRequestEmail = userRequestEmail,
      userRequestPlugin = userRequestPlugin,
      userRequestIdent = userRequestIdent,
      userRequestAcceptTOS = userRequestAcceptTOS
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserRequest where
  toJSON UserRequest{..} = object $
    [ "tag" .= ("UserRequest" :: Text)
    , "display_nick" .= userRequestDisplayNick
    , "name" .= userRequestName
    , "email" .= userRequestEmail
    , "plugin" .= userRequestPlugin
    , "ident" .= userRequestIdent
    , "accept_tos" .= userRequestAcceptTOS
    ]


instance Eq UserRequest where
  (==) a b = userRequestDisplayNick a == userRequestDisplayNick b && userRequestName a == userRequestName b && userRequestEmail a == userRequestEmail b && userRequestPlugin a == userRequestPlugin b && userRequestIdent a == userRequestIdent b && userRequestAcceptTOS a == userRequestAcceptTOS b

instance FromJSON UserResponse where
  parseJSON (Object o) = do
    userResponseId <- o .: ("id" :: Text)
    userResponseNick <- o .: ("nick" :: Text)
    userResponseDisplayNick <- o .: ("display_nick" :: Text)
    userResponseName <- o .: ("name" :: Text)
    userResponseEmail <- o .: ("email" :: Text)
    userResponseEmailMD5 <- o .: ("email_md5" :: Text)
    userResponsePlugin <- o .: ("plugin" :: Text)
    userResponseIdent <- o .: ("ident" :: Text)
    userResponseAcceptTOS <- o .: ("accept_tos" :: Text)
    userResponseActive <- o .: ("active" :: Text)
    userResponseGuard <- o .: ("guard" :: Text)
    userResponseCreatedAt <- o .: ("created_at" :: Text)
    userResponseModifiedAt <- o .: ("modified_at" :: Text)
    userResponseDeactivatedAt <- o .: ("deactivated_at" :: Text)
    userResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ UserResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserResponse where
  toJSON UserResponse{..} = object $
    [ "tag" .= ("UserResponse" :: Text)
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


instance Eq UserResponse where
  (==) a b = userResponseId a == userResponseId b && userResponseNick a == userResponseNick b && userResponseDisplayNick a == userResponseDisplayNick b && userResponseName a == userResponseName b && userResponseEmail a == userResponseEmail b && userResponseEmailMD5 a == userResponseEmailMD5 b && userResponsePlugin a == userResponsePlugin b && userResponseIdent a == userResponseIdent b && userResponseAcceptTOS a == userResponseAcceptTOS b && userResponseActive a == userResponseActive b && userResponseGuard a == userResponseGuard b && userResponseCreatedAt a == userResponseCreatedAt b && userResponseModifiedAt a == userResponseModifiedAt b && userResponseDeactivatedAt a == userResponseDeactivatedAt b && userResponseActivityAt a == userResponseActivityAt b

instance FromJSON UserResponses where
  parseJSON (Object o) = do
    userResponses <- o .: ("user_responses" :: Text)
    pure $ UserResponses {
      userResponses = userResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserResponses where
  toJSON UserResponses{..} = object $
    [ "tag" .= ("UserResponses" :: Text)
    , "user_responses" .= userResponses
    ]


instance Eq UserResponses where
  (==) a b = userResponses a == userResponses b

instance FromJSON UserSanitizedResponse where
  parseJSON (Object o) = do
    userSanitizedResponseId <- o .: ("id" :: Text)
    userSanitizedResponseNick <- o .: ("nick" :: Text)
    userSanitizedResponseDisplayNick <- o .: ("display_nick" :: Text)
    userSanitizedResponseEmailMD5 <- o .: ("email_md5" :: Text)
    userSanitizedResponseActive <- o .: ("active" :: Text)
    userSanitizedResponseGuard <- o .: ("guard" :: Text)
    userSanitizedResponseCreatedAt <- o .: ("created_at" :: Text)
    userSanitizedResponseActivityAt <- o .: ("activity_at" :: Text)
    pure $ UserSanitizedResponse {
      userSanitizedResponseId = userSanitizedResponseId,
      userSanitizedResponseNick = userSanitizedResponseNick,
      userSanitizedResponseDisplayNick = userSanitizedResponseDisplayNick,
      userSanitizedResponseEmailMD5 = userSanitizedResponseEmailMD5,
      userSanitizedResponseActive = userSanitizedResponseActive,
      userSanitizedResponseGuard = userSanitizedResponseGuard,
      userSanitizedResponseCreatedAt = userSanitizedResponseCreatedAt,
      userSanitizedResponseActivityAt = userSanitizedResponseActivityAt
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserSanitizedResponse where
  toJSON UserSanitizedResponse{..} = object $
    [ "tag" .= ("UserSanitizedResponse" :: Text)
    , "id" .= userSanitizedResponseId
    , "nick" .= userSanitizedResponseNick
    , "display_nick" .= userSanitizedResponseDisplayNick
    , "email_md5" .= userSanitizedResponseEmailMD5
    , "active" .= userSanitizedResponseActive
    , "guard" .= userSanitizedResponseGuard
    , "created_at" .= userSanitizedResponseCreatedAt
    , "activity_at" .= userSanitizedResponseActivityAt
    ]


instance Eq UserSanitizedResponse where
  (==) a b = userSanitizedResponseId a == userSanitizedResponseId b && userSanitizedResponseNick a == userSanitizedResponseNick b && userSanitizedResponseDisplayNick a == userSanitizedResponseDisplayNick b && userSanitizedResponseEmailMD5 a == userSanitizedResponseEmailMD5 b && userSanitizedResponseActive a == userSanitizedResponseActive b && userSanitizedResponseGuard a == userSanitizedResponseGuard b && userSanitizedResponseCreatedAt a == userSanitizedResponseCreatedAt b && userSanitizedResponseActivityAt a == userSanitizedResponseActivityAt b

instance FromJSON UserSanitizedResponses where
  parseJSON (Object o) = do
    userSanitizedResponses <- o .: ("user_sanitized_responses" :: Text)
    pure $ UserSanitizedResponses {
      userSanitizedResponses = userSanitizedResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserSanitizedResponses where
  toJSON UserSanitizedResponses{..} = object $
    [ "tag" .= ("UserSanitizedResponses" :: Text)
    , "user_sanitized_responses" .= userSanitizedResponses
    ]


instance Eq UserSanitizedResponses where
  (==) a b = userSanitizedResponses a == userSanitizedResponses b

instance FromJSON UserSanitizedStatResponse where
  parseJSON (Object o) = do
    userSanitizedStatResponseUserId <- o .: ("user_id" :: Text)
    userSanitizedStatResponseThreads <- o .: ("threads" :: Text)
    userSanitizedStatResponseThreadPosts <- o .: ("thread_posts" :: Text)
    userSanitizedStatResponseRespect <- o .: ("respect" :: Text)
    userSanitizedStatResponseResources <- o .: ("resources" :: Text)
    userSanitizedStatResponseLeurons <- o .: ("leurons" :: Text)
    userSanitizedStatResponseWorkouts <- o .: ("workouts" :: Text)
    pure $ UserSanitizedStatResponse {
      userSanitizedStatResponseUserId = userSanitizedStatResponseUserId,
      userSanitizedStatResponseThreads = userSanitizedStatResponseThreads,
      userSanitizedStatResponseThreadPosts = userSanitizedStatResponseThreadPosts,
      userSanitizedStatResponseRespect = userSanitizedStatResponseRespect,
      userSanitizedStatResponseResources = userSanitizedStatResponseResources,
      userSanitizedStatResponseLeurons = userSanitizedStatResponseLeurons,
      userSanitizedStatResponseWorkouts = userSanitizedStatResponseWorkouts
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserSanitizedStatResponse where
  toJSON UserSanitizedStatResponse{..} = object $
    [ "tag" .= ("UserSanitizedStatResponse" :: Text)
    , "user_id" .= userSanitizedStatResponseUserId
    , "threads" .= userSanitizedStatResponseThreads
    , "thread_posts" .= userSanitizedStatResponseThreadPosts
    , "respect" .= userSanitizedStatResponseRespect
    , "resources" .= userSanitizedStatResponseResources
    , "leurons" .= userSanitizedStatResponseLeurons
    , "workouts" .= userSanitizedStatResponseWorkouts
    ]


instance Eq UserSanitizedStatResponse where
  (==) a b = userSanitizedStatResponseUserId a == userSanitizedStatResponseUserId b && userSanitizedStatResponseThreads a == userSanitizedStatResponseThreads b && userSanitizedStatResponseThreadPosts a == userSanitizedStatResponseThreadPosts b && userSanitizedStatResponseRespect a == userSanitizedStatResponseRespect b && userSanitizedStatResponseResources a == userSanitizedStatResponseResources b && userSanitizedStatResponseLeurons a == userSanitizedStatResponseLeurons b && userSanitizedStatResponseWorkouts a == userSanitizedStatResponseWorkouts b

instance FromJSON UserSanitizedStatResponses where
  parseJSON (Object o) = do
    userSanitizedStatResponses <- o .: ("user_sanitized_stat_responses" :: Text)
    pure $ UserSanitizedStatResponses {
      userSanitizedStatResponses = userSanitizedStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserSanitizedStatResponses where
  toJSON UserSanitizedStatResponses{..} = object $
    [ "tag" .= ("UserSanitizedStatResponses" :: Text)
    , "user_sanitized_stat_responses" .= userSanitizedStatResponses
    ]


instance Eq UserSanitizedStatResponses where
  (==) a b = userSanitizedStatResponses a == userSanitizedStatResponses b

instance FromJSON Visibility where
  parseJSON (Object o) = do
    tag <- o .: ("tag" :: Text)
    case tag of
      ("Public" :: Text) -> do
        pure Public

      ("Private" :: Text) -> do
        pure Private

      _ -> fail "Could not parse Visibility"

  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON Visibility where
  toJSON (Public ) = object $
    [ "tag" .= ("Public" :: Text)
    , "contents" .= ([] :: [Text])
    ]
  toJSON (Private ) = object $
    [ "tag" .= ("Private" :: Text)
    , "contents" .= ([] :: [Text])
    ]


instance Eq Visibility where
  (==) Public Public = True
  (==) Private Private = True
  (==) _ _ = False

instance FromJSON OrganizationPackResponse where
  parseJSON (Object o) = do
    organizationPackResponseUser <- o .: ("user" :: Text)
    organizationPackResponseUserId <- o .: ("user_id" :: Text)
    organizationPackResponseOrganization <- o .: ("organization" :: Text)
    organizationPackResponseOrganizationId <- o .: ("organization_id" :: Text)
    organizationPackResponseStat <- o .: ("stat" :: Text)
    organizationPackResponseLike <- o .: ("like" :: Text)
    organizationPackResponseStar <- o .: ("star" :: Text)
    organizationPackResponsePermissions <- o .: ("permissions" :: Text)
    organizationPackResponseTeams <- o .: ("teams" :: Text)
    pure $ OrganizationPackResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON OrganizationPackResponse where
  toJSON OrganizationPackResponse{..} = object $
    [ "tag" .= ("OrganizationPackResponse" :: Text)
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


instance Eq OrganizationPackResponse where
  (==) a b = organizationPackResponseUser a == organizationPackResponseUser b && organizationPackResponseUserId a == organizationPackResponseUserId b && organizationPackResponseOrganization a == organizationPackResponseOrganization b && organizationPackResponseOrganizationId a == organizationPackResponseOrganizationId b && organizationPackResponseStat a == organizationPackResponseStat b && organizationPackResponseLike a == organizationPackResponseLike b && organizationPackResponseStar a == organizationPackResponseStar b && organizationPackResponsePermissions a == organizationPackResponsePermissions b && organizationPackResponseTeams a == organizationPackResponseTeams b

instance FromJSON OrganizationPackResponses where
  parseJSON (Object o) = do
    organizationPackResponses <- o .: ("organization_pack_responses" :: Text)
    pure $ OrganizationPackResponses {
      organizationPackResponses = organizationPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON OrganizationPackResponses where
  toJSON OrganizationPackResponses{..} = object $
    [ "tag" .= ("OrganizationPackResponses" :: Text)
    , "organization_pack_responses" .= organizationPackResponses
    ]


instance Eq OrganizationPackResponses where
  (==) a b = organizationPackResponses a == organizationPackResponses b

instance FromJSON TeamPackResponse where
  parseJSON (Object o) = do
    teamPackResponseUser <- o .: ("user" :: Text)
    teamPackResponseUserId <- o .: ("user_id" :: Text)
    teamPackResponseTeam <- o .: ("team" :: Text)
    teamPackResponseTeamId <- o .: ("team_id" :: Text)
    teamPackResponseStat <- o .: ("stat" :: Text)
    teamPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ TeamPackResponse {
      teamPackResponseUser = teamPackResponseUser,
      teamPackResponseUserId = teamPackResponseUserId,
      teamPackResponseTeam = teamPackResponseTeam,
      teamPackResponseTeamId = teamPackResponseTeamId,
      teamPackResponseStat = teamPackResponseStat,
      teamPackResponsePermissions = teamPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamPackResponse where
  toJSON TeamPackResponse{..} = object $
    [ "tag" .= ("TeamPackResponse" :: Text)
    , "user" .= teamPackResponseUser
    , "user_id" .= teamPackResponseUserId
    , "team" .= teamPackResponseTeam
    , "team_id" .= teamPackResponseTeamId
    , "stat" .= teamPackResponseStat
    , "permissions" .= teamPackResponsePermissions
    ]


instance Eq TeamPackResponse where
  (==) a b = teamPackResponseUser a == teamPackResponseUser b && teamPackResponseUserId a == teamPackResponseUserId b && teamPackResponseTeam a == teamPackResponseTeam b && teamPackResponseTeamId a == teamPackResponseTeamId b && teamPackResponseStat a == teamPackResponseStat b && teamPackResponsePermissions a == teamPackResponsePermissions b

instance FromJSON TeamPackResponses where
  parseJSON (Object o) = do
    teamPackResponses <- o .: ("team_pack_responses" :: Text)
    pure $ TeamPackResponses {
      teamPackResponses = teamPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamPackResponses where
  toJSON TeamPackResponses{..} = object $
    [ "tag" .= ("TeamPackResponses" :: Text)
    , "team_pack_responses" .= teamPackResponses
    ]


instance Eq TeamPackResponses where
  (==) a b = teamPackResponses a == teamPackResponses b

instance FromJSON TeamMemberPackResponse where
  parseJSON (Object o) = do
    teamMemberPackResponseUser <- o .: ("user" :: Text)
    teamMemberPackResponseUserId <- o .: ("user_id" :: Text)
    teamMemberPackResponseTeamMember <- o .: ("team_member" :: Text)
    teamMemberPackResponseTeamMemberId <- o .: ("team_member_id" :: Text)
    teamMemberPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ TeamMemberPackResponse {
      teamMemberPackResponseUser = teamMemberPackResponseUser,
      teamMemberPackResponseUserId = teamMemberPackResponseUserId,
      teamMemberPackResponseTeamMember = teamMemberPackResponseTeamMember,
      teamMemberPackResponseTeamMemberId = teamMemberPackResponseTeamMemberId,
      teamMemberPackResponsePermissions = teamMemberPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamMemberPackResponse where
  toJSON TeamMemberPackResponse{..} = object $
    [ "tag" .= ("TeamMemberPackResponse" :: Text)
    , "user" .= teamMemberPackResponseUser
    , "user_id" .= teamMemberPackResponseUserId
    , "team_member" .= teamMemberPackResponseTeamMember
    , "team_member_id" .= teamMemberPackResponseTeamMemberId
    , "permissions" .= teamMemberPackResponsePermissions
    ]


instance Eq TeamMemberPackResponse where
  (==) a b = teamMemberPackResponseUser a == teamMemberPackResponseUser b && teamMemberPackResponseUserId a == teamMemberPackResponseUserId b && teamMemberPackResponseTeamMember a == teamMemberPackResponseTeamMember b && teamMemberPackResponseTeamMemberId a == teamMemberPackResponseTeamMemberId b && teamMemberPackResponsePermissions a == teamMemberPackResponsePermissions b

instance FromJSON TeamMemberPackResponses where
  parseJSON (Object o) = do
    teamMemberPackResponses <- o .: ("team_member_pack_responses" :: Text)
    pure $ TeamMemberPackResponses {
      teamMemberPackResponses = teamMemberPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON TeamMemberPackResponses where
  toJSON TeamMemberPackResponses{..} = object $
    [ "tag" .= ("TeamMemberPackResponses" :: Text)
    , "team_member_pack_responses" .= teamMemberPackResponses
    ]


instance Eq TeamMemberPackResponses where
  (==) a b = teamMemberPackResponses a == teamMemberPackResponses b

instance FromJSON UserPackResponse where
  parseJSON (Object o) = do
    userPackResponseUser <- o .: ("user" :: Text)
    userPackResponseUserId <- o .: ("user_id" :: Text)
    userPackResponseStat <- o .: ("stat" :: Text)
    userPackResponseProfile <- o .: ("profile" :: Text)
    userPackResponseProfileId <- o .: ("profile_id" :: Text)
    pure $ UserPackResponse {
      userPackResponseUser = userPackResponseUser,
      userPackResponseUserId = userPackResponseUserId,
      userPackResponseStat = userPackResponseStat,
      userPackResponseProfile = userPackResponseProfile,
      userPackResponseProfileId = userPackResponseProfileId
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserPackResponse where
  toJSON UserPackResponse{..} = object $
    [ "tag" .= ("UserPackResponse" :: Text)
    , "user" .= userPackResponseUser
    , "user_id" .= userPackResponseUserId
    , "stat" .= userPackResponseStat
    , "profile" .= userPackResponseProfile
    , "profile_id" .= userPackResponseProfileId
    ]


instance Eq UserPackResponse where
  (==) a b = userPackResponseUser a == userPackResponseUser b && userPackResponseUserId a == userPackResponseUserId b && userPackResponseStat a == userPackResponseStat b && userPackResponseProfile a == userPackResponseProfile b && userPackResponseProfileId a == userPackResponseProfileId b

instance FromJSON UserPackResponses where
  parseJSON (Object o) = do
    userPackResponses <- o .: ("user_pack_responses" :: Text)
    pure $ UserPackResponses {
      userPackResponses = userPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserPackResponses where
  toJSON UserPackResponses{..} = object $
    [ "tag" .= ("UserPackResponses" :: Text)
    , "user_pack_responses" .= userPackResponses
    ]


instance Eq UserPackResponses where
  (==) a b = userPackResponses a == userPackResponses b

instance FromJSON UserSanitizedPackResponse where
  parseJSON (Object o) = do
    userSanitizedPackResponseUser <- o .: ("user" :: Text)
    userSanitizedPackResponseUserId <- o .: ("user_id" :: Text)
    userSanitizedPackResponseProfile <- o .: ("profile" :: Text)
    userSanitizedPackResponseProfileId <- o .: ("profile_id" :: Text)
    userSanitizedPackResponseStat <- o .: ("stat" :: Text)
    userSanitizedPackResponseLike <- o .: ("like" :: Text)
    userSanitizedPackResponseStar <- o .: ("star" :: Text)
    pure $ UserSanitizedPackResponse {
      userSanitizedPackResponseUser = userSanitizedPackResponseUser,
      userSanitizedPackResponseUserId = userSanitizedPackResponseUserId,
      userSanitizedPackResponseProfile = userSanitizedPackResponseProfile,
      userSanitizedPackResponseProfileId = userSanitizedPackResponseProfileId,
      userSanitizedPackResponseStat = userSanitizedPackResponseStat,
      userSanitizedPackResponseLike = userSanitizedPackResponseLike,
      userSanitizedPackResponseStar = userSanitizedPackResponseStar
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserSanitizedPackResponse where
  toJSON UserSanitizedPackResponse{..} = object $
    [ "tag" .= ("UserSanitizedPackResponse" :: Text)
    , "user" .= userSanitizedPackResponseUser
    , "user_id" .= userSanitizedPackResponseUserId
    , "profile" .= userSanitizedPackResponseProfile
    , "profile_id" .= userSanitizedPackResponseProfileId
    , "stat" .= userSanitizedPackResponseStat
    , "like" .= userSanitizedPackResponseLike
    , "star" .= userSanitizedPackResponseStar
    ]


instance Eq UserSanitizedPackResponse where
  (==) a b = userSanitizedPackResponseUser a == userSanitizedPackResponseUser b && userSanitizedPackResponseUserId a == userSanitizedPackResponseUserId b && userSanitizedPackResponseProfile a == userSanitizedPackResponseProfile b && userSanitizedPackResponseProfileId a == userSanitizedPackResponseProfileId b && userSanitizedPackResponseStat a == userSanitizedPackResponseStat b && userSanitizedPackResponseLike a == userSanitizedPackResponseLike b && userSanitizedPackResponseStar a == userSanitizedPackResponseStar b

instance FromJSON UserSanitizedPackResponses where
  parseJSON (Object o) = do
    userSanitizedPackResponses <- o .: ("user_sanitized_pack_responses" :: Text)
    pure $ UserSanitizedPackResponses {
      userSanitizedPackResponses = userSanitizedPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON UserSanitizedPackResponses where
  toJSON UserSanitizedPackResponses{..} = object $
    [ "tag" .= ("UserSanitizedPackResponses" :: Text)
    , "user_sanitized_pack_responses" .= userSanitizedPackResponses
    ]


instance Eq UserSanitizedPackResponses where
  (==) a b = userSanitizedPackResponses a == userSanitizedPackResponses b

instance FromJSON GlobalGroupPackResponse where
  parseJSON (Object o) = do
    globalGroupPackResponseUser <- o .: ("user" :: Text)
    globalGroupPackResponseUserId <- o .: ("user_id" :: Text)
    globalGroupPackResponseGlobalGroup <- o .: ("global_group" :: Text)
    globalGroupPackResponseGlobalGroupId <- o .: ("global_group_id" :: Text)
    globalGroupPackResponseStat <- o .: ("stat" :: Text)
    globalGroupPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ GlobalGroupPackResponse {
      globalGroupPackResponseUser = globalGroupPackResponseUser,
      globalGroupPackResponseUserId = globalGroupPackResponseUserId,
      globalGroupPackResponseGlobalGroup = globalGroupPackResponseGlobalGroup,
      globalGroupPackResponseGlobalGroupId = globalGroupPackResponseGlobalGroupId,
      globalGroupPackResponseStat = globalGroupPackResponseStat,
      globalGroupPackResponsePermissions = globalGroupPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GlobalGroupPackResponse where
  toJSON GlobalGroupPackResponse{..} = object $
    [ "tag" .= ("GlobalGroupPackResponse" :: Text)
    , "user" .= globalGroupPackResponseUser
    , "user_id" .= globalGroupPackResponseUserId
    , "global_group" .= globalGroupPackResponseGlobalGroup
    , "global_group_id" .= globalGroupPackResponseGlobalGroupId
    , "stat" .= globalGroupPackResponseStat
    , "permissions" .= globalGroupPackResponsePermissions
    ]


instance Eq GlobalGroupPackResponse where
  (==) a b = globalGroupPackResponseUser a == globalGroupPackResponseUser b && globalGroupPackResponseUserId a == globalGroupPackResponseUserId b && globalGroupPackResponseGlobalGroup a == globalGroupPackResponseGlobalGroup b && globalGroupPackResponseGlobalGroupId a == globalGroupPackResponseGlobalGroupId b && globalGroupPackResponseStat a == globalGroupPackResponseStat b && globalGroupPackResponsePermissions a == globalGroupPackResponsePermissions b

instance FromJSON GlobalGroupPackResponses where
  parseJSON (Object o) = do
    globalGroupPackResponses <- o .: ("global_group_pack_responses" :: Text)
    pure $ GlobalGroupPackResponses {
      globalGroupPackResponses = globalGroupPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GlobalGroupPackResponses where
  toJSON GlobalGroupPackResponses{..} = object $
    [ "tag" .= ("GlobalGroupPackResponses" :: Text)
    , "global_group_pack_responses" .= globalGroupPackResponses
    ]


instance Eq GlobalGroupPackResponses where
  (==) a b = globalGroupPackResponses a == globalGroupPackResponses b

instance FromJSON GroupPackResponse where
  parseJSON (Object o) = do
    groupPackResponseUser <- o .: ("user" :: Text)
    groupPackResponseUserId <- o .: ("user_id" :: Text)
    groupPackResponseGroup <- o .: ("group" :: Text)
    groupPackResponseGroupId <- o .: ("group_id" :: Text)
    groupPackResponseOrganization <- o .: ("organization" :: Text)
    groupPackResponseOrganizationId <- o .: ("organization_id" :: Text)
    groupPackResponseStat <- o .: ("stat" :: Text)
    groupPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ GroupPackResponse {
      groupPackResponseUser = groupPackResponseUser,
      groupPackResponseUserId = groupPackResponseUserId,
      groupPackResponseGroup = groupPackResponseGroup,
      groupPackResponseGroupId = groupPackResponseGroupId,
      groupPackResponseOrganization = groupPackResponseOrganization,
      groupPackResponseOrganizationId = groupPackResponseOrganizationId,
      groupPackResponseStat = groupPackResponseStat,
      groupPackResponsePermissions = groupPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupPackResponse where
  toJSON GroupPackResponse{..} = object $
    [ "tag" .= ("GroupPackResponse" :: Text)
    , "user" .= groupPackResponseUser
    , "user_id" .= groupPackResponseUserId
    , "group" .= groupPackResponseGroup
    , "group_id" .= groupPackResponseGroupId
    , "organization" .= groupPackResponseOrganization
    , "organization_id" .= groupPackResponseOrganizationId
    , "stat" .= groupPackResponseStat
    , "permissions" .= groupPackResponsePermissions
    ]


instance Eq GroupPackResponse where
  (==) a b = groupPackResponseUser a == groupPackResponseUser b && groupPackResponseUserId a == groupPackResponseUserId b && groupPackResponseGroup a == groupPackResponseGroup b && groupPackResponseGroupId a == groupPackResponseGroupId b && groupPackResponseOrganization a == groupPackResponseOrganization b && groupPackResponseOrganizationId a == groupPackResponseOrganizationId b && groupPackResponseStat a == groupPackResponseStat b && groupPackResponsePermissions a == groupPackResponsePermissions b

instance FromJSON GroupPackResponses where
  parseJSON (Object o) = do
    groupPackResponses <- o .: ("group_pack_responses" :: Text)
    pure $ GroupPackResponses {
      groupPackResponses = groupPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupPackResponses where
  toJSON GroupPackResponses{..} = object $
    [ "tag" .= ("GroupPackResponses" :: Text)
    , "group_pack_responses" .= groupPackResponses
    ]


instance Eq GroupPackResponses where
  (==) a b = groupPackResponses a == groupPackResponses b

instance FromJSON GroupMemberPackResponse where
  parseJSON (Object o) = do
    groupMemberPackResponseUser <- o .: ("user" :: Text)
    groupMemberPackResponseUserId <- o .: ("user_id" :: Text)
    groupMemberPackResponseGroupMember <- o .: ("group_member" :: Text)
    groupMemberPackResponseGroupMemberId <- o .: ("group_member_id" :: Text)
    groupMemberPackResponseIsOwner <- o .: ("is_owner" :: Text)
    pure $ GroupMemberPackResponse {
      groupMemberPackResponseUser = groupMemberPackResponseUser,
      groupMemberPackResponseUserId = groupMemberPackResponseUserId,
      groupMemberPackResponseGroupMember = groupMemberPackResponseGroupMember,
      groupMemberPackResponseGroupMemberId = groupMemberPackResponseGroupMemberId,
      groupMemberPackResponseIsOwner = groupMemberPackResponseIsOwner
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupMemberPackResponse where
  toJSON GroupMemberPackResponse{..} = object $
    [ "tag" .= ("GroupMemberPackResponse" :: Text)
    , "user" .= groupMemberPackResponseUser
    , "user_id" .= groupMemberPackResponseUserId
    , "group_member" .= groupMemberPackResponseGroupMember
    , "group_member_id" .= groupMemberPackResponseGroupMemberId
    , "is_owner" .= groupMemberPackResponseIsOwner
    ]


instance Eq GroupMemberPackResponse where
  (==) a b = groupMemberPackResponseUser a == groupMemberPackResponseUser b && groupMemberPackResponseUserId a == groupMemberPackResponseUserId b && groupMemberPackResponseGroupMember a == groupMemberPackResponseGroupMember b && groupMemberPackResponseGroupMemberId a == groupMemberPackResponseGroupMemberId b && groupMemberPackResponseIsOwner a == groupMemberPackResponseIsOwner b

instance FromJSON GroupMemberPackResponses where
  parseJSON (Object o) = do
    groupMemberPackResponses <- o .: ("group_member_pack_responses" :: Text)
    pure $ GroupMemberPackResponses {
      groupMemberPackResponses = groupMemberPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON GroupMemberPackResponses where
  toJSON GroupMemberPackResponses{..} = object $
    [ "tag" .= ("GroupMemberPackResponses" :: Text)
    , "group_member_pack_responses" .= groupMemberPackResponses
    ]


instance Eq GroupMemberPackResponses where
  (==) a b = groupMemberPackResponses a == groupMemberPackResponses b

instance FromJSON ForumPackResponse where
  parseJSON (Object o) = do
    forumPackResponseForum <- o .: ("forum" :: Text)
    forumPackResponseForumId <- o .: ("forum_id" :: Text)
    forumPackResponseStat <- o .: ("stat" :: Text)
    forumPackResponseLike <- o .: ("like" :: Text)
    forumPackResponseStar <- o .: ("star" :: Text)
    forumPackResponseWithOrganization <- o .: ("with_organization" :: Text)
    forumPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ ForumPackResponse {
      forumPackResponseForum = forumPackResponseForum,
      forumPackResponseForumId = forumPackResponseForumId,
      forumPackResponseStat = forumPackResponseStat,
      forumPackResponseLike = forumPackResponseLike,
      forumPackResponseStar = forumPackResponseStar,
      forumPackResponseWithOrganization = forumPackResponseWithOrganization,
      forumPackResponsePermissions = forumPackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ForumPackResponse where
  toJSON ForumPackResponse{..} = object $
    [ "tag" .= ("ForumPackResponse" :: Text)
    , "forum" .= forumPackResponseForum
    , "forum_id" .= forumPackResponseForumId
    , "stat" .= forumPackResponseStat
    , "like" .= forumPackResponseLike
    , "star" .= forumPackResponseStar
    , "with_organization" .= forumPackResponseWithOrganization
    , "permissions" .= forumPackResponsePermissions
    ]


instance Eq ForumPackResponse where
  (==) a b = forumPackResponseForum a == forumPackResponseForum b && forumPackResponseForumId a == forumPackResponseForumId b && forumPackResponseStat a == forumPackResponseStat b && forumPackResponseLike a == forumPackResponseLike b && forumPackResponseStar a == forumPackResponseStar b && forumPackResponseWithOrganization a == forumPackResponseWithOrganization b && forumPackResponsePermissions a == forumPackResponsePermissions b

instance FromJSON ForumPackResponses where
  parseJSON (Object o) = do
    forumPackResponses <- o .: ("forum_pack_responses" :: Text)
    pure $ ForumPackResponses {
      forumPackResponses = forumPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ForumPackResponses where
  toJSON ForumPackResponses{..} = object $
    [ "tag" .= ("ForumPackResponses" :: Text)
    , "forum_pack_responses" .= forumPackResponses
    ]


instance Eq ForumPackResponses where
  (==) a b = forumPackResponses a == forumPackResponses b

instance FromJSON BoardPackResponse where
  parseJSON (Object o) = do
    boardPackResponseBoard <- o .: ("board" :: Text)
    boardPackResponseBoardId <- o .: ("board_id" :: Text)
    boardPackResponseStat <- o .: ("stat" :: Text)
    boardPackResponseLike <- o .: ("like" :: Text)
    boardPackResponseStar <- o .: ("star" :: Text)
    boardPackResponseLatestThread <- o .: ("latest_thread" :: Text)
    boardPackResponseLatestThreadPost <- o .: ("latest_thread_post" :: Text)
    boardPackResponseLatestThreadPostUser <- o .: ("latest_thread_post_user" :: Text)
    boardPackResponseWithOrganization <- o .: ("with_organization" :: Text)
    boardPackResponseWithForum <- o .: ("with_forum" :: Text)
    boardPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ BoardPackResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BoardPackResponse where
  toJSON BoardPackResponse{..} = object $
    [ "tag" .= ("BoardPackResponse" :: Text)
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


instance Eq BoardPackResponse where
  (==) a b = boardPackResponseBoard a == boardPackResponseBoard b && boardPackResponseBoardId a == boardPackResponseBoardId b && boardPackResponseStat a == boardPackResponseStat b && boardPackResponseLike a == boardPackResponseLike b && boardPackResponseStar a == boardPackResponseStar b && boardPackResponseLatestThread a == boardPackResponseLatestThread b && boardPackResponseLatestThreadPost a == boardPackResponseLatestThreadPost b && boardPackResponseLatestThreadPostUser a == boardPackResponseLatestThreadPostUser b && boardPackResponseWithOrganization a == boardPackResponseWithOrganization b && boardPackResponseWithForum a == boardPackResponseWithForum b && boardPackResponsePermissions a == boardPackResponsePermissions b

instance FromJSON BoardPackResponses where
  parseJSON (Object o) = do
    boardPackResponses <- o .: ("board_pack_responses" :: Text)
    pure $ BoardPackResponses {
      boardPackResponses = boardPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON BoardPackResponses where
  toJSON BoardPackResponses{..} = object $
    [ "tag" .= ("BoardPackResponses" :: Text)
    , "board_pack_responses" .= boardPackResponses
    ]


instance Eq BoardPackResponses where
  (==) a b = boardPackResponses a == boardPackResponses b

instance FromJSON ThreadPackResponse where
  parseJSON (Object o) = do
    threadPackResponseThread <- o .: ("thread" :: Text)
    threadPackResponseThreadId <- o .: ("thread_id" :: Text)
    threadPackResponseUser <- o .: ("user" :: Text)
    threadPackResponseUserId <- o .: ("user_id" :: Text)
    threadPackResponseStat <- o .: ("stat" :: Text)
    threadPackResponseLike <- o .: ("like" :: Text)
    threadPackResponseStar <- o .: ("star" :: Text)
    threadPackResponseLatestThreadPost <- o .: ("latest_thread_post" :: Text)
    threadPackResponseLatestThreadPostUser <- o .: ("latest_thread_post_user" :: Text)
    threadPackResponseWithOrganization <- o .: ("with_organization" :: Text)
    threadPackResponseWithForum <- o .: ("with_forum" :: Text)
    threadPackResponseWithBoard <- o .: ("with_board" :: Text)
    threadPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ ThreadPackResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadPackResponse where
  toJSON ThreadPackResponse{..} = object $
    [ "tag" .= ("ThreadPackResponse" :: Text)
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


instance Eq ThreadPackResponse where
  (==) a b = threadPackResponseThread a == threadPackResponseThread b && threadPackResponseThreadId a == threadPackResponseThreadId b && threadPackResponseUser a == threadPackResponseUser b && threadPackResponseUserId a == threadPackResponseUserId b && threadPackResponseStat a == threadPackResponseStat b && threadPackResponseLike a == threadPackResponseLike b && threadPackResponseStar a == threadPackResponseStar b && threadPackResponseLatestThreadPost a == threadPackResponseLatestThreadPost b && threadPackResponseLatestThreadPostUser a == threadPackResponseLatestThreadPostUser b && threadPackResponseWithOrganization a == threadPackResponseWithOrganization b && threadPackResponseWithForum a == threadPackResponseWithForum b && threadPackResponseWithBoard a == threadPackResponseWithBoard b && threadPackResponsePermissions a == threadPackResponsePermissions b

instance FromJSON ThreadPackResponses where
  parseJSON (Object o) = do
    threadPackResponses <- o .: ("thread_pack_responses" :: Text)
    pure $ ThreadPackResponses {
      threadPackResponses = threadPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadPackResponses where
  toJSON ThreadPackResponses{..} = object $
    [ "tag" .= ("ThreadPackResponses" :: Text)
    , "thread_pack_responses" .= threadPackResponses
    ]


instance Eq ThreadPackResponses where
  (==) a b = threadPackResponses a == threadPackResponses b

instance FromJSON ThreadPostPackResponse where
  parseJSON (Object o) = do
    threadPostPackResponseThreadPost <- o .: ("thread_post" :: Text)
    threadPostPackResponseThreadPostId <- o .: ("thread_post_id" :: Text)
    threadPostPackResponseUser <- o .: ("user" :: Text)
    threadPostPackResponseUserId <- o .: ("user_id" :: Text)
    threadPostPackResponseStat <- o .: ("stat" :: Text)
    threadPostPackResponseLike <- o .: ("like" :: Text)
    threadPostPackResponseStar <- o .: ("star" :: Text)
    threadPostPackResponseWithOrganization <- o .: ("with_organization" :: Text)
    threadPostPackResponseWithForum <- o .: ("with_forum" :: Text)
    threadPostPackResponseWithBoard <- o .: ("with_board" :: Text)
    threadPostPackResponseWithThread <- o .: ("with_thread" :: Text)
    threadPostPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ ThreadPostPackResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadPostPackResponse where
  toJSON ThreadPostPackResponse{..} = object $
    [ "tag" .= ("ThreadPostPackResponse" :: Text)
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


instance Eq ThreadPostPackResponse where
  (==) a b = threadPostPackResponseThreadPost a == threadPostPackResponseThreadPost b && threadPostPackResponseThreadPostId a == threadPostPackResponseThreadPostId b && threadPostPackResponseUser a == threadPostPackResponseUser b && threadPostPackResponseUserId a == threadPostPackResponseUserId b && threadPostPackResponseStat a == threadPostPackResponseStat b && threadPostPackResponseLike a == threadPostPackResponseLike b && threadPostPackResponseStar a == threadPostPackResponseStar b && threadPostPackResponseWithOrganization a == threadPostPackResponseWithOrganization b && threadPostPackResponseWithForum a == threadPostPackResponseWithForum b && threadPostPackResponseWithBoard a == threadPostPackResponseWithBoard b && threadPostPackResponseWithThread a == threadPostPackResponseWithThread b && threadPostPackResponsePermissions a == threadPostPackResponsePermissions b

instance FromJSON ThreadPostPackResponses where
  parseJSON (Object o) = do
    threadPostPackResponses <- o .: ("thread_post_pack_responses" :: Text)
    pure $ ThreadPostPackResponses {
      threadPostPackResponses = threadPostPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ThreadPostPackResponses where
  toJSON ThreadPostPackResponses{..} = object $
    [ "tag" .= ("ThreadPostPackResponses" :: Text)
    , "thread_post_pack_responses" .= threadPostPackResponses
    ]


instance Eq ThreadPostPackResponses where
  (==) a b = threadPostPackResponses a == threadPostPackResponses b

instance FromJSON ResourcePackResponse where
  parseJSON (Object o) = do
    resourcePackResponseResource <- o .: ("resource" :: Text)
    resourcePackResponseResourceId <- o .: ("resource_id" :: Text)
    resourcePackResponseUser <- o .: ("user" :: Text)
    resourcePackResponseUserId <- o .: ("user_id" :: Text)
    resourcePackResponseStat <- o .: ("stat" :: Text)
    resourcePackResponseLike <- o .: ("like" :: Text)
    resourcePackResponseStar <- o .: ("star" :: Text)
    resourcePackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ ResourcePackResponse {
      resourcePackResponseResource = resourcePackResponseResource,
      resourcePackResponseResourceId = resourcePackResponseResourceId,
      resourcePackResponseUser = resourcePackResponseUser,
      resourcePackResponseUserId = resourcePackResponseUserId,
      resourcePackResponseStat = resourcePackResponseStat,
      resourcePackResponseLike = resourcePackResponseLike,
      resourcePackResponseStar = resourcePackResponseStar,
      resourcePackResponsePermissions = resourcePackResponsePermissions
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ResourcePackResponse where
  toJSON ResourcePackResponse{..} = object $
    [ "tag" .= ("ResourcePackResponse" :: Text)
    , "resource" .= resourcePackResponseResource
    , "resource_id" .= resourcePackResponseResourceId
    , "user" .= resourcePackResponseUser
    , "user_id" .= resourcePackResponseUserId
    , "stat" .= resourcePackResponseStat
    , "like" .= resourcePackResponseLike
    , "star" .= resourcePackResponseStar
    , "permissions" .= resourcePackResponsePermissions
    ]


instance Eq ResourcePackResponse where
  (==) a b = resourcePackResponseResource a == resourcePackResponseResource b && resourcePackResponseResourceId a == resourcePackResponseResourceId b && resourcePackResponseUser a == resourcePackResponseUser b && resourcePackResponseUserId a == resourcePackResponseUserId b && resourcePackResponseStat a == resourcePackResponseStat b && resourcePackResponseLike a == resourcePackResponseLike b && resourcePackResponseStar a == resourcePackResponseStar b && resourcePackResponsePermissions a == resourcePackResponsePermissions b

instance FromJSON ResourcePackResponses where
  parseJSON (Object o) = do
    resourcePackResponses <- o .: ("resource_pack_responses" :: Text)
    pure $ ResourcePackResponses {
      resourcePackResponses = resourcePackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON ResourcePackResponses where
  toJSON ResourcePackResponses{..} = object $
    [ "tag" .= ("ResourcePackResponses" :: Text)
    , "resource_pack_responses" .= resourcePackResponses
    ]


instance Eq ResourcePackResponses where
  (==) a b = resourcePackResponses a == resourcePackResponses b

instance FromJSON LeuronPackResponse where
  parseJSON (Object o) = do
    leuronPackResponseLeuron <- o .: ("leuron" :: Text)
    leuronPackResponseLeuronId <- o .: ("leuron_id" :: Text)
    leuronPackResponseUser <- o .: ("user" :: Text)
    leuronPackResponseUserId <- o .: ("user_id" :: Text)
    leuronPackResponseTraining <- o .: ("training" :: Text)
    leuronPackResponseStat <- o .: ("stat" :: Text)
    leuronPackResponseLike <- o .: ("like" :: Text)
    leuronPackResponseStar <- o .: ("star" :: Text)
    leuronPackResponsePermissions <- o .: ("permissions" :: Text)
    pure $ LeuronPackResponse {
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
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronPackResponse where
  toJSON LeuronPackResponse{..} = object $
    [ "tag" .= ("LeuronPackResponse" :: Text)
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


instance Eq LeuronPackResponse where
  (==) a b = leuronPackResponseLeuron a == leuronPackResponseLeuron b && leuronPackResponseLeuronId a == leuronPackResponseLeuronId b && leuronPackResponseUser a == leuronPackResponseUser b && leuronPackResponseUserId a == leuronPackResponseUserId b && leuronPackResponseTraining a == leuronPackResponseTraining b && leuronPackResponseStat a == leuronPackResponseStat b && leuronPackResponseLike a == leuronPackResponseLike b && leuronPackResponseStar a == leuronPackResponseStar b && leuronPackResponsePermissions a == leuronPackResponsePermissions b

instance FromJSON LeuronPackResponses where
  parseJSON (Object o) = do
    leuronPackResponses <- o .: ("leuron_pack_responses" :: Text)
    pure $ LeuronPackResponses {
      leuronPackResponses = leuronPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON LeuronPackResponses where
  toJSON LeuronPackResponses{..} = object $
    [ "tag" .= ("LeuronPackResponses" :: Text)
    , "leuron_pack_responses" .= leuronPackResponses
    ]


instance Eq LeuronPackResponses where
  (==) a b = leuronPackResponses a == leuronPackResponses b

instance FromJSON PmInPackResponse where
  parseJSON (Object o) = do
    pmInPackResponsePmIn <- o .: ("pm_in" :: Text)
    pmInPackResponsePmInId <- o .: ("pm_in_id" :: Text)
    pmInPackResponseUser <- o .: ("user" :: Text)
    pmInPackResponseUserId <- o .: ("user_id" :: Text)
    pure $ PmInPackResponse {
      pmInPackResponsePmIn = pmInPackResponsePmIn,
      pmInPackResponsePmInId = pmInPackResponsePmInId,
      pmInPackResponseUser = pmInPackResponseUser,
      pmInPackResponseUserId = pmInPackResponseUserId
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmInPackResponse where
  toJSON PmInPackResponse{..} = object $
    [ "tag" .= ("PmInPackResponse" :: Text)
    , "pm_in" .= pmInPackResponsePmIn
    , "pm_in_id" .= pmInPackResponsePmInId
    , "user" .= pmInPackResponseUser
    , "user_id" .= pmInPackResponseUserId
    ]


instance Eq PmInPackResponse where
  (==) a b = pmInPackResponsePmIn a == pmInPackResponsePmIn b && pmInPackResponsePmInId a == pmInPackResponsePmInId b && pmInPackResponseUser a == pmInPackResponseUser b && pmInPackResponseUserId a == pmInPackResponseUserId b

instance FromJSON PmInPackResponses where
  parseJSON (Object o) = do
    pmInPackResponses <- o .: ("pm_in_pack_responses" :: Text)
    pure $ PmInPackResponses {
      pmInPackResponses = pmInPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmInPackResponses where
  toJSON PmInPackResponses{..} = object $
    [ "tag" .= ("PmInPackResponses" :: Text)
    , "pm_in_pack_responses" .= pmInPackResponses
    ]


instance Eq PmInPackResponses where
  (==) a b = pmInPackResponses a == pmInPackResponses b

instance FromJSON PmOutPackResponse where
  parseJSON (Object o) = do
    pmOutPackResponsePmOut <- o .: ("pm_out" :: Text)
    pmOutPackResponsePmOutId <- o .: ("pm_out_id" :: Text)
    pmOutPackResponseUser <- o .: ("user" :: Text)
    pmOutPackResponseUserId <- o .: ("user_id" :: Text)
    pure $ PmOutPackResponse {
      pmOutPackResponsePmOut = pmOutPackResponsePmOut,
      pmOutPackResponsePmOutId = pmOutPackResponsePmOutId,
      pmOutPackResponseUser = pmOutPackResponseUser,
      pmOutPackResponseUserId = pmOutPackResponseUserId
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmOutPackResponse where
  toJSON PmOutPackResponse{..} = object $
    [ "tag" .= ("PmOutPackResponse" :: Text)
    , "pm_out" .= pmOutPackResponsePmOut
    , "pm_out_id" .= pmOutPackResponsePmOutId
    , "user" .= pmOutPackResponseUser
    , "user_id" .= pmOutPackResponseUserId
    ]


instance Eq PmOutPackResponse where
  (==) a b = pmOutPackResponsePmOut a == pmOutPackResponsePmOut b && pmOutPackResponsePmOutId a == pmOutPackResponsePmOutId b && pmOutPackResponseUser a == pmOutPackResponseUser b && pmOutPackResponseUserId a == pmOutPackResponseUserId b

instance FromJSON PmOutPackResponses where
  parseJSON (Object o) = do
    pmOutPackResponses <- o .: ("pm_out_pack_responses" :: Text)
    pure $ PmOutPackResponses {
      pmOutPackResponses = pmOutPackResponses
    }
  parseJSON x = fail $ "Could not parse object: " <> show x


instance ToJSON PmOutPackResponses where
  toJSON PmOutPackResponses{..} = object $
    [ "tag" .= ("PmOutPackResponses" :: Text)
    , "pm_out_pack_responses" .= pmOutPackResponses
    ]


instance Eq PmOutPackResponses where
  (==) a b = pmOutPackResponses a == pmOutPackResponses b
-- footer