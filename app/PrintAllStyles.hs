#!/usr/bin/env runghc


import AnsiSGR.String


main :: IO ()
main = do

    putStrLn (blink Slow          ++ "blink Slow           = [5m")
    putStrLn (reset Blink         ++ "reset Blink          = [25m")
    putStrLn (blink Rapid         ++ "blink Rapid          = [6m")
    putStrLn (reset Blink         ++ "reset Blink          = [25m")

    putStrLn (conceal             ++ "conceal              = [8m")
    putStrLn (reset Conceal       ++ "reset Conceal        = [28m")

    putStrLn (frame Rect          ++ "frame Rect           = [51m")
    putStrLn (reset Frame         ++ "reset Frame          = [54m")

    putStrLn (frame Circle        ++ "frame Circle         = [52m")
    putStrLn (reset Frame         ++ "reset Frame          = [54m")

    putStrLn (ideogram RightLine1 ++ "ideogram RightLine1  = [60m")
    putStrLn (reset Ideogram      ++ "reset Ideogram       = [65m")
    putStrLn (ideogram RightLine2 ++ "ideogram RightLine2  = [61m")
    putStrLn (reset Ideogram      ++ "reset Ideogram       = [65m")
    putStrLn (ideogram LeftLine1  ++ "ideogram LeftLine1   = [62m")
    putStrLn (reset Ideogram      ++ "reset Ideogram       = [65m")
    putStrLn (ideogram LeftLine2  ++ "ideogram LeftLine2   = [63m")
    putStrLn (reset Ideogram      ++ "reset Ideogram       = [65m")
    putStrLn (ideogram Underline1 ++ "ideogram Underline1  = [60m")
    putStrLn (reset Ideogram      ++ "reset Ideogram       = [65m")
    putStrLn (ideogram Underline2 ++ "ideogram Underline2  = [61m")
    putStrLn (reset Ideogram      ++ "reset Ideogram       = [65m")
    putStrLn (ideogram Overline1  ++ "ideogram Overline1   = [62m")
    putStrLn (reset Ideogram      ++ "reset Ideogram       = [65m")
    putStrLn (ideogram Overline2  ++ "ideogram Overline2   = [63m")
    putStrLn (reset Ideogram      ++ "reset Ideogram       = [65m")
    putStrLn (ideogram Stress     ++ "ideogram Stress      = [64m")
    putStrLn (reset Ideogram      ++ "reset Ideogram       = [65m")

    putStrLn (intensity Bold      ++ "intensity Bold       = [1m")
    putStrLn (reset Intensity     ++ "reset Intensity      = [22m")
    putStrLn (intensity Faint     ++ "intensity Faint      = [2m")
    putStrLn (reset Intensity     ++ "reset Intensity      = [22m")

    putStrLn (invert              ++ "invert               = [7m")
    putStrLn (reset Invert        ++ "reset Invert         = [27m")

    putStrLn (overline            ++ "overline             = [53m")
    putStrLn (reset Overline      ++ "reset Overline       = [55m")

    putStrLn (proportional        ++ "proportional         = [26m")
    putStrLn (reset Proportional  ++ "reset Proportional   = [50m")

    putStrLn (script Sup          ++ "script Sup           = [73m")
    putStrLn (reset Script        ++ "reset Script         = [75m")
    putStrLn (script Sub          ++ "script Sub           = [74m")
    putStrLn (reset Script        ++ "reset Script         = [75m")

    putStrLn (strike              ++ "strike               = [9m")
    putStrLn (reset Strike        ++ "reset Strike         = [29m")

    putStrLn (typeface Italic     ++ "typeface Italic      = [3m")
    putStrLn (reset Typeface      ++ "reset Typeface       = [23m")
    putStrLn (typeface Fraktur    ++ "typeface Fraktur     = [20m")
    putStrLn (reset Typeface      ++ "reset Typeface       = [23m")
    putStrLn (italic              ++ "italic               = [3m")
    putStrLn (reset Typeface      ++ "reset Typeface       = [23m")
    putStrLn (fraktur             ++ "fraktur              = [20m")
    putStrLn (reset Typeface      ++ "reset Typeface       = [23m")

    putStrLn (underline Single    ++ "underline Single     = [4m")
    putStrLn (reset Underline     ++ "reset Underline      = [24m")
    putStrLn (underline Double    ++ "underline Double     = [21m")
    putStrLn (reset Underline     ++ "reset Underline      = [24m")

    putStrLn (reset All           ++ "reset All            = [0m")

    return ()
