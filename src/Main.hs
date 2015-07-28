import Control.Applicative
import System.Environment
import Data.Time
import Data.Time.Format
import Data.Time.Clock
import Data.Time.LocalTime

main = do contents <- filter (/= "") . lines <$> getContents
          args <- getArgs
          tz <- getCurrentTimeZone
          utc <- getCurrentTime
          let dy = daytime tz utc
              tag = toTag args
          appendFile "/home/iyou/memos/memo.md" . unlines $ toMd dy tag contents

toMd :: String -> String -> [String] -> [String]
toMd dy tag (x:xs) = y:ys
                      where y = "# [" ++ dy ++ "] " ++ x ++ " " ++ tag ++ num
                            ys = map ("  + " ++) xs
                            num = " (" ++ (show $ length xs) ++ ")"

daytime :: TimeZone -> UTCTime -> String
daytime tz utc = formatTime defaultTimeLocale "%Y%m%d%H%M" $ utcToLocalTime tz utc

toTag :: [String] -> String
toTag [] = ""
toTag xs = foldr (++) ":" ys
            where ys = map (":" ++) xs
