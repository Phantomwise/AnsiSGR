-- ================================================================
-- RESET
-- ================================================================


module AnsiSGR.String.Reset (Reset(..), reset) where


data Reset           = All
                     | Intensity | Typeface | Underline | Blink | Invert | Conceal | Strike | Proportional | Frame | Overline | Ideogram | Script
                     | Bg | Fg | Ul
    deriving (Eq, Bounded, Enum)


reset :: Reset -> String
reset All            = "\x1b[0m"
reset Intensity      = "\x1b[22m"
reset Typeface       = "\x1b[23m"
reset Underline      = "\x1b[24m"
reset Blink          = "\x1b[25m"
reset Invert         = "\x1b[27m"
reset Conceal        = "\x1b[28m"
reset Strike         = "\x1b[29m"
reset Proportional   = "\x1b[50m"
reset Frame          = "\x1b[54m"
reset Overline       = "\x1b[55m"
reset Ideogram       = "\x1b[65m"
reset Script         = "\x1b[75m"
reset Fg             = "\x1b[39m"
reset Bg             = "\x1b[49m"
reset Ul             = "\x1b[59m"


-- ================================================================
