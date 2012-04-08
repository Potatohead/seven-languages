module Main where

  rev :: [a] -> [a]
  rev [] = []
  rev (h:t) = rev t  ++ [h]
