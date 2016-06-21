module LN.T.ACL (
  ACL (..)
) where



import           LN.T.Permission
import           LN.T.Prelude



data ACL
  = ACL_Grant Permissions
  | ACL_Deny
  deriving (Eq, Ord, Show, Read, Generic, Typeable)
