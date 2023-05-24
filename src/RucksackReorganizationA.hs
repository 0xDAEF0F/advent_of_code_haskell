module RucksackReorganizationA (getSumOfPriorities, itemToPriority) where

import Data.Char (isAsciiLower, isAsciiUpper, ord)
import Data.Set (Set, intersection)
import qualified Data.Set as S
import Test.Speculate.Utils (halve)

getSumOfPriorities :: String -> Int
getSumOfPriorities str = sum $ map (sumOfIntersectionOfTwoCompartments . rucksackToCompartments) $ lines str

sumOfIntersectionOfTwoCompartments :: ([Int], [Int]) -> Int
sumOfIntersectionOfTwoCompartments (a, b) = sum $ S.toList intersectionOfItemsBetweenTwoCompartments
  where
    intersectionOfItemsBetweenTwoCompartments = compartmentA `intersection` compartmentB
    compartmentA = S.fromList a
    compartmentB = S.fromList b

rucksackToCompartments :: String -> ([Int], [Int])
rucksackToCompartments str = halve $ map itemToPriority str

itemToPriority :: Char -> Int
itemToPriority a
  | isAsciiLower a = ord a - 96
  | isAsciiUpper a = ord a - 38