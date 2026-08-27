-- ================================================================
-- INTENSITY
-- ================================================================


module Intensity (Intensity(..), intensity) where


data Intensity     = Bold | Faint


intensity :: Intensity -> String
intensity Bold     = "\x1b[1m"
intensity Faint    = "\x1b[2m"


-- ================================================================
