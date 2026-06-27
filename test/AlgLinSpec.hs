module AlgLinSpec where

import Test.Hspec
import Test.QuickCheck

import qualified AlgLin

import Data.Vector (fromList)

spec :: Spec
spec = 
  describe "AlgLin.dotProduct" $ do
    it "calculate dot product correctly" $
      let
        v1 = fromList [2.0, 7.0, 1.0]
        v2 = fromList [8.0, 2.0, 8.0]
      in
        AlgLin.dotProduct v1 v2 `shouldBe` Right 38.0

    it "fails when vectors are incompatible" $
      let
        v1 = fromList []
        v2 = fromList [1.0]
      in
        AlgLin.dotProduct v1 v2 `shouldBe` Left (AlgLin.VectorSizeDontMatch 0 1)


    it "calculates sigmoid function for a given x" $
      property $ \x -> 
        let
          result = AlgLin.sigmoid (x :: Double)
        in
          result >= 0 && result <= 1
