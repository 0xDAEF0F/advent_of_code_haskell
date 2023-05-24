module Main where

import qualified CalorieCounting (sumTop3)
import qualified RockPaperScissors (fight)
import qualified RockPaperScissorsTwo (fight)
import qualified RucksackReorganizationA (getSumOfPriorities)
import qualified RucksackReorganizationB (solution)
import System.IO ()

main :: IO ()
main = do
  content <- readFile "input-day-three.txt"
  let sum = RucksackReorganizationB.solution content
  print sum
