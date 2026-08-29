-- ================================================================
-- INTENSITY
-- ================================================================


module AnsiSGR.String.Intensity (Intensity(..), intensity) where


data Intensity     = Bold | Faint
    deriving (Eq, Bounded, Enum)


intensity :: Intensity -> String
intensity Bold     = "\x1b[1m"
intensity Faint    = "\x1b[2m"


-- ================================================================
