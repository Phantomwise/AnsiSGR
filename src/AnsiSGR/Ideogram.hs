-- ================================================================
-- IDEOGRAM
-- ================================================================


module AnsiSGR.Ideogram (Ideogram(..), ideogram) where


data Ideogram       = Underline1 | Underline2 | Overline1 | Overline2 | RightLine1 | RightLine2 | LeftLine1 | LeftLine2 | Stress


ideogram :: Ideogram -> String
ideogram RightLine1 = "\x1b[60m"
ideogram RightLine2 = "\x1b[61m"
ideogram LeftLine1  = "\x1b[62m"
ideogram LeftLine2  = "\x1b[63m"
ideogram Underline1 = ideogram RightLine1
ideogram Underline2 = ideogram RightLine2
ideogram Overline1  = ideogram LeftLine1
ideogram Overline2  = ideogram LeftLine2
ideogram Stress     = "\x1b[64m"


-- ================================================================
