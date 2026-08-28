# Ansi SGR

A Haskell module for ANSI SGR codes: background/foreground/underline color, intensity, blink, underline, overline, subscript/superscript, etc

<p style="margin-left: 2em"><em>
Have you ever laid awake at night wishing you could color underlines in terminal outputs?<br />
Have you ever been depressed at not having an easy way to use uncommon ANSI codes like blink, superscript and proportional spacing?<br />
Have you ever felt like murdering your code editor for not being able to show color previews of ANSI codes that use RGB colors?<br />
Look no further! This module is for you!
</em></p>

## Table

- [Features](#features)
- [Usage](#usage)
- [Status](#status)
- [Testing](#testing)
- [AI](#ai)
- [License](#license)

## Features

- Soon comprehensive support of **ALL** the SGR color codes, even those supported by **ZERO** terminals! 🥳 *(Only the codes 10-19, for alternative fonts, are not yet implemented)*
- 🎨 Colors for foreground, background and underline
- 🎨 Color using either:
	- 8 basic terminal color palette + bright/dull variants (`Color8`)
	- 256 color palette (`Color256`)
	- 24-bit RGB color palette (`ColorRGB`)
	- Hex wrapper to use hex RGB values, with leading `#` supported so code editors can parse them as colors and display a preview of the actual colors in the code 😎 (`ColorHex`)
	- ... or use all four variants because there is no one to stop you!
- 💄 Styles: blink, strike, underline, overline, italic, fraktur, subscript, superscript, frame, proportional spacing, invert, conceal, ideogram lines, ideogram stress
- Functions insert ANSI codes. They do not wrap your code. If you prefer wrapping functions, try [text-ansi](https://hackage.haskell.org/package/text-ansi), though it doesn't support underline color. Or create an issue in the repo and I'll see about adding wrappers.
- Explicit reset for each attribute (`Reset`)
- Support only `String` for now. `Text` support is planned.
- Split into several modules by category (`Blink`, `Color8`, etc). Import the whole thing via `AnsiSGR`, or import the sub-modules you need: each one is self-contained.

## Usage

...

## Status

...

## Testing

...

## AI

- No AI code in the module itself
- AI was used to generate the following tests:
	- `TestAllStyles.hs`
- No AI code anywhere else

## License

BSD 3-Clause. See [LICENSE](LICENSE).

