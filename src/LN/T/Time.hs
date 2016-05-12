module LN.T.Time (
  defaultUTCTime
) where



import Data.Time



defaultUTCTime :: UTCTime
defaultUTCTime = read "2016-01-01 00:00:00.0 UTC" :: UTCTime
