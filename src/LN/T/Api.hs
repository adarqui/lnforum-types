{-# LANGUAGE OverloadedStrings #-}

module LN.T.Api (
  apiPrefix
) where



import           LN.T.Prelude



apiPrefix :: IsString a => a
apiPrefix = "api"
