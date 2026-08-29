-- ================================================================
-- FRAME
-- ================================================================


module AnsiSGR.String.Frame (Frame(..), frame) where


data Frame         = Rect | Circle
    deriving (Eq, Bounded, Enum)


frame :: Frame -> String
frame Rect         = "\x1b[51m"
frame Circle       = "\x1b[52m"


-- ================================================================
