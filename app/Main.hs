module Main where

import qualified CalorieCounting (sumTop3)
import qualified CampCleanupA (solution)
import qualified CampCleanupB (solution)
import qualified RockPaperScissors (fight)
import qualified RockPaperScissorsTwo (fight)
import qualified RucksackReorganizationA (getSumOfPriorities)
import qualified RucksackReorganizationB (solution)
import qualified SupplyStacksA (solution)
import System.IO ()

main :: IO ()
main = do
  content <- readFile "input-day-5.txt"
  let solution = SupplyStacksA.solution content
  print solution
