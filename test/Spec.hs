module Main where

import Test.Hspec

import qualified AlgLinSpec

main :: IO ()
main = hspec $ do
    AlgLinSpec.spec