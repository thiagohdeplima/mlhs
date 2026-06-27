module Regression.LinearSpec where

import Test.Hspec

import qualified Regression.Linear as Linear

import Data.Vector (fromList)

spec :: Spec
spec =
  describe "Regression.Linear.fit" $ do
    it "should calculate correct model" $
      let
        x = fromList [52, 59, 67, 73, 64, 74, 54, 61, 65, 46, 72]
        y = fromList [132, 143, 153, 162, 154, 168, 137, 149, 159, 128, 166]

        model = Linear.fit x y
      in do
        Linear.w0 model `shouldBe` 58.705515430072225
        Linear.w1 model `shouldBe` 1.463230466185161
        Linear.r2 model `shouldBe` 4.215927918526452e-2
