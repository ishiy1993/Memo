import Control.Applicative

main = do contents <- lines <$> getContents
          putStrLn . unlines $ toMd contents

toMd :: [String] -> [String]
toMd (x:xs) = y:ys
              where y = "# " ++ x
                    ys = map ("\t+ " ++) xs
