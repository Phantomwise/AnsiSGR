-- ================================================================
-- GHC OPTIONS
-- ================================================================


{-# OPTIONS_GHC -Wno-tabs #-}


-- ================================================================
-- SGR CODES
-- ================================================================


-- src/Display.hs
module SGR where


-- ================================================================
-- TYPES
-- ================================================================


data SGR    = Black | Red | Green | Yellow | Blue | Magenta | Cyan | White | Default
            | Dull | Vivid
            | Bold | Faint | IntensityOff
            | Single | Double | UnderlineOff
            | Slow | Rapid | BlinkOff
            | InvertOn | InvertOff
            | ConcealOn | ConcealOff
            | StrikeOn | StrikeOff
            | ProportionalOn | ProportionalOff
            | On | Off
            | Reset
	deriving (Show)


-- ================================================================
-- COLOR FUNCTIONS
-- ================================================================


fg :: SGR -> SGR -> String
fg Dull  Black   = "\x1b[30m"
fg Dull  Red     = "\x1b[31m"
fg Dull  Green   = "\x1b[32m"
fg Dull  Yellow  = "\x1b[33m"
fg Dull  Blue    = "\x1b[34m"
fg Dull  Magenta = "\x1b[35m"
fg Dull  Cyan    = "\x1b[36m"
fg Dull  White   = "\x1b[37m"
fg Vivid Black   = "\x1b[90m"
fg Vivid Red     = "\x1b[91m"
fg Vivid Green   = "\x1b[92m"
fg Vivid Yellow  = "\x1b[93m"
fg Vivid Blue    = "\x1b[94m"
fg Vivid Magenta = "\x1b[95m"
fg Vivid Cyan    = "\x1b[96m"
fg Vivid White   = "\x1b[97m"
fg _     Default = "\x1b[39m"
fg _     _       = ""


fgd :: SGR -> String
fgd Black   = "\x1b[30m"
fgd Red     = "\x1b[31m"
fgd Green   = "\x1b[32m"
fgd Yellow  = "\x1b[33m"
fgd Blue    = "\x1b[34m"
fgd Magenta = "\x1b[35m"
fgd Cyan    = "\x1b[36m"
fgd White   = "\x1b[37m"
fgd Default = "\x1b[39m"
fgd _       = ""


fgv :: SGR -> String
fgv Black   = "\x1b[90m"
fgv Red     = "\x1b[91m"
fgv Green   = "\x1b[92m"
fgv Yellow  = "\x1b[93m"
fgv Blue    = "\x1b[94m"
fgv Magenta = "\x1b[95m"
fgv Cyan    = "\x1b[96m"
fgv White   = "\x1b[97m"
fgv Default = "\x1b[39m"
fgv _       = ""


bg :: SGR -> SGR -> String
bg Dull Black    = "\x1b[40m"
bg Dull Red      = "\x1b[41m"
bg Dull Green    = "\x1b[42m"
bg Dull Yellow   = "\x1b[43m"
bg Dull Blue     = "\x1b[44m"
bg Dull Magenta  = "\x1b[45m"
bg Dull Cyan     = "\x1b[46m"
bg Dull White    = "\x1b[47m"
bg Vivid Black   = "\x1b[100m"
bg Vivid Red     = "\x1b[101m"
bg Vivid Green   = "\x1b[102m"
bg Vivid Yellow  = "\x1b[103m"
bg Vivid Blue    = "\x1b[104m"
bg Vivid Magenta = "\x1b[105m"
bg Vivid Cyan    = "\x1b[106m"
bg Vivid White   = "\x1b[107m"
bg _     Default = "\x1b[49m"
bg _     _       = ""


bgd :: SGR -> String
bgd Black   = "\x1b[40m"
bgd Red     = "\x1b[41m"
bgd Green   = "\x1b[42m"
bgd Yellow  = "\x1b[43m"
bgd Blue    = "\x1b[44m"
bgd Magenta = "\x1b[45m"
bgd Cyan    = "\x1b[46m"
bgd White   = "\x1b[47m"
bgd Default = "\x1b[49m"
bgd _       = ""


bgv :: SGR -> String
bgv Black   = "\x1b[100m"
bgv Red     = "\x1b[101m"
bgv Green   = "\x1b[102m"
bgv Yellow  = "\x1b[103m"
bgv Blue    = "\x1b[104m"
bgv Magenta = "\x1b[105m"
bgv Cyan    = "\x1b[106m"
bgv White   = "\x1b[107m"
bgv Default = "\x1b[49m"
bgv _       = ""


-- ================================================================
-- STYLE FUNCTIONS
-- ================================================================


intensity :: SGR -> String
intensity Bold     = "\x1b[1m"
intensity Faint    = "\x1b[2m"
intensity Off      = "\x1b[22m"
intensity _        = ""


underline :: SGR -> String
underline Single   = "\x1b[4m"
underline Double   = "\x1b[21m"
underline Off      = "\x1b[24m"
underline _        = ""


blink :: SGR -> String
blink Slow         = "\x1b[5m"
blink Rapid        = "\x1b[6m"
blink Off          = "\x1b[25m"
blink _            = ""


invert :: SGR -> String
invert On         = "\x1b[7m"
invert Off        = "\x1b[27m"
invert _          = ""
-- Renamed from "revert" to avoid clash with Prelude


conceal :: SGR -> String
conceal On         = "\x1b[8m"
conceal Off        = "\x1b[28m"
conceal _          = ""


strike :: SGR -> String
strike On          = "\x1b[9m"
strike Off         = "\x1b[29m"
strike _           = ""


proportional :: SGR -> String
proportional On    = "\x1b[26m"
proportional Off   = "\x1b[50m"
proportional _     = ""


reset :: String
reset = "\x1b[0m"
-- Not actually using the constructor for now


-- ================================================================
