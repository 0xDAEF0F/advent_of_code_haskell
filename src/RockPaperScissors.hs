{-# LANGUAGE LambdaCase #-}

module RockPaperScissors where

data Weapon = Rock | Paper | Scissor deriving (Eq, Show, Read)

data PlayerChoice = Self Weapon | Opponent Weapon deriving (Show)

fight :: String -> Int
fight str = sum $ map (fightScore . toPlayerChoice) $ lines str

pointsForWeapon :: PlayerChoice -> Int
pointsForWeapon = \case
  Self Rock -> 1
  Self Paper -> 2
  Self Scissor -> 3

fightScore :: (PlayerChoice, PlayerChoice) -> Int
fightScore (opponent, self) = pointsForWeapon self + scoreForFight
  where
    scoreForFight = case opponent of
      Opponent Rock -> case self of
        Self Rock -> 3
        Self Paper -> 6
        Self Scissor -> 0
      Opponent Paper -> case self of
        Self Rock -> 0
        Self Paper -> 3
        Self Scissor -> 6
      Opponent Scissor -> case self of
        Self Rock -> 6
        Self Paper -> 0
        Self Scissor -> 3

toPlayerChoice :: [Char] -> (PlayerChoice, PlayerChoice)
toPlayerChoice [o, p] = (opponent, self)
  where
    opponent = case o of
      'A' -> Opponent Rock
      'B' -> Opponent Paper
      'C' -> Opponent Scissor
    self = case p of
      'X' -> Self Rock
      'Y' -> Self Paper
      'Z' -> Self Scissor