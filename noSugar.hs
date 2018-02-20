import Data.Char

main :: IO ()
main =
  putStrLn "Enter a single word to calculate its Scrabble score: " >>
  getLine >>=
  \s -> putStrLn $
    "Your word score is: " ++
    show (foldl (+) 0 $ map (\c -> let c' = toLower c in
      if elem c' "eaionrtlsu"
      then 1
      else if elem c' "dg"
      then 2
      else if elem c' "bcmp"
      then 3
      else if elem c' "fhvwy"
      then 4
      else if elem c' "k"
      then 5
      else if elem c' "jx"
      then 8
      else if elem c' "qz"
      then 10
      else error "A word may only contain English letters!"
    ) s)
