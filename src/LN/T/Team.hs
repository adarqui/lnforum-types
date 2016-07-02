module LN.T.Team (
  SystemTeam (..)
) where



import           LN.T.Prelude



data SystemTeam
  = Team_Owners
  | Team_Members
  deriving (Generic, Typeable)
