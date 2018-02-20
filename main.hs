import Data.Char

main :: IO ()
main = do
  putStrLn "Enter a single word to calculate its Scrabble score: "
  s <- getLine
  putStrLn $
    "Your word score is: " ++
    show (foldl (+) 0 $ map (\c -> let c' = toLower c in
      if c' `elem` "eaionrtlsu"
      then 1
      else if c' `elem` "dg"
      then 2
      else if c' `elem` "bcmp"
      then 3
      else if c' `elem` "fhvwy"
      then 4
      else if c' `elem` "k"
      then 5
      else if c' `elem` "jx"
      then 8
      else if c' `elem` "qz"
      then 10
      else error "A word may only contain English letters!"
    ) s)
