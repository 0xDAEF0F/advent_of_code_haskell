module CalorieCounting where

import Data.List (sortOn)
import Data.Ord (Down (Down))

sumTop3 :: String -> Int
sumTop3 lin = sum $ top3 lin

top3 :: String -> [Int]
top3 lin = take 3 $ sortedDescElfsCalories lin

sortedDescElfsCalories :: String -> [Int]
sortedDescElfsCalories lin = sortOn Down $ elfsCalories $ lines lin

elfsCalories :: [String] -> [Int]
elfsCalories [] = []
elfsCalories lin = toSum : if null rest then [] else elfsCalories (tail rest)
  where
    toSum = sum $ toIntList hd
    (hd, rest) = break (== "") lin

toIntList :: [String] -> [Int]
toIntList = map read
