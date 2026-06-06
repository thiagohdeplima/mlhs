module Main where

import Test.Hspec

import qualified AlgLinSpec

import qualified Regression.LinearSpec

main :: IO ()
main = hspec $ do
    AlgLinSpec.spec
    Regression.LinearSpec.spec
