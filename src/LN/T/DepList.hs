module LN.T.DepList (
  DepList,
  (+->),
  depListToLower
) where



import qualified Data.Text    as T
import           LN.T.Prelude



type DepList a = [[a]]

infixr 9 +->

(+->) :: a -> [a] -> [a]
(+->) a as = a : as



depListToLower :: DepList Text -> DepList Text
depListToLower = map (map T.toLower)
