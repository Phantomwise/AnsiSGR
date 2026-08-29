-- ================================================================
-- TYPEFACE
-- ================================================================


module AnsiSGR.String.Typeface (Typeface(..), typeface, italic, fraktur) where


data Typeface      = Italic | Fraktur
    deriving (Eq, Bounded, Enum)


typeface :: Typeface -> String
typeface Italic    = "\x1b[3m"
typeface Fraktur   = "\x1b[20m"

italic :: String
italic             = typeface Italic

fraktur :: String
fraktur            = typeface Fraktur


-- ================================================================
