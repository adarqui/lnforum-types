module LN.T.Permission (
  Permission (..),
  Permissions,
  emptyPermissions
) where



import           LN.T.Prelude



data Permission
  = Perm_Create
  | Perm_Read
  | Perm_Update
  | Perm_Delete
  | Perm_Execute
  deriving (Eq, Ord, Show, Read, Generic, Typeable)



-- | TODO FIXME: Permissions should be a Map, not a list.
-- This would also have a major impact on the front-end code.
-- Need to build Maps into ln-interop; currently unsupported.
-- Once built in, need to also change blahResponses from lists to Maps.
type Permissions = [Permission]



emptyPermissions :: Permissions
emptyPermissions = []
