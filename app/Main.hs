module Main where

import qualified CalorieCounting (sumTop3)
import qualified RockPaperScissors (fight)
import qualified RockPaperScissorsTwo (fight)
import qualified RucksackReorganizationA (getSumOfPriorities)
import qualified RucksackReorganizationB (solution)
import qualified CampCleanupA (solution)
import qualified CampCleanupB (solution)
import System.IO ()

main :: IO ()
main = do
  content <- readFile "input-day-4.txt"
  let sum = CampCleanupB.solution content
  print sum
