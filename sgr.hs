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


data Ansi      = Slow | Rapid | BlinkOff
               | Bold | Faint | IntensityOff
               | Single | Double | UnderlineOff
               | InvertOn | InvertOff
               | ConcealOn | ConcealOff
               | StrikeOn | StrikeOff
               | On | Off
	deriving (Show)


-- ================================================================
-- STYLE FUNCTIONS
-- ================================================================


intensity :: Ansi -> String
intensity Bold     = "\x1b[1m"
intensity Faint    = "\x1b[2m"
intensity Off      = "\x1b[22m"
intensity _        = ""


underline :: Ansi -> String
underline Single   = "\x1b[4m"
underline Double   = "\x1b[21m"
underline Off      = "\x1b[24m"
underline _        = ""


blink :: Ansi -> String
blink Slow         = "\x1b[5m"
blink Rapid        = "\x1b[6m"
blink Off          = "\x1b[25m"
blink _            = ""


invert :: Ansi -> String
invert On         = "\x1b[7m"
invert Off        = "\x1b[27m"
invert _          = ""
-- Renamed from "revert" to avoid clash with Prelude


conceal :: Ansi -> String
conceal On         = "\x1b[8m"
conceal Off        = "\x1b[28m"
conceal _          = ""


strike :: Ansi -> String
strike On          = "\x1b[9m"
strike Off         = "\x1b[29m"
strike _           = ""


-- ================================================================
