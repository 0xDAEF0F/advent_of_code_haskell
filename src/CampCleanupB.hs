module CampCleanupB (solution) where

import Data.List.Split (splitOn)

type CampRange = (Int, Int)

type CampPairRange = (CampRange, CampRange)

solution :: String -> Int
solution str = sum $ map (fromEnum . isOverlap . parseLineToPairRange) $ lines str

parseLineToPairRange :: String -> CampPairRange
parseLineToPairRange line =
  ((read startRangeA, read endRangeA), (read startRangeB, read endRangeB))
  where
    [firstGroup, secondGroup] = splitOn "," line
    [startRangeA, endRangeA] = splitOn "-" firstGroup
    [startRangeB, endRangeB] = splitOn "-" secondGroup

isOverlap :: CampPairRange -> Bool
isOverlap (range1@(a, b), range2@(c, d)) = isAnyElemOfFirstInRangeSecond || isAnyElemOfSecondInRangeFirst
  where
    isAnyElemOfFirstInRangeSecond = isNumInRange a range2 || isNumInRange b range2
    isAnyElemOfSecondInRangeFirst = isNumInRange c range1 || isNumInRange d range1
    isNumInRange num (start, end) = num >= start && num <= end
