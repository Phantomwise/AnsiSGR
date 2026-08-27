-- ================================================================
-- SGR CODES
-- ================================================================


module TerminalSGR
    where


-- ================================================================
-- LOCAL IMPORTS
-- ================================================================


import Intensity
import Typeface
import Underline
import Blink
import Invert
import Conceal
import Strike
import Proportional
import Frame
import Overline
import Ideogram
import Script


-- ================================================================
-- EXTERNAL IMPORTS
-- ================================================================


import Data.Word (Word8)
import Text.Read (readMaybe)


-- ================================================================
-- TYPES
-- ================================================================


data Color      = Black | Red | Green | Yellow | Blue | Magenta | Cyan | White
data Brightness = Dull | Vivid

data Reset      = All
                | Intensity | Typeface | Underline | Blink | Invert | Conceal | Strike | Proportional | Frame | Overline | Ideogram | Script
                | Bg | Fg | Ul


-- ================================================================
-- COLOR FUNCTIONS
-- ================================================================


fg :: Brightness -> Color -> String
fg Dull  Black   = "\x1b[30m"
fg Dull  Red     = "\x1b[31m"
fg Dull  Green   = "\x1b[32m"
fg Dull  Yellow  = "\x1b[33m"
fg Dull  Blue    = "\x1b[34m"
fg Dull  Magenta = "\x1b[35m"
fg Dull  Cyan    = "\x1b[36m"
fg Dull  White   = "\x1b[37m"
fg Vivid Black   = "\x1b[90m"
fg Vivid Red     = "\x1b[91m"
fg Vivid Green   = "\x1b[92m"
fg Vivid Yellow  = "\x1b[93m"
fg Vivid Blue    = "\x1b[94m"
fg Vivid Magenta = "\x1b[95m"
fg Vivid Cyan    = "\x1b[96m"
fg Vivid White   = "\x1b[97m"


fgd :: Color -> String
fgd Black   = "\x1b[30m"
fgd Red     = "\x1b[31m"
fgd Green   = "\x1b[32m"
fgd Yellow  = "\x1b[33m"
fgd Blue    = "\x1b[34m"
fgd Magenta = "\x1b[35m"
fgd Cyan    = "\x1b[36m"
fgd White   = "\x1b[37m"


fgv :: Color -> String
fgv Black   = "\x1b[90m"
fgv Red     = "\x1b[91m"
fgv Green   = "\x1b[92m"
fgv Yellow  = "\x1b[93m"
fgv Blue    = "\x1b[94m"
fgv Magenta = "\x1b[95m"
fgv Cyan    = "\x1b[96m"
fgv White   = "\x1b[97m"


bg :: Brightness -> Color -> String
bg Dull Black    = "\x1b[40m"
bg Dull Red      = "\x1b[41m"
bg Dull Green    = "\x1b[42m"
bg Dull Yellow   = "\x1b[43m"
bg Dull Blue     = "\x1b[44m"
bg Dull Magenta  = "\x1b[45m"
bg Dull Cyan     = "\x1b[46m"
bg Dull White    = "\x1b[47m"
bg Vivid Black   = "\x1b[100m"
bg Vivid Red     = "\x1b[101m"
bg Vivid Green   = "\x1b[102m"
bg Vivid Yellow  = "\x1b[103m"
bg Vivid Blue    = "\x1b[104m"
bg Vivid Magenta = "\x1b[105m"
bg Vivid Cyan    = "\x1b[106m"
bg Vivid White   = "\x1b[107m"


bgd :: Color -> String
bgd Black   = "\x1b[40m"
bgd Red     = "\x1b[41m"
bgd Green   = "\x1b[42m"
bgd Yellow  = "\x1b[43m"
bgd Blue    = "\x1b[44m"
bgd Magenta = "\x1b[45m"
bgd Cyan    = "\x1b[46m"
bgd White   = "\x1b[47m"


bgv :: Color -> String
bgv Black   = "\x1b[100m"
bgv Red     = "\x1b[101m"
bgv Green   = "\x1b[102m"
bgv Yellow  = "\x1b[103m"
bgv Blue    = "\x1b[104m"
bgv Magenta = "\x1b[105m"
bgv Cyan    = "\x1b[106m"
bgv White   = "\x1b[107m"


fg256 :: Word8 -> String
fg256 arg = "\x1b[38;5;" ++ show arg ++ "m"

fgRGB :: Word8 -> Word8 -> Word8 -> String
fgRGB r g b = "\x1b[38;2;" ++ (show r) ++ ";" ++ (show g) ++ ";" ++ (show b) ++ "m"

bg256 :: Word8 -> String
bg256 arg = "\x1b[48;5;" ++ show arg ++ "m"

bgRGB :: Word8 -> Word8 -> Word8 -> String
bgRGB r g b = "\x1b[48;2;" ++ (show r) ++ ";" ++ (show g) ++ ";" ++ (show b) ++ "m"

ul256 :: Word8 -> String
ul256 arg = "\x1b[58;5;" ++ show arg ++ "m"

ulRGB :: Word8 -> Word8 -> Word8 -> String
ulRGB r g b = "\x1b[58;2;" ++ (show r) ++ ";" ++ (show g) ++ ";" ++ (show b) ++ "m"


fgHex :: String -> String
fgHex hex = case validateHex hex of
    [r, g, b] -> fgRGB r g b
    _         -> error "Unreachable"

bgHex :: String -> String
bgHex hex = case validateHex hex of
    [r, g, b] -> bgRGB r g b
    _         -> error "Unreachable"

ulHex :: String -> String
ulHex hex = case validateHex hex of
    [r, g, b] -> ulRGB r g b
    _         -> error "Unreachable"


validateHex :: String -> [Word8]
validateHex hex
    | length hex == 6 = decomposeHex hex
    | otherwise       = error "Invalid hex value: Must have exactly 6 characters"

decomposeHex :: String -> [Word8]
decomposeHex (a:b:c:d:e:f:[]) = map hexToWord [[a,b], [c,d], [e,f]]
decomposeHex _ = error "Unreachable"

hexToWord :: String -> Word8
hexToWord hex = case readMaybe ("0x" ++ hex) of
    Just x -> x
    Nothing -> error "Invalid hex value: Must be in the range 00-ff"


-- ================================================================
-- STYLE FUNCTIONS
-- ================================================================


reset :: Reset -> String
reset All            = "\x1b[0m"
reset Intensity      = "\x1b[22m"
reset Typeface       = "\x1b[23m"
-- reset Italic         = reset Typeface -- Constructor name already taken
-- reset Fraktur        = reset Typeface -- Constructor name already taken
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
