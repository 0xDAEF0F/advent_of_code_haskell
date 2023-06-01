module Main where

import qualified CalorieCounting (sumTop3)
import qualified CampCleanupA (solution)
import qualified CampCleanupB (solution)
import qualified RockPaperScissors (fight)
import qualified RockPaperScissorsTwo (fight)
import qualified RucksackReorganizationA (getSumOfPriorities)
import qualified RucksackReorganizationB (solution)
import qualified SupplyStacksA (solution)
import qualified SupplyStacksB (solution)
import System.IO ()
import qualified TuningTroubleA (solution)

main :: IO ()
main = do
  content <- readFile "input-day-6.txt"
  let solution = TuningTroubleA.solution content
  print solution
