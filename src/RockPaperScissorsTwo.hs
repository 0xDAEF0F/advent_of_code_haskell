module RockPaperScissorsTwo (fight) where

data Weapon = Rock | Paper | Scissors

data Outcome = Win | Lose | Draw

fight :: String -> Int
fight str = sum $ map (matchScore . toMatch) $ lines str

matchScore :: (Weapon, Outcome) -> Int
matchScore (opponent, position) = scoreForFight
  where
    scoreForFight = case opponent of
      Rock -> case position of
        Win -> 6 + 2
        Draw -> 3 + 1
        Lose -> 0 + 3
      Paper -> case position of
        Win -> 6 + 3
        Draw -> 3 + 2
        Lose -> 0 + 1
      Scissors -> case position of
        Win -> 6 + 1
        Draw -> 3 + 3
        Lose -> 0 + 2

toMatch :: [Char] -> (Weapon, Outcome)
toMatch [o, p] = (weapon, outcome)
  where
    weapon = case o of
      'A' -> Rock
      'B' -> Paper
      'C' -> Scissors
    outcome = case p of
      'X' -> Lose
      'Y' -> Draw
      'Z' -> Win