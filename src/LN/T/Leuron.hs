{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

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
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



-- THESE COULD BE NESTED! ie, the factListList could contain Fact's, dcards etc
data FactList = FactList {
  factListFact :: Text,
  factListList :: [Text]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data Card = Card {
  cardFront :: Text,
  cardBack  :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data DCard = DCard {
  dcardFront :: Text,
  dcardBack  :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data DCardX = DCardX {
  dcardxFront :: [Text],
  dcardxBack  :: [Text]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data Acronym = Acronym {
  acronymAbbreviation :: Text,
  acronymMeaning      :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data Synonym = Synonym {
  synonymA :: Text,
  synonymB :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data Antonym = Antonym {
  antonymA :: Text,
  antonymB :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



type TemplateValue = (Text, [Text])

data Template = Template {
  template       :: Text,
  templateValues :: [TemplateValue]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data ImageAssociation = ImageAssociation {
  imageUrl    :: [Text],
  assocBy     :: [Text],
  assocResult :: [Text]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data Script = Script {
  scriptTitle :: Text,
  scriptDesc  :: Text,
  scriptUrl   :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



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
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data Table = Table {
  tableTitle   :: Text,
  tableColumns :: [Text],
  tableRows    :: [[Maybe Text]]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data QA = QA {
  qaQuestion :: Text,
  qaAnswer   :: Text
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



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
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



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
  deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



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
