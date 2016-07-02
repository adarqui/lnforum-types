{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module LN.T.Leuron (
  module A,
  LeuronData (..),
  TyLeuron (..),
  Fact (..),
  FactList (..),
  Card (..),
  DCard (..),
  DCardX (..),
--  DCardY (..),
--  OptDefMean (..),
--  OrGroup (..),
  Acronym (..),
  Synonym (..),
  Antonym (..),
  Template (..),
  TemplateValue,
  ImageAssociation (..),
  Script (..),
  LDContent,
  LDHint,
  LinearDemoNode,
  LinearDemo (..),
  QA (..),
  Table (..),
--  LeuronGrammar (..),
--  LeuronOptions (..),
  leuronTypeToText,
  tyLeuronTypeToText,
) where



import           LN.T.DepList       as A
import           LN.T.Prelude
import           LN.T.Splits        as A
import           LN.T.Substitutions as A



data Fact = Fact {
  factText :: Text
} deriving (Generic, Typeable)



-- THESE COULD BE NESTED! ie, the factListList could contain Fact's, dcards etc
data FactList = FactList {
  factListFact :: Text,
  factListList :: [Text]
} deriving (Generic, Typeable)



data Card = Card {
  cardFront :: Text,
  cardBack  :: Text
} deriving (Generic, Typeable)



data DCard = DCard {
  dcardFront :: Text,
  dcardBack  :: Text
} deriving (Generic, Typeable)



data DCardX = DCardX {
  dcardxFront :: [Text],
  dcardxBack  :: [Text]
} deriving (Generic, Typeable)



data Acronym = Acronym {
  acronymAbbreviation :: Text,
  acronymMeaning      :: Text
} deriving (Generic, Typeable)



data Synonym = Synonym {
  synonymA :: Text,
  synonymB :: Text
} deriving (Generic, Typeable)



data Antonym = Antonym {
  antonymA :: Text,
  antonymB :: Text
} deriving (Generic, Typeable)



type TemplateValue = (Text, [Text])

data Template = Template {
  template       :: Text,
  templateValues :: [TemplateValue]
} deriving (Generic, Typeable)



data ImageAssociation = ImageAssociation {
  imageUrl    :: [Text],
  assocBy     :: [Text],
  assocResult :: [Text]
} deriving (Generic, Typeable)



data Script = Script {
  scriptTitle :: Text,
  scriptDesc  :: Text,
  scriptUrl   :: Text
} deriving (Generic, Typeable)



-- | LinearDemo
-- A Linear demo is a sequential demo of steps, which can be played step by step.
-- The "Hint" allows us to hint about the next step, if enabled/requested by the user.
--
type LDContent = Text
type LDHint = Maybe Text
type LinearDemoNode = (LDContent, LDHint)
data LinearDemo = LinearDemo {
  linearDemoLabel   :: Text,
  linearDemoContent :: [LinearDemoNode]
} deriving (Generic, Typeable)



data Table = Table {
  tableTitle   :: Text,
  tableColumns :: [Text],
  tableRows    :: [[Maybe Text]]
} deriving (Generic, Typeable)



data QA = QA {
  qaQuestion :: Text,
  qaAnswer   :: Text
} deriving (Generic, Typeable)



data LeuronData
  = LnFact Fact
  | LnFactList FactList
  | LnCard Card
  | LnDCard DCard
  | LnDCardX DCardX
  | LnAcronym Acronym
  | LnSynonym Synonym
  | LnAntonym Antonym
  | LnTemplate Template
  | LnImageAssociation ImageAssociation
  | LnLinearDemo LinearDemo
  | LnTable Table
  | LnScript Script
  | LnQA QA
  | LnExamples
  | LnEmpty
  deriving (Generic, Typeable)



data TyLeuron
  = TyLnFact
  | TyLnFactList
  | TyLnCard
  | TyLnDCard
  | TyLnDCardX
  | TyLnAcronym
  | TyLnSynonym
  | TyLnAntonym
  | TyLnTemplate
  | TyLnImageAssociation
  | TyLnLinearDemo
  | TyLnTable
  | TyLnScript
  | TyLnQA
  | TyLnExamples
  | TyLnEmpty
  deriving (Generic, Typeable)



leuronTypeToText :: LeuronData -> Text
leuronTypeToText ld =
  case ld of
    (LnFact _)       -> "Fact"
    (LnFactList _)   -> "FactList"
    (LnCard _)       -> "Card"
    (LnDCard _)      -> "DCard"
    (LnDCardX _)     -> "DCardX"
    (LnSynonym _)    -> "Synonym"
    (LnAcronym _)    -> "Acronym"
    (LnAntonym _)    -> "Antonym"
    (LnTemplate _)   -> "Template"
    (LnImageAssociation _) -> "ImageAssociation"
    (LnLinearDemo _) -> "LinearDemo"
    (LnTable _)      -> "Table"
    (LnScript _)     -> "Script"
    (LnQA _)         -> "QA"
    LnExamples       -> "Examples"
    LnEmpty          -> "Empty"



tyLeuronTypeToText :: TyLeuron -> Text
tyLeuronTypeToText ld =
  case ld of
    TyLnFact       -> "Fact"
    TyLnFactList   -> "FactList"
    TyLnCard       -> "Card"
    TyLnDCard      -> "DCard"
    TyLnDCardX     -> "DCardX"
    TyLnSynonym    -> "Synonym"
    TyLnAcronym    -> "Acronym"
    TyLnAntonym    -> "Antonym"
    TyLnTemplate   -> "Template"
    TyLnImageAssociation -> "ImageAssociation"
    TyLnLinearDemo -> "LinearDemo"
    TyLnTable      -> "Table"
    TyLnScript     -> "Script"
    TyLnQA         -> "QA"
    TyLnExamples   -> "Examples"
    TyLnEmpty      -> "Empty"
