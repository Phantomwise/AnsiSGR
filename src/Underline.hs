-- ================================================================
-- UNDERLINE
-- ================================================================


module Underline (Underline(..), underline) where


data Underline     = Single | Double


underline :: Underline -> String
underline Single   = "\x1b[4m"
underline Double   = "\x1b[21m"


-- ================================================================
