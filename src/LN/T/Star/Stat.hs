module LN.T.Star.Stat (
  StarStatResponse (..),
  StarStatResponses (..)
) where



import           LN.T.Entity
import           LN.T.Prelude



data StarStatResponse = StarStatResponse {
  starStatResponseId     :: Int64,
  starStatResponseEntity :: Ent,
  starStatResponseStars  :: Int64
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)



data StarStatResponses = StarStatResponses {
  starStatResponses :: [StarStatResponse]
} deriving (Eq, Ord, Show, Read, Generic, Typeable, Out)
