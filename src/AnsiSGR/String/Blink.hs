-- ================================================================
-- BLINK
-- ================================================================


module AnsiSGR.String.Blink (Blink(..), blink) where


data Blink         = Slow | Rapid


blink :: Blink -> String
blink Slow         = "\x1b[5m"
blink Rapid        = "\x1b[6m"


-- ================================================================
