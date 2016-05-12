{-# LANGUAGE DeriveAnyClass  #-}
{-# LANGUAGE RecordWildCards #-}

module LN.T.Api (
  apiPrefix
) where



import           LN.T.Prelude



apiPrefix :: IsString a => a
apiPrefix = "api"
