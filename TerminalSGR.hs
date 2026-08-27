-- ================================================================
-- SGR CODES
-- ================================================================


module TerminalSGR
    where


-- ================================================================
-- LOCAL IMPORTS
-- ================================================================


import Color8
import Color256

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

import Reset


-- ================================================================
-- EXTERNAL IMPORTS
-- ================================================================


import Data.Word (Word8)
import Text.Read (readMaybe)


-- ================================================================
-- COLOR FUNCTIONS
-- ================================================================


fgRGB :: Word8 -> Word8 -> Word8 -> String
fgRGB r g b = "\x1b[38;2;" ++ (show r) ++ ";" ++ (show g) ++ ";" ++ (show b) ++ "m"

bgRGB :: Word8 -> Word8 -> Word8 -> String
bgRGB r g b = "\x1b[48;2;" ++ (show r) ++ ";" ++ (show g) ++ ";" ++ (show b) ++ "m"

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
