-- ================================================================
-- UNDERLINE
-- ================================================================


module AnsiSGR.String.Underline (Underline(..), underline) where


data Underline     = Single | Double
    deriving (Eq, Bounded, Enum)


underline :: Underline -> String
underline Single   = "\x1b[4m"
underline Double   = "\x1b[21m"


-- ================================================================
