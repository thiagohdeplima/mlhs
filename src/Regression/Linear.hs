module Regression.Linear
where

import qualified Data.Vector as V

data Model = Model
  {
    w0 :: Double,
    w1 :: Double,
    r2 :: Double
  } deriving (Show, Eq)

fit :: V.Vector Double -> V.Vector Double -> Model
fit x y
  | lenX == 0 = error "the x vector must not be empty"
  | lenY /= lenX = error "x and y must have the same length"
  | otherwise = Model { w0 = _w0, w1 = _w1, r2 = _r2}
  where
    lenX = V.length x
    lenY = V.length y

    x_ = V.sum(x) / fromIntegral lenX
    y_ = V.sum(y) / fromIntegral lenY

    sxx = V.sum $ V.map (** 2) $ V.map (\xi -> xi - x_) x
    syy = V.sum $ V.map (** 2) $ V.map (\yi -> yi - y_) y
    sxy = V.sum $ V.zipWith (\xi yi -> (xi - x_) * (yi - y_)) x y

    _w1 = sxy / sxx
    _w0 = y_ - _w1 * x_
    _r2 = 1 - sxy ** 2 / (sxx * syy)

predict :: Model -> Double -> Double
predict model x =
  w0 model + w1 model * x
