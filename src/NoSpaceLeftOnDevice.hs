module NoSpaceLeftOnDevice () where

main = do
  file <- readFile "input-day-7.txt"
  let l = lines file
  print l

data FileSystem = File String Integer | Directory String [FileSystem] deriving (Show)

example :: FileSystem
example = Directory "name" [File "hello" 123, File "myname" 18234, Directory "dir" [File "some" 38, Directory "nest" [File "nesty.txt" 18]]]

sizeFs :: FileSystem -> Integer
sizeFs (File _ n) = n
sizeFs (Directory _ xs) = sum $ map sizeFs xs
