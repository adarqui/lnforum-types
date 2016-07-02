-- Not sure what i want to do with this yet..

module LN.T.Job (
  Job (..),
  Queue (..)
) where



import           LN.T.Prelude
import           LN.T.Internal.Types



type UserId = Int64



-- type Job = (JobRequest, JobReply)
data Job
  = Job_Nop               ()                       ()
  | Job_Ping              ()                       UTCTime
  | Job_CreateUserProfile (UserId, ProfileRequest) ProfileResponse
  deriving (Generic, Typeable)



data Queue
  = QNop
  | QPing
  | QCreateUserProfile
  deriving (Eq, Ord, Enum, Show, Read, Generic, Typeable)
