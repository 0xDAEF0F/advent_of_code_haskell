module Main where

import qualified CalorieCounting (sumTop3)
import qualified RockPaperScissors (fight)
import qualified RockPaperScissorsTwo (fight)
import System.IO ()

main :: IO ()
main = do
  content <- readFile "input-day-two.txt"
  let sum = RockPaperScissorsTwo.fight content
  print sum
