module LN.T.GenericPretty (
  module Text.PrettyPrint.GenericPretty
) where



import           Data.Int                       (Int64)
import           Data.Text                      (Text)
import qualified Data.Text                      as T
import           Data.Time                      (UTCTime)
import           Text.PrettyPrint.GenericPretty



instance Out Text where
  docPrec n t = docPrec n (T.unpack t)
  doc t = doc (T.unpack t)



instance Out Int64 where
  docPrec n i = docPrec n (fromIntegral i :: Integer)
  doc i = doc (fromIntegral i :: Integer)



instance Out UTCTime where
  docPrec n utc = docPrec n (show utc)
  doc utc = doc (show utc)
