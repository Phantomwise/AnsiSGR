-- ================================================================
-- SCRIPT
-- ================================================================


module AnsiSGR.String.Script (Script(..), script) where


data Script     = Sub | Sup
    deriving (Eq, Bounded, Enum)


script :: Script -> String
script Sup         = "\x1b[73m"
script Sub         = "\x1b[74m"


-- ================================================================
