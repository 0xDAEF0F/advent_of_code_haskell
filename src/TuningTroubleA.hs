module TuningTroubleA (solution) where

import Data.List.Extra (anySame)

solution :: String -> Int
solution str = go $ zip str [1 ..]

go :: [(Char, Int)] -> Int
go list
  | anySame charsToCompare = go $ tail list
  | otherwise = snd $ last subList
  where
    subList = take 14 list
    charsToCompare = map fst subList