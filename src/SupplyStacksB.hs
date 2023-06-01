module SupplyStacksB (solution) where

type Quantity = Int

type From = Int

type To = Int

type Instruction = (Quantity, From, To)

type CratesState = [[Char]]

--                     [L]     [H] [W]
--                 [J] [Z] [J] [Q] [Q]
-- [S]             [M] [C] [T] [F] [B]
-- [P]     [H]     [B] [D] [G] [B] [P]
-- [W]     [L] [D] [D] [J] [W] [T] [C]
-- [N] [T] [R] [T] [T] [T] [M] [M] [G]
-- [J] [S] [Q] [S] [Z] [W] [P] [G] [D]
-- [Z] [G] [V] [V] [Q] [M] [L] [N] [R]
--  1   2   3   4   5   6   7   8   9

initialState :: CratesState
initialState =
  [ ['S', 'P', 'W', 'N', 'J', 'Z'],
    ['T', 'S', 'G'],
    ['H', 'L', 'R', 'Q', 'V'],
    ['D', 'T', 'S', 'V'],
    ['J', 'M', 'B', 'D', 'T', 'Z', 'Q'],
    ['L', 'Z', 'C', 'D', 'J', 'T', 'W', 'M'],
    ['J', 'T', 'G', 'W', 'M', 'P', 'L'],
    ['H', 'Q', 'F', 'B', 'T', 'M', 'G', 'N'],
    ['W', 'Q', 'B', 'P', 'C', 'G', 'D', 'R']
  ]

solution :: String -> CratesState
solution st = foldl executeInstruction initialState allInstructions
  where
    allInstructions = map parseInstruction $ lines st

parseInstruction :: String -> Instruction
parseInstruction s = (read qty, read from - 1, read to - 1)
  where
    [_, qty, _, from, _, to] = words s

executeInstruction :: CratesState -> Instruction -> CratesState
executeInstruction cr (0, _, _) = cr
executeInstruction cr (qty, from, to) = newStacks
  where
    newFromStack = drop qty (cr !! from)
    newToStack = take qty (cr !! from) ++ (cr !! to)
    newStacks = map foo $ zip cr [0 ..]
    foo (st, i)
      | i == from = newFromStack
      | i == to = newToStack
      | otherwise = st
