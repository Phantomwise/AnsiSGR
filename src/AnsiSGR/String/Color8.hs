-- ================================================================
-- COLOR 8
-- ================================================================


module AnsiSGR.String.Color8 (Color8(..), Brightness(..), fg, fgd, fgv, bg, bgd, bgv) where


data Color8         = Black | Red | Green | Yellow | Blue | Magenta | Cyan | White
data Brightness    = Dull | Vivid


fg :: Brightness -> Color8 -> String
fg Dull  Black     = "\x1b[30m"
fg Dull  Red       = "\x1b[31m"
fg Dull  Green     = "\x1b[32m"
fg Dull  Yellow    = "\x1b[33m"
fg Dull  Blue      = "\x1b[34m"
fg Dull  Magenta   = "\x1b[35m"
fg Dull  Cyan      = "\x1b[36m"
fg Dull  White     = "\x1b[37m"
fg Vivid Black     = "\x1b[90m"
fg Vivid Red       = "\x1b[91m"
fg Vivid Green     = "\x1b[92m"
fg Vivid Yellow    = "\x1b[93m"
fg Vivid Blue      = "\x1b[94m"
fg Vivid Magenta   = "\x1b[95m"
fg Vivid Cyan      = "\x1b[96m"
fg Vivid White     = "\x1b[97m"


fgd :: Color8 -> String
fgd Black          = "\x1b[30m"
fgd Red            = "\x1b[31m"
fgd Green          = "\x1b[32m"
fgd Yellow         = "\x1b[33m"
fgd Blue           = "\x1b[34m"
fgd Magenta        = "\x1b[35m"
fgd Cyan           = "\x1b[36m"
fgd White          = "\x1b[37m"


fgv :: Color8 -> String
fgv Black          = "\x1b[90m"
fgv Red            = "\x1b[91m"
fgv Green          = "\x1b[92m"
fgv Yellow         = "\x1b[93m"
fgv Blue           = "\x1b[94m"
fgv Magenta        = "\x1b[95m"
fgv Cyan           = "\x1b[96m"
fgv White          = "\x1b[97m"


bg :: Brightness -> Color8 -> String
bg Dull Black      = "\x1b[40m"
bg Dull Red        = "\x1b[41m"
bg Dull Green      = "\x1b[42m"
bg Dull Yellow     = "\x1b[43m"
bg Dull Blue       = "\x1b[44m"
bg Dull Magenta    = "\x1b[45m"
bg Dull Cyan       = "\x1b[46m"
bg Dull White      = "\x1b[47m"
bg Vivid Black     = "\x1b[100m"
bg Vivid Red       = "\x1b[101m"
bg Vivid Green     = "\x1b[102m"
bg Vivid Yellow    = "\x1b[103m"
bg Vivid Blue      = "\x1b[104m"
bg Vivid Magenta   = "\x1b[105m"
bg Vivid Cyan      = "\x1b[106m"
bg Vivid White     = "\x1b[107m"


bgd :: Color8 -> String
bgd Black          = "\x1b[40m"
bgd Red            = "\x1b[41m"
bgd Green          = "\x1b[42m"
bgd Yellow         = "\x1b[43m"
bgd Blue           = "\x1b[44m"
bgd Magenta        = "\x1b[45m"
bgd Cyan           = "\x1b[46m"
bgd White          = "\x1b[47m"


bgv :: Color8 -> String
bgv Black          = "\x1b[100m"
bgv Red            = "\x1b[101m"
bgv Green          = "\x1b[102m"
bgv Yellow         = "\x1b[103m"
bgv Blue           = "\x1b[104m"
bgv Magenta        = "\x1b[105m"
bgv Cyan           = "\x1b[106m"
bgv White          = "\x1b[107m"


-- ================================================================
