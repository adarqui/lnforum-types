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

instance ToJSON ApiRequest where
  toJSON ApiRequest{..} = object $
    [ "tag" .= "ApiRequest"
    , "comment" .= apiRequestComment
    ]


instance FromJSON ApiRequest where
  parseJSON (Object o) = do
    apiRequestComment <- o .: "comment"
    return $ ApiRequest {
      apiRequestComment = apiRequestComment
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ApiResponse where
  toJSON ApiResponse{..} = object $
    [ "tag" .= "ApiResponse"
    , "id" .= apiResponseId
    , "user_id" .= apiResponseUserId
    , "key" .= apiResponseKey
    , "comment" .= apiResponseComment
    , "created_at" .= apiResponseCreatedAt
    , "modified_at" .= apiResponseModifiedAt
    ]


instance FromJSON ApiResponse where
  parseJSON (Object o) = do
    apiResponseId <- o .: "id"
    apiResponseUserId <- o .: "user_id"
    apiResponseKey <- o .: "key"
    apiResponseComment <- o .: "comment"
    apiResponseCreatedAt <- o .: "created_at"
    apiResponseModifiedAt <- o .: "modified_at"
    return $ ApiResponse {
      apiResponseId = apiResponseId,
      apiResponseUserId = apiResponseUserId,
      apiResponseKey = apiResponseKey,
      apiResponseComment = apiResponseComment,
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
    , "name" .= boardRequestName
    , "description" .= boardRequestDescription
    ]


instance FromJSON BoardRequest where
  parseJSON (Object o) = do
    boardRequestName <- o .: "name"
    boardRequestDescription <- o .: "description"
    return $ BoardRequest {
      boardRequestName = boardRequestName,
      boardRequestDescription = boardRequestDescription
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BoardResponse where
  toJSON BoardResponse{..} = object $
    [ "tag" .= "BoardResponse"
    , "id" .= boardResponseId
    , "user_id" .= boardResponseUserId
    , "forum_id" .= boardResponseForumId
    , "parent_id" .= boardResponseParentId
    , "name" .= boardResponseName
    , "description" .= boardResponseDescription
    , "created_at" .= boardResponseCreatedAt
    , "modified_by" .= boardResponseModifiedBy
    , "modified_at" .= boardResponseModifiedAt
    ]


instance FromJSON BoardResponse where
  parseJSON (Object o) = do
    boardResponseId <- o .: "id"
    boardResponseUserId <- o .: "user_id"
    boardResponseForumId <- o .: "forum_id"
    boardResponseParentId <- o .: "parent_id"
    boardResponseName <- o .: "name"
    boardResponseDescription <- o .: "description"
    boardResponseCreatedAt <- o .: "created_at"
    boardResponseModifiedBy <- o .: "modified_by"
    boardResponseModifiedAt <- o .: "modified_at"
    return $ BoardResponse {
      boardResponseId = boardResponseId,
      boardResponseUserId = boardResponseUserId,
      boardResponseForumId = boardResponseForumId,
      boardResponseParentId = boardResponseParentId,
      boardResponseName = boardResponseName,
      boardResponseDescription = boardResponseDescription,
      boardResponseCreatedAt = boardResponseCreatedAt,
      boardResponseModifiedBy = boardResponseModifiedBy,
      boardResponseModifiedAt = boardResponseModifiedAt
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
    , "name" .= bucketRequestName
    , "description" .= bucketRequestDescription
    , "score_lo" .= bucketRequestScoreLo
    , "score_hi" .= bucketRequestScoreHi
    , "leurons" .= bucketRequestLeurons
    , "resources" .= bucketRequestResources
    , "categories" .= bucketRequestCategories
    , "filters" .= bucketRequestFilters
    ]


instance FromJSON BucketRequest where
  parseJSON (Object o) = do
    bucketRequestName <- o .: "name"
    bucketRequestDescription <- o .: "description"
    bucketRequestScoreLo <- o .: "score_lo"
    bucketRequestScoreHi <- o .: "score_hi"
    bucketRequestLeurons <- o .: "leurons"
    bucketRequestResources <- o .: "resources"
    bucketRequestCategories <- o .: "categories"
    bucketRequestFilters <- o .: "filters"
    return $ BucketRequest {
      bucketRequestName = bucketRequestName,
      bucketRequestDescription = bucketRequestDescription,
      bucketRequestScoreLo = bucketRequestScoreLo,
      bucketRequestScoreHi = bucketRequestScoreHi,
      bucketRequestLeurons = bucketRequestLeurons,
      bucketRequestResources = bucketRequestResources,
      bucketRequestCategories = bucketRequestCategories,
      bucketRequestFilters = bucketRequestFilters
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON BucketResponse where
  toJSON BucketResponse{..} = object $
    [ "tag" .= "BucketResponse"
    , "id" .= bucketResponseId
    , "user_id" .= bucketResponseUserId
    , "name" .= bucketResponseName
    , "description" .= bucketResponseDescription
    , "score_lo" .= bucketResponseScoreLo
    , "score_hi" .= bucketResponseScoreHi
    , "leurons" .= bucketResponseLeurons
    , "resources" .= bucketResponseResources
    , "categories" .= bucketResponseCategories
    , "filters" .= bucketResponseFilters
    , "created_at" .= bucketResponseCreatedAt
    , "modified_at" .= bucketResponseModifiedAt
    ]


instance FromJSON BucketResponse where
  parseJSON (Object o) = do
    bucketResponseId <- o .: "id"
    bucketResponseUserId <- o .: "user_id"
    bucketResponseName <- o .: "name"
    bucketResponseDescription <- o .: "description"
    bucketResponseScoreLo <- o .: "score_lo"
    bucketResponseScoreHi <- o .: "score_hi"
    bucketResponseLeurons <- o .: "leurons"
    bucketResponseResources <- o .: "resources"
    bucketResponseCategories <- o .: "categories"
    bucketResponseFilters <- o .: "filters"
    bucketResponseCreatedAt <- o .: "created_at"
    bucketResponseModifiedAt <- o .: "modified_at"
    return $ BucketResponse {
      bucketResponseId = bucketResponseId,
      bucketResponseUserId = bucketResponseUserId,
      bucketResponseName = bucketResponseName,
      bucketResponseDescription = bucketResponseDescription,
      bucketResponseScoreLo = bucketResponseScoreLo,
      bucketResponseScoreHi = bucketResponseScoreHi,
      bucketResponseLeurons = bucketResponseLeurons,
      bucketResponseResources = bucketResponseResources,
      bucketResponseCategories = bucketResponseCategories,
      bucketResponseFilters = bucketResponseFilters,
      bucketResponseCreatedAt = bucketResponseCreatedAt,
      bucketResponseModifiedAt = bucketResponseModifiedAt
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


instance ToJSON ForumRequest where
  toJSON ForumRequest{..} = object $
    [ "tag" .= "ForumRequest"
    , "name" .= forumRequestName
    , "description" .= forumRequestDescription
    ]


instance FromJSON ForumRequest where
  parseJSON (Object o) = do
    forumRequestName <- o .: "name"
    forumRequestDescription <- o .: "description"
    return $ ForumRequest {
      forumRequestName = forumRequestName,
      forumRequestDescription = forumRequestDescription
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ForumResponse where
  toJSON ForumResponse{..} = object $
    [ "tag" .= "ForumResponse"
    , "id" .= forumResponseId
    , "user_id" .= forumResponseUserId
    , "org_id" .= forumResponseOrgId
    , "name" .= forumResponseName
    , "description" .= forumResponseDescription
    , "created_at" .= forumResponseCreatedAt
    , "modified_by" .= forumResponseModifiedBy
    , "modified_at" .= forumResponseModifiedAt
    ]


instance FromJSON ForumResponse where
  parseJSON (Object o) = do
    forumResponseId <- o .: "id"
    forumResponseUserId <- o .: "user_id"
    forumResponseOrgId <- o .: "org_id"
    forumResponseName <- o .: "name"
    forumResponseDescription <- o .: "description"
    forumResponseCreatedAt <- o .: "created_at"
    forumResponseModifiedBy <- o .: "modified_by"
    forumResponseModifiedAt <- o .: "modified_at"
    return $ ForumResponse {
      forumResponseId = forumResponseId,
      forumResponseUserId = forumResponseUserId,
      forumResponseOrgId = forumResponseOrgId,
      forumResponseName = forumResponseName,
      forumResponseDescription = forumResponseDescription,
      forumResponseCreatedAt = forumResponseCreatedAt,
      forumResponseModifiedBy = forumResponseModifiedBy,
      forumResponseModifiedAt = forumResponseModifiedAt
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
      leuronRequestStyle = leuronRequestStyle
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
    , "created_at" .= leuronResponseCreatedAt
    , "modified_at" .= leuronResponseModifiedAt
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
    leuronResponseCreatedAt <- o .: "created_at"
    leuronResponseModifiedAt <- o .: "modified_at"
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
      leuronResponseCreatedAt = leuronResponseCreatedAt,
      leuronResponseModifiedAt = leuronResponseModifiedAt
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
    , "dcard_front" .= dcardFront
    , "dcard_back" .= dcardBack
    ]


instance FromJSON DCard where
  parseJSON (Object o) = do
    dcardFront <- o .: "dcard_front"
    dcardBack <- o .: "dcard_back"
    return $ DCard {
      dcardFront = dcardFront,
      dcardBack = dcardBack
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON DCardX where
  toJSON DCardX{..} = object $
    [ "tag" .= "DCardX"
    , "dcardx_front" .= dcardxFront
    , "dcardx_back" .= dcardxBack
    ]


instance FromJSON DCardX where
  parseJSON (Object o) = do
    dcardxFront <- o .: "dcardx_front"
    dcardxBack <- o .: "dcardx_back"
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
    , "qa_question" .= qaQuestion
    , "qa_answer" .= qaAnswer
    ]


instance FromJSON QA where
  parseJSON (Object o) = do
    qaQuestion <- o .: "qa_question"
    qaAnswer <- o .: "qa_answer"
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


instance ToJSON OrganizationRequest where
  toJSON OrganizationRequest{..} = object $
    [ "tag" .= "OrganizationRequest"
    , "name" .= organizationRequestName
    , "description" .= organizationRequestDescription
    , "company" .= organizationRequestCompany
    , "location" .= organizationRequestLocation
    , "email" .= organizationRequestEmail
    ]


instance FromJSON OrganizationRequest where
  parseJSON (Object o) = do
    organizationRequestName <- o .: "name"
    organizationRequestDescription <- o .: "description"
    organizationRequestCompany <- o .: "company"
    organizationRequestLocation <- o .: "location"
    organizationRequestEmail <- o .: "email"
    return $ OrganizationRequest {
      organizationRequestName = organizationRequestName,
      organizationRequestDescription = organizationRequestDescription,
      organizationRequestCompany = organizationRequestCompany,
      organizationRequestLocation = organizationRequestLocation,
      organizationRequestEmail = organizationRequestEmail
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON OrganizationResponse where
  toJSON OrganizationResponse{..} = object $
    [ "tag" .= "OrganizationResponse"
    , "id" .= organizationResponseId
    , "user_id" .= organizationResponseUserId
    , "name" .= organizationResponseName
    , "description" .= organizationResponseDescription
    , "company" .= organizationResponseCompany
    , "location" .= organizationResponseLocation
    , "email" .= organizationResponseEmail
    , "email_md5" .= organizationResponseEmailMD5
    , "created_at" .= organizationResponseCreatedAt
    , "modified_by" .= organizationResponseModifiedBy
    , "modified_at" .= organizationResponseModifiedAt
    ]


instance FromJSON OrganizationResponse where
  parseJSON (Object o) = do
    organizationResponseId <- o .: "id"
    organizationResponseUserId <- o .: "user_id"
    organizationResponseName <- o .: "name"
    organizationResponseDescription <- o .: "description"
    organizationResponseCompany <- o .: "company"
    organizationResponseLocation <- o .: "location"
    organizationResponseEmail <- o .: "email"
    organizationResponseEmailMD5 <- o .: "email_md5"
    organizationResponseCreatedAt <- o .: "created_at"
    organizationResponseModifiedBy <- o .: "modified_by"
    organizationResponseModifiedAt <- o .: "modified_at"
    return $ OrganizationResponse {
      organizationResponseId = organizationResponseId,
      organizationResponseUserId = organizationResponseUserId,
      organizationResponseName = organizationResponseName,
      organizationResponseDescription = organizationResponseDescription,
      organizationResponseCompany = organizationResponseCompany,
      organizationResponseLocation = organizationResponseLocation,
      organizationResponseEmail = organizationResponseEmail,
      organizationResponseEmailMD5 = organizationResponseEmailMD5,
      organizationResponseCreatedAt = organizationResponseCreatedAt,
      organizationResponseModifiedBy = organizationResponseModifiedBy,
      organizationResponseModifiedAt = organizationResponseModifiedAt
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

      "ParamTag_ByUserId" -> do
        return ParamTag_ByUserId

      "ParamTag_ByUsersIds" -> do
        return ParamTag_ByUsersIds

      "ParamTag_ByUserNick" -> do
        return ParamTag_ByUserNick

      "ParamTag_ByUsersNicks" -> do
        return ParamTag_ByUsersNicks

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


instance ToJSON PmRequest where
  toJSON PmRequest{..} = object $
    [ "tag" .= "PmRequest"
    , "subject" .= pmRequestSubject
    , "body" .= pmRequestBody
    ]


instance FromJSON PmRequest where
  parseJSON (Object o) = do
    pmRequestSubject <- o .: "subject"
    pmRequestBody <- o .: "body"
    return $ PmRequest {
      pmRequestSubject = pmRequestSubject,
      pmRequestBody = pmRequestBody
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
    , "created_at" .= pmResponseCreatedAt
    , "modified_at" .= pmResponseModifiedAt
    ]


instance FromJSON PmResponse where
  parseJSON (Object o) = do
    pmResponseId <- o .: "id"
    pmResponseUserId <- o .: "user_id"
    pmResponseToUserId <- o .: "to_user_id"
    pmResponseSubject <- o .: "subject"
    pmResponseBody <- o .: "body"
    pmResponseCreatedAt <- o .: "created_at"
    pmResponseModifiedAt <- o .: "modified_at"
    return $ PmResponse {
      pmResponseId = pmResponseId,
      pmResponseUserId = pmResponseUserId,
      pmResponseToUserId = pmResponseToUserId,
      pmResponseSubject = pmResponseSubject,
      pmResponseBody = pmResponseBody,
      pmResponseCreatedAt = pmResponseCreatedAt,
      pmResponseModifiedAt = pmResponseModifiedAt
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
    ]


instance FromJSON PmInRequest where
  parseJSON (Object o) = do
    pmInRequestLabel <- o .: "label"
    pmInRequestIsRead <- o .: "is_read"
    pmInRequestIsStarred <- o .: "is_starred"
    return $ PmInRequest {
      pmInRequestLabel = pmInRequestLabel,
      pmInRequestIsRead = pmInRequestIsRead,
      pmInRequestIsStarred = pmInRequestIsStarred
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
    ]


instance FromJSON PmOutRequest where
  parseJSON (Object o) = do
    pmOutRequestLabel <- o .: "label"
    return $ PmOutRequest {
      pmOutRequestLabel = pmOutRequestLabel
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
    pmOutResponseCreatedAt <- o .: "created_at"
    pmOutResponseModifiedAt <- o .: "modified_at"
    return $ PmOutResponse {
      pmOutResponseId = pmOutResponseId,
      pmOutResponsePmId = pmOutResponsePmId,
      pmOutResponseUserId = pmOutResponseUserId,
      pmOutResponseLabel = pmOutResponseLabel,
      pmOutResponseIsSaved = pmOutResponseIsSaved,
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
    , "profile_name" .= profileName
    , "profile_email" .= profileEmail
    ]


instance FromJSON ProfileX where
  parseJSON (Object o) = do
    profileName <- o .: "profile_name"
    profileEmail <- o .: "profile_email"
    return $ ProfileX {
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
    ]


instance FromJSON ProfileRequest where
  parseJSON (Object o) = do
    profileRequestGender <- o .: "gender"
    profileRequestBirthdate <- o .: "birthdate"
    profileRequestWebsite <- o .: "website"
    profileRequestLocation <- o .: "location"
    profileRequestSignature <- o .: "signature"
    return $ ProfileRequest {
      profileRequestGender = profileRequestGender,
      profileRequestBirthdate = profileRequestBirthdate,
      profileRequestWebsite = profileRequestWebsite,
      profileRequestLocation = profileRequestLocation,
      profileRequestSignature = profileRequestSignature
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ProfileResponse where
  toJSON ProfileResponse{..} = object $
    [ "tag" .= "ProfileResponse"
    , "id" .= profileResponseId
    , "entity_id" .= profileResponseEntityId
    , "gender" .= profileResponseGender
    , "birthdate" .= profileResponseBirthdate
    , "website" .= profileResponseWebsite
    , "location" .= profileResponseLocation
    , "signature" .= profileResponseSignature
    , "karma_good" .= profileResponseKarmaGood
    , "karma_bad" .= profileResponseKarmaBad
    , "created_at" .= profileResponseCreatedAt
    , "modified_at" .= profileResponseModifiedAt
    ]


instance FromJSON ProfileResponse where
  parseJSON (Object o) = do
    profileResponseId <- o .: "id"
    profileResponseEntityId <- o .: "entity_id"
    profileResponseGender <- o .: "gender"
    profileResponseBirthdate <- o .: "birthdate"
    profileResponseWebsite <- o .: "website"
    profileResponseLocation <- o .: "location"
    profileResponseSignature <- o .: "signature"
    profileResponseKarmaGood <- o .: "karma_good"
    profileResponseKarmaBad <- o .: "karma_bad"
    profileResponseCreatedAt <- o .: "created_at"
    profileResponseModifiedAt <- o .: "modified_at"
    return $ ProfileResponse {
      profileResponseId = profileResponseId,
      profileResponseEntityId = profileResponseEntityId,
      profileResponseGender = profileResponseGender,
      profileResponseBirthdate = profileResponseBirthdate,
      profileResponseWebsite = profileResponseWebsite,
      profileResponseLocation = profileResponseLocation,
      profileResponseSignature = profileResponseSignature,
      profileResponseKarmaGood = profileResponseKarmaGood,
      profileResponseKarmaBad = profileResponseKarmaBad,
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
    ]


instance FromJSON ReminderRequest where
  parseJSON (Object o) = do
    reminderRequestData <- o .: "data"
    return $ ReminderRequest {
      reminderRequestData = reminderRequestData
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ReminderResponse where
  toJSON ReminderResponse{..} = object $
    [ "tag" .= "ReminderResponse"
    , "id" .= reminderResponseId
    , "user_id" .= reminderResponseUserId
    , "parent_folder_id" .= reminderResponseParentFolderId
    , "data" .= reminderResponseData
    , "created_at" .= reminderResponseCreatedAt
    , "modified_at" .= reminderResponseModifiedAt
    ]


instance FromJSON ReminderResponse where
  parseJSON (Object o) = do
    reminderResponseId <- o .: "id"
    reminderResponseUserId <- o .: "user_id"
    reminderResponseParentFolderId <- o .: "parent_folder_id"
    reminderResponseData <- o .: "data"
    reminderResponseCreatedAt <- o .: "created_at"
    reminderResponseModifiedAt <- o .: "modified_at"
    return $ ReminderResponse {
      reminderResponseId = reminderResponseId,
      reminderResponseUserId = reminderResponseUserId,
      reminderResponseParentFolderId = reminderResponseParentFolderId,
      reminderResponseData = reminderResponseData,
      reminderResponseCreatedAt = reminderResponseCreatedAt,
      reminderResponseModifiedAt = reminderResponseModifiedAt
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
    , "name" .= reminderFolderRequestName
    , "description" .= reminderFolderRequestDescription
    , "visibility" .= reminderFolderRequestVisibility
    ]


instance FromJSON ReminderFolderRequest where
  parseJSON (Object o) = do
    reminderFolderRequestName <- o .: "name"
    reminderFolderRequestDescription <- o .: "description"
    reminderFolderRequestVisibility <- o .: "visibility"
    return $ ReminderFolderRequest {
      reminderFolderRequestName = reminderFolderRequestName,
      reminderFolderRequestDescription = reminderFolderRequestDescription,
      reminderFolderRequestVisibility = reminderFolderRequestVisibility
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ReminderFolderResponse where
  toJSON ReminderFolderResponse{..} = object $
    [ "tag" .= "ReminderFolderResponse"
    , "id" .= reminderFolderResponseId
    , "user_id" .= reminderFolderResponseUserId
    , "parent_folder_id" .= reminderFolderResponseParentFolderId
    , "name" .= reminderFolderResponseName
    , "visibility" .= reminderFolderResponseVisibility
    , "description" .= reminderFolderResponseDescription
    , "created_at" .= reminderFolderResponseCreatedAt
    , "modified_at" .= reminderFolderResponseModifiedAt
    ]


instance FromJSON ReminderFolderResponse where
  parseJSON (Object o) = do
    reminderFolderResponseId <- o .: "id"
    reminderFolderResponseUserId <- o .: "user_id"
    reminderFolderResponseParentFolderId <- o .: "parent_folder_id"
    reminderFolderResponseName <- o .: "name"
    reminderFolderResponseVisibility <- o .: "visibility"
    reminderFolderResponseDescription <- o .: "description"
    reminderFolderResponseCreatedAt <- o .: "created_at"
    reminderFolderResponseModifiedAt <- o .: "modified_at"
    return $ ReminderFolderResponse {
      reminderFolderResponseId = reminderFolderResponseId,
      reminderFolderResponseUserId = reminderFolderResponseUserId,
      reminderFolderResponseParentFolderId = reminderFolderResponseParentFolderId,
      reminderFolderResponseName = reminderFolderResponseName,
      reminderFolderResponseVisibility = reminderFolderResponseVisibility,
      reminderFolderResponseDescription = reminderFolderResponseDescription,
      reminderFolderResponseCreatedAt = reminderFolderResponseCreatedAt,
      reminderFolderResponseModifiedAt = reminderFolderResponseModifiedAt
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


instance ToJSON ResourceRequest where
  toJSON ResourceRequest{..} = object $
    [ "tag" .= "ResourceRequest"
    , "title" .= resourceRequestTitle
    , "description" .= resourceRequestDescription
    , "source" .= resourceRequestSource
    , "author" .= resourceRequestAuthor
    , "prerequisites" .= resourceRequestPrerequisites
    , "categories" .= resourceRequestCategories
    , "visibility" .= resourceRequestVisibility
    , "counter" .= resourceRequestCounter
    , "version" .= resourceRequestVersion
    , "urls" .= resourceRequestUrls
    ]


instance FromJSON ResourceRequest where
  parseJSON (Object o) = do
    resourceRequestTitle <- o .: "title"
    resourceRequestDescription <- o .: "description"
    resourceRequestSource <- o .: "source"
    resourceRequestAuthor <- o .: "author"
    resourceRequestPrerequisites <- o .: "prerequisites"
    resourceRequestCategories <- o .: "categories"
    resourceRequestVisibility <- o .: "visibility"
    resourceRequestCounter <- o .: "counter"
    resourceRequestVersion <- o .: "version"
    resourceRequestUrls <- o .: "urls"
    return $ ResourceRequest {
      resourceRequestTitle = resourceRequestTitle,
      resourceRequestDescription = resourceRequestDescription,
      resourceRequestSource = resourceRequestSource,
      resourceRequestAuthor = resourceRequestAuthor,
      resourceRequestPrerequisites = resourceRequestPrerequisites,
      resourceRequestCategories = resourceRequestCategories,
      resourceRequestVisibility = resourceRequestVisibility,
      resourceRequestCounter = resourceRequestCounter,
      resourceRequestVersion = resourceRequestVersion,
      resourceRequestUrls = resourceRequestUrls
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ResourceResponse where
  toJSON ResourceResponse{..} = object $
    [ "tag" .= "ResourceResponse"
    , "id" .= resourceResponseId
    , "user_id" .= resourceResponseUserId
    , "title" .= resourceResponseTitle
    , "description" .= resourceResponseDescription
    , "source" .= resourceResponseSource
    , "author" .= resourceResponseAuthor
    , "prerequisites" .= resourceResponsePrerequisites
    , "categories" .= resourceResponseCategories
    , "visibility" .= resourceResponseVisibility
    , "counter" .= resourceResponseCounter
    , "version" .= resourceResponseVersion
    , "urls" .= resourceResponseUrls
    , "created_at" .= resourceResponseCreatedAt
    , "modified_at" .= resourceResponseModifiedAt
    ]


instance FromJSON ResourceResponse where
  parseJSON (Object o) = do
    resourceResponseId <- o .: "id"
    resourceResponseUserId <- o .: "user_id"
    resourceResponseTitle <- o .: "title"
    resourceResponseDescription <- o .: "description"
    resourceResponseSource <- o .: "source"
    resourceResponseAuthor <- o .: "author"
    resourceResponsePrerequisites <- o .: "prerequisites"
    resourceResponseCategories <- o .: "categories"
    resourceResponseVisibility <- o .: "visibility"
    resourceResponseCounter <- o .: "counter"
    resourceResponseVersion <- o .: "version"
    resourceResponseUrls <- o .: "urls"
    resourceResponseCreatedAt <- o .: "created_at"
    resourceResponseModifiedAt <- o .: "modified_at"
    return $ ResourceResponse {
      resourceResponseId = resourceResponseId,
      resourceResponseUserId = resourceResponseUserId,
      resourceResponseTitle = resourceResponseTitle,
      resourceResponseDescription = resourceResponseDescription,
      resourceResponseSource = resourceResponseSource,
      resourceResponseAuthor = resourceResponseAuthor,
      resourceResponsePrerequisites = resourceResponsePrerequisites,
      resourceResponseCategories = resourceResponseCategories,
      resourceResponseVisibility = resourceResponseVisibility,
      resourceResponseCounter = resourceResponseCounter,
      resourceResponseVersion = resourceResponseVersion,
      resourceResponseUrls = resourceResponseUrls,
      resourceResponseCreatedAt = resourceResponseCreatedAt,
      resourceResponseModifiedAt = resourceResponseModifiedAt
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


instance ToJSON TeamRequest where
  toJSON TeamRequest{..} = object $
    [ "tag" .= "TeamRequest"
    , "name" .= teamRequestName
    , "description" .= teamRequestDescription
    ]


instance FromJSON TeamRequest where
  parseJSON (Object o) = do
    teamRequestName <- o .: "name"
    teamRequestDescription <- o .: "description"
    return $ TeamRequest {
      teamRequestName = teamRequestName,
      teamRequestDescription = teamRequestDescription
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON TeamResponse where
  toJSON TeamResponse{..} = object $
    [ "tag" .= "TeamResponse"
    , "id" .= teamResponseId
    , "user_id" .= teamResponseUserId
    , "org_id" .= teamResponseOrgId
    , "name" .= teamResponseName
    , "description" .= teamResponseDescription
    , "created_at" .= teamResponseCreatedAt
    , "modified_by" .= teamResponseModifiedBy
    , "modified_at" .= teamResponseModifiedAt
    ]


instance FromJSON TeamResponse where
  parseJSON (Object o) = do
    teamResponseId <- o .: "id"
    teamResponseUserId <- o .: "user_id"
    teamResponseOrgId <- o .: "org_id"
    teamResponseName <- o .: "name"
    teamResponseDescription <- o .: "description"
    teamResponseCreatedAt <- o .: "created_at"
    teamResponseModifiedBy <- o .: "modified_by"
    teamResponseModifiedAt <- o .: "modified_at"
    return $ TeamResponse {
      teamResponseId = teamResponseId,
      teamResponseUserId = teamResponseUserId,
      teamResponseOrgId = teamResponseOrgId,
      teamResponseName = teamResponseName,
      teamResponseDescription = teamResponseDescription,
      teamResponseCreatedAt = teamResponseCreatedAt,
      teamResponseModifiedBy = teamResponseModifiedBy,
      teamResponseModifiedAt = teamResponseModifiedAt
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
    , "name" .= threadRequestName
    , "description" .= threadRequestDescription
    , "sticky" .= threadRequestSticky
    , "locked" .= threadRequestLocked
    , "poll" .= threadRequestPoll
    ]


instance FromJSON ThreadRequest where
  parseJSON (Object o) = do
    threadRequestName <- o .: "name"
    threadRequestDescription <- o .: "description"
    threadRequestSticky <- o .: "sticky"
    threadRequestLocked <- o .: "locked"
    threadRequestPoll <- o .: "poll"
    return $ ThreadRequest {
      threadRequestName = threadRequestName,
      threadRequestDescription = threadRequestDescription,
      threadRequestSticky = threadRequestSticky,
      threadRequestLocked = threadRequestLocked,
      threadRequestPoll = threadRequestPoll
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadResponse where
  toJSON ThreadResponse{..} = object $
    [ "tag" .= "ThreadResponse"
    , "id" .= threadResponseId
    , "user_id" .= threadResponseUserId
    , "board_id" .= threadResponseBoardId
    , "name" .= threadResponseName
    , "description" .= threadResponseDescription
    , "sticky" .= threadResponseSticky
    , "locked" .= threadResponseLocked
    , "poll" .= threadResponsePoll
    , "created_at" .= threadResponseCreatedAt
    , "modified_by" .= threadResponseModifiedBy
    , "modified_at" .= threadResponseModifiedAt
    , "activity_at" .= threadResponseActivityAt
    ]


instance FromJSON ThreadResponse where
  parseJSON (Object o) = do
    threadResponseId <- o .: "id"
    threadResponseUserId <- o .: "user_id"
    threadResponseBoardId <- o .: "board_id"
    threadResponseName <- o .: "name"
    threadResponseDescription <- o .: "description"
    threadResponseSticky <- o .: "sticky"
    threadResponseLocked <- o .: "locked"
    threadResponsePoll <- o .: "poll"
    threadResponseCreatedAt <- o .: "created_at"
    threadResponseModifiedBy <- o .: "modified_by"
    threadResponseModifiedAt <- o .: "modified_at"
    threadResponseActivityAt <- o .: "activity_at"
    return $ ThreadResponse {
      threadResponseId = threadResponseId,
      threadResponseUserId = threadResponseUserId,
      threadResponseBoardId = threadResponseBoardId,
      threadResponseName = threadResponseName,
      threadResponseDescription = threadResponseDescription,
      threadResponseSticky = threadResponseSticky,
      threadResponseLocked = threadResponseLocked,
      threadResponsePoll = threadResponsePoll,
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
    ]


instance FromJSON ThreadPostRequest where
  parseJSON (Object o) = do
    threadPostRequestTitle <- o .: "title"
    threadPostRequestBody <- o .: "body"
    threadPostRequestTags <- o .: "tags"
    threadPostRequestPrivateTags <- o .: "private_tags"
    return $ ThreadPostRequest {
      threadPostRequestTitle = threadPostRequestTitle,
      threadPostRequestBody = threadPostRequestBody,
      threadPostRequestTags = threadPostRequestTags,
      threadPostRequestPrivateTags = threadPostRequestPrivateTags
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostResponse where
  toJSON ThreadPostResponse{..} = object $
    [ "tag" .= "ThreadPostResponse"
    , "id" .= threadPostResponseId
    , "user_id" .= threadPostResponseUserId
    , "thread_id" .= threadPostResponseThreadId
    , "parent_id" .= threadPostResponseParentId
    , "title" .= threadPostResponseTitle
    , "body" .= threadPostResponseBody
    , "tags" .= threadPostResponseTags
    , "private_tags" .= threadPostResponsePrivateTags
    , "created_at" .= threadPostResponseCreatedAt
    , "modified_by" .= threadPostResponseModifiedBy
    , "modified_at" .= threadPostResponseModifiedAt
    ]


instance FromJSON ThreadPostResponse where
  parseJSON (Object o) = do
    threadPostResponseId <- o .: "id"
    threadPostResponseUserId <- o .: "user_id"
    threadPostResponseThreadId <- o .: "thread_id"
    threadPostResponseParentId <- o .: "parent_id"
    threadPostResponseTitle <- o .: "title"
    threadPostResponseBody <- o .: "body"
    threadPostResponseTags <- o .: "tags"
    threadPostResponsePrivateTags <- o .: "private_tags"
    threadPostResponseCreatedAt <- o .: "created_at"
    threadPostResponseModifiedBy <- o .: "modified_by"
    threadPostResponseModifiedAt <- o .: "modified_at"
    return $ ThreadPostResponse {
      threadPostResponseId = threadPostResponseId,
      threadPostResponseUserId = threadPostResponseUserId,
      threadPostResponseThreadId = threadPostResponseThreadId,
      threadPostResponseParentId = threadPostResponseParentId,
      threadPostResponseTitle = threadPostResponseTitle,
      threadPostResponseBody = threadPostResponseBody,
      threadPostResponseTags = threadPostResponseTags,
      threadPostResponsePrivateTags = threadPostResponsePrivateTags,
      threadPostResponseCreatedAt = threadPostResponseCreatedAt,
      threadPostResponseModifiedBy = threadPostResponseModifiedBy,
      threadPostResponseModifiedAt = threadPostResponseModifiedAt
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


instance ToJSON ThreadPostLikeRequest where
  toJSON ThreadPostLikeRequest{..} = object $
    [ "tag" .= "ThreadPostLikeRequest"
    , "opt" .= threadPostLikeRequestOpt
    , "reason" .= threadPostLikeRequestReason
    ]


instance FromJSON ThreadPostLikeRequest where
  parseJSON (Object o) = do
    threadPostLikeRequestOpt <- o .: "opt"
    threadPostLikeRequestReason <- o .: "reason"
    return $ ThreadPostLikeRequest {
      threadPostLikeRequestOpt = threadPostLikeRequestOpt,
      threadPostLikeRequestReason = threadPostLikeRequestReason
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostLikeResponse where
  toJSON ThreadPostLikeResponse{..} = object $
    [ "tag" .= "ThreadPostLikeResponse"
    , "id" .= threadPostLikeResponseId
    , "thread_post_id" .= threadPostLikeResponseThreadPostId
    , "user_id" .= threadPostLikeResponseUserId
    , "opt" .= threadPostLikeResponseOpt
    , "score" .= threadPostLikeResponseScore
    , "reason" .= threadPostLikeResponseReason
    , "created_at" .= threadPostLikeResponseCreatedAt
    , "modified_at" .= threadPostLikeResponseModifiedAt
    ]


instance FromJSON ThreadPostLikeResponse where
  parseJSON (Object o) = do
    threadPostLikeResponseId <- o .: "id"
    threadPostLikeResponseThreadPostId <- o .: "thread_post_id"
    threadPostLikeResponseUserId <- o .: "user_id"
    threadPostLikeResponseOpt <- o .: "opt"
    threadPostLikeResponseScore <- o .: "score"
    threadPostLikeResponseReason <- o .: "reason"
    threadPostLikeResponseCreatedAt <- o .: "created_at"
    threadPostLikeResponseModifiedAt <- o .: "modified_at"
    return $ ThreadPostLikeResponse {
      threadPostLikeResponseId = threadPostLikeResponseId,
      threadPostLikeResponseThreadPostId = threadPostLikeResponseThreadPostId,
      threadPostLikeResponseUserId = threadPostLikeResponseUserId,
      threadPostLikeResponseOpt = threadPostLikeResponseOpt,
      threadPostLikeResponseScore = threadPostLikeResponseScore,
      threadPostLikeResponseReason = threadPostLikeResponseReason,
      threadPostLikeResponseCreatedAt = threadPostLikeResponseCreatedAt,
      threadPostLikeResponseModifiedAt = threadPostLikeResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostLikeResponses where
  toJSON ThreadPostLikeResponses{..} = object $
    [ "tag" .= "ThreadPostLikeResponses"
    , "thread_post_like_responses" .= threadPostLikeResponses
    ]


instance FromJSON ThreadPostLikeResponses where
  parseJSON (Object o) = do
    threadPostLikeResponses <- o .: "thread_post_like_responses"
    return $ ThreadPostLikeResponses {
      threadPostLikeResponses = threadPostLikeResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostLikeStatResponse where
  toJSON ThreadPostLikeStatResponse{..} = object $
    [ "tag" .= "ThreadPostLikeStatResponse"
    , "id" .= threadPostLikeStatResponseId
    , "score" .= threadPostLikeStatResponseScore
    , "like" .= threadPostLikeStatResponseLike
    , "dislike" .= threadPostLikeStatResponseDislike
    ]


instance FromJSON ThreadPostLikeStatResponse where
  parseJSON (Object o) = do
    threadPostLikeStatResponseId <- o .: "id"
    threadPostLikeStatResponseScore <- o .: "score"
    threadPostLikeStatResponseLike <- o .: "like"
    threadPostLikeStatResponseDislike <- o .: "dislike"
    return $ ThreadPostLikeStatResponse {
      threadPostLikeStatResponseId = threadPostLikeStatResponseId,
      threadPostLikeStatResponseScore = threadPostLikeStatResponseScore,
      threadPostLikeStatResponseLike = threadPostLikeStatResponseLike,
      threadPostLikeStatResponseDislike = threadPostLikeStatResponseDislike
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostLikeStatResponses where
  toJSON ThreadPostLikeStatResponses{..} = object $
    [ "tag" .= "ThreadPostLikeStatResponses"
    , "thread_post_like_stat_responses" .= threadPostLikeStatResponses
    ]


instance FromJSON ThreadPostLikeStatResponses where
  parseJSON (Object o) = do
    threadPostLikeStatResponses <- o .: "thread_post_like_stat_responses"
    return $ ThreadPostLikeStatResponses {
      threadPostLikeStatResponses = threadPostLikeStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostStarRequest where
  toJSON ThreadPostStarRequest{..} = object $
    [ "tag" .= "ThreadPostStarRequest"
    , "reason" .= threadPostStarRequestReason
    ]


instance FromJSON ThreadPostStarRequest where
  parseJSON (Object o) = do
    threadPostStarRequestReason <- o .: "reason"
    return $ ThreadPostStarRequest {
      threadPostStarRequestReason = threadPostStarRequestReason
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostStarResponse where
  toJSON ThreadPostStarResponse{..} = object $
    [ "tag" .= "ThreadPostStarResponse"
    , "id" .= threadPostStarResponseId
    , "thread_post_id" .= threadPostStarResponseThreadPostId
    , "user_id" .= threadPostStarResponseUserId
    , "reason" .= threadPostStarResponseReason
    , "created_at" .= threadPostStarResponseCreatedAt
    , "modified_at" .= threadPostStarResponseModifiedAt
    ]


instance FromJSON ThreadPostStarResponse where
  parseJSON (Object o) = do
    threadPostStarResponseId <- o .: "id"
    threadPostStarResponseThreadPostId <- o .: "thread_post_id"
    threadPostStarResponseUserId <- o .: "user_id"
    threadPostStarResponseReason <- o .: "reason"
    threadPostStarResponseCreatedAt <- o .: "created_at"
    threadPostStarResponseModifiedAt <- o .: "modified_at"
    return $ ThreadPostStarResponse {
      threadPostStarResponseId = threadPostStarResponseId,
      threadPostStarResponseThreadPostId = threadPostStarResponseThreadPostId,
      threadPostStarResponseUserId = threadPostStarResponseUserId,
      threadPostStarResponseReason = threadPostStarResponseReason,
      threadPostStarResponseCreatedAt = threadPostStarResponseCreatedAt,
      threadPostStarResponseModifiedAt = threadPostStarResponseModifiedAt
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostStarResponses where
  toJSON ThreadPostStarResponses{..} = object $
    [ "tag" .= "ThreadPostStarResponses"
    , "thread_post_star_responses" .= threadPostStarResponses
    ]


instance FromJSON ThreadPostStarResponses where
  parseJSON (Object o) = do
    threadPostStarResponses <- o .: "thread_post_star_responses"
    return $ ThreadPostStarResponses {
      threadPostStarResponses = threadPostStarResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostStarStatResponse where
  toJSON ThreadPostStarStatResponse{..} = object $
    [ "tag" .= "ThreadPostStarStatResponse"
    , "id" .= threadPostStarStatResponseId
    , "stars" .= threadPostStarStatResponseStars
    ]


instance FromJSON ThreadPostStarStatResponse where
  parseJSON (Object o) = do
    threadPostStarStatResponseId <- o .: "id"
    threadPostStarStatResponseStars <- o .: "stars"
    return $ ThreadPostStarStatResponse {
      threadPostStarStatResponseId = threadPostStarStatResponseId,
      threadPostStarStatResponseStars = threadPostStarStatResponseStars
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON ThreadPostStarStatResponses where
  toJSON ThreadPostStarStatResponses{..} = object $
    [ "tag" .= "ThreadPostStarStatResponses"
    , "thread_post_star_stat_responses" .= threadPostStarStatResponses
    ]


instance FromJSON ThreadPostStarStatResponses where
  parseJSON (Object o) = do
    threadPostStarStatResponses <- o .: "thread_post_star_stat_responses"
    return $ ThreadPostStarStatResponses {
      threadPostStarStatResponses = threadPostStarStatResponses
    }
  parseJSON x = fail $ "Could not parse object: " ++ show x


instance ToJSON UserRequest where
  toJSON UserRequest{..} = object $
    [ "tag" .= "UserRequest"
    , "nick" .= userRequestNick
    , "display_nick" .= userRequestDisplayNick
    , "name" .= userRequestName
    , "email" .= userRequestEmail
    , "plugin" .= userRequestPlugin
    , "ident" .= userRequestIdent
    ]


instance FromJSON UserRequest where
  parseJSON (Object o) = do
    userRequestNick <- o .: "nick"
    userRequestDisplayNick <- o .: "display_nick"
    userRequestName <- o .: "name"
    userRequestEmail <- o .: "email"
    userRequestPlugin <- o .: "plugin"
    userRequestIdent <- o .: "ident"
    return $ UserRequest {
      userRequestNick = userRequestNick,
      userRequestDisplayNick = userRequestDisplayNick,
      userRequestName = userRequestName,
      userRequestEmail = userRequestEmail,
      userRequestPlugin = userRequestPlugin,
      userRequestIdent = userRequestIdent
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
    , "active" .= userResponseActive
    , "created_at" .= userResponseCreatedAt
    , "modified_at" .= userResponseModifiedAt
    , "deactivated_at" .= userResponseDeactivatedAt
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
    userResponseActive <- o .: "active"
    userResponseCreatedAt <- o .: "created_at"
    userResponseModifiedAt <- o .: "modified_at"
    userResponseDeactivatedAt <- o .: "deactivated_at"
    return $ UserResponse {
      userResponseId = userResponseId,
      userResponseNick = userResponseNick,
      userResponseDisplayNick = userResponseDisplayNick,
      userResponseName = userResponseName,
      userResponseEmail = userResponseEmail,
      userResponseEmailMD5 = userResponseEmailMD5,
      userResponsePlugin = userResponsePlugin,
      userResponseIdent = userResponseIdent,
      userResponseActive = userResponseActive,
      userResponseCreatedAt = userResponseCreatedAt,
      userResponseModifiedAt = userResponseModifiedAt,
      userResponseDeactivatedAt = userResponseDeactivatedAt
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
    , "created_at" .= userSanitizedResponseCreatedAt
    ]


instance FromJSON UserSanitizedResponse where
  parseJSON (Object o) = do
    userSanitizedResponseId <- o .: "id"
    userSanitizedResponseNick <- o .: "nick"
    userSanitizedResponseDisplayNick <- o .: "display_nick"
    userSanitizedResponseEmailMD5 <- o .: "email_md5"
    userSanitizedResponseActive <- o .: "active"
    userSanitizedResponseCreatedAt <- o .: "created_at"
    return $ UserSanitizedResponse {
      userSanitizedResponseId = userSanitizedResponseId,
      userSanitizedResponseNick = userSanitizedResponseNick,
      userSanitizedResponseDisplayNick = userSanitizedResponseDisplayNick,
      userSanitizedResponseEmailMD5 = userSanitizedResponseEmailMD5,
      userSanitizedResponseActive = userSanitizedResponseActive,
      userSanitizedResponseCreatedAt = userSanitizedResponseCreatedAt
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


instance ToJSON BoardPackResponse where
  toJSON BoardPackResponse{..} = object $
    [ "tag" .= "BoardPackResponse"
    , "board" .= boardPackResponseBoard
    , "board_stat" .= boardPackResponseBoardStat
    , "latest_thread" .= boardPackResponseLatestThread
    , "latest_thread_post" .= boardPackResponseLatestThreadPost
    , "latest_thread_post_user" .= boardPackResponseLatestThreadPostUser
    ]


instance FromJSON BoardPackResponse where
  parseJSON (Object o) = do
    boardPackResponseBoard <- o .: "board"
    boardPackResponseBoardStat <- o .: "board_stat"
    boardPackResponseLatestThread <- o .: "latest_thread"
    boardPackResponseLatestThreadPost <- o .: "latest_thread_post"
    boardPackResponseLatestThreadPostUser <- o .: "latest_thread_post_user"
    return $ BoardPackResponse {
      boardPackResponseBoard = boardPackResponseBoard,
      boardPackResponseBoardStat = boardPackResponseBoardStat,
      boardPackResponseLatestThread = boardPackResponseLatestThread,
      boardPackResponseLatestThreadPost = boardPackResponseLatestThreadPost,
      boardPackResponseLatestThreadPostUser = boardPackResponseLatestThreadPostUser
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


instance ToJSON OrganizationPackResponse where
  toJSON OrganizationPackResponse{..} = object $
    [ "tag" .= "OrganizationPackResponse"
    , "organization" .= organizationPackResponseOrganization
    , "organization_stat" .= organizationPackResponseOrganizationStat
    ]


instance FromJSON OrganizationPackResponse where
  parseJSON (Object o) = do
    organizationPackResponseOrganization <- o .: "organization"
    organizationPackResponseOrganizationStat <- o .: "organization_stat"
    return $ OrganizationPackResponse {
      organizationPackResponseOrganization = organizationPackResponseOrganization,
      organizationPackResponseOrganizationStat = organizationPackResponseOrganizationStat
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


instance ToJSON ThreadPackResponse where
  toJSON ThreadPackResponse{..} = object $
    [ "tag" .= "ThreadPackResponse"
    , "thread" .= threadPackResponseThread
    , "thread_user" .= threadPackResponseThreadUser
    , "thread_stat" .= threadPackResponseThreadStat
    , "latest_thread_post" .= threadPackResponseLatestThreadPost
    , "latest_thread_post_user" .= threadPackResponseLatestThreadPostUser
    ]


instance FromJSON ThreadPackResponse where
  parseJSON (Object o) = do
    threadPackResponseThread <- o .: "thread"
    threadPackResponseThreadUser <- o .: "thread_user"
    threadPackResponseThreadStat <- o .: "thread_stat"
    threadPackResponseLatestThreadPost <- o .: "latest_thread_post"
    threadPackResponseLatestThreadPostUser <- o .: "latest_thread_post_user"
    return $ ThreadPackResponse {
      threadPackResponseThread = threadPackResponseThread,
      threadPackResponseThreadUser = threadPackResponseThreadUser,
      threadPackResponseThreadStat = threadPackResponseThreadStat,
      threadPackResponseLatestThreadPost = threadPackResponseLatestThreadPost,
      threadPackResponseLatestThreadPostUser = threadPackResponseLatestThreadPostUser
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
    , "user" .= threadPostPackResponseUser
    , "stat" .= threadPostPackResponseStat
    , "like" .= threadPostPackResponseLike
    , "star" .= threadPostPackResponseStar
    ]


instance FromJSON ThreadPostPackResponse where
  parseJSON (Object o) = do
    threadPostPackResponseThreadPost <- o .: "thread_post"
    threadPostPackResponseUser <- o .: "user"
    threadPostPackResponseStat <- o .: "stat"
    threadPostPackResponseLike <- o .: "like"
    threadPostPackResponseStar <- o .: "star"
    return $ ThreadPostPackResponse {
      threadPostPackResponseThreadPost = threadPostPackResponseThreadPost,
      threadPostPackResponseUser = threadPostPackResponseUser,
      threadPostPackResponseStat = threadPostPackResponseStat,
      threadPostPackResponseLike = threadPostPackResponseLike,
      threadPostPackResponseStar = threadPostPackResponseStar
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


instance ToJSON UserPackResponse where
  toJSON UserPackResponse{..} = object $
    [ "tag" .= "UserPackResponse"
    , "user" .= userPackResponseUser
    , "user_stat" .= userPackResponseUserStat
    , "user_profile" .= userPackResponseUserProfile
    ]


instance FromJSON UserPackResponse where
  parseJSON (Object o) = do
    userPackResponseUser <- o .: "user"
    userPackResponseUserStat <- o .: "user_stat"
    userPackResponseUserProfile <- o .: "user_profile"
    return $ UserPackResponse {
      userPackResponseUser = userPackResponseUser,
      userPackResponseUserStat = userPackResponseUserStat,
      userPackResponseUserProfile = userPackResponseUserProfile
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
    , "user_stat" .= userSanitizedPackResponseUserStat
    , "user_profile" .= userSanitizedPackResponseUserProfile
    ]


instance FromJSON UserSanitizedPackResponse where
  parseJSON (Object o) = do
    userSanitizedPackResponseUser <- o .: "user"
    userSanitizedPackResponseUserStat <- o .: "user_stat"
    userSanitizedPackResponseUserProfile <- o .: "user_profile"
    return $ UserSanitizedPackResponse {
      userSanitizedPackResponseUser = userSanitizedPackResponseUser,
      userSanitizedPackResponseUserStat = userSanitizedPackResponseUserStat,
      userSanitizedPackResponseUserProfile = userSanitizedPackResponseUserProfile
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

-- footer