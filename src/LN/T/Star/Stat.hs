module LN.T.Star.Stat (
  StarStatResponse (..),
  StarStatResponses (..)
) where



import           LN.T.Ent
import           LN.T.Prelude



data StarStatResponse = StarStatResponse {
  starStatResponseId     :: Int64,
  starStatResponseEnt    :: Ent,
  starStatResponseEntId  :: Int64,
  starStatResponseStars  :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable)



data StarStatResponses = StarStatResponses {
  starStatResponses :: [StarStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable)
