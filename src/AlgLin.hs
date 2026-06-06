
module AlgLin
  (
    dotProduct,
    sigmoid,

    DotProductError (..)
  )
where

import qualified Data.Vector as V

data DotProductError =
  VectorSizeDontMatch Int Int
  deriving (Eq, Show)

dotProduct :: V.Vector Double -> V.Vector Double -> Either DotProductError Double
dotProduct v1 v2
  | len1 == len2 = Right $ V.sum $ V.zipWith (*) v1 v2
  | otherwise = Left $ VectorSizeDontMatch len1 len2
  where
    len1 = V.length(v1)
    len2 = V.length(v2)

sigmoid :: Double -> Double
sigmoid x = 1 / (1 + exp (-x))
