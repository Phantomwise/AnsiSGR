-- ================================================================
-- COLORRGB
-- ================================================================


module ColorRGB (fgRGB, bgRGB, ulRGB) where


import Data.Word (Word8)


fgRGB :: Word8 -> Word8 -> Word8 -> String
fgRGB r g b = "\x1b[38;2;" ++ (show r) ++ ";" ++ (show g) ++ ";" ++ (show b) ++ "m"

bgRGB :: Word8 -> Word8 -> Word8 -> String
bgRGB r g b = "\x1b[48;2;" ++ (show r) ++ ";" ++ (show g) ++ ";" ++ (show b) ++ "m"

ulRGB :: Word8 -> Word8 -> Word8 -> String
ulRGB r g b = "\x1b[58;2;" ++ (show r) ++ ";" ++ (show g) ++ ";" ++ (show b) ++ "m"


-- ================================================================
