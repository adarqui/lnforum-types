-- Not sure what i want to do with this yet..

module LN.T.Job (
  Job (..),
  Queue (..)
) where



import           LN.T.Prelude
import           LN.T.Internal.Types



-- type Job = (JobRequest, JobReply)
data Job
  = Job_Nop               ()                       ()
  | Job_Ping              ()                       UTCTime
  | Job_CreateUserProfile (Int64 {-UserId-}, ProfileRequest) ProfileResponse
  deriving (Generic, Typeable)



data Queue
  = QNop
  | QPing
  | QCreateUserProfile       -- ^ When a user is created, it fires off a job to create a UserProfile
  | QCreateUserApi           -- ^ When a user is created, it fires off a job to create an Api entry
  | QAddThreadPostToSet      -- ^ Adds a thread post to a thread set
  | QRemoveThreadPostFromSet -- ^ Deletes a thread post from a thread set
  | QFixUserProfiles         -- ^ Adds profiles for users that don't have any
  | QFixThreadPostSets       -- ^ Goes through all threads in the system and makes sure their sets are accurate
  deriving (Eq, Ord, Enum, Show, Read, Generic, Typeable)
