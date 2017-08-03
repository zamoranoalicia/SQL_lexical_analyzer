module Main where
 main :: IO()
 main = do {
    putStrLn "Please enter the line of text"
    line <- getLine
    putStrLn line
 }