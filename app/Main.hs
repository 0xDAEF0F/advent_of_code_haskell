module Main where

import CalorieCounting (sumTop3)
import System.IO ()

main :: IO ()
main = do
  content <- readFile "input.txt"
  let sum = sumTop3 content
  print sum
