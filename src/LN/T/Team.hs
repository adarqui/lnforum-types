module LN.T.Team (
  SystemTeam (..)
) where



import           LN.T.Prelude



data SystemTeam
  = Team_Owners
  | Team_Members
  deriving (Eq, Ord, Show, Read, Generic, Typeable)
