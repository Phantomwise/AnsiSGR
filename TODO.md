# TODO

- [x] Derive instances like Eq, Bounded, Enum
- [ ] Update PrintAllStyles to use `[minBound .. maxBound]` on data types
- [ ] Derive Show
- [ ] Update PrintAllStyles to use Show on the data types returned by `[minBound .. maxBound]`
- [x] Add # to Hex codes so VS Code extensions can show a preview of the color
- [ ] Maybe split color modules into fg/bg/ul variants and have the main Color8/Color256/ColorHex import them?
- [x] Find a better name
- [x] Rename github repo
- [ ] Check organization of files follow guidelines
- [ ] Figure out how to use Cabal
	- [ ] Add license file
	- [ ] Add version bounds on dependencies
- [x] Add README
	- Disclaimer about some codes being untested-on-real-terminal codes (though tested by capturing terminal output)
- [ ] Add CHANGELOG
- [x] Add a shell.nix
- [ ] Make automated tests that tries all the functions and run it with something to capture the output like `script`
	- [x] Tests for non-color functions
	- [ ] Tests for color functions

## Later

- [ ] Support Text
	- [x] Decided on duplicating the code for both String and Text (better performance than one being a wrapper packing/unpacking the other)
	- [x] Use two namespaces, one for String and one for Text, so the module doesn't break when Text support is added
	- [ ] Make sure both can be imported separately
	- [ ] Add a test to verify that both Text and String folders contain identical code

## Remaining unsupported SGR:

- FontPrimary             = 10      -- Primary (default) font                 —
- FontAlt<Nb>             = 11–19   -- Alternative font                       Select alternative font n − 10
- FontAlt1                = 11      -- Alternative font                       —
- FontAlt2                = 12      -- Alternative font                       —
- FontAlt3                = 13      -- Alternative font                       —
- FontAlt4                = 14      -- Alternative font                       —
- FontAlt5                = 15      -- Alternative font                       —
- FontAlt6                = 16      -- Alternative font                       —
- FontAlt7                = 17      -- Alternative font                       —
- FontAlt8                = 18      -- Alternative font                       —
- FontAlt9                = 19      -- Alternative font                       —
