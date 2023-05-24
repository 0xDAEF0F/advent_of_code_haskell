module RucksackReorganizationB (solution) where

import Data.Char (isAsciiLower, isAsciiUpper, ord)
import Data.List.Split (chunksOf)
import Data.Set (Set, intersection)
import qualified Data.Set as S
import RucksackReorganizationA (itemToPriority)

solution :: String -> Int
solution str = sum $ map (itemToPriority . head . S.toList) toIntersections
  where
    toIntersections = map intersectionOfThreeGroups inGroups
    inGroups = chunksOf 3 $ lines str

intersectionOfThreeGroups :: [String] -> Set Char
intersectionOfThreeGroups [a, b, c] = intersectionOfThreeGroups
  where
    intersectionOfThreeGroups = groupA `intersection` groupB `intersection` groupC
    groupA = S.fromList a
    groupB = S.fromList b
    groupC = S.fromList c