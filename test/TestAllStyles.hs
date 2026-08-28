#!/usr/bin/env runghc

-- ================================================================
-- TEST
-- ================================================================
--
-- NOTE: This file was AI-generated (Claude Sonnet 5, Anthropic),
-- 2026-08-28. Review before trusting it blindly.
--
-- Parses log/PrintAllStyles.log (produced by `make log-styles`, which
-- runs PrintAllStyles.hs under `script` to capture real terminal
-- output) and checks that the actual leading escape sequence on each
-- line matches the expected SGR code stated in that line's label.
--
-- Each line printed by PrintAllStyles.hs looks like:
--
--     <ESC>[5mblink Slow           = [5m
--
-- i.e. the real escape sequence, followed by a human-readable label
-- ending in "= [<code>m" describing what the code SHOULD be. This
-- script extracts both sides of that line and compares them -- no
-- hardcoded correspondences, the log is the single source of truth
-- for what's "expected".
--
-- Run with:
--     make log-styles && runghc -isrc test/Test.hs
--
-- Exits 0 if all checks pass, 1 otherwise.


import System.Environment (getArgs)
import System.Exit (exitFailure, exitSuccess)
import System.IO (hPutStrLn, stderr)
import System.Directory (doesFileExist)
import Data.List (isPrefixOf, isSuffixOf, stripPrefix, sortOn, groupBy)
import Data.Char (isDigit)
import Text.Printf (printf)


defaultLogPath :: String
defaultLogPath = "log/PrintAllStyles.log"


-- ================================================================
-- PARSING
-- ================================================================


data LineCheck = LineCheck
    { lcLabel    :: String
    , lcExpected :: String
    , lcActual   :: String
    }


-- | Strip \r produced by `script`, and drop its header/footer + blank lines.
cleanLines :: String -> [String]
cleanLines raw =
    [ l | l0 <- lines (filter (/= '\r') raw)
        , let l = l0
        , not (null l)
        , not ("Script started" `isPrefixOf` l)
        , not ("Script done" `isPrefixOf` l)
    ]


-- | Pull the leading "\ESC[<digits/;>m" off the front of a line, if present.
--   Returns (code, rest-of-line-after-escape).
takeEscape :: String -> Maybe (String, String)
takeEscape s = do
    afterEsc <- stripPrefix "\ESC[" s
    let (code, rest) = break (== 'm') afterEsc
    case rest of
        ('m':rest') | all (\c -> isDigit c || c == ';') code -> Just (code, rest')
        _                                                    -> Nothing


-- | Pull the trailing "= [<digits/;>m" off the end of a line, if present.
--   Returns (code, label-before-that-suffix).
takeExpected :: String -> Maybe (String, String)
takeExpected s =
    case breakOnLast "= [" s of
        Nothing              -> Nothing
        Just (label, suffix) ->
            if "m" `isSuffixOf` suffix
                then let code = init suffix  -- drop trailing 'm'
                     in if all (\c -> isDigit c || c == ';') code
                            then Just (code, trim label)
                            else Nothing
                else Nothing
  where
    trim = f . f where f = reverse . dropWhile (== ' ')


-- | Find the last occurrence of `needle` in `haystack`, splitting around it.
breakOnLast :: String -> String -> Maybe (String, String)
breakOnLast needle haystack = go Nothing 0
  where
    n = length needle
    go found i
        | i > length haystack - n = fmap (\j -> (take j haystack, drop (j + n) haystack)) found
        | needle `isPrefixOf` drop i haystack = go (Just i) (i + 1)
        | otherwise = go found (i + 1)


parseLine :: String -> Maybe LineCheck
parseLine line = do
    (actual, afterEsc) <- takeEscape line
    (expected, label)  <- takeExpected afterEsc
    return LineCheck { lcLabel = label, lcExpected = expected, lcActual = actual }


-- ================================================================
-- MAIN
-- ================================================================


main :: IO ()
main = do
    args <- getArgs
    let logPath = case args of
            (p:_) -> p
            []    -> defaultLogPath

    exists <- doesFileExist logPath
    if not exists
        then do
            hPutStrLn stderr ("Log file not found: " ++ logPath)
            hPutStrLn stderr "Run `make log-styles` first to generate it."
            exitFailure
        else do
            raw <- readFile logPath
            let checks = [ c | l <- cleanLines raw, Just c <- [parseLine l] ]

            if null checks
                then do
                    putStrLn ("No style-report lines found in " ++ logPath ++ ". Nothing to check.")
                    exitFailure
                else do
                    mapM_ report checks

                    let failures = filter (\c -> lcActual c /= lcExpected c) checks
                        total    = length checks
                        numPass  = total - length failures

                        uniqueGroups     = groupByLabel checks
                        uniqueTotal      = length uniqueGroups
                        uniqueGroupPass g = all (\c -> lcActual c == lcExpected c) (snd g)
                        uniquePass       = length (filter uniqueGroupPass uniqueGroups)

                    putStrLn ""
                    printf "%d/%d unique checks passed\n" uniquePass uniqueTotal
                    printf "%d/%d total checks passed\n" numPass total

                    if null failures
                        then exitSuccess
                        else do
                            putStrLn (show (length failures) ++ " failure(s):")
                            mapM_
                                (\c -> putStrLn ("  - " ++ lcLabel c ++ ": expected [" ++ lcExpected c ++ "m, got [" ++ lcActual c ++ "m"))
                                failures
                            exitFailure


-- Raw SGR codes, deliberately not using AnsiSGR itself (this file tests
-- that module, so it shouldn't depend on it for something as basic as
-- coloring its own output).
green, red, resetColor :: String
green      = "\ESC[32m"
red        = "\ESC[31m"
resetColor = "\ESC[0m"


-- | Group checks by label (e.g. all "reset Blink" occurrences together),
--   preserving each group's first-seen order.
groupByLabel :: [LineCheck] -> [(String, [LineCheck])]
groupByLabel checks =
    [ (lcLabel firstCheck, g)
    | g@(firstCheck:_) <- groupBy (\a b -> lcLabel a == lcLabel b) (sortOn lcLabel checks)
    ]


report :: LineCheck -> IO ()
report c
    | lcActual c == lcExpected c =
        printf "%sPASS%s  %-28s expected [%sm\n" green resetColor (lcLabel c) (lcExpected c)
    | otherwise =
        printf "%sFAIL%s  %-28s expected [%sm  got [%sm\n" red resetColor (lcLabel c) (lcExpected c) (lcActual c)


-- ================================================================
