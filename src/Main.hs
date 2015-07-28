import Control.Applicative

main = do contents <- lines <$> getContents
          appendFile "/home/iyou/memos/test.md" . unlines $ toMd contents

toMd :: [String] -> [String]
toMd (x:xs) = y:ys
              where y = "# " ++ x
                    ys = map ("  + " ++) xs
