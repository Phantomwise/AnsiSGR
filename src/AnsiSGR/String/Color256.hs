-- ================================================================
-- COLOR 256
-- ================================================================


module AnsiSGR.String.Color256 (fg256, bg256, ul256) where


import Data.Word (Word8)


fg256 :: Word8 -> String
fg256 arg = "\x1b[38;5;" ++ show arg ++ "m"

bg256 :: Word8 -> String
bg256 arg = "\x1b[48;5;" ++ show arg ++ "m"

ul256 :: Word8 -> String
ul256 arg = "\x1b[58;5;" ++ show arg ++ "m"


-- ================================================================
