module LN.T.Team (
  SystemTeams (..)
) where



import           LN.T.Prelude



data SystemTeams
  = Team_Owners
  | Team_Members
  deriving (Eq, Ord, Show, Read, Generic, Typeable)
