module CampCleanupA (solution) where
import Data.List.Split (splitOn)

type PairRange = ((Int, Int), (Int, Int))

solution :: String -> Int
solution str = sum $ map (fromEnum . isOneRangeFullyOverlapping . toRangeTuple) $ lines str

toRangeTuple :: String -> PairRange
toRangeTuple line = ((read startRangeA, read endRangeA), (read startRangeB, read endRangeB))
    where
        [firstGroup, secondGroup] = splitOn "," line
        [startRangeA, endRangeA] = splitOn "-" firstGroup
        [startRangeB, endRangeB] = splitOn "-" secondGroup

isOneRangeFullyOverlapping :: PairRange -> Bool
isOneRangeFullyOverlapping ((a, b), (c, d))
    | c >= a && d <= b = True
    | a >= c && b <= d = True
    | otherwise = False
