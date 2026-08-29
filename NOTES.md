# Implementation Notes


**Design choice:** insert SGR codes as transparently as possible, don't hide behind wrappers (*), don't obscure the backend


## No unified `Color` sum type


I had thought about doing something like this:

```haskell
data Color = Color8 Color8 | Color256 Word8 | ColorRGB Word8 Word8 Word8
```

So I could have one function for foreground color, one for background color, one for underline color:

```haskell
fg :: Color -> String
bg :: Color -> String
ul :: Color -> String
```

Instead of separate functions for each (`fg`/`fg256`/`fgRGB` etc)

**Problem:**

8-color SGR codes are theme-relative (depending on the terminal's own palette), while 256-color and RGB codes are literal values.
Underline colors have no valid SGR codes for the basic 8-color, they only support 256-color and RGB.

So a unified `Color` type would mean, for `ul :: Brightness -> Color -> String`:
- Either a function which errors or inserts nothing when it's used with the basic 8-color. Which is bad UX.
- Or a fakeout of the basic 8-color by mapping them to fixed RGB values (ex: `ul Vivid Red -> ulRGB 255 0 0`). Which:
  - Goes against the design choice of the project by obscuring what the functions actually do.
  - Is deceptive: `fg Vivid Red ++ ul Vivid Red` appears to use the same color, but will display as mismatched colors on terminals with a custom color palette.
  - Will never match exactly the basic 8-color since terminals define them and their dull/vivid variants differently.

**Decision:** Keep `fg`/`bg`/`ul` as separate per-color-space functions


(*) Implementation of wrapper functions as an optional alternative is envisageable if requested, but will not be the default.
